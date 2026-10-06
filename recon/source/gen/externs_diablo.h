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

/* TU-OWNED globals of DIABLO.CPP in retail small-data order (MAP 0x8011B788..0x8011B805, SYM
 * STAT records for the statics).  cc1plus emits an initialised global at its definition, in source
 * order and interleaved with the .sdata string literals of the functions compiled so far, and
 * defers every uninitialised global to the end of the TU; the retail bytes therefore say which
 * ones carried an explicit initialiser and where in the file they stood: this block (before
 * LoadLvlGFX's "L1.TIL".."L4.TIL" and CreateLevel's "STACK" literals), then LastFrCount /
 * GameSpeed right after CreateLevel (recon/source/diablo.cpp), then the uninitialised tail
 * (svgamode, MouseX, MouseY, gv1..gv5, gb*) also kept there.  Statics without an initialiser
 * go to .sbss (.lcomm) at 0x8011C7AC..0x8011C7BB in this order. */
unsigned long ghMainWnd = 0x29A;      /* @0x8011B788 */
unsigned char fullscreen = 1;         /* @0x8011B78C */
int force_redraw = 0;                 /* @0x8011B790 */
static unsigned char cineflag = 1;    /* @0x8011B794 (STAT) */
unsigned char visiondebug = 0;        /* @0x8011B795 */
unsigned char scrollflag = 0;         /* @0x8011B796 */
unsigned char light4flag = 0;         /* @0x8011B797 */
unsigned char leveldebug = 0;         /* @0x8011B798 */
unsigned char monstdebug = 0;         /* @0x8011B799 */
unsigned char trigdebug = 0;          /* @0x8011B79A */
int setseed = 0;                      /* @0x8011B79C */
int debugmonsttypes = 0;              /* @0x8011B7A0 */
unsigned char PauseMode = 0;          /* @0x8011B7A4 */
unsigned char FriendlyMode = 0;       /* @0x8011B7A5 */
static int sgnTimeoutCurs = 0;        /* @0x8011B7A8 (STAT): saved cursor id while in a timeout-cursor state */
unsigned char sgbMouseDown = 0;       /* @0x8011B7AC */
static long *sg_previousFilter;       /* @0x8011C7AC (STAT, .sbss) */
static int Passedlvldir;              /* @0x8011C7B0 (STAT, .sbss): lvldir stashed across the CreateLevel setjmp/GSYS_SetStackAndJump handoff */
static unsigned char *TempStack;      /* @0x8011C7B4 (STAT, .sbss): CreateLevel's private stack (GAL_Lock'd 0x14000-byte block) */
static BOOL pauseo;                   /* @0x8011C7B8 (STAT, .sbss): game_loop "pause-ok already set" one-shot latch */

/* Declared ahead (DIABLO.H), defined after CreateLevel in recon/source/diablo.cpp. */
extern int LastFrCount;               /* @0x8011B7D8 */
extern enum GM_SPEEDS GameSpeed;      /* @0x8011B7DC */
extern unsigned char svgamode;        /* @0x8011B7E0 */
extern int MouseX;                    /* @0x8011B7E4 */
extern int MouseY;                    /* @0x8011B7E8 */
extern long gv1, gv2, gv3, gv4, gv5;  /* @0x8011B7EC..0x8011B7FC */
extern unsigned char gbProcessPlayers;   /* @0x8011B800 */
extern unsigned char gbDoEnding;         /* @0x8011B801 */
extern unsigned char gbRunGame;          /* @0x8011B802 */
extern unsigned char gbRunGameResult;    /* @0x8011B803 */
extern unsigned char gbGameLoopStartup;  /* @0x8011B804 */
