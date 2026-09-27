extern unsigned long *ThisOt;   /* @0x8011AAB4 */
extern struct POLY_FT4 *ThisPrimAddr;   /* PSXSRC/PRIMPOOL.H (sdata) */
extern struct POLY_FT4 *AddrToAvoid;   /* @0x8011AABC */

extern int AMPlayerX;   /* @0x8011C38C */
extern int AMPlayerY;   /* @0x8011C390 */
extern int AMPx[2];   /* @0x8011C394 (defined in automap.cpp) */
extern int AMPy[2];   /* @0x8011C39C (defined in automap.cpp) */

extern struct PlayerStruct plr[2];   /* @0x800DA538 */
extern unsigned short automaptype[512];   /* @0x8010D7AC */
extern unsigned char automapview[5][40];   /* @0x8010D6E4 */
extern unsigned short dungeon[48][48];   /* @0x800E40C4 */
extern unsigned char leveltype;   /* @0x8011C10D */
extern unsigned char currlevel;   /* @0x8011C10C */
extern unsigned char setlevel;   /* @0x8011C10E */
extern unsigned char setlvlnum;   /* @0x8011C10F */
extern unsigned char gbActivePlayers;   /* @0x8011B9A3 */
extern unsigned char AmLTab[16];   /* @0x800E3BAC */
extern unsigned char AmRTab[16];   /* @0x800E3BBC */
extern unsigned char PauseMode;   /* @0x8011B7A4 */
extern const unsigned char GOLDR;   /* @0x8011ABDA */
extern const unsigned char GOLDG;   /* @0x8011ABDB */
extern const unsigned char GOLDB;   /* @0x8011ABDC */
extern struct CFont MediumFont;   /* @0x800B82D8 */
