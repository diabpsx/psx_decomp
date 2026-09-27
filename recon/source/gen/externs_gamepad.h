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
extern struct map_info dung_map[112][112];   /* @0x800E7A28 */
extern unsigned char IsDplayer(int x, int y);   /* @0x8005FD10 PLAYER.CPP:262 */
extern void StartPlrKill(int pnum, int val);   /* @0x80066E24 PLAYER.CPP:4688 */
extern unsigned char ChkPlrOffsets(int wx1, int wy1, int wx2, int wy2);   /* @0x80062568 PLAYER.CPP:2542 */
extern void StartStand(int pnum, int dir);   /* @0x80066CA4 PLAYER.CPP:4683 */
extern void NewPlrAnim(int pnum, int Peq, int numFrames, int Delay);   /* @0x80066E70 PLAYER.CPP:4689 */
extern void PlrClrTrans(int x, int y);   /* @0x80060C6C PLAYER.CPP:1402 */
extern void PlrDoTrans(int x, int y);   /* @0x80060CE4 PLAYER.CPP:1418 */
extern struct ScrollStruct ScrollInfo;   /* @0x800E7914 */
extern int ViewX;   /* @0x8011C114 */
extern int ViewY;   /* @0x8011C118 */
extern unsigned char svgamode;   /* @0x8011B7E0 */
extern void ClearPanel(void);   /* @0x80031F20 CONTROL.CPP:1291 */
extern char *MakeItemStr(struct ItemStruct *ItemPtr, unsigned short ItemNo, unsigned short MaxLen);   /* @0x80049198 ITEMS.CPP:5246 */
extern void get_next_inv(void);   /* @0x800A0BFC PADFUNCS.CPP:176 */
extern unsigned char CheckArea(int xx, int yy, int range, unsigned char allflag, int pnum);   /* @0x800A3A9C PADFUNCS.CPP:1364 */
extern void CheckPanelInfo(void);   /* @0x80032228 CONTROL.CPP:1691 */
extern void CheckTrigForce(void);   /* @0x800765E4 TRIGS.CPP:769 */
extern void CheckTown(void);   /* @0x80037884 CURSOR.CPP:211 */
extern void CheckRportal(void);   /* @0x80037B18 CURSOR.CPP:247 */
extern void select_belt_item(int pnum);   /* @0x800A0A60 PADFUNCS.CPP:119 */
extern char tempstr[256];   /* @0x800CEA10 */
extern char _infoclr[2];   /* @0x8011B6BC */
extern int cursmx;   /* @0x8011B750 */
extern int cursmy;   /* @0x8011B754 */
extern char *get_action_str(int pval, int combo);   /* @0x8009C6B0 CTRL.CPP:338 */
extern struct CFont MediumFont;   /* @0x800B82D8 */
extern const unsigned char WHITER;   /* @0x8011ABD1 */
extern const unsigned char WHITEG;   /* @0x8011ABD2 */
extern int demo_pad_time;   /* @0x8011ABB4 */
extern "C" int sprintf(char *buf, const char *fmt, ...);
extern struct CBlocks *BL_GetCurrentBlocks(void);   /* @0x800919EC BLOCK.CPP:2805 */
extern void ChangeLightXY(int i, int x, int y);   /* @0x8004D384 LIGHTING.CPP:1234 */
extern void ChangeVisionXY(int id, int x, int y);   /* @0x8004D6D0 LIGHTING.CPP:1493 */
extern void PM_ChangeLightOff(int pnum);   /* @0x80067040 PLAYER.CPP:4697 */
extern int GetDirection(int x1, int y1, int x2, int y2);   /* @0x8003DA28 ENGINE.CPP:45 */
extern struct CPlayer *gplayer;   /* @0x8011B110 */
extern void CheckSBook(void);   /* @0x80037280 CONTROL.CPP:3491 */
extern void QuestlogEnter(void);   /* @0x80069078 QUESTS.CPP:909 */
extern void CheckChrBtns(void);   /* @0x80035CEC CONTROL.CPP:3006 */
extern void SetSpell(int pnum);   /* @0x80031D54 CONTROL.CPP:1255 */
extern void get_last_inv(void);   /* @0x800A0AD0 PADFUNCS.CPP:152 */
extern void QuestlogESC(void);   /* @0x80069144 QUESTS.CPP:936 */
extern void ToggleSpell(int pnum);   /* @0x80031004 CONTROL.CPP:837 */
extern char msgholdflag;   /* @0x8011B869 */
extern unsigned char select_flag;   /* @0x8011B11D */
extern unsigned char Qfromoptions;   /* @0x8011B228 */
extern struct CPad *PAD_GetPad(int PadNum, unsigned char both);   /* @0x800897F4 PADS.CPP:251 */
extern void CheckStoreBtn(void);   /* @0x80074228 STORES.CPP:3687 */
extern BOOL IsGameLoading(void);   /* @0x800A4648 LOADING.CPP:212 */
extern unsigned char TryIconCurs(void);   /* @0x80038574 DIABLO.CPP:1087 */
extern unsigned char any_belt_items(void);   /* @0x800A0A68 PADFUNCS.CPP:136 */
extern void AutomapUp(void);   /* @0x80161F68 AUTOMAP.CPP:136 (GAME overlay) */
extern void AutomapDown(void);   /* @0x80161F88 AUTOMAP.CPP:142 */
extern void AutomapLeft(void);   /* @0x80161FA8 AUTOMAP.CPP:148 */
extern void AutomapRight(void);   /* @0x80161FC8 AUTOMAP.CPP:154 */
extern unsigned char gbRunGame;   /* @0x8011B802 */
extern unsigned char automapflag;   /* @0x8011C37B */
extern BOOL goldcheat;   /* @0x8011B224 */
