extern BOOL DiabloDieFlag;   /* @0x8011B25C */
extern BOOL DoLoadedGame;   /* @0x8011B184 */
extern int FePlayerNo;   /* @0x8011B378 */
extern BOOL LoadedChar[2];   /* @0x8011B328 */
extern int ViewX;   /* @0x8011C114 */
extern int ViewY;   /* @0x8011C118 */
extern int _pcurs[2];   /* @0x8011B730 */
extern char _pcursinvitem[2];   /* @0x8011B768 */
extern char _pcursobj[2];   /* @0x8011B760 */
extern char _pcursplr[2];   /* @0x8011B76C */
extern unsigned char currlevel;   /* @0x8011C10C */
extern int cursmx;   /* @0x8011B750 */
extern int cursmy;   /* @0x8011B754 */
extern int demo_pad_time;   /* @0x8011ABB4 */
extern struct map_info dung_map[112][112];   /* @0x800E7A28 */
extern unsigned short dungeon[48][48];   /* @0x800E40C4 */
extern unsigned char gbMaxPlayers;   /* @0x8011B9A2 */
extern unsigned char gbSelectProvider;   /* @0x8011B9A6 */
extern unsigned char gbValidSaveFile;   /* @0x8011B9F0 */
int DebugMonsters[10];   /* @0x800CEC84 */
unsigned char pMegaTiles[2736];   /* @0x800CECAC */
unsigned long glSeedTbl[17];   /* @0x800CF75C */
int gnLevelTypeTbl[17];   /* @0x800CF7A0 */
extern char last_type;   /* @0x8011B095 */
extern int level_record;   /* @0x8011AE44 */
extern unsigned char leveltype;   /* @0x8011C10D */
extern unsigned char *mydflags;   /* @0x8011C0D8 */
extern int myplr;   /* @0x8011BA08 */
extern unsigned char pdungeon[40][40];   /* @0x800E52C4 */
extern struct QuestStruct quests[16];   /* @0x800DDA40 */
extern int sel_data;   /* @0x8011B72C */
extern unsigned char setlevel;   /* @0x8011C10E */
extern unsigned char setlvlnum;   /* @0x8011C10F */
extern int setpc_x;   /* @0x8011C0E4 */
extern int setpc_y;   /* @0x8011C0E8 */
extern char visible_level;   /* @0x8011B0A8 */
extern struct PlayerStruct plr[2];   /* @0x800DA538 */

/* TU-OWNED small globals (oracle reaches every one of these via %gp_rel in THIS TU; per methodology
 * 3.12#6 an owning module tentative-defines, not externs, its own small globals so the assembler
 * gp-relativizes them like retail). DIABLO.CPP is their natural home (main game-state file); other
 * TUs that only read them keep plain `extern` (and the oracle addresses them absolute there, which
 * is correct for a non-owner). */
int LastFrCount = -1;   /* @0x8011B7D8 */
enum GM_SPEEDS GameSpeed;   /* @0x8011B7DC */
unsigned char PauseMode;   /* @0x8011B7A4 */
int force_redraw;   /* @0x8011B790 */
unsigned char gbProcessPlayers;   /* @0x8011B800 */
unsigned char gbDoEnding;   /* @0x8011B801 */
unsigned char gbRunGame;   /* @0x8011B802 */
unsigned char gbRunGameResult;   /* @0x8011B803 */
unsigned char gbGameLoopStartup;   /* @0x8011B804 */
unsigned long ghMainWnd = 0x29A;   /* @0x8011B788 */
int setseed;   /* @0x8011B79C */
unsigned char sgbMouseDown;   /* @0x8011B7AC */
unsigned char svgamode;   /* @0x8011B7E0 */

/* TU-owned small globals -- no SYM EXT record (unnamed splat D_ gaps), reached %gp_rel in the oracle;
 * tentative defs so they land in .sbss and gp-relative-address like retail (methodology 3.12#6). */
int D_8011B7A8;             /* sgnTimeoutCurs-equivalent: saved cursor id while in a timeout-cursor state */
int D_8011C7B0;             /* lvldir stashed across the CreateLevel setjmp/GSYS_SetStackAndJump handoff */
unsigned char *D_8011C7B4;  /* CreateLevel's private stack pointer/top (GAL_Lock'd 0x14000-byte block) */
int D_8011C7B8;             /* game_loop: "pause-ok already set" one-shot latch (SYM shows a WORD store) */
