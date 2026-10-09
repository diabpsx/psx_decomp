/* CONTROL.CPP's uninitialised globals: cc1plus emits them at the end of the TU in first-declaration
 * order, and the retail .sdata tail (0x8011B6AC..0x8011B71F) shows that order, so they are declared
 * here before anything else can mention them (definitions in control.cpp). */
extern unsigned char *pStatusPanel;   /* @0x8011B6AC */
extern unsigned char *pGBoxBuff;   /* @0x8011B6B0 */
extern unsigned char dropGoldFlag;   /* @0x8011B6B4 */
extern unsigned char _pinfoflag[2];   /* @0x8011B6B8 */
extern char _infoclr[2];   /* @0x8011B6BC */
extern unsigned char drawhpflag;   /* @0x8011B6BE */
extern unsigned char drawmanaflag;   /* @0x8011B6BF */
extern unsigned char chrflag;   /* @0x8011B6C0 */
extern unsigned char drawbtnflag;   /* @0x8011B6C1 */
extern unsigned char panbtndown;   /* @0x8011B6C2 */
extern unsigned char panelflag;   /* @0x8011B6C3 */
extern unsigned char chrbtndown;   /* @0x8011B6C4 */
extern unsigned char lvlbtndown;   /* @0x8011B6C5 */
extern unsigned char sbookflag;   /* @0x8011B6C6 */
extern unsigned char talkflag;   /* @0x8011B6C7 */
extern int dropGoldValue;   /* @0x8011B6C8 */
extern int initialDropGoldValue;   /* @0x8011B6CC */
extern int initialDropGoldIndex;   /* @0x8011B6D0 */
extern unsigned char *pPanelButtons;   /* @0x8011B6D4 */
extern unsigned char *pPanelText;   /* @0x8011B6D8 */
extern unsigned char *pManaBuff;   /* @0x8011B6DC */
extern unsigned char *pLifeBuff;   /* @0x8011B6E0 */
extern unsigned char *pChrPanel;   /* @0x8011B6E4 */
extern unsigned char *pChrButtons;   /* @0x8011B6E8 */
extern unsigned char *pSpellCels;   /* @0x8011B6EC */
extern struct RECT *InfoBoxRect;   /* @0x8011B6F0 */
extern struct RECT CSRect;   /* @0x8011B6F4 */
extern int numpanbtns;   /* @0x8011B6FC */
extern unsigned char *pDurIcons;   /* @0x8011B700 */
extern unsigned char drawdurflag;   /* @0x8011B704 */
extern unsigned char chrbtnactive;   /* @0x8011B705 */
extern unsigned char *pSpellBkCel;   /* @0x8011B708 */
extern unsigned char *pSBkBtnCel;   /* @0x8011B70C */
extern unsigned char *pSBkIconCels;   /* @0x8011B710 */
extern int sbooktab;   /* @0x8011B714 */
extern int cur_spel[2];   /* @0x8011B718 */
extern BOOL optionsflag;   /* @0x8011B248 */
extern BOOL DoShowPanel;   /* @0x8011B000 */
extern char stextflag;   /* @0x8011BAE0 */
extern unsigned char qtextflag;   /* @0x8011B960 */
extern int sel_data;   /* @0x8011B72C */
extern unsigned char currlevel;   /* @0x8011C10C */
extern unsigned char automapflag;   /* @0x8011C37B */
extern unsigned char *pQLogCel;   /* @0x8011BA50 -- oracle uses lui/lw here (absolute): owned elsewhere */
/* The following are gp-rel (%gp_rel) in this TU's oracle -> CONTROL.CPP owns them (lever #6):
 * tentative-defined below, NOT extern, despite the SYM's EXT class label. */
extern int myplr;   /* @0x8011BA08 */
extern struct PlayerStruct plr[2];   /* @0x800DA538 */
extern struct SpellData spelldata[37];   /* @0x800DDB80 */
/* TU-owned STAT globals are declared and defined only in control.cpp. */
extern unsigned char DialogRed;   /* @0x8011ABFD */
extern unsigned char DialogGreen;   /* @0x8011ABFE */
extern unsigned char DialogBlue;   /* @0x8011ABFF */
extern unsigned char DialogTRed;   /* @0x8011AC00 */
extern unsigned char DialogTGreen;   /* @0x8011AC01 */
extern unsigned char DialogTBlue;   /* @0x8011AC02 */
extern unsigned char leveltype;   /* @0x8011C10D */
extern int force_redraw;   /* @0x8011B790 */
extern int SpellPages[5][5];   /* @0x800CE34C */
extern int options_pad;   /* @0x8011B250 */
extern const unsigned char GOLDR;   /* @0x8011ABDA */
extern const unsigned char GOLDG;   /* @0x8011ABDB */
extern const unsigned char GOLDB;   /* @0x8011ABDC */
extern struct CSDATA CS_Tab[28];   /* @0x800CE3B0 */
extern unsigned char PauseMode;   /* @0x8011B7A4 */
extern unsigned char invflag;   /* @0x8011C32C */
extern unsigned char questlog;   /* @0x8011BA29 */
extern unsigned char Qfromoptions;   /* @0x8011B228 */
extern BOOL ignore_buttons;   /* @0x8011BBD0 */
extern const unsigned char WHITER;   /* @0x8011ABD1 */
extern const unsigned char WHITEG;   /* @0x8011ABD2 */
extern const unsigned char WHITEB;   /* @0x8011ABD3 */
extern const unsigned char REDR;   /* @0x8011ABD7 */
extern const unsigned char REDG;   /* @0x8011ABD8 */
extern const unsigned char REDB;   /* @0x8011ABD9 */
extern class CFont MediumFont;   /* @0x800B82D8 */
extern int MaxStats[3][4];   /* @0x800DA438 */
extern const unsigned char BLUER;   /* @0x8011ABD4 */
extern const unsigned char BLUEG;   /* @0x8011ABD5 */
extern const unsigned char BLUEB;   /* @0x8011ABD6 */
extern char _infostr[2][256];   /* @0x800CE810 */
extern unsigned char gbMaxPlayers;   /* @0x8011B9A2 */
extern unsigned char BACKR, BACKG, BACKB;   /* @0x8011ABFA.. */
extern struct CSDATA CS_Tab[28];   /* @0x800CE3B0 */
extern unsigned char gbActivePlayers;   /* @0x8011B9A3 */
extern int InvPageNo;   /* @0x8011C338 */
extern int InvPageFlag;   /* @0x8011C33C */
extern struct MonsterStruct monster[190];   /* @0x80105394 */
extern struct TownerStruct towner[16];   /* @0x800CFE80 */
extern char tempstr[256];   /* @0x800CEA10 */
extern int _pcurs[2];   /* @0x8011B730 */
extern char _pcursinvitem[2];   /* @0x8011B768 */
extern int _pcursmonst[2];   /* @0x8011B758 */
extern char _pcursobj[2];   /* @0x8011B760 */
extern char _pcursitem[2];   /* @0x8011B764 */
extern char _pcursplr[2];   /* @0x8011B76C */
extern unsigned char _trigflag[2];   /* @0x8011BB74 */
extern int MouseX;   /* @0x8011B7E4 */
extern int MouseY;   /* @0x8011B7E8 */
extern const unsigned char BORDERR, BORDERG, BORDERB;   /* @0x8011ABF7.. */
extern int cmenu;   /* @0x8011B23C */
extern char SpellITbl[37];   /* @0x800CE324 */
extern int FePlayerNo;   /* @0x8011B378 */
extern unsigned long *ThisOt;   /* @0x8011AAB4 */
extern unsigned char SpellColors[18];   /* @0x800CE310 */
