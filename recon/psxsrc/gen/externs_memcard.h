/* MEMCARD.CPP externs (tools/symhdr.py extern ...) */
extern unsigned char block_buf[128];   /* @0x800CC7E8 */
extern int card_changed[2];   /* @0x8011B3F4 */
extern struct DIRENTRY card_dir[2][16];   /* @0x8013E1F8 */
extern int card_dirty[2];   /* @0x8011B1E8 */
extern unsigned int card_ev0;   /* @0x8011B1C8 */
extern unsigned int card_ev1;   /* @0x8011B1CC */
extern unsigned int card_ev2;   /* @0x8011B1D0 */
extern unsigned int card_ev3;   /* @0x8011B1D4 */
extern int card_files[2];   /* @0x8011B3EC */
extern struct file_header card_header[2][16];   /* @0x8013E6F8 */
extern int card_usable[2];   /* @0x8011B3E4 */
extern int last_card_status[2];   /* @0x8011B3FC */
extern BOOL new_card_flag[2];   /* @0x8011B210 */
extern struct sjis sjis_table[37];   /* @0x8013E158 */
