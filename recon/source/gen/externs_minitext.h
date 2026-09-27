/* qtextflag/qtextSpd: SYM class EXT = external LINKAGE, not "defined elsewhere" -- this TU's oracle
 * reaches both via %gp_rel, and hellfire's MINITEXT.CPP defines both as plain (non-static) globals
 * right here -> real tentative definitions (see minitext.cpp), not externs. */
extern unsigned char FeFlag;   /* @0x8011B374 */
extern int FileSYS;   /* @0x8011AAEC */
extern struct SFXHDR *sghMusic;   /* @0x8011BBB4 */
extern struct SFXHDR *sghStream;   /* @0x8011B834 */
extern long sglMasterVolume;   /* @0x8011BB9C */
extern long sglMusicVolume;   /* @0x8011BBA0 */
extern unsigned char gbProcessPlayers;   /* @0x8011B800 */
extern unsigned char PauseMode;   /* @0x8011B7A4 */
extern unsigned char questlog;   /* @0x8011BA29 */
extern int myplr;   /* @0x8011BA08 */
extern struct CFont MediumFont;   /* @0x800B82D8 */
extern struct CFont LargeFont;   /* @0x800B84F4 */
extern unsigned char DialogRed;   /* @0x8011ABFD */
extern unsigned char DialogGreen;   /* @0x8011ABFE */
extern unsigned char DialogBlue;   /* @0x8011ABFF */
extern unsigned char DialogTRed;   /* @0x8011AC00 */
extern unsigned char DialogTGreen;   /* @0x8011AC01 */
extern unsigned char DialogTBlue;   /* @0x8011AC02 */
extern unsigned char BORDERR;   /* @0x8011ABF7 */
extern unsigned char BORDERG;   /* @0x8011ABF8 */
extern unsigned char BORDERB;   /* @0x8011ABF9 */
extern struct TextDataStruct alltext[269];   /* @0x80117C20 */
/* QBack (@0x800D6790) is DEFINED in minitext.cpp (its ctor/dtor thunks _GLOBAL_.I/D.QBack live here) */
extern char stextflag;   /* @0x8011BAE0 */
extern int options_pad;   /* @0x8011B250 */
extern BOOL ignore_buttons;   /* @0x8011BBD0 */
extern BOOL CDWAIT;   /* @0x8011ADEC */
extern unsigned char BLUER;   /* @0x8011ABD4 */
extern unsigned char BLUEG;   /* @0x8011ABD5 */
extern unsigned char BLUEB;   /* @0x8011ABD6 */
extern unsigned char WHITER;   /* @0x8011ABD1 */
extern unsigned char WHITEG;   /* @0x8011ABD2 */
extern unsigned char WHITEB;   /* @0x8011ABD3 */
extern int TextWait;   /* @0x8011B95C */
extern char MtPrevText[80];   /* @0x800D67A0 */
extern char tempstr[256];   /* @0x800CEA10 */
extern struct SFXHDR SFXTab[2];   /* @0x800B9BE0 */
extern unsigned char Qfromoptions;   /* @0x8011B228 */
