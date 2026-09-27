extern BOOL optionsflag;   /* @0x8011B248 */
extern BOOL DoShowPanel;   /* @0x8011B000 */
extern char stextflag;   /* @0x8011BAE0 */
extern unsigned char qtextflag;   /* @0x8011B960 */
extern unsigned char _pinfoflag[2];   /* @0x8011B6B8 */
extern int sel_data;   /* @0x8011B72C */
extern unsigned char currlevel;   /* @0x8011C10C */
extern unsigned char automapflag;   /* @0x8011C37B */
extern unsigned char *pQLogCel;   /* @0x8011BA50 -- oracle uses lui/lw here (absolute): owned elsewhere */
/* The following are gp-rel (%gp_rel) in this TU's oracle -> CONTROL.CPP owns them (lever #6):
 * tentative-defined below, NOT extern, despite the SYM's EXT class label. */
extern int myplr;   /* @0x8011BA08 */
extern struct PlayerStruct plr[2];   /* @0x800DA538 */
extern struct SpellData spelldata[37];   /* @0x800DDB80 */
/* TU-owned STAT globals (tentative defs live in control.cpp; forward decl here for consistency) */
extern int _pnumlines[2];   /* @0x8011C764 */
extern int SPLICONY;   /* @0x8011B630 */
extern int SPLICONRIGHT;   /* @0x8011C76C */
extern int lus;   /* @0x8011B65C */
extern char plusanim;   /* @0x8011B664 */
extern unsigned char *pMultiBtns;   /* @0x8011C7A0 */
extern unsigned char *pTalkBtns;   /* @0x8011C7A4 */
extern unsigned char DialogRed;   /* @0x8011ABFD */
extern unsigned char DialogGreen;   /* @0x8011ABFE */
extern unsigned char DialogBlue;   /* @0x8011ABFF */
extern unsigned char DialogTRed;   /* @0x8011AC00 */
extern unsigned char DialogTGreen;   /* @0x8011AC01 */
extern unsigned char DialogTBlue;   /* @0x8011AC02 */
extern int D_801110FC[10];   /* rodata: DrawDurIcon4Item icon-frame table, unnamed in SYM */
extern unsigned char leveltype;   /* @0x8011C10D */
extern TASK *_spselflag[2];   /* @0x8011B650 */
extern int force_redraw;   /* @0x8011B790 */
extern int SpellPages[5][5];   /* @0x800CE34C */
extern int sbooktab;   /* @0x8011B714 */
extern int cur_spel[2];   /* @0x8011B718 */
extern int options_pad;   /* @0x8011B250 */
extern unsigned char GOLDR;   /* @0x8011ABDA */
extern unsigned char GOLDG;   /* @0x8011ABDB */
extern unsigned char GOLDB;   /* @0x8011ABDC */
extern struct CSDATA CS_Tab[28];   /* @0x800CE3B0 */
extern unsigned char PauseMode;   /* @0x8011B7A4 */
extern unsigned char invflag;   /* @0x8011C32C */
extern unsigned char questlog;   /* @0x8011BA29 */
extern unsigned char Qfromoptions;   /* @0x8011B228 */
extern BOOL ignore_buttons;   /* @0x8011BBD0 */
extern unsigned char WHITER;   /* @0x8011ABD1 */
extern unsigned char WHITEG;   /* @0x8011ABD2 */
extern unsigned char WHITEB;   /* @0x8011ABD3 */
extern unsigned char REDR;   /* @0x8011ABD7 */
extern unsigned char REDG;   /* @0x8011ABD8 */
extern unsigned char REDB;   /* @0x8011ABD9 */
extern struct RECT CSRect;   /* @0x8011B6F4 */
extern class CFont MediumFont;   /* @0x800B82D8 */
