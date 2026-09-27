/* STORES.CPP -- externs (globals owned by other TUs). */
extern unsigned char gbMaxPlayers;   /* @0x8011B9A2 */
extern int myplr;   /* @0x8011BA08 */
extern struct PlayerStruct plr[2];   /* @0x800DA538 */
extern unsigned char currlevel;   /* @0x8011C10C */
extern struct QuestStruct quests[16];   /* @0x800DDA40 */
extern int Qtalklist[11][16];   /* @0x800CFBC0 */

extern int _numpremium[2];   /* @0x8011BAB8 */
extern int _premiumlevel[2];   /* @0x8011BAC0 */
extern struct ItemStruct _premiumitem[2][6];   /* @0x800DF508 */
extern struct ItemStruct _boyitem[2];   /* @0x800E0AF8 */
extern int _boylevel[2];   /* @0x8011BAD8 */
extern int _NoWitchItems[2];   /* @0x8011BAC8 */
extern int _WitchIdxOfs[2];   /* @0x8011BAD0 */
extern struct ItemStruct _smithitem[2][20];   /* @0x800DE428 */
extern struct ItemStruct _witchitem[2][20];   /* @0x800DFA18 */
extern struct ItemStruct _healitem[2][20];   /* @0x800E0BD0 */
extern struct ItemStruct _golditem[2];   /* @0x800E1CB0 */
extern int options_pad;   /* @0x8011B250 */
extern unsigned char sbookflag;   /* @0x8011B6C6 */
extern unsigned char invflag;   /* @0x8011C32C */
extern unsigned char chrflag;   /* @0x8011B6C0 */
extern unsigned char questlog;   /* @0x8011BA29 */
extern unsigned char dropGoldFlag;   /* @0x8011B6B4 */

long GetRndSeed(void);   /* @0x8003DADC ENGINE.CPP */
void SetRndSeed(long s);   /* @0x8003DACC ENGINE.CPP */

/* STORES.CPP's OWN globals (EXT/STAT in SYM, all owned by this TU) are tentative-defined
 * directly in the .cpp, NOT declared extern here -- see the top of stores.cpp. */

extern struct CFont MediumFont;   /* @0x800B82D8 */
extern unsigned char WHITER;   /* @0x8011ABD1 */
extern unsigned char WHITEG;   /* @0x8011ABD2 */
extern unsigned char WHITEB;   /* @0x8011ABD3 */
extern unsigned char BLUER;   /* @0x8011ABD4 */
extern unsigned char BLUEG;
extern unsigned char BLUEB;
extern unsigned char REDR;
extern unsigned char REDG;
extern unsigned char REDB;
extern unsigned char GOLDR;   /* @0x8011ABDA */
extern unsigned char GOLDG;
extern unsigned char GOLDB;
extern int SStringYNorm[20];   /* @0x800DE314 */
extern int SStringYBuy0[20];   /* @0x800DE364 */
extern int SStringYBuy1[20];   /* @0x800DE3B4 */
extern int cursW;   /* CURSOR.CPP */
extern int cursH;   /* CURSOR.CPP */
