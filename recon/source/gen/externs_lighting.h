extern unsigned char TransList[256];   /* @0x800E7928 */
extern char TransVal;   /* @0x8011C148 */
extern unsigned char leveltype;   /* @0x8011C10D */
extern struct PlayerStruct plr[2];   /* @0x800DA538 */
extern int myplr;   /* @0x8011BA08 */
extern struct map_info dung_map[112][112];   /* @0x800E7A28 */
/* weird_cheat/restore_r/restore_g/restore_b/numlights/numvision/dovision/visionid/lightmax:
 * LIGHTING.CPP OWNS these (its oracle reaches them via %gp_rel) -- tentative-defined in
 * lighting.cpp itself, not extern'd here (methodology lever #6, gp-rel ownership). */
extern unsigned char light4flag;   /* @0x8011B797 */
extern int gr_scrxoff;   /* @0x8011B098 */
extern int gr_scryoff;   /* @0x8011B09C */
extern unsigned char dung_map_r[56][56];   /* @0x80100228 */
extern unsigned char dung_map_g[56][56];   /* @0x80100E68 */
extern unsigned char dung_map_b[56][56];   /* @0x80101AA8 */
