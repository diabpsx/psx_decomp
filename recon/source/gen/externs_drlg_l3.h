/* pregame-overlay data tables (carved into asm/data/drlg_l3_rodata_*.rodata.s, symbol_addrs_pregame.txt) */
extern unsigned char spawntable[15];   /* @0x801486B4 */
extern unsigned char poolsub[15];   /* @0x801486D4 */
extern unsigned char L3ConvTbl[16];   /* @0x801486E4 */
extern unsigned char L3UP[20];   /* @0x801486F4 */
extern unsigned char L3DOWN[20];   /* @0x80148708 */
extern unsigned char L3HOLDWARP[20];   /* @0x8014871C */
extern unsigned char L3TITE1[34];   /* @0x80148730 */
extern unsigned char L3TITE2[34];   /* @0x80148754 */
extern unsigned char L3TITE3[34];   /* @0x80148778 */
extern unsigned char L3TITE7[42];   /* @0x8014879C */
extern unsigned char L3TITE8[20];   /* @0x801487C8 */
extern unsigned char L3TITE9[20];   /* @0x801487DC */
extern unsigned char L3TITE10[20];   /* @0x801487F0 */
extern unsigned char L3TITE11[20];   /* @0x80148804 */
extern unsigned char L3ISLE1[14];   /* @0x80148818 */
extern unsigned char L3ISLE2[14];   /* @0x80148828 */
extern unsigned char L3ISLE3[14];   /* @0x80148838 */
extern unsigned char L3ISLE4[14];   /* @0x80148848 */
extern unsigned char L3ISLE5[10];   /* @0x80148858 */
extern unsigned char L3ANVIL[244];   /* @0x80148864 */

/* main-image small tables reached from DRLG_L3__Fi (content confirmed byte-for-byte against
 * refs/devilution/Source/drlg_l3.cpp's L3TITE12/L3TITE13/L3CREV1-11/L3XTRA1-5; VAs are the real
 * addresses splat carved (D_8011BEEC etc) -- named here for readability, byte-identical either way
 * since verify_asm normalizes %hi/%lo/reloc names). */
extern unsigned char L3TITE12[6];   /* @0x8011BEEC */
extern unsigned char L3TITE13[6];   /* @0x8011BEF4 */
extern unsigned char L3CREV1[6];   /* @0x8011BEFC */
extern unsigned char L3CREV2[6];   /* @0x8011BF04 */
extern unsigned char L3CREV3[6];   /* @0x8011BF0C */
extern unsigned char L3CREV4[6];   /* @0x8011BF14 */
extern unsigned char L3CREV5[6];   /* @0x8011BF1C */
extern unsigned char L3CREV6[6];   /* @0x8011BF24 */
extern unsigned char L3CREV7[6];   /* @0x8011BF2C */
extern unsigned char L3CREV8[6];   /* @0x8011BF34 */
extern unsigned char L3CREV9[6];   /* @0x8011BF3C */
extern unsigned char L3CREV10[6];   /* @0x8011BF44 */
extern unsigned char L3CREV11[6];   /* @0x8011BF4C */
extern unsigned char L3XTRA1[4];   /* @0x8011BF54 */
extern unsigned char L3XTRA2[4];   /* @0x8011BF58 */
extern unsigned char L3XTRA3[4];   /* @0x8011BF5C */
extern unsigned char L3XTRA4[4];   /* @0x8011BF60 */
extern unsigned char L3XTRA5[4];   /* @0x8011BF64 */

/* game-core state (owned by GENDUNG.CPP / ENGINE.CPP, tentative-defined there) */
extern unsigned short dungeon[48][48];   /* @0x800E40C4 */
extern unsigned char *mydflags;   /* @0x8011C0D8 */
extern unsigned char pdungeon[40][40];   /* @0x800E52C4 */
extern unsigned char pMegaTiles[2736];   /* @0x800CECAC */
extern int setpc_x;   /* @0x8011C0E4 */
extern int setpc_y;   /* @0x8011C0E8 */
extern int setpc_w;   /* @0x8011C0EC */
extern int setpc_h;   /* @0x8011C0F0 */
extern unsigned char currlevel;   /* @0x8011C10C */
extern int dminx;   /* @0x8011C0F8 */
extern int dminy;   /* @0x8011C0FC */
extern int dmaxx;   /* @0x8011C100 */
extern int dmaxy;   /* @0x8011C104 */
extern int ViewX;   /* @0x8011C114 */
extern int ViewY;   /* @0x8011C118 */
extern int LvlViewX;   /* @0x8011C12C */
extern int LvlViewY;   /* @0x8011C130 */
extern struct map_info dung_map[112][112];   /* @0x800E7A28 */
