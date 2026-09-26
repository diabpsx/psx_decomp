extern unsigned char currlevel;   /* @0x8011C10C */
extern unsigned char setlevel;   /* @0x8011C10E */
extern unsigned char setlvlnum;   /* @0x8011C10F */
extern int myplr;   /* @0x8011BA08 */
extern struct PlayerStruct plr[2];   /* @0x800DA538 */
extern struct MonsterStruct monster[190];   /* @0x80105394 */
extern short monstactive[190];   /* @0x8010A0C4 */
extern long nummonsters;   /* @0x8011C2CC */
extern struct MissileStruct missile[125];   /* @0x80102C58 */
extern short missileactive[125];   /* @0x80102A60 */
extern int nummissiles;   /* @0x8011C288 */
extern struct ItemStruct item[128];   /* @0x800D1D54 */
extern long numitems;   /* @0x8011B888 */
extern struct ObjectStruct object[127];   /* @0x800D8C4C */
extern unsigned char automapview[5][40];   /* @0x8010D6E4 */
/* deltaload owned by THIS TU (oracle reaches it via %gp_rel in delta_init) -- tentative def, not
 * extern; the ACTUAL definition is placed in msg.cpp right before the CompClass static objects
 * (gcc-2.7 names the _GLOBAL_.I/.D static-init thunk after the last global SYMBOL emitted just
 * before the objects needing a ctor -- retail's thunk is literally "_GLOBAL_.I.deltaload"). */
extern unsigned char deltaload;
extern unsigned long glSeedTbl[17];   /* @0x800CF75C */
extern unsigned char gbActivePlayers;   /* @0x8011B9A3 */
extern unsigned char gbBufferMsgs;   /* @0x8011B97E */
extern unsigned char deathflag;   /* @0x8011BA0C */
extern struct QuestStruct quests[16];   /* @0x800DDA40 */
extern int _pcurs[2];   /* @0x8011B730 */
extern struct CompLevelMaps GameMaps;   /* @0x800D704C */
extern struct LocalLevel sgLocals[22];   /* @0x800D71BC */
