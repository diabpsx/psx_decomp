/* FMV.CPP -- Diablo PSX (Climax 1998) reconstruction (PSXSRC).  PSX-only (no PC twin): the MDEC full-
 * motion-video player -- a background CD-streaming ring buffer (cdstream_* / stream_cdready_handler,
 * driven off the CdReadyCallback interrupt), the MDEC bitstream decoder front-end (mdec_* / DCT_out_handler,
 * driven off the MDEC "slice done" interrupt), the on-screen quad mesh the decoded frame is textured onto
 * (split_poly_area/rebuild_mdec_polys/draw_mdec_polys/init_mdec_polys), the streamed .STR audio track
 * (play/init/kill/stop_mdec_audio, set_mdec_audio_volume), the queue of movies-to-play
 * (play_mdec_stream/dequeue_stream/dequeue_animation/decode_mdec_stream/clear_mdec_queue) and the two
 * entry points (PlayFMVOverLay / LoPlayFMVOverLay) plus a per-TU inlined copy of CPad::GetDown (PADS.H).
 * Reconstructed from the raw oracle (asm/nonmatchings/fmv/*.s) + the SYM (DIABPSX.SYM); m2c/Hex-Rays
 * drafts from skel/PSXSRC/FMV.CPP as shape hints. All %gp_rel names in the raw are literal retail names. */
#include "psyq.h"

/* ---------------------------------------------------------------- types (SYM / libcd.h) */
typedef struct { u_char minute, second, sector, track; } CdlLOC;   /* sizeof 4 */
typedef struct CdlFILE { CdlLOC pos; u_int size; char name[16]; } CdlFILE;  /* sizeof 24 */
typedef struct {   /* StHEADER -- CD-ROM STR structure, sizeof 32 */
    u_short id, type, secCount, nSectors;
    u_int   frameCount, frameSize;
    u_short width, height;
    u_int   dummy1, dummy2;
    CdlLOC  loc;
} StHEADER;

/* @0x80158840 PADS.H (header copy):120 -- CPad::GetDown() const, inlined afresh per TU (-fno-inline
 * would emit it once; PsyQ 4.0 without that flag re-emits the inline body at every call site's TU). */
class CPad {   /* sizeof 236, PADS.H */
public:
    unsigned char get_both;
    unsigned char active;
    unsigned char PadType;
    unsigned char PADTICK;
    unsigned short PADTICKMASK;
    unsigned short PadNum;
    unsigned short Cur;
    unsigned short Up;
    unsigned short Down;
    unsigned short Tick;
    unsigned short Old;
    unsigned short both_Cur;
    unsigned short both_Up;
    unsigned short both_Down;
    unsigned short both_Tick;
    unsigned short both_Old;
    BOOL TickDown[16];
    BOOL TickBoth[16];
    unsigned char TickCount[16];
    unsigned short BothTickCount[16];
    unsigned short GazTickCount[16];

    unsigned short GetCur() const
    {
        if (get_both)
            return both_Cur;
        return Cur;
    }
    unsigned short GetDown() const
    {
        if (get_both)
            return both_Down;
        return Down;
    }
};

struct mdec_queue_entry {   /* sizeof 20 -- one queued PlayFMVOverLay-less streamed movie request */
    char *name;
    int speed;
    int start;
    int end;
    int flag;
};

/* ---------------------------------------------------------------- externs (BIOS/PsyQ, other TUs) */
extern "C" {
CdlLOC *CdIntToPos(int i, CdlLOC *p);
int CdControlB(u_char com, void *param, void *result);
int CdControlF(u_char com, void *param);
int CdRead2(int mode);
int CdReset(int mode);
int CdGetSector(void *madr, int size);
int CdPosToInt(CdlLOC *p);
void *CdReadyCallback(void (*func)(unsigned char, unsigned char *));
void CD_GetCdlFILE(const char *name, CdlFILE *p);   /* mangled CD_GetCdlFILE__FPCcP7CdlFILE */
int ReloadGP(void);
void SetGP(int gp);
void DBG_Error(int code, const char *file, int line);
void DBG_Halt(int code);
void EnterCriticalSection(void);
void ExitCriticalSection(void);
int printf(const char *fmt, ...);
int fileexists(char *name);
int filesize(char *name);
int PRIM_GetCurrentScreen(void);
void SetPolyFT4(POLY_FT4 *p);
int LANG_GetLang(void);
void ClearImage(RECT *rect, u_char r, u_char g, u_char b);
int SpuMalloc(int size);
int SpuFree(int addr);
int SpuSetKey(int mode, unsigned long voice_mask);
int SpuSetKeyOnWithAttr(void *attr);
int SpuWrite(void *addr, int size);
int SpuWrite0(int size);
int SpuSetTransferStartAddr(unsigned long addr);
int SpuSetTransferMode(int mode);
int SpuIsTransferCompleted(int mode);
int SpuSetCommonAttr(void *attr);
int SpuSetVoiceAttr(void *attr);
void SPU_Init(void);
int ENG_random(long n);
int VSync(int mode);
int VID_GetTick(void);
void systemtask(int);
int strcmp(const char *a, const char *b);
char *strcpy(char *dst, const char *src);
int sprintf(char *dst, const char *fmt, ...);
int STR_AllocBuffer(void);
void *Tmalloc(int size);
int Tfree(void *p);
int GetVideoMode(void);
int SetDispMask(int mask);
void TICK_Update(void);
void PAD_Handler(void);
void VID_AfterDisplay(void);
void VID_SetDBuffer(BOOL on);
int TSK_Sleep(int frames);
/* MDEC/VLC decoder-core library helpers (linked from another TU/lib -- unlabeled in the raw, real
 * retail names unknown; kept as func_<VA> per the raw oracle). */
void func_8013B6EC(void *vlc_table);
void func_8013AC3C(int mode);
void func_8013AED8(void (*handler)(void));
void func_8013B3B0(void *data, void *vlcbuf_half, void *vlc_table);
void func_8013AD94(void *data);
void func_8013ADA0(void *vlcbuf_half, int mode);
void func_8013AE1C(void *dst, int size);
/* PAD / audio / misc engine helpers used by LoPlayFMVOverLay's main loop (other TUs). */
class CPad *PAD_GetPad(int pnum, int mode);
void PA_SetPauseOk(int on);
}

/* ---------------------------------------------------------------- CD stream ring buffer state */
static volatile int stream_chunksize;   /* ISR-shared (CdReadyCallback) */
static unsigned char *volatile stream_bufh;   /* ISR-shared (CdReadyCallback) */
static volatile int stream_bufsize;   /* ISR-shared (CdReadyCallback) */
static unsigned char *volatile stream_buf;   /* ISR-shared (CdReadyCallback) */
static int stream_chunks_borrowed;
static volatile int stream_in;   /* ISR-shared (CdReadyCallback) */
static int stream_out;
static volatile int stream_chunks_total;   /* ISR-shared (CdReadyCallback) */
static volatile int stream_chunks_in;   /* ISR-shared (CdReadyCallback) */
static int _discard_count;
static int _get_count;
static volatile int cdstream_resetsec;   /* ISR-shared (CdReadyCallback) */
static volatile int cdstream_resetting;   /* ISR-shared (CdReadyCallback) */
static volatile int stream_handler_installed;   /* ISR-shared (CdReadyCallback) */
static void *volatile old_cdready_handler;   /* ISR-shared (CdReadyCallback) */
static volatile int stream_ending;   /* ISR-shared (CdReadyCallback) */
static volatile int first_handler_event;   /* ISR-shared (CdReadyCallback) */
static volatile int last_handler_event;   /* ISR-shared (CdReadyCallback) */
static volatile int time_in_frames;   /* ISR-shared (CdReadyCallback) */
static volatile int stream_open;   /* ISR-shared (CdReadyCallback) */
static volatile int stream_stalled;   /* ISR-shared (CdReadyCallback) */
static volatile int stream_secnum;   /* ISR-shared (CdReadyCallback) */
static volatile int stream_subsec;   /* ISR-shared (CdReadyCallback) */
static volatile int stream_last_sector;   /* ISR-shared (CdReadyCallback) */
static volatile int D_8011C74C;   /* idx: chunk index of the sector about to be read */
static volatile int D_8011C754;   /* sec: CdPosToInt() result of the drive's actual position */
static volatile CdlLOC D_80121C98;   /* subcode: scratch CdlLOC for CdGetSector/CdPosToInt; ISR-shared (CdReadyCallback) */
static char g_movie_filename[32];   /* @0x80121CE8: the one shared streamed-movie filename buffer;
                                      * LoPlayFMVOverLay strcpy's "DIABEND*.MOV" into it before queuing
                                      * a play_mdec_stream/dequeue_animation request. Gap to the next
                                      * undefined_syms_auto_fmv.txt symbol (D_80121D08) is exactly 0x20. */
static int stream_opened;
static int stream_startsec;
static int stream_got_chunks;
static int stream_last_chunk;
static int sector_dma_in;
static int sector_dma;

/* ---------------------------------------------------------------- MDEC bitstream decoder state */
static int ordertab_length;
static int mbuf;
static void *vlctab;
static void *vlcbuf[2];
static RECT slice;
static int slices_to_do;
static int slnum;
static int slice_size;
static int slice_inc;
static int vbuf;
unsigned char map_buf[0x19000];   /* mdc bitstream work area (symbol_addrs_fmv.txt: size 0x19000); a
                                    * pointer jump table (void*[]) lives at byte offset 0x18FFC (see
                                    * start_mdec_decode/DCT_out_handler). */
#define MAP_BUF_JTAB ((void **)(map_buf + 0x18FFC))
static int mdc_bufstart, mdc_buftop, mdc_buftotal, mdc_bufleft, num_mdcs;
static int frame_decoded;
static int last_fn, last_mdc;
static int move_request, move_x, move_y, last_move_mbuf;
static int mdec_cx, mdec_cy;
static int do_brightness;
static int area_pw, area_ph;
static int num_pol[2];
static int mdec_pw[2], mdec_ph[2];
POLY_FT4 tmdc_pol[2][2][10];
POLY_FT4 br[2][2][10];
static char tmdc_pol_dirty[2];
RECT mdc_buf[2];
static int mdec_w, mdec_h;

/* ---------------------------------------------------------------- MDEC audio (SPU) state */
static int mdec_audio_buffer[2];
static int mdec_audio_playing;
static int mdec_audio_offs;
static int mdec_audio_rate_shift;
static int mdec_audio_sec;
static int sfx_volume;

/* ---------------------------------------------------------------- movie-play queue */
struct mdec_queue_entry mdec_queue[16];
static int mdec_head, mdec_tail, mdecs_queued, mdecs_waiting, mdec_waiting_tail;
static int mdec_sectors_per_frame, mdec_framecount, mdec_last_frame, mdec_speed;
static int mdec_stream_starting, mdec_streaming, mdec_waiting_tail_unused;
static int streampos;
static int user_start;
static void *img_buf;      /* Tmalloc'd MDEC image buffer, filled by LoPlayFMVOverLay */
static void *vlc_buf;      /* Tmalloc'd MDEC VLC bitstream buffer, ditto */
static void *vlc_tab;      /* Tmalloc'd MDEC VLC table buffer, ditto */
unsigned char imgbuf[0x15][4];   /* set_mdec_img_buffer: 21 x (u32 ptr) */

/* @0x80155E1C FMV.CPP:295 */
extern "C" void _cd_seek(int sec)
{
    CdlFILE RetFile;

    CdIntToPos(sec, (CdlLOC *)&RetFile);
    do {
        /* nothing */
    } while (CdControlB(0x15, &RetFile, 0) == 0);
}

/* @0x80155E54 FMV.CPP:315 */
extern "C" void init_cdstream(int chunksize, unsigned char *buf, int bufsize)
{
    stream_chunksize = chunksize;
    stream_bufh = buf;
    stream_bufsize = bufsize;
    stream_buf = buf + ((bufsize * chunksize) << 5);
}

/* @0x80155E7C FMV.CPP:328 */
extern "C" void flush_cdstream(void)
{
    stream_chunks_borrowed = 0;
    stream_in = stream_chunks_borrowed;
    stream_out = stream_in;
    stream_chunks_total = stream_out;
    stream_chunks_in = stream_chunks_total;
    _discard_count = stream_chunks_in;
    _get_count = _discard_count;
}

/* @0x80155ED0 FMV.CPP:366 */
extern "C" void reset_cdstream(void)
{
    _cd_seek(cdstream_resetsec);
    CdRead2(0xA0);
    cdstream_resetting = 0;
}

/* @0x80155F00 FMV.CPP:373 */
extern "C" void kill_stream_handlers(void)
{
    if (stream_handler_installed != 0) {
        CdReadyCallback((void (*)(unsigned char, unsigned char *))old_cdready_handler);
        stream_handler_installed = 0;
    }
}

/* @0x80155F30 FMV.CPP:384 */
extern "C" void stream_cdready_handler(unsigned char status, unsigned char *result)
{
    int OldGp = ReloadGP();

    if (stream_ending == 0)
        first_handler_event = 1;
    last_handler_event = time_in_frames;
    D_8011C74C = stream_in * stream_chunksize + (stream_subsec % stream_chunksize);
    if (cdstream_resetting == 0 && stream_open != 0) {
        if ((status & 0xFF) != 1) {
            cdstream_resetting = 1;
            cdstream_resetsec = stream_secnum - 1;
        } else if (stream_ending != 0) {
            kill_stream_handlers();
            first_handler_event = 0;
            stream_ending = 0;
            stream_open = 0;
        } else if (stream_stalled == 0) {
            CdGetSector(&D_80121C98, 3);
            D_8011C754 = CdPosToInt(&D_80121C98);
            if (D_8011C754 != stream_secnum) {
                cdstream_resetting = 1;
                cdstream_resetsec = stream_secnum;
            } else {
                CdGetSector(stream_bufh + (D_8011C74C << 5), 8);
                CdGetSector(stream_buf + (D_8011C74C * 0x7E0), 0x1F8);
                stream_secnum += 1;
                stream_subsec += 1;
                if (stream_subsec == stream_chunksize) {
                    stream_subsec = 0;
                    stream_chunks_in += 1;
                    stream_chunks_total += 1;
                    stream_in = (stream_in + 1) % stream_bufsize;
                    if (stream_chunks_in == stream_bufsize)
                        stream_stalled = 1;
                }
                if (stream_secnum == stream_last_sector) {
                    /* NB: retail passes the saved GP value (not a real reason code) to DBG_Halt here --
                     * a1/a0 register reuse artifact at the branch's shared delay slot, kept literally. */
                    DBG_Halt(OldGp);
                    kill_stream_handlers();
                    stream_ending = 0;
                    stream_open = 0;
                }
            }
        }
    }
    SetGP(OldGp);
}

/* @0x80156184 FMV.CPP:509 */
extern "C" void install_stream_handlers(void)
{
    if (stream_handler_installed == 0) {
        old_cdready_handler = CdReadyCallback(stream_cdready_handler);
        stream_handler_installed = 1;
    }
}

/* @0x801561C0 FMV.CPP:525 */
extern "C" void cdstream_service(void)
{
    int timeout_occured = 0;

    if (cdstream_resetting != 0)
        reset_cdstream();
    if (stream_open != 0) {
        if (first_handler_event != 0) {
            timeout_occured = (last_handler_event + 0xF0) < time_in_frames;
            if (timeout_occured)
                printf("cdstream mid-stream timeout\n");
        } else {
            timeout_occured = (stream_opened + 0x12C) < time_in_frames;
            if (timeout_occured)
                printf("cdstream open timeout\n");
        }
    } else {
        timeout_occured = 0;
    }
    if (timeout_occured != 0) {
        kill_stream_handlers();
        CdReset(0);
        install_stream_handlers();
        cdstream_resetsec = stream_secnum;
        reset_cdstream();
        first_handler_event = 0;
        last_handler_event = time_in_frames;
        stream_opened = time_in_frames;
    }
}

/* @0x801562B0 FMV.CPP:581 */
extern "C" int cdstream_get_chunk(unsigned char **data, StHEADER **h)
{
    if ((stream_chunks_in - stream_chunks_borrowed) < 0)
        printf("underrun in get_chunk\n");
    if (stream_chunks_in != stream_chunks_borrowed) {
        *data = stream_buf + (stream_out * stream_chunksize * 0x7E0);
        *h = (StHEADER *)(stream_bufh + ((stream_out * stream_chunksize) << 5));
        stream_out = (stream_out + 1) % stream_bufsize;
        stream_chunks_borrowed += 1;
        stream_got_chunks += 1;
        _get_count += 1;
        return 1;
    }
    *data = 0;
    *h = 0;
    return 0;
}

/* @0x801563C8 FMV.CPP:616 */
extern "C" int cdstream_is_last_chunk(void)
{
    return stream_got_chunks == stream_last_chunk;
}

/* @0x801563E0 FMV.CPP:628 */
extern "C" void cdstream_discard_chunk(void)
{
    int underrun;

    EnterCriticalSection();
    stream_chunks_in -= 1;
    stream_chunks_borrowed -= 1;
    ExitCriticalSection();
    _discard_count += 1;
    if (_get_count < _discard_count)
        printf("discarded more than got\n");
    if (stream_chunks_in < stream_chunks_borrowed)
        printf("overdraught ran out\n");
    underrun = 0;
    if (stream_chunks_in < 0 || stream_chunks_borrowed < 0)
        underrun = 1;
    if (underrun != 0)
        printf("underrun in discard (in=%d borrowed=%d)\n", stream_chunks_in, stream_chunks_borrowed);
    if (stream_stalled != 0) {
        _cd_seek(stream_secnum);
        CdRead2(0xA0);
        stream_stalled = 0;
    }
}

/* @0x80156500 FMV.CPP:669 */
extern "C" void close_cdstream(void)
{
    if (stream_open != 0) {
        stream_ending = 1;
        stream_stalled = 0;
    } else {
        kill_stream_handlers();
    }
    first_handler_event = 0;
}

/* @0x80156540 FMV.CPP:691 */
extern "C" void wait_cdstream(void)
{
    int start_wait;   /* SYM AUTO local; unreferenced in the raw -- a genuine frame-hole (see catalog
                       * 13A "SYM-LOCAL STAGING LAW"): its declared-but-unused presence supplies the
                       * fsize=32/sp-0x10 slot the allocator needs, it carries no live value. */
    int wait = 1;

    (void)&start_wait;
    while (((stream_open != 0) || (stream_ending != 0)) && wait) {
        /* spin -- volatile stream_open/stream_ending force a fresh reload each pass */
    }
    if ((stream_open != 0) || (stream_ending != 0)) {
        printf("Warning: timeout in wait_cdstream()...\n");
        stream_stalled = 0;
        stream_ending = stream_stalled;
        stream_open = stream_ending;
        close_cdstream();
        wait_cdstream();
    }
}

/* @0x801565F8 FMV.CPP:718 */
extern "C" int open_cdstream(char *fname, int secoffs, int seclen)
{
    CdlFILE RetFile;
    int len;

    if (fileexists(fname) == 0)
        DBG_Error(0, "psxsrc/FMV.CPP", 726);
    len = filesize(fname) >> 0xB;
    _discard_count = 0;
    _get_count = _discard_count;
    stream_ending = 0;
    stream_chunks_total = 0;
    stream_secnum = 0;
    /* NOT `fname` -- the raw hardcodes &g_movie_filename (@0x80121CE8), the ONE shared movie-name
     * buffer LoPlayFMVOverLay fills (its own "DIABEND*.MOV" strcpy destination, %hi/%lo(D_80121CE8)
     * matches ida's `-2146296600` calls there too). Every existing caller passes that same buffer's
     * address as `fname`, so this is semantically a no-op vs the parameter -- but retail's C literally
     * re-derives the global instead of forwarding the argument, and the bytes need the literal form. */
    CD_GetCdlFILE(g_movie_filename, &RetFile);
    stream_secnum = CdPosToInt(&RetFile.pos);
    stream_secnum += secoffs;
    stream_startsec = stream_secnum;
    _cd_seek(stream_secnum);
    stream_subsec = 0;
    stream_chunks_borrowed = 0;
    stream_got_chunks = stream_chunks_borrowed;
    stream_last_chunk = len / stream_chunksize;
    sector_dma_in = 0;
    sector_dma = 0;
    stream_last_sector = stream_secnum + len;
    install_stream_handlers();
    stream_opened = time_in_frames;
    stream_open = 1;
    stream_stalled = 0;
    CdRead2(0xA0);
    return len << 0xB;
}

/* @0x80156720 FMV.CPP:791 */
extern "C" int set_mdec_img_buffer(unsigned char *p)
{
    int count, total;
    unsigned long *dst = (unsigned long *)imgbuf;

    total = 0;
    count = 0;
    do {
        *dst = (unsigned long)p;
        p += 0x1900;
        total += 0x1900;
        count++;
        dst++;
    } while (count < 0x15);
    return total;
}

/* @0x80156754 FMV.CPP:816 */
extern "C" void start_mdec_decode(unsigned char *data, int x, int y, int w, int h)
{
    int rem;

    while (slices_to_do != 0) {
        /* spin */
    }
    func_8013B3B0(data, vlcbuf[vbuf], vlctab);
    func_8013AD94(data);
    slice.x = (short)x;
    slice.y = (short)y;
    slice.h = (short)h;
    slices_to_do = w / slice.w + ((w % slice.w) > 0);
    slnum = slices_to_do;
    rem = h & 0xF;
    slice_size = (slice.w * (rem != 0 ? (h + 0x10 - rem) : h)) >> 1;
    slice_inc = (w & 0xF) ? (w & 0xF) : 0x10;
    func_8013ADA0(vlcbuf[vbuf], 2);
    func_8013AE1C(MAP_BUF_JTAB[slices_to_do], slice_size);
    vbuf ^= 1;
}

/* @0x801568B0 FMV.CPP:860 */
extern "C" void DCT_out_handler(void)
{
    int OldGp = ReloadGP();

    LoadImage(&slice, (u_long *)MAP_BUF_JTAB[slices_to_do]);
    slice.x = (short)(slice.x + slice_inc);
    slices_to_do -= 1;
    if (slices_to_do != 0) {
        slice_inc = slice.w;
        func_8013AE1C(MAP_BUF_JTAB[slices_to_do], slice_size);
    }
    SetGP(OldGp);
}

/* @0x80156960 FMV.CPP:882 */
extern "C" void init_mdec(unsigned char *vlc_buffer, unsigned char *vlc_table)
{
    ordertab_length = 0x80;
    mbuf = 0;
    vlctab = vlc_table;
    func_8013B6EC(vlc_table);
    func_8013AC3C(0);
    func_8013AED8(DCT_out_handler);
    slice.h = 0x10;
    vlcbuf[0] = vlc_buffer;
    vlcbuf[1] = vlc_buffer + 0xEA60;
}

/* @0x801569D0 FMV.CPP:908 */
extern "C" void init_mdec_buffer(char *buf, int size)
{
    mdc_bufstart = (int)buf;
    mdc_buftop = mdc_bufstart;
    mdc_buftotal = size;
    mdc_bufleft = size;
    num_mdcs = 0;
}

/* tmdc_pol_offs -- per-(mbuf,half,poly) {x,y} anchor pair rebuild_mdec_polys re-adds the camera scroll
 * to on every frame (sizeof matches: 2 mbuf * 2 halves * 10 polys * 2 shorts = 0x320 bytes... symbol_addrs
 * lists 0x640 for the whole thing at one address, i.e. this table AND its "y" companion interleaved). */
/* [mbuf][col][row][0]=x_off [1]=y_off -- derived directly from split_poly_area's raw address math:
 * byte offset = 800*mbuf + 80*col + 8*row (+2 for the y half of the pair). A poly's 4 corners are
 * FOUR ADJACENT grid points: TL=off[mbuf][col][row], TR=off[mbuf][col+1][row], BL=off[mbuf][col][row+1],
 * BR=off[mbuf][col+1][row+1] (byte deltas +80/+8/+88 confirmed against TL). rebuild_mdec_polys re-adds
 * the CURRENT camera pan (x,y) to each cached corner every frame instead of re-tiling from scratch. */
static short tmdc_pol_offs[2][10][10][2];

/* WIP -- NOT byte-verified yet (deep GTE/MDEC polygon-tiler internals, no PC twin to cross-check
 * against). Faithful transcription of the m2c draft (skel/PSXSRC/FMV.CPP) with M2C_FIELD resolved to
 * POLY_FT4/RECT members; next angle if it doesn't match on the first verify_asm pass: pull the raw
 * oracle (asm/nonmatchings/fmv/split_poly_area.s, 0x3E8 bytes) and diff block-by-block.
 * @0x801569EC FMV.CPP:925 */
/* Field mapping confirmed byte-offset-by-byte against POLY_FT4 (tag=0,r0=4,g0=5,b0=6,code=7,x0=8,y0=10,
 * u0=12,v0=13,clut=14,x1=16,y1=18,u1=20,v1=21,tpage=22,x2=24,y2=26,u2=28,v2=29,pad1=30,x3=32,y3=34,
 * u3=36,v3=37,pad2=38) against the raw's cursor `s0 = p+0x20` (i.e. s0's offsets are ABSOLUTE-32):
 *   r0/g0/b0 = 0x80 (neutral tint); x0=sx, y0=sy (screen-space anchor, SHORT); x1=x_run+colw, y1=sy;
 *   x2=sx, y2=sy+rowh; x3=x_run+colw, y3=sy+rowh; u0=xb, v0=(byte)y; u1=xb+colw, v1=(byte)y;
 *   u2=xb, u3=xb+colw, v2=(byte)y2, v3=(byte)y2; tpage=GetTPage(2,0,x&0xFFC0,y&0xFF00).
 * `x_run` (the raw's $fp) is reset to the `sx` PARAMETER once per OUTER (row) iteration and accumulates
 * by `colw` every INNER (column) iteration -- distinct from `sy`, which only advances by `rowh` once
 * per outer iteration and never resets. */
extern "C" int split_poly_area(POLY_FT4 *p, POLY_FT4 *bp, int offs, RECT *r, int sx, short sy, int correct)
{
    int rows = 0;
    short y = r->y;
    short h = r->h;
    short w = r->w;
    int hleft = (short)h;
    short yoff = -(h >> 1);
    short xoff = -(w >> 1);

    area_pw = 0;
    area_ph = 0;
    if (h != 0) {
        do {
            int rowh = 256 - (y & 0xFF);
            if (hleft < rowh)
                rowh = hleft;
            int x_run = sx;
            hleft -= rowh;
            area_pw = 0;
            short wleft = r->w;
            short x = r->x;
            if (wleft != 0) {
                short y2 = y + rowh;
                short yoff2 = yoff + rowh;
                do {
                    signed char xb = (signed char)(x & 0x3F);
                    short colw = 0x40 - xb;
                    if (wleft < colw)
                        colw = wleft;
                    wleft -= colw;
                    SetPolyFT4(p);
                    p->r0 = 0x80; p->g0 = 0x80; p->b0 = 0x80;
                    p->u0 = (unsigned char)xb; p->v0 = (unsigned char)y;
                    p->x0 = (short)x_run; p->y0 = sy;
                    p->u1 = (unsigned char)(xb + colw); p->v1 = (unsigned char)y;
                    p->x1 = (short)(x_run + colw); p->y1 = sy;
                    p->tpage = GetTPage(2, 0, x & 0xFFC0, y & 0xFF00);
                    p->u2 = (unsigned char)xb; p->x2 = (short)x_run; p->y2 = (short)(sy + rowh);
                    p->v2 = (unsigned char)y2;
                    p->u3 = (unsigned char)(xb + colw); p->v3 = (unsigned char)y2;
                    p->x3 = (short)(x_run + colw); p->y3 = (short)(sy + rowh);
                    if (bp != 0) {
                        POLY_FT4 *dst = bp;
                        POLY_FT4 *src = p;
                        while (src != p + 1)
                            *dst++ = *src++;
                        bp->r0 = (unsigned char)ENG_random(correct);
                        bp->g0 = (unsigned char)ENG_random(correct);
                        bp->b0 = (unsigned char)ENG_random(correct);
                        bp->x0 = x; bp->y0 = y; bp->x1 = x + colw; bp->y1 = y;
                        bp->x2 = x; bp->y2 = y2; bp->x3 = x + colw; bp->y3 = y2;
                        bp += 1;
                    }
                    x += colw;
                    x_run += colw;
                    tmdc_pol_offs[offs][area_pw][area_ph][0] = xoff;
                    tmdc_pol_offs[offs][area_pw][area_ph][1] = yoff;
                    area_pw += 1;
                    p += 1;
                } while (wleft != 0);
            }
            yoff += rowh;
            sy = (short)(sy + rowh);
            area_ph += 1;
            y += rowh;
        } while (hleft != 0);
    }
    return rows;
}

/* WIP -- NOT byte-verified (see split_poly_area note). @0x80156DD4 FMV.CPP:1009 */
extern "C" void rebuild_mdec_polys(int x, int y)
{
    /* tmdc_pol is [half][mbuf][poly] (half outer, confirmed against draw_mdec_polys's own +0x320
     * half-copy stride); rebuild always (re)writes the CURRENT decode buffer's half-0 copy.
     * Matches the raw's exact induction-variable reuse: row's byte term (row*8) is recomputed once
     * per OUTER iteration (loop-invariant across columns); the "next row" term ((row+1)*8) is a
     * running += accumulator across outer iterations, not recomputed; the mbuf*800 term is computed
     * once per INNER iteration and reused for both corners on that row; col*80 and (col+1)*80 are
     * each computed once per inner iteration and reused for both corners on that column edge. */
    POLY_FT4 *p = &tmdc_pol[0][mbuf][0];
    int row = 0;
    int row1_8 = 8;   /* (row+1)*8 */

    for (; row < mdec_ph[mbuf]; row++) {
        if (mdec_pw[mbuf] > 0) {
            int row8 = row * 8;
            for (int col = 0; col < mdec_pw[mbuf]; col++) {
                int c80 = col * 80;
                int mb800 = mbuf * 800;
                short *tl = (short *)((char *)tmdc_pol_offs + row8 + c80 + mb800);
                p->x0 = tl[0] + x; p->y0 = tl[1] + y;
                int c80n = (col + 1) * 80;
                short *tr = (short *)((char *)tmdc_pol_offs + row8 + c80n + mb800);
                p->x1 = tr[0] + x; p->y1 = tr[1] + y;
                short *bl = (short *)((char *)tmdc_pol_offs + row1_8 + c80 + mb800);
                p->x2 = bl[0] + x; p->y2 = bl[1] + y;
                short *br_ = (short *)((char *)tmdc_pol_offs + row1_8 + c80n + mb800);
                p->x3 = br_[0] + x; p->y3 = br_[1] + y;
                p += 1;
            }
        }
        row1_8 += 8;
    }
}

/* WIP -- NOT byte-verified (see split_poly_area note). @0x80156FB4 FMV.CPP:1044 */
extern "C" int draw_mdec_polys(signed char bright)
{
    int screen = PRIM_GetCurrentScreen();

    if (frame_decoded == 0)
        return screen;
    int state = screen & 0xFF;
    if (move_request != 0) {
        state = screen & 0xFF;
        if (mbuf != last_move_mbuf) {
            mdec_cx = move_x;
            mdec_cy = move_y;
            rebuild_mdec_polys(move_x, move_y);
            move_request -= 1;
            last_move_mbuf = mbuf;
            tmdc_pol_dirty[mbuf] = 1;
            state = screen & 0xFF;
        }
    }
    if (state == 1 && tmdc_pol_dirty[mbuf] != 0) {
        tmdc_pol_dirty[mbuf] = 0;
        for (int i = 0; i < num_pol[mbuf]; i++) {
            tmdc_pol[1][mbuf][i] = tmdc_pol[0][mbuf][i];
            br[1][mbuf][i] = br[0][mbuf][i];
        }
    }
    for (int i = 0; i < num_pol[mbuf]; i++) {
        POLY_FT4 *pp = &tmdc_pol[screen & 0xFF][mbuf][i];
        pp->r0 = bright; pp->g0 = bright; pp->b0 = bright;
        /* addPrim(ThisOt, pp) -- other TU's ordering-table head; left as a documented gap. */
    }
    int r = do_brightness;
    if (r != 0)
        do_brightness = 0;
    return r;
}

/* WIP -- NOT byte-verified (see split_poly_area note). @0x8015734C FMV.CPP:1111 */
extern "C" void init_mdec_polys(int x, int y, int w, int h, int bx1, int by1, int bx2, int by2, int correct)
{
    short w1 = w - 1, h1 = h - 1;
    RECT rr;

    frame_decoded = 0;
    mdc_buf[0].w = w1; mdc_buf[0].h = h1;
    mdc_buf[1].w = w1; mdc_buf[1].h = h1;
    mdc_buf[0].x = (short)bx1; mdc_buf[0].y = (short)by1;
    mdc_buf[1].x = (short)bx2; mdc_buf[1].y = (short)by2;
    rr.x = (short)bx1; rr.y = (short)by1; rr.w = w1; rr.h = h1;
    num_pol[0] = split_poly_area(&tmdc_pol[0][0][0], (POLY_FT4 *)&br[0][0][0], 0, &rr,
                                  x - (w1 >> 1), (unsigned short)(y - (h1 >> 1)), correct);
    mdec_pw[0] = area_pw;
    mdec_ph[0] = area_ph;
    for (int i = 0; i < num_pol[0]; i++) {
        tmdc_pol[1][0][i] = tmdc_pol[0][0][i];
        br[1][0][i] = br[0][0][i];
    }
    rr.x = (short)bx2; rr.y = (short)by2; rr.w = w1; rr.h = h1;
    num_pol[1] = split_poly_area(&tmdc_pol[0][1][0], (POLY_FT4 *)&br[0][1][0], 1, &rr,
                                  x - (w1 >> 1), (unsigned short)(y - (h1 >> 1)), correct);
    mdec_pw[1] = area_pw;
    mdec_ph[1] = area_ph;
    for (int i = 0; i < num_pol[1]; i++) {
        tmdc_pol[1][1][i] = tmdc_pol[0][1][i];
        br[1][1][i] = br[0][1][i];
    }
    mdec_w = w1;
    mdec_h = h1;
    mdec_cx = x;
    mdec_cy = y;
    last_mdc = -1;
    last_fn = -1;
}

/* @0x80156FA8 FMV.CPP:1034 */
extern "C" void clear_mdec_frame(void)
{
    frame_decoded = 0;
}

/* @0x8015732C FMV.CPP:1087 */
extern "C" void invalidate_mdec_frame(void)
{
    last_fn = -1;
    last_mdc = -1;
}

/* @0x80157340 FMV.CPP:1097 */
extern "C" int is_frame_decoded(void)
{
    return slices_to_do == 0;
}

/* @0x801576DC FMV.CPP:1159 */
extern "C" void set_mdec_poly_bright(unsigned char br_val)
{
    for (int b = 0; b < 2; b++) {
        for (int half = 0; half < 2; half++) {
            for (int i = 0; i < 10; i++) {
                tmdc_pol[b][half][i].r0 = br_val;
                tmdc_pol[b][half][i].g0 = br_val;
                tmdc_pol[b][half][i].b0 = br_val;
            }
        }
    }
}

/* @0x80157744 FMV.CPP:1180 */
extern "C" int init_mdec_stream(unsigned char *buftop, int sectors_per_frame, int mdec_frames_per_buffer)
{
    mdec_sectors_per_frame = sectors_per_frame;
    init_cdstream(sectors_per_frame, buftop, mdec_frames_per_buffer);
    mdec_framecount = 0;
    return (mdec_frames_per_buffer * mdec_sectors_per_frame) << 0xB;
}

/* @0x801578AC FMV.CPP:1283 */
extern "C" int kill_mdec_audio(void)
{
    SpuFree(mdec_audio_buffer[0]);
    return SpuFree(mdec_audio_buffer[1]);
}

/* @0x801578DC FMV.CPP:1290 */
extern "C" int stop_mdec_audio(void)
{
    return SpuSetKey(0, 3);
}

static int mdec_audio_rate;   /* v6[885]: sample rate arg saved by init_mdec_audio */

/* WIP -- NOT byte-verified (SPU streaming setup; no PC twin). @0x80157794 FMV.CPP:1191 */
extern "C" int init_mdec_audio(int rate)
{
    struct { int sample_rate; short a, b; int loop; short c, d, e, f; } comm_attr;

    SPU_Init();
    for (int i = 0; i < 5; i++)
        VSync(0);
    comm_attr.sample_rate = 707;
    comm_attr.a = 0x3FFF; comm_attr.b = 0x3FFF;
    comm_attr.loop = 1;
    comm_attr.c = 0; comm_attr.d = 0;
    SpuSetCommonAttr(&comm_attr);
    mdec_audio_buffer[0] = SpuMalloc(20480);
    mdec_audio_buffer[1] = SpuMalloc(20480);
    mdec_audio_offs = 0;
    mdec_audio_sec = 0;
    mdec_audio_rate = rate;
    if (mdec_audio_buffer[0] == -1 || mdec_audio_buffer[1] == -1)
        DBG_Error(0, "psxsrc/FMV.CPP", 1231);
    SpuSetTransferMode(0);
    SpuSetTransferStartAddr(mdec_audio_buffer[0]);
    SpuWrite0(6144);
    SpuIsTransferCompleted(1);
    SpuSetTransferMode(0);
    SpuSetTransferStartAddr(mdec_audio_buffer[1]);
    SpuWrite0(6144);
    return SpuIsTransferCompleted(1);
}

/* WIP -- NOT byte-verified (SPU double-buffer feed; no PC twin). @0x80157900 FMV.CPP:1298 */
extern "C" int play_mdec_audio(unsigned char *data, StHEADER *h)
{
    unsigned char *b = data;

    for (int i = 0; i < 2; i++) {
        if (mdec_audio_playing == 0) {
            b[1] |= 6;
            for (int j = 16; j < (int)h->frameSize; j += 16)
                (b + j)[1] |= 2;
        } else if (mdec_audio_playing == 9) {
            int j = 0;
            for (; j < (int)h->frameSize - 16; j += 16)
                (data + j)[1] |= 2;
            (data + j)[1] = 3;
        } else {
            for (int j = 0; j < (int)h->frameSize; j += 16)
                (data + j)[1] |= 2;
        }
        b += 2016;
        data += 2016;
    }
    SpuSetTransferMode(0);
    SpuSetTransferStartAddr(mdec_audio_buffer[0] + mdec_audio_offs);
    SpuWrite(mdec_audio_sec ? data - 2016 * (2 - mdec_audio_sec) : data - 4032, h->frameSize);
    SpuIsTransferCompleted(1);
    SpuSetTransferMode(0);
    SpuSetTransferStartAddr(mdec_audio_buffer[1] + mdec_audio_offs);
    SpuWrite(mdec_audio_sec ? data - 2016 + 2016 * mdec_audio_sec : data - 2016, h->frameSize);
    SpuIsTransferCompleted(1);
    mdec_audio_offs += (int)h->frameSize;
    /* WIP: retail's raw calls SpuSetKeyOnWithAttr once more here (callaudit-confirmed, byte shape not
     * yet verified) -- per the earlier ida draft, a 2-iteration loop builds a per-voice attr struct
     * (pitch=0x3FFF/adsr literals seen in set_mdec_audio_volume's own attr) and keys both voices on. */
    {
        struct { unsigned short mask; short l, r; short pitch, adsr1, adsr2, adsr3, adsr4; } attr;
        for (int v = 0; v < 2; v++) {
            attr.mask = 1 << v;
            attr.pitch = 0x3FFF;
            attr.l = (v == 0) ? 0x3FFF : 0;
            attr.r = (v == 1) ? 0x3FFF : 0;
            attr.adsr1 = 1;
            attr.adsr2 = 1;
            attr.adsr3 = 3;
            attr.adsr4 = 0;
            SpuSetKeyOnWithAttr(&attr);
        }
    }
    return 0;
}

/* @0x80157D00 FMV.CPP:1437 */
extern "C" void resync_audio(void)
{
    mdec_audio_playing = 2;
}

/* WIP -- NOT byte-verified (SPU per-voice volume; no PC twin). @0x80157C34 FMV.CPP:1418 */
extern "C" int set_mdec_audio_volume(short vol)
{
    struct { unsigned short mask; short l, r; short pitch, adsr1, adsr2, adsr3, adsr4; } voice_attr;
    unsigned short v = (unsigned short)((mdec_audio_rate * vol) >> 14);
    int i;

    for (i = 0; i < 2; i++) {
        voice_attr.pitch = 3;
        voice_attr.l = (i != 0) ? 0 : (short)v;
        voice_attr.r = (i == 1) ? (short)v : 0;
        voice_attr.mask = 1 << i;
        SpuSetVoiceAttr(&voice_attr);
    }
    return i < 2;
}

/* @0x80157D10 FMV.CPP:1448 */
extern "C" int stop_mdec_stream(void)
{
    SpuIsTransferCompleted(1);
    close_cdstream();
    wait_cdstream();
    mdec_streaming = 0;
    flush_cdstream();
    return stop_mdec_audio();
}

/* @0x80157D54 FMV.CPP:1460 */
extern "C" int dequeue_stream(void)
{
    struct mdec_queue_entry *a = &mdec_queue[mdec_head];

    if (mdecs_waiting != 0) {
        if (a->start == -1) {
            int len = open_cdstream(a->name, 0, 0);
            a->flag = 1;
            a->start = len / (mdec_sectors_per_frame << 11);
        } else {
            open_cdstream(a->name, a->start * mdec_sectors_per_frame, 0);
        }
        a->flag = 1;
        mdecs_waiting -= 1;
        mdec_head = (mdec_head + 1) & 0xF;
    }
    return mdec_head;
}

/* @0x80157E40 FMV.CPP:1486 */
extern "C" int dequeue_animation(void)
{
    struct mdec_queue_entry *a;

    a = &mdec_queue[mdec_head];
    if (mdecs_queued != 0) {
        mdec_head = (mdec_head + 1) & 0xF;
        if (a->start == -1) {
            flush_cdstream();
            int len = open_cdstream(a->name, 0, 0);
            mdec_stream_starting = 0;
            mdec_last_frame = -1;
            mdec_framecount = len / (mdec_sectors_per_frame << 11) - 1;
            mdecs_waiting -= 1;
        } else {
            if (a->flag == 0) {
                flush_cdstream();
                open_cdstream(a->name, a->start * mdec_sectors_per_frame, 0);
                mdecs_waiting -= 1;
            }
            mdec_framecount = a->end;
            mdec_stream_starting = a->start << 12;
            mdec_last_frame = a->end - 1;
        }
        mdec_streaming = 1;
        mdec_waiting_tail = 1;
        user_start = a->speed;
        mdecs_queued -= 1;
        return 1;
    }
    return 0;
}

/* @0x80157FF0 FMV.CPP:1548 */
extern "C" int decode_mdec_stream(int frames_elapsed)
{
    unsigned char *data = 0;
    StHEADER *h = 0;
    int want_frame;

    if (mdec_waiting_tail != 0 && mdec_stream_starting == 0)
        dequeue_stream();
    cdstream_service();
    if (!mdec_streaming)
        return 0;
    if (stream_chunks_in == 0)
        return stream_chunks_in;
    if (mdec_waiting_tail == 0) {
        want_frame = (mdec_stream_starting + user_start * frames_elapsed) >> 12;
        mdec_stream_starting += user_start * frames_elapsed;
        if (mdec_last_frame < want_frame) {
            for (;;) {
                cdstream_get_chunk(&data, &h);
                if (!mdec_streaming)
                    break;
                if (h->frameCount == mdec_framecount || (int)h->frameCount >= want_frame)
                    break;
                if (stream_chunks_in < 2)
                    break;
                cdstream_discard_chunk();
            }
        }
    } else {
        cdstream_get_chunk(&data, &h);
    }
    if (data != 0) {
        int half = mbuf;
        RECT *m = &mdc_buf[half];
        mdec_waiting_tail = 0;
        mdec_last_frame = h->frameCount;
        start_mdec_decode(data + 32, m->x, m->y, h->width, h->height);
        frame_decoded = 1;
        do_brightness = 1;
        mbuf ^= 1;
        play_mdec_audio(data + 8064, (StHEADER *)((char *)h + 256));
        cdstream_discard_chunk();
        if (h->frameCount == mdec_framecount) {
            if (mdecs_queued != 0)
                return dequeue_animation();
            else
                return stop_mdec_stream();
        }
    }
    return stream_chunks_in;
}

/* @0x801581D0 FMV.CPP:1626 */
extern "C" int play_mdec_stream(char *filename, int speed, int start, int end)
{
    struct mdec_queue_entry *a = &mdec_queue[mdec_tail];

    if (mdecs_queued >= 16)
        return 0;
    a->name = filename;
    a->speed = speed;
    a->start = start;
    a->end = end;
    a->flag = 0;
    mdecs_queued += 1;
    mdecs_waiting += 1;
    mdec_tail = (mdec_tail + 1) & 0xF;
    if (!mdec_streaming)
        return dequeue_animation();
    return 1;
}

/* @0x8015826C FMV.CPP:1652 */
extern "C" void clear_mdec_queue(void)
{
    if (mdecs_queued != 0) {
        mdec_waiting_tail = 0;
        mdec_head = 0;
        mdec_tail = 0;
        mdecs_waiting = 0;
        mdecs_queued = 0;
    }
}

/* @0x80158298 FMV.CPP:1666 */
extern "C" void StrClearVRAM(void)
{
    RECT clrRect;

    clrRect.x = 0; clrRect.y = 0; clrRect.w = 320; clrRect.h = 256;
    ClearImage(&clrRect, 0, 0, 0);
    clrRect.x = 320; clrRect.y = 0; clrRect.w = 320; clrRect.h = 256;
    ClearImage(&clrRect, 0, 0, 0);
    clrRect.x = 0; clrRect.y = 256; clrRect.w = 320; clrRect.h = 256;
    ClearImage(&clrRect, 0, 0, 0);
    clrRect.x = 320; clrRect.y = 256; clrRect.w = 320; clrRect.h = 256;
    ClearImage(&clrRect, 0, 0, 0);
}

/* @0x80158358 FMV.CPP:1700 */
typedef int jmp_buf[12];   /* PsyQ setjmp.h (psyq400/PSX/INCLUDE/SETJMP.H); same pattern as
                            * recon/source/diablo.cpp's CreateLevel D_8012EC28. */
extern "C" int setjmp(jmp_buf);
extern "C" void longjmp(jmp_buf, int);
extern "C" void GSYS_SetStackAndJump(void *Stack, void (*Func)(void *), void *Param);
extern "C" void LoPlayFMVOverLay(void *);
enum LANG_TYPE { LANG_ENGLISH, LANG_FRENCH, LANG_GERMAN, LANG_SPANISH, LANG_ITALIAN, LANG_JAPANESE };
extern int sglMasterVolume;

static jmp_buf D_80121D08;     /* PlayFMVOverLay's own setjmp env (right after g_movie_filename[32],
                                 * @0x80121CE8 + 0x20 = 0x80121D08). */
static char *D_8011C758;       /* filename stashed across the GSYS_SetStackAndJump handoff */
static int D_8011C75C;         /* w  ditto */
static int D_8011C760;         /* h  ditto */
/* Not gp-rel in the oracle (0x8012E534 is >32KB from $gp=0x8011A780, out of gp-relative range) --
 * an unsized extern array forces the 2-insn lui/addiu absolute form instead of a tentative-def gp_rel
 * access. Pre-allocated task stack top for LoPlayFMVOverLay; owning TU unknown/not yet reconstructed. */
extern unsigned char D_8012E534[];

extern "C" short PlayFMVOverLay(char *filename, int w, int h)
{
    sfx_volume = (sglMasterVolume * 0x3FFF) >> 8;
    if (!setjmp(D_80121D08)) {
        D_8011C758 = filename;
        D_8011C75C = w;
        D_8011C760 = h;
        GSYS_SetStackAndJump(D_8012E534, LoPlayFMVOverLay, 0);
    }
    return 0;
}

/* @0x801583E0 FMV.CPP:1737 -- see near-miss note: main FMV playback loop, uses ~15 other-TU helpers. */
static unsigned char D_8011B4E8;   /* language-variant byte for the DIABEND ending movie picker */

extern "C" void LoPlayFMVOverLay(void *)
{
    char *filename = D_8011C758;
    int w = D_8011C75C;
    int h = D_8011C760;
    int start = -1;
    int end = -1;
    int bright = 0x80;
    int fade = 0;
    int start_time = -1;
    RECT r;   /* SYM AUTO local (sp-0x30); unreferenced in the raw -- same frame-hole class as
               * wait_cdstream's start_wait (catalog 13A). */
    int i;

    time_in_frames = VID_GetTick();
    for (i = 0; i < 100; i++)
        systemtask(0);
    D_8011B4E8 = 0;
    if (strcmp("DIABEND.MOV", filename) != 0) {
        {
            int lang = LANG_GetLang();
            int v;
            switch (lang) {
            case LANG_ENGLISH: v = 1; goto set1;
            case LANG_FRENCH:  v = 2;
            set1:
                D_8011B4E8 = v;
                sprintf(g_movie_filename, "DIABEND1.MOV");
                break;
            case LANG_GERMAN: v = 1; goto set2;
            case LANG_SPANISH: v = 2;
            set2:
                D_8011B4E8 = v;
                sprintf(g_movie_filename, "DIABEND2.MOV");
                break;
            case LANG_ITALIAN:
                D_8011B4E8 = 1;
                sprintf(g_movie_filename, "DIABEND3.MOV");
                break;
            case LANG_JAPANESE:
                DBG_Error(0, "psxsrc/FMV.CPP", 1790);
                break;
            }
        }
    } else {
        strcpy(g_movie_filename, filename);
    }
    user_start = 0;
    streampos = 0;
    STR_AllocBuffer();
    vlc_buf = Tmalloc(0x1D4C0);
    img_buf = Tmalloc(0x22600);
    time_in_frames = VID_GetTick();
    init_mdec((unsigned char *)vlc_buf, (unsigned char *)vlc_tab);
    init_mdec_polys(160, 120, w, h, 0, 256, 320, 256, 128);
    set_mdec_img_buffer((unsigned char *)img_buf);
    init_mdec_audio(1);
    init_mdec_stream(map_buf, 10, 5);
    StrClearVRAM();
    /* NB: the raw's v1==1 arm reaches the shared play_mdec_stream call site WITHOUT ever setting $a1
     * on that path -- it falls through using whatever $a1 held from the preceding v1==0/default
     * comparison block (a genuine retail register-reuse artifact, not a real per-case constant).
     * Modeling case 0 with the DEFAULT arm's literal (0x1333) and case 1 with the "real" 0x1000
     * reproduces this byte-for-byte closer than the semantically-tidier 0x1000/0x1000 split (case 1's
     * "stale" value happens to coincide with whatever the case-0/default combination leaves behind). */
    switch (GetVideoMode()) {
    case 0:
        play_mdec_stream(g_movie_filename, 0x1000, start, end);
        break;
    case 1:
        play_mdec_stream(g_movie_filename, 0x1333, start, end);
        break;
    default:
        break;
    }
    SetDispMask(1);
    VID_GetTick();
    do {
        time_in_frames = VID_GetTick();
        if (start_time < time_in_frames) {
            TICK_Update();
            PAD_Handler();
            draw_mdec_polys((signed char)bright);
            if (fade != 0) {
                bright -= 8;
                set_mdec_audio_volume((short)(bright << 7));
            }
            VID_AfterDisplay();
        }
        decode_mdec_stream(1);
        if (start_time == -1 && mdec_last_frame != -1)
            start_time = time_in_frames;
        CPad *P1 = PAD_GetPad(0, 1);
        CPad *P2 = PAD_GetPad(0, 2);
        if ((P1->GetDown() & 0x10) != 0 || (P2->GetDown() & 0x10) != 0) {
            user_start = 1;
            fade = 1;
        }
        if ((P1->GetDown() & 0x40) != 0 || (P2->GetDown() & 0x40) != 0)
            fade = 1;
    } while (mdec_streaming != 0 && bright >= 0);
    stop_mdec_stream();
    wait_cdstream();
    kill_mdec_audio();
    VID_SetDBuffer(0);
    VSync(0);
    Tfree(vlc_buf);
    Tfree(img_buf);
    StrClearVRAM();
    TSK_Sleep(1);
    StrClearVRAM();
    TSK_Sleep(3);
    longjmp(D_80121D08, 1);
}

