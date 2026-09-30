void snd_update(unsigned char bStopAll);   /* @0x80077D14 SOUND.CPP:108 */
void snd_stop_snd(TSnd *pSnd);   /* @0x80077D1C SOUND.CPP:132 */
void snd_play_snd(TSFX *pSnd, long lVolume, long lPan);   /* @0x80077D58 SOUND.CPP:145 */
void snd_play_msnd(unsigned short pszName, long lVolume, long lPan);   /* @0x80077DA0 SOUND.CPP:172 */
void snd_init(unsigned long hWnd);   /* @0x80077E40 SOUND.CPP:209 */
void music_stop(void);   /* @0x80077E50 SOUND.CPP:227 */
void music_fade(void);   /* @0x80077E90 SOUND.CPP:245 */
void music_start(int nTrack);   /* @0x80077ED0 SOUND.CPP:261 */
unsigned char snd_playing(int SFXNo);   /* @0x80077F70 SOUND.CPP:315 */
void SND_StopSnd(int voice);   /* @0x8009A6B8 SNDBANK.CPP:453 */
int SND_PlaySnd(unsigned short Name, int vol, int pan, int pitchadj);   /* @0x8009A79C SNDBANK.CPP:498 */
BOOL SND_IsSfxPlaying(int SFXNo);   /* @0x8009A6EC SNDBANK.CPP:466 */
void STR_SoundCommand(SFXHDR *sfh, int Command);   /* @0x80099388 STREAM.CPP:876 */
SFXHDR * STR_PlaySound(unsigned short Name, char flag, int volume, char loop);   /* @0x80098DC8 STREAM.CPP:597 */
extern "C" unsigned long GU_GetRnd(void);   /* @0x80020CF4 GUTILS.C:76 */
extern "C" void DBG_Error(char *Text, char *File, int Line);   /* @0x80020E94 GDEBUG.C:146 */
