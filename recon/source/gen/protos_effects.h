/* cross-TU callees */
void STR_setvolume(SFXHDR *sfh);   /* @0x80099010 STREAM.CPP:736 */
void STR_SoundCommand(SFXHDR *sfh, int Command);   /* @0x80099388 STREAM.CPP:876 */
SFXHDR * STR_PlaySound(unsigned short Name, char flag, int volume, char loop);   /* @0x80098DC8 STREAM.CPP:597 */
extern "C" void TSK_Sleep(int Frames);   /* @0x800203B8 TASKER.C:287 */
CBlocks * BL_GetCurrentBlocks(void);   /* @0x800919EC BLOCK.CPP:2805 */
int SND_PlaySnd(unsigned short Name, int vol, int pan, int pitchadj);   /* @0x8009A79C SNDBANK.CPP:498 */
unsigned char snd_playing(int SFXNo);   /* @0x80077F70 SOUND.CPP:315 */
void snd_play_snd(TSFX *pSFX, long lVolume, long lPan);   /* @0x80077D58 SOUND.CPP:145 */
void snd_play_msnd(unsigned short pszName, long lVolume, long lPan);   /* @0x80077DA0 SOUND.CPP:172 */
struct TSnd;
void snd_stop_snd(TSnd *pSnd);   /* @0x80077D1C SOUND.CPP:132 */
void snd_update(unsigned char bStopAll);   /* @0x80077D14 SOUND.CPP:108 */
long ENG_random(long v);   /* @0x8003DB24 ENGINE.CPP:113 */

/* effects.cpp's own functions */
unsigned char effect_is_playing(int nSFX);   /* @0x8003CF34 EFFECTS.CPP:83 */
void stream_stop(void);   /* @0x8003CF5C EFFECTS.CPP:107 */
void stream_pause(void);   /* @0x8003CFB8 EFFECTS.CPP:127 */
void stream_resume(void);   /* @0x8003D01C EFFECTS.CPP:148 */
static void stream_play(TSFX *pSFX, long lVolume, long lPan);   /* @0x8003D06C EFFECTS.CPP:169 */
static void stream_update(void);   /* @0x8003D158 EFFECTS.CPP:213 */
static void sfx_stop(void);   /* @0x8003D160 EFFECTS.CPP:235 */
void InitMonsterSND(int monst);   /* @0x8003D17C EFFECTS.CPP:249 */
void FreeMonsterSnd(void);   /* @0x8003D1D4 EFFECTS.CPP:286 */
static unsigned char calc_snd_position(int x, int y, long *plVolume, long *plPan);   /* @0x8003D1DC EFFECTS.CPP:327 */
static void PlaySFX_priv(TSFX *pSFX, unsigned char loc, int x, int y);   /* @0x8003D3C4 EFFECTS.CPP:375 */
void PlayEffect(int i, int mode);   /* @0x8003D528 EFFECTS.CPP:433 */
static int RndSFX(int psfx);   /* @0x8003D670 EFFECTS.CPP:485 */
void PlaySFX(int psfx);   /* @0x8003D718 EFFECTS.CPP:520 */
void PlaySfxLoc(int psfx, int x, int y);   /* @0x8003D784 EFFECTS.CPP:535 */
void sound_stop(void);   /* @0x8003D830 EFFECTS.CPP:554 */
void sound_update(void);   /* @0x8003D8C8 EFFECTS.CPP:576 */
static void priv_sound_init(unsigned char bLoadMask);   /* @0x8003D8FC EFFECTS.CPP:594 */
void sound_init(void);   /* @0x8003D940 EFFECTS.CPP:631 */
void stream_fade(void);   /* @0x8003D9E8 EFFECTS.CPP:656 */
