/* TU-owned globals (this is the segment that materializes them) */

/* other TUs */
extern unsigned char gbMaxPlayers;       /* @0x8011B9A2 */
extern unsigned char deltaload;          /* @0x8011B97D */
extern unsigned char currlevel;          /* @0x8011C10C */
extern unsigned char leveltype;          /* @0x8011C10D */
extern unsigned char setlevel;           /* @0x8011C10E */
extern unsigned char setlvlnum;          /* @0x8011C10F */
extern unsigned char setlvltype;         /* @0x8011C110 */
extern int ViewX;                        /* @0x8011C114 */
extern int ViewY;                        /* @0x8011C118 */
extern int myplr;                        /* @0x8011BA08 */
extern struct PlayerStruct plr[2];       /* @0x800DA538 */
extern int setpc_x;                      /* @0x8011C0E4 */
extern int setpc_y;                      /* @0x8011C0E8 */
extern int setpc_w;                      /* @0x8011C0EC */
extern int setpc_h;                      /* @0x8011C0F0 */
extern int nummonsters;                  /* @0x8011C2CC */
extern struct MonsterStruct monster[190]; /* @0x80105394 */
extern unsigned char UniqMonst[0x900];   /* @0x8010C708 -- raw byte view, PSX-trimmed UniqMonData */
extern int sfxdelay;                     /* @0x8011B850 */
extern int sfxdnum;                      /* @0x8011B854 */
extern struct TriggerStruct trigs[16];
extern int numtrigs;                     /* @0x8011BB78 */
extern signed char objectactive[0x7F]; /* @0x800DA220 */
extern int numobjects;                   /* @0x8011B9CC */
extern char TransVal;                     /* @0x8011C148 */
extern char offset_x[8];                 /* @0x8011C2A8 */
extern char offset_y[8];                 /* @0x8011C2B0 */
extern int sel_data;                     /* @0x8011B72C */
extern char _infostr[2][256];            /* @0x800CE810 */
extern int cursmx;                       /* @0x8011B750 */
extern int cursmy;                       /* @0x8011B754 */
extern int Qtalklist[11][16];            /* @0x800CFBC0 */
extern unsigned char Qfromoptions;                 /* @0x8011B228 */
extern char **TextPtr;                      /* @0x8011BBF4 */
extern int CDWAIT;                       /* @0x8011ADEC */
extern unsigned char qtextflag;          /* @0x8011B960 */
extern int options_pad;                  /* @0x8011B250 */
extern struct CFont MediumFont;          /* @0x800B82D8 */
extern unsigned char DialogRed, DialogGreen, DialogBlue;     /* @0x8011ABFD.. */
extern unsigned char DialogTRed, DialogTGreen, DialogTBlue;  /* @0x8011AC00.. */
extern unsigned char WHITER, WHITEG, WHITEB;   /* @0x8011ABD1.. */
extern unsigned char BLUER, BLUEG, BLUEB;      /* @0x8011ABD4.. */
extern unsigned char REDR, REDG, REDB;         /* @0x8011ABD7.. */
extern unsigned char GOLDR, GOLDG, GOLDB;      /* @0x8011ABDA.. */
extern unsigned char BACKR, BACKG, BACKB;      /* @0x8011ABFA.. */
extern unsigned char BORDERR, BORDERG, BORDERB;/* @0x8011ABF7.. */
