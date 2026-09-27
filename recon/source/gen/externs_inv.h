extern struct PlayerStruct plr[2];   /* @0x800DA538 */
extern struct SpellData spelldata[37];   /* @0x800DDB80 */
extern struct QuestStruct quests[16];   /* @0x800DDA40 */
extern unsigned char uitemflag;   /* @0x8011B8DC (owned by ITEMS.CPP: absolute-addressed everywhere in inv/) */
extern int myplr;   /* @0x8011BA08 */
extern int force_redraw;   /* @0x8011B790 */
extern unsigned char leveltype;   /* @0x8011C10D */
extern int MouseX;   /* @0x8011B7E4 */
extern int MouseY;   /* @0x8011B7E8 */
extern int cursmx;   /* @0x8011B750 */
extern int cursmy;   /* @0x8011B754 */
extern unsigned char dropGoldFlag;   /* @0x8011B6B4 */
extern int dropGoldValue;   /* @0x8011B6C8 */
extern int initialDropGoldIndex;   /* @0x8011B6D0 */
extern int initialDropGoldValue;   /* @0x8011B6CC */
extern int _pcurs[2];   /* @0x8011B730 */
extern char _pcursinvitem[2];   /* @0x8011B768 */
extern int sel_data;   /* @0x8011B72C */
extern char offset_x[8];   /* @0x8011C2A8 */
extern char offset_y[8];   /* @0x8011C2B0 */
extern char _pcursobj[2];   /* @0x8011B760 */
extern char _pcursitem[2];   /* @0x8011B764 */
extern int _pcursmonst[2];   /* @0x8011B758 */
extern struct ItemStruct item[128];   /* @0x800D1D54 */
extern long numitems;   /* @0x8011B888 */
extern char itemactive[127];   /* @0x800D5354 */
extern struct map_info dung_map[112][112];   /* @0x800E7A28 */
extern struct MonsterStruct monster[190];   /* @0x80105394 */
extern unsigned char InvItemWidth[180];   /* @0x8010D518 */
extern unsigned char InvItemHeight[180];   /* @0x8010D5CC */
extern char stextflag;   /* @0x8011BAE0 */
extern unsigned char talkflag;   /* @0x8011B6C7 */
extern unsigned char currlevel;   /* @0x8011C10C */
extern unsigned char gbMaxPlayers;   /* @0x8011B9A2 */
extern int sfxdelay;   /* @0x8011B850 */
extern int sfxdnum;   /* @0x8011B854 */
extern unsigned char AllItemsUseable[157];   /* @0x800D1B40 */
extern unsigned char ItemCAnimTbl[169];   /* @0x800D1BE0 */
extern int ItemInvSnds[35];   /* @0x800D1CB0 */
extern char _infostr[2][256];   /* @0x800CE810 */
extern char _infoclr[2];   /* @0x8011B6BC */
extern int icursW28;   /* @0x8011B748 */
extern int icursH28;   /* @0x8011B74C */
extern int AP2x2Tbl[10];   /* @0x8010D008 */
extern char itemavail[127];   /* @0x800D53D4 */
extern unsigned short DavesPad;   /* @0x8011AB12 */
extern int InvPageFlag;   /* @0x8011C33C */
extern int InvPageNo;   /* @0x8011C338 */
extern int InvBackAY;   /* @0x8011C340 */
extern int options_pad;   /* @0x8011B250 */
extern BOOL ignore_buttons;   /* @0x8011BBD0 */
extern unsigned char BORDERR;   /* @0x8011ABF7 */
extern unsigned char BORDERG;   /* @0x8011ABF8 */
extern unsigned char BORDERB;   /* @0x8011ABF9 */
extern int InvGfxTable[168];   /* @0x8010D278 */
extern const unsigned char WHITER;   /* @0x8011ABD1 */
extern const unsigned char WHITEG;   /* @0x8011ABD2 */
extern struct CFont MediumFont;   /* @0x800B82D8 */
