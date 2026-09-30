extern "C" void * SMemAlloc(unsigned long bytes, char *filename, int linenumber, unsigned long flags);   /* @0x8007B1D0 STORM.CPP:63 */
extern "C" unsigned char SMemFree(void *ptr, char *filename, int linenumber, unsigned long flags);   /* @0x8007B1F0 STORM.CPP:74 */
int GetDirection(int x1, int y1, int x2, int y2);   /* @0x8003DA28 ENGINE.CPP:45 */
void SetRndSeed(long s);   /* @0x8003DACC ENGINE.CPP:94 */
long GetRndSeed(void);   /* @0x8003DADC ENGINE.CPP:102 */
long ENG_random(long v);   /* @0x8003DB24 ENGINE.CPP:113 */
unsigned char * DiabloAllocPtr(unsigned long dwBytes);   /* @0x8003DB90 ENGINE.CPP:371 */
void mem_free_dbg(void *p);   /* @0x8003DBDC ENGINE.CPP:432 */
unsigned char * LoadFileInMem(const char *pszName, unsigned long *pdwFileLen);   /* @0x8003DC2C ENGINE.CPP:490 */
void PlayInGameMovie(const char *pszMovie);   /* @0x8003DC34 ENGINE.CPP:568 */
