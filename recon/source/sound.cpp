/* SOURCE/SOUND.CPP — Diablo PSX (Climax 1998) reconstruction.
 * PC lineage: refs/diablo-hellfire/src/SOUND.CPP (DirectSound-based) -- the PSX layer replaces the
 * whole DirectSound engine with the SPU-based SND_ and STR_ API (SNDBANK.CPP, STREAM.CPP), so only
 * the public entry-point NAMES and high-level intent (volume clamp, music start/stop/fade, dup-sound
 * update) carry over; the bodies below are transcribed straight from the retail oracle.
 * Layouts, prototypes, externs generated from DIABPSX.SYM (tools/symhdr.py -> gen headers). */
#include "diabpsx_types.h"
#include "source/gen/structs_sound.h"
#include "source/gen/externs_sound.h"
#include "source/gen/protos_sound.h"

#define SND_NUM_VOICES 24

/* SOUND.CPP-owned globals (.sdata; SYM class EXT).  Tentative definitions in the OWNER TU make them
 * gp-relative (`lw/sb ...,%gp_rel(sym)($gp)`) exactly like retail; `extern` would materialize
 * absolute lui/lw (methodology 3.12 #6). */
unsigned char gbSndInited;
long sglMasterVolume;
long sglMusicVolume;
int sgnMusicTrack;
SFXHDR *sghMusic;

/* line 108 @0x80077D14 */
void snd_update(unsigned char bStopAll)
{
    /* PC ALLOW_DUP_SOUNDS duplicate-voice sweep -- PSX has no software duplicate-buffer pool
     * (the SPU has its own hardware voices), so this entry point is a no-op stub. */
}

/* line 132 @0x80077D1C */
void snd_stop_snd(TSnd *pSnd)
{
    for (int v = 0; v < SND_NUM_VOICES; v++)
        SND_StopSnd(v);
}

/* line 145 @0x80077D58 */
void snd_play_snd(TSFX *pSnd, long lVolume, long lPan)
{
    if (!pSnd)
        return;

    lVolume *= 2;
    if (lVolume < 0)
        lVolume = 0;
    else if (lVolume >= 0x4000)
        lVolume = 0x3FFF;

    SND_PlaySnd(pSnd->pszName, lVolume, lPan, 0);
}

/* line 172 @0x80077DA0 */
void snd_play_msnd(unsigned short pszName, long lVolume, long lPan)
{
    int padj;

    if (lVolume < 0)
        lVolume = 0;
    else if (lVolume >= 0x4000)
        lVolume = 0x3FFF;

    padj = (GU_GetRnd() & 0x7F) - 0x40;
    SND_PlaySnd(pszName, lVolume, lPan, padj);
    if (pszName == 0x391)
        SND_PlaySnd(0x395, lVolume, lPan, padj);
}

/* line 209 @0x80077E40 */
void snd_init(unsigned long hWnd)
{
    gbSndInited = 1;
}

/* line 227 @0x80077E50 */
void music_stop(void)
{
    if (FileSYS == 2) {
        if (sghMusic)
            STR_SoundCommand(sghMusic, 8);
    }
}

/* line 245 @0x80077E90 */
void music_fade(void)
{
    if (FileSYS == 2) {
        if (sghMusic)
            STR_SoundCommand(sghMusic, 5);
    }
}

/* line 261 @0x80077ED0 */
void music_start(int nTrack)
{
    if (FileSYS == 2) {
        int MusicVolume;

        if (sghMusic)
            music_stop();

        MusicVolume = sglMusicVolume;
        sghMusic = STR_PlaySound(sgszMusicTracks[nTrack], 1, (MusicVolume * sglMasterVolume) >> 8, 1);
        if (!sghMusic)
            DBG_Error(NULL, "source/SOUND.cpp", 0x113);

        sgnMusicTrack = nTrack;
    }
}

/* line 315 @0x80077F70 */
unsigned char snd_playing(int SFXNo)
{
    return SND_IsSfxPlaying(SFXNo);
}
