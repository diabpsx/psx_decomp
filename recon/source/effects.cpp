/* EFFECTS.CPP — Diablo PSX (Climax 1998) reconstruction (main image).  Twin: refs/diablo-hellfire/src/EFFECTS.CPP.
 * Layouts / prototypes / externs generated from DIABPSX.SYM (tools/symhdr.py -> gen/*.h).
 * PSX deltas vs hellfire: the whole Storm/SFile-based file-streaming (SFileOpenFile/SFileDdaBeginEx/
 * SFileDdaGetPos) is replaced by the PSX CD-XA "STR_" API (STR_PlaySound/STR_SoundCommand/STR_setvolume);
 * the DEBUG_STREAM fallback path (debug_stream/debug_stream_update) does not exist on PSX; TSFX shrank
 * from {bFlags,pszName char*,pSnd TSnd*} to a packed 4-byte {Channel,bFlags,pszName==numeric bank id};
 * per-monster sound storage collapsed from a [MAX_MS+1][2] TSnd* array to one CMonster::Snds bank-id
 * (InitMonsterSND/FreeMonsterSnd/PlayEffect index it as Snds+mode, no runtime file loads at all);
 * calc_snd_position adds a PSX-only on-screen visibility gate (BL_GetCurrentBlocks()->GetScrXY) before
 * the pan/volume falloff math, using the raw dungeon x/y directly (no player-relative subtraction is
 * done in this function on PSX -- the x==0&&y==0 case returns TRUE at the default centered volume/pan
 * without going through the screen check, matching "sound source at the reference point is always
 * audible"). stream_pause/stream_resume/stream_fade are PSX-only additions (no PC counterpart). */
#include "diabpsx_types.h"
#include "psxsrc/textdat_header.h"
#include "psxsrc/textfileinfo_header.h"
#include "source/gen/structs_effects.h"
#include "source/gen/externs_effects.h"
#include "source/gen/protos_effects.h"
#include "source/diablo.h"

/* sound flag bits (TSFX::bFlags), matching hellfire's #defines */
#define sfx_STREAM        0x01
#define sfx_ALLOWMULTIPLE 0x02
#define sfx_MENU          0x04
#define sfx_MONK          0x08
#define sfx_ROGUE         0x10
#define sfx_WARRIOR       0x20
#define sfx_SORCEROR      0x40
#define sfx_DEBUG_STREAM  0x80
/* PSX only ever ships Warrior/Rogue/Sorceror (no Monk/Bard/Barbarian) -- CHAR_MASK is 3 bits here,
   not hellfire's 4 (confirmed by the 0x8F/0x70 masks in priv_sound_init/stream_play's oracle). */
#define sfx_CHAR_MASK (sfx_ROGUE|sfx_WARRIOR|sfx_SORCEROR)

#define NUM_SFX 992   /* sizeof(sgSFX)/sizeof(sgSFX[0]) -- oracle loop bound 0xF80 / sizeof(TSFX)=4 */

/* Retail PSX ownership and names, including the externally visible stream state. */
SFXHDR *sghStream = 0;
TSFX *sgpStreamSFX = 0;
static int SFXX = 0;
static int SFXY = 0;
static int SFXW = 320;
static int SFXH = 240;
int mypan = 0x8000;
int sfxdelay = 0;
int sfxdnum = 0;
#include "source/gen/table_effects.h"

/* line 83 @0x8003CF34 */
unsigned char effect_is_playing(int nSFX)
{
    if (sghStream && sghStream->SfxNo == nSFX) return 1;
    return 0;
}

/* line 107 @0x8003CF5C */
void stream_stop(void)
{
    if (FileSYS == 2) {
        SFXTab[1].volume = 0;
        STR_setvolume(&SFXTab[1]);
        if (sghStream) {
            STR_SoundCommand(sghStream, 8);
            TSK_Sleep(1);
        }
    }
}

/* line 127 @0x8003CFB8 */
void stream_pause(void)
{
    if (FileSYS == 2) {
        SFXTab[1].volume = 0;
        STR_setvolume(&SFXTab[1]);
        if (sghStream && sghStream->used)
            STR_SoundCommand(sghStream, 3);
    }
}

/* line 148 @0x8003D01C */
void stream_resume(void)
{
    if (FileSYS == 2) {
        if (sghStream && sghStream->used)
            STR_SoundCommand(sghStream, 4);
    }
}

/* line 169 @0x8003D06C */
static void stream_play(TSFX *pSFX, long lVolume, long lPan)
{
    if (FileSYS != 2) return;
    if (CDWAIT) return;

    if (pSFX->bFlags & sfx_STREAM) {
        lVolume = (sglSoundVolume * sglMasterVolume) >> 8;
        stream_stop();
    } else {
        if (!(pSFX->bFlags & 0x70)) stream_stop();
        lVolume = (sglSpeechVolume * sglMasterVolume) >> 8;
    }

    if (lVolume < 0) return;
    if (lVolume >= 0x4000) lVolume = 0x3FFF;

    sghStream = STR_PlaySound(pSFX->pszName, 0, lVolume, 0);
    sgpStreamSFX = pSFX;
}

/* line 213 @0x8003D158 */
static void stream_update(void)
{
}

/* line 235 @0x8003D160 */
static void sfx_stop(void)
{
    for (unsigned long d = NUM_SFX; d--; ) { }
}

/* line 249 @0x8003D17C */
void InitMonsterSND(int monst)
{
    if (!gbSndInited) return;

    int mtype = Monsters[monst].mtype;
    Monsters[monst].Snds = monsterdata[mtype].sndfile;
}

/* line 286 @0x8003D1D4 */
void FreeMonsterSnd(void)
{
}

/* line 327 @0x8003D1DC */
static unsigned char calc_snd_position(int x, int y, long *plVolume, long *plPan)
{
    char Temp[64];
    long volume;
    long pan;
    int scrx, scry;
    CBlocks *gblocks;
    RECT R;
    long vol;

    *plVolume = (sglSoundVolume * sglMasterVolume) >> 8;
    *plPan = 0x8000;

    if (!dung_map[x][y].dFlags)
        return 0;
    if (x + y == 0)
        return 1;

    gblocks = BL_GetCurrentBlocks();
    if (!gblocks)
        return 0;

    gblocks->GetScrXY(R, x * 20, y * 20, 0, 0);

    scrx = R.x;
    scry = R.y;

    if (scrx < SFXX) return 0;
    if (SFXX + SFXW < scrx) return 0;
    if (scry < SFXY) return 0;
    if (SFXY + SFXH < scry) return 0;

    if (MONO) return 1;

    pan = scrx * 204;
    if (pan < 0) pan = 0;
    if (pan > 0x10000) pan = 0x10000;

    vol = (sglSoundVolume * sglMasterVolume) << 8;
    scry = SFXW / 2;
    if (scry < scrx)
        scrx = SFXW - scrx;
    /* Identical arms: jump2 cross-jumps them after register allocation, so the test costs no code,
     * but the extra scry reference lifts scry's allocation priority above scrx (retail a0/a1). */
    if (scry) {
        scrx *= 2;
        volume = scrx * (vol / scry);   /* SYM: volume REG $-1 = lives in LO (the mult result) */
    } else {
        scrx *= 2;
        volume = scrx * (vol / scry);
    }
    *plVolume = volume >> 16;
    *plPan = pan;
    return 1;
}

/* line 375 @0x8003D3C4 */
static void PlaySFX_priv(TSFX *pSFX, unsigned char loc, int x, int y)
{
    if (!gbSndInited) return;

    long lPan = 0x8000;
    long lVolume = (sglSoundVolume * sglMasterVolume) >> 8;

    if (loc && !calc_snd_position(x, y, &lVolume, &lPan))
        return;

    if ((pSFX->bFlags & sfx_STREAM) || (pSFX->bFlags & sfx_ALLOWMULTIPLE)) {
        lVolume = (sglSoundVolume * sglMasterVolume) >> 8;
        lPan = 0x8000;
        if (optionsflag) {
            lVolume = (sglSpeechVolume * sglMasterVolume) >> 8;
            SND_PlaySnd(sgSFX[50].pszName, lVolume, 0x8000, 0);
            return;
        }
        stream_play(pSFX, lVolume, 0x8000);
        return;
    }

    if (*(unsigned short *)pSFX & 0xC00) {
        snd_play_snd(pSFX, lVolume, lPan);
    } else {
        if (!snd_playing(pSFX->pszName))
            snd_play_snd(pSFX, lVolume, lPan);
    }
}

/* line 433 @0x8003D528 */
void PlayEffect(int i, int mode)
{
    ENG_random(2);

    if (plr[myplr].pLvlLoad) return;
    if (!gbSndInited) return;
    if (gbBufferMsgs) return;

    int mi = monster[i]._mMTidx;
    if (snd_playing(Monsters[mi].Snds + mode)) return;

    long lPan;
    long lVolume;
    if (!calc_snd_position(monster[i]._mx, monster[i]._my, &lVolume, &lPan))
        return;

    snd_play_msnd((Monsters[mi].Snds + mode) & 0xFFFF, lVolume, lPan);
}

/* line 485 @0x8003D670 */
static int RndSFX(int psfx)
{
    int nRand;

    if (psfx == 0x316) nRand = 2;
    else if (psfx == 0x2D9) nRand = 3;
    else if (psfx == 0x2DC) nRand = 3;
    else if (psfx == 0x2DF) nRand = 3;
    else if (psfx == 0x240) nRand = 2;
    else if (psfx == 0x2A8) nRand = 2;
    else if (psfx == 0x9) nRand = 2;
    else if (psfx == 0x43) nRand = 2;
    else if (psfx == 0x2C) nRand = 2;
    else if (psfx == 0x10) nRand = 2;
    else if (psfx == 0) return 2;
    else if (psfx == 0x2CD) nRand = 3;
    else return psfx;

    return psfx + ENG_random(nRand);
}

/* line 520 @0x8003D718 */
void PlaySFX(int psfx)
{
    if (psfx == 0 && plr[0].plractive && plr[1].plractive)
        return;

    psfx = RndSFX(psfx);
    PlaySFX_priv(&sgSFX[psfx], 0, 0, 0);
}

/* line 535 @0x8003D784 */
void PlaySfxLoc(int psfx, int x, int y)
{
    psfx = RndSFX(psfx);

    if ((unsigned int)psfx < 4) {
        /* walk-type sfx: in 2-player co-op, both share one screen -- skip the extra
           footsteps; otherwise play centered/non-positional. */
        if (plr[0].plractive && plr[1].plractive)
            return;
        PlaySFX_priv(&sgSFX[psfx], 0, 0, 0);
        return;
    }

    PlaySFX_priv(&sgSFX[psfx], 1, x, y);
}

/* line 554 @0x8003D830 */
void sound_stop(void)
{
    snd_update(1);
    stream_stop();
    sfx_stop();

    int mi, mode, nr;
    for (mi = 0; mi < nummtypes; mi++) {
        for (mode = 0; mode < 4; mode++) {
            for (nr = 0; nr < 2; nr++) {
                TSFX *pSnd = (TSFX *)0;
                snd_stop_snd((TSnd *)pSnd);
            }
        }
    }
}

/* line 576 @0x8003D8C8 */
void sound_update(void)
{
    if (!gbSndInited) return;
    snd_update(0);
    stream_update();
}

/* line 594 @0x8003D8FC */
static void priv_sound_init(unsigned char bLoadMask)
{
    if (!gbSndInited) return;

    unsigned char bCharMask = bLoadMask & sfx_CHAR_MASK;
    bLoadMask ^= bCharMask;

    for (unsigned long d = 0; d < NUM_SFX; d++) {
        if (sgSFX[d].bFlags & sfx_STREAM) continue;
        if (bLoadMask && !(sgSFX[d].bFlags & bLoadMask)) continue;
        if (sgSFX[d].bFlags & sfx_CHAR_MASK) {
            if (!(sgSFX[d].bFlags & bCharMask)) continue;
        }
    }
}

/* line 631 @0x8003D940 */
void sound_init(void)
{
    unsigned char bLoadMask = 0;
    if (gbMaxPlayers > 1)
        bLoadMask = 0x70;
    else if (plr[myplr]._pClass == 0)
        bLoadMask = sfx_WARRIOR;
    else if (plr[myplr]._pClass == 1)
        bLoadMask = sfx_ROGUE;
    else if (plr[myplr]._pClass == 2)
        bLoadMask = sfx_SORCEROR;
    priv_sound_init(bLoadMask);
}

/* line 656 @0x8003D9E8 */
void stream_fade(void)
{
    if (FileSYS == 2) {
        if (sghStream)
            STR_SoundCommand(sghStream, 5);
    }
}
