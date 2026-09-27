void DefragItems(unsigned char *ilist, int num);   /* @0x80162FD4 PREMSG.CPP:92 */
void removellist(unsigned char *ilist, unsigned char val);   /* @0x8016301C PREMSG.CPP:102 */
void DeltaLoadLevel(void);   /* @0x80163054 PREMSG.CPP:115 */

/* cross-TU callees */
DLevel * GetDLevel(int LevNum, BOOL SetLevel);   /* @0x80052888 MSG.CPP:2790 */
void ReleaseDLevel(DLevel *Dl);   /* @0x800528D0 MSG.CPP:2807 */
void M_ClearSquares(int i);   /* @0x8007F35C COREMON.CPP:139 */
void decode_enemy(int m, int enemy);   /* @0x80161E94 PREMON.CPP:1359 */
void M_UpdateLeader(int i);   /* @0x8007FFD4 COREMON.CPP:559 */
void M_StartStand(int i, int md);   /* @0x8007FE70 COREMON.CPP:526 */
void AddDead(int dx, int dy, char dv, int ddir);   /* @0x80037F8C DEAD.CPP:99 */
unsigned char QuestStatus(int i);   /* @0x80067B70 QUESTS.CPP:305 */
void CreateItem(int uid, int x, int y);   /* @0x80044A20 ITEMS.CPP:2808 */
int FindGetItem(int idx, unsigned short ci, int iseed);   /* @0x8008271C COREINV.CPP:52 */
void DeleteItem(int ii, int i);   /* @0x800457B8 ITEMS.CPP:3127 */
void RecreateEar(int ii, unsigned short ic, int iseed, unsigned char Id, int dur, int mdur, int ch, int mch, int ivalue, int ibuff);   /* @0x80045008 ITEMS.CPP:2962 */
void RecreateItem(int ii, int idx, unsigned short icreateinfo, int iseed, int ivalue, int PlrCreate);   /* @0x8004BA14 ITEMS.CPP:6127 */
unsigned char CanPut(int i, int j);   /* @0x800806C0 COREMON.CPP:699 */
void RespawnItem(int i, unsigned char FlipFlag);   /* @0x80045600 ITEMS.CPP:3088 */
void SyncOpObject(int pnum, int cmd, int i);   /* @0x8005E1A4 OBJECTS.CPP:3845 */
void SyncBreakObj(int pnum, int oi);   /* @0x8005ECA4 OBJECTS.CPP:4085 */
void Obj_Trap(int i);   /* @0x80054F50 OBJECTS.CPP:1088 */
void ConvertdPiece(void);   /* @0x8008287C DPIECE.CPP:113 */
void BuildLevTrigs(void);   /* @0x800754E8 TRIGS.CPP:258 */
