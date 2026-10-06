/* MEMCARD.H declared its small-data globals in this order; cc1plus emits the uninitialised ones at
 * the end of the TU in first-declaration order, which is the retail .sdata order
 * (0x8011B3DB..0x8011B403), so these declarations must come before any other mention. */
extern char dirflag;   /* @0x8011B3DB */
extern int card_status[2];   /* @0x8011B3DC */
extern int card_usable[2];   /* @0x8011B3E4 */
extern int card_files[2];   /* @0x8011B3EC */
extern int card_changed[2];   /* @0x8011B3F4 */
extern int last_card_status[2];   /* @0x8011B3FC */
/* MEMCARD.CPP externs (tools/symhdr.py extern ...) */
extern unsigned char block_buf[128];   /* @0x800CC7E8 */
extern struct DIRENTRY card_dir[2][16];   /* @0x8013E1F8 */
extern int card_dirty[2];   /* @0x8011B1E8 */
extern unsigned int card_ev0;   /* @0x8011B1C8 */
extern unsigned int card_ev1;   /* @0x8011B1CC */
extern unsigned int card_ev2;   /* @0x8011B1D0 */
extern unsigned int card_ev3;   /* @0x8011B1D4 */
extern struct file_header card_header[2][16];   /* @0x8013E6F8 */
extern BOOL new_card_flag[2];   /* @0x8011B210 */
extern struct sjis sjis_table[37];   /* @0x8013E158 */
