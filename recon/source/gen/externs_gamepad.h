extern char _infostr[2][256];   /* @0x800CE810 */
extern int _pcursmonst[2];   /* @0x8011B758 */
extern char _pcursobj[2];   /* @0x8011B760 */
extern char _pcursitem[2];   /* @0x8011B764 */
extern char _pcursinvitem[2];   /* @0x8011B768 */
extern unsigned char chrflag;   /* @0x8011B6C0 */
extern int options_pad;   /* @0x8011B250 */
extern struct KEY_ASSIGNS txt_actions[20];   /* @0x800CC40C */
extern struct pad_assigns pad_txt[14];   /* @0x800CC364 */
extern struct TASK *_spselflag[2];   /* @0x8011B650 */
extern int ScrollFlag[2];   /* @0x8011B8B8 */
extern unsigned char PauseMode;   /* @0x8011B7A4 */
extern unsigned char invflag;   /* @0x8011C32C */
extern BOOL optionsflag;   /* @0x8011B248 */
extern unsigned char sbookflag;   /* @0x8011B6C6 */
extern unsigned char questlog;   /* @0x8011BA29 */
extern unsigned char qtextflag;   /* @0x8011B960 */
extern char stextflag;   /* @0x8011BAE0 */
extern char _pcursplr[2];   /* @0x8011B76C */
extern int FePlayerNo;   /* @0x8011B378 */
extern unsigned char gbActivePlayers;   /* @0x8011B9A3 */
extern struct PlayerStruct plr[2];   /* @0x800DA538 */

extern void PlaySFX(int psfx);   /* @0x8003D718 EFFECTS.CPP:520 */
extern struct TASK *TSK_AddTask(unsigned long Id, void (*Main)(struct TASK *), int StackSize, int DataSize);   /* @0x80020010 TASKER.C:141 */
extern void TSK_Kill(struct TASK *T);   /* @0x80020548 TASKER.C:350 */
extern void RemoveTargetCursor(int pnum);   /* @0x800A178C PADFUNCS.CPP:466 */
extern void TeleStop(int plr);   /* @0x800A040C DAVEL.CPP:749 */
extern void ClrDiabloMsg(void);
extern int get_key_pad(int n);   /* @0x8009C728 CTRL.CPP:360 */
extern void pad_func_AutoMap(int pnum);   /* @0x800A255C PADFUNCS.CPP:807 */
extern unsigned char FeFlag;   /* @0x8011B374 */
extern unsigned char leveltype;   /* @0x8011C10D */


enum CTRL_SET { CTRL_ADVANCED = 1, CTRL_BEGINNER = 0 };
extern void restore_controller_settings(enum CTRL_SET s);   /* @0x8009CAD8 CTRL.CPP:521 */
extern void SetQSpell(int pnum, int Spell, int type);   /* @0x800A09DC PADFUNCS.CPP:88 */
extern void pad_func_select(int pnum);   /* @0x800A0D98 PADFUNCS.CPP:251 */
extern void pad_func_up(int pnum);   /* @0x800A0D30 PADFUNCS.CPP:204 */
extern void pad_func_down(int pnum);   /* @0x800A0D5C PADFUNCS.CPP:214 */
extern void pad_func_left(int pnum);   /* @0x800A0D88 PADFUNCS.CPP:224 */
extern void pad_func_right(int pnum);   /* @0x800A0D90 PADFUNCS.CPP:232 */
extern unsigned char PosOkPlayer(int pnum, int x, int y);   /* @0x80066B6C PLAYER.CPP:4679 */
extern BOOL GetFadeState(void);   /* @0x8007EEAC PALETTE.CPP:179 */
extern BOOL GLUE_Finished(void);   /* @0x8009BB04 GLUE.CPP:331 */
extern BOOL IS_GameOver(void);   /* @0x800821DC GAMEOVER.CPP:83 */
extern void TSK_Sleep(int Frames);   /* @0x800203B8 TASKER.C:287 */
extern int myplr;   /* @0x8011BA08 */
extern int sel_data;   /* @0x8011B72C */
extern BOOL CDWAIT;   /* @0x8011ADEC */
extern unsigned long demo_finish;   /* @0x8011ABBC */
extern char offset_x[8];   /* @0x8011C2A8 */
extern char offset_y[8];   /* @0x8011C2B0 */
