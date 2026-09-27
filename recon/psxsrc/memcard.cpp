/* MEMCARD.CPP -- Diablo PSX (Climax 1998) reconstruction (PSXSRC/MEMCARD.CPP, FRONTEND overlay).  No PC
 * twin: the memory-card file layer (directory scan, save-file read/write/delete/format, the card event
 * poll) on top of PsyQ LIBCARD/LIBAPI, plus the ASCII <-> Shift-JIS title helpers the save headers need.
 * Sources: retail asm oracle (asm/nonmatchings/memcard) > SYM (scratch/tuinfo.py MEMCARD.CPP) >
 * refs/skeleton/JAP_1998_05_29/DIABPSX/PSXSRC/MEMCARD.CPP drafts.  Layouts from tools/symhdr.py. */
#include "diabpsx_types.h"
#include "psxsrc/gen/structs_memcard.h"
#include "psxsrc/gen/externs_memcard.h"
#include "psxsrc/gen/protos_memcard.h"

extern "C" {
char *strcpy(char *dst, const char *src);
int sprintf(char *buf, const char *fmt, ...);
void *memset(void *s, int c, unsigned int n);
void *memcpy(void *d, const void *s, unsigned int n);
long TestEvent(unsigned long event);
long _card_load(long chan);
long _card_wait(long chan);
long _card_clear(long chan);
void _bu_init(void);
long _get_errno(void);
struct DIRENTRY *firstfile(char *name, struct DIRENTRY *dir);
struct DIRENTRY *nextfile(struct DIRENTRY *dir);
long open(char *devname, unsigned long flag);
long close(long fd);
long read(long fd, void *buf, long n);
long write(long fd, void *buf, long n);
long erase(char *name);
long format(char *fs);
}

extern void (*mem_card_event_handler)(int event, int card_number);   /* @0x8011B174 */

/* TU-owned small globals (%gp_rel in the oracle) */
int to_ascii_invalid_char;   /* @0x8011B3C8 */
char dirflag;   /* @0x8011B3DB */
int card_status[2];   /* @0x8011B3DC */

/* @0x801426F8 MEMCARD.CPP:137 */
void endian_swap(unsigned char *b, int byts)
{
    int i;
    unsigned char t;

    for (i = 0; i < byts; i += 2) {
        t = b[i];
        b[i] = b[i + 1];
        b[i + 1] = t;
    }
}

/* @0x8014272C MEMCARD.CPP:145 */
void sjis_endian_swap(unsigned char *b, int byts)
{
    int i;
    unsigned char t;

    for (i = 0; i < byts; i++) {
        if (b[i + 1] & 0x80) {
            t = b[i];
            b[i] = b[i + 1];
            b[i + 1] = t;
            i++;
        }
    }
}

/* @0x80142774 MEMCARD.CPP:167 */
unsigned short to_sjis(char asc)
{
    struct sjis *sp;

    sp = sjis_table;
    while (sp->ascii) {
        if (asc >= sp->ascii && asc < sp->ascii + sp->num)
            return sp->sjis + (asc - sp->ascii);
        sp++;
    }
    return 0x8148;
}

/* @0x801427F4 MEMCARD.CPP:200 */
char to_ascii(unsigned short sjis)
{
    struct sjis *sp;

    sp = sjis_table;
    while (sp->ascii) {
        if (sjis >= sp->sjis && sjis < sp->sjis + sp->num)
            return sp->ascii + (sjis - sp->sjis);
        sp++;
    }
    to_ascii_invalid_char = 1;
    return '?';
}

/* @0x8014287C MEMCARD.CPP:229 */
void ascii_to_sjis(unsigned char *asc, unsigned short *sjis)
{
    while (*asc) {
        if (*asc & 0x80) {
            *sjis++ = (asc[0] << 8) | asc[1];
            asc += 2;
        } else {
            *sjis++ = to_sjis(*asc++);
        }
    }
    *sjis++ = 0;   /* the post-increments raise sjis's ref count over asc's: retail sjis->s0, asc->s1 */
    *sjis++ = 0;
}

/* @0x80142904 MEMCARD.CPP:246 */
int is_sjis(unsigned char *buf)
{
    return *buf >> 7;
}

/* @0x80142910 MEMCARD.CPP:251 */
int sjis_to_ascii(unsigned short *sjis, char *asc)
{
    to_ascii_invalid_char = 0;
    if (*sjis & 0x8000) {
        while (*sjis) *asc++ = to_ascii(*sjis++);
        *asc = 0;
    } else {
        strcpy(asc, (char *)sjis);
    }
    return to_ascii_invalid_char == 0;
}

/* @0x80142CE4 MEMCARD.CPP:503 */
int checksum_data(char *buf, int size)
{
    int chk = 0xDEADBEEF;

    while (size--) chk -= *buf++;
    return chk;
}

/* @0x80142BF4 MEMCARD.CPP:418 — LIBCARD event poll after _card_load: ev0 = formatted, ev1/ev2 = card
 * gone, ev3 = new card (read block 0 and check the "MC" signature) */
int test_card_format(int card_number)
{
    _card_load(card_number << 4);
    _card_wait(card_number);
    if (TestEvent(card_ev0) == 1) return 1;
    if (TestEvent(card_ev1) == 1) {
        card_removed(card_number);
        return 0;
    }
    if (TestEvent(card_ev2) == 1) {
        card_removed(card_number);
        return 0;
    }
    if (TestEvent(card_ev3) == 1) {
        if (read_card_block(card_number, 0) && block_buf[0] == 'M' && block_buf[1] == 'C') return 1;
        return 0;
    }
    return 0;
}

/* @0x80142D20 MEMCARD.CPP:520 */
int delete_card_file(int card_number, int file)
{
    char path[80];

    if (card_usable[card_number]) {
        if (file >= card_files[card_number]) return 0;
        if (mem_card_event_handler) mem_card_event_handler(5, card_number);
        sprintf(path, "bu%d0:%s", card_number, card_dir[card_number][file].name);
        if (erase(path)) {
            card_dirty[card_number] = 1;
            card_changed[card_number] = 1;
            return 1;
        }
    }
    return 0;
}

/* @0x80142FF4 MEMCARD.CPP:702 */
int format_card(int card_number)
{
    char path[80];

    if (card_status[card_number] == 0) {
        card_dirty[card_number] = 1;
        card_changed[card_number] = 1;
        card_files[card_number] = 0;
        if (mem_card_event_handler) mem_card_event_handler(4, card_number);
        sprintf(path, "bu%d0:", card_number);
        if (format(path)) return card_usable[card_number] = test_card_format(card_number);
    }
    return 0;
}

/* @0x8014340C MEMCARD.CPP:900 */
void new_card(int card_number)
{
    if (mem_card_event_handler) mem_card_event_handler(1, card_number);
    _bu_init();
    _card_clear(card_number << 4);
    _card_wait(card_number);
    if (test_hw_event() == 0) {
        card_usable[card_number] = test_card_format(card_number);
        read_card_directory(card_number);
    } else {
        card_removed(card_number);
    }
}

/* @0x80142998 MEMCARD.CPP:280 — scan bu<n>0:* into card_dir[n], then read each save's 512-byte header
 * (title byte-swapped and converted from Shift-JIS in place).  A card that is not usable while either
 * slot reports status 3 marks the OTHER slot dirty. */
void read_card_directory(int card_number)
{
    char path[80];
    struct DIRENTRY *dir;
    int i;
    int fh;
    int r;

    dir = card_dir[card_number];
    if (mem_card_event_handler) mem_card_event_handler(0, card_number);
    if (card_usable[card_number]) {
        sprintf(path, "bu%d0:*", card_number);
        card_files[card_number] = 0;
        if (firstfile(path, dir)) {
            do {
                dir++;
                card_files[card_number]++;
            } while (nextfile(dir));
        }
        for (i = 0; i < card_files[card_number]; i++) {
            sprintf(path, "bu%d0:%s", card_number, card_dir[card_number][i].name);
            fh = open(path, 1);
            if (fh != -1) {
                r = read(fh, &card_header[card_number][i], 0x200);
                endian_swap(card_header[card_number][i].title, 64);
                sjis_to_ascii((unsigned short *)card_header[card_number][i].title, (char *)card_header[card_number][i].title);
                close(fh);
            }
            if (fh == -1 || r == -1) {
                card_removed(card_number);
                PantsDelay();
                return;
            }
            card_changed[card_number] = 1;
        }
    } else {
        if (card_status[0] == 3 || card_status[1] == 3) {
            if (card_number == 1) card_dirty[0] = 1;
            else card_dirty[1] = 1;
        }
    }
}

/* @0x801434A0 MEMCARD.CPP:945 — per-frame card state follow-up: status 0 after 1/2/4 or status 3 flags a
 * new card, status 2 after 0 drops usability; a dirty card is re-tested and its directory re-read */
void service_card(int card_number)
{
    int last_status = last_card_status[card_number];

    switch (card_status[card_number]) {
    case 0:
        if (last_status == 1 || last_status == 2 || last_status == 4) new_card_flag[card_number] = true;
        break;
    case 1:
        break;
    case 2:
        if (last_status == 0) {
            if (mem_card_event_handler) mem_card_event_handler(8, card_number);
            card_usable[card_number] = 0;
        }
        break;
    case 3:
        new_card_flag[card_number] = true;
        break;
    case 4:
        break;
    }
    if (card_dirty[card_number]) {
        card_usable[card_number] = test_card_format(card_number);
        dirflag = 1;
        read_card_directory(card_number);
        dirflag = 0;
        card_dirty[card_number] = 0;
    }
}

/* @0x80142E18 MEMCARD.CPP:572 — read a save: 3 = card unusable, 2 = bad slot/id, 1 = open failed,
 * -2 = checksum error, else 0 on success (1 after 5 failed tries).  The payload read is rounded up to
 * the 128-byte card sector. */
int read_card_file(int card_number, int file, int id, char *buf)
{
    int okay = 0;
    int tries = 4;
    int fd;
    int r;
    int size;
    int checksumerror = 0;
    struct file_header h;
    char path[80];

    if (card_usable[card_number]) {
        if (file < card_files[card_number]) {
            if (card_header[card_number][file].id == id) {
                if (mem_card_event_handler) mem_card_event_handler(3, card_number);
                sprintf(path, "bu%d0:%s", card_number, card_dir[card_number][file].name);
                do {
                    fd = open(path, 1);
                    if (fd == -1) return 1;
                    if (read(fd, &h, 0x200) != -1) {
                        size = h.size;
                        if ((size + 512) & 127) size += 128 - ((size + 512) & 127);
                        r = read(fd, buf, size);
                        if (r != -1 && r == size) {
                            if (checksum_data(buf, h.size) != h.chksum) {
                                okay = 1;
                                checksumerror = 1;
                            } else {
                                okay = 1;
                            }
                        }
                    }
                    close(fd);
                } while (!okay && --tries != -1);
                if (checksumerror) return -2;
                return okay ^ 1;
            }
            return 2;
        }
        return 2;
    }
    return 3;
}

/* @0x801430B8 MEMCARD.CPP:757 — build the 512-byte save header ("SC", type 0x11, block count, Shift-JIS
 * title, clut + 3 icon frames, id/size/checksum) and write header + sector-rounded payload.
 * Returns write_ok 0 / write_error 1 / write_no_space 2 (errno 28) / write_no_card 3. */
int write_card_file(int card_number, int id, char *name, char *title, unsigned char *icon, unsigned short *clut, int size, unsigned char *buf)
{
    struct file_header h;
    int fd;
    int failed;
    int e = -1;
    char path[80];

    sprintf(path, "bu%d0:%s", card_number, name);
    h.magic[0] = 'S';
    h.magic[1] = 'C';
    h.type = 0x11;
    h.blockentry = ((size + sizeof(struct file_header)) >> 13) + (((size + sizeof(struct file_header)) & 0x1FFF) ? 1 : 0);
    memset(h.title, 0, 64);
    ascii_to_sjis((unsigned char *)title, (unsigned short *)h.title);
    endian_swap(h.title, 64);
    memcpy(h.clut, clut, 32);
    memcpy(h.icon, icon, 0x180);
    h.id = id;
    h.size = size;
    h.chksum = checksum_data((char *)buf, size);
    for (int Loop = 27; Loop >= 0; Loop--) h.reserved[Loop] = 0;
    failed = 1;
    if (card_usable[card_number]) {
        if (mem_card_event_handler) mem_card_event_handler(2, card_number);
        fd = open(path, (h.blockentry << 16) | 0x200);
        if (fd != -1) {
            if (write(fd, &h, 0x200) == 0x200) {
                if ((size + 512) & 127) size += 128 - ((size + 512) & 127);
                if (write(fd, buf, size) == size) {
                    failed = 0;
                    close(fd);
                }
            }
        }
        if (failed) {
            if (e == -1) e = _get_errno();
            if (fd != -1) close(fd);
            if (e == 28) return 2;
            card_dirty[card_number] = 1;
            card_changed[card_number] = 1;
            return 1;
        }
        card_dirty[card_number] = 1;
        card_changed[card_number] = 1;
        return 0;
    }
    return 3;
}
