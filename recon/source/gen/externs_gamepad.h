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
extern unsigned char automapmoved;   /* @0x8011BBDE */
extern unsigned char _SpdBeltSelFlag[2];   /* @0x8011BBC4 */
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
