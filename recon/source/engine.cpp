/* ENGINE.CPP — Diablo PSX (Climax 1998) reconstruction.  Twin: refs/diablo-hellfire/src/ENGINE.CPP.
 * PSX deltas: only the direction/random/memory helpers survive; random() is ENG_random(v) (no idx);
 * DiabloAllocPtr/mem_free_dbg take the critical section but never leave it (CCritSect::Enter is an
 * empty inline from STORM.H, emitted out of line at the end of this object; Leave is never used);
 * the Storm calls carry the literal file/line of the PSX source; LoadFileInMem is a stub returning 0;
 * PlayInGameMovie is empty. */
#include "diabpsx_types.h"
#include "source/gen/protos_engine.h"
#include "source/diablo.h"

extern "C" int abs(int);

/* STORM.H (PSX): the Win32 critical section is compiled out. */
class CCritSect {
    int m_critsect;
public:
    void inline Enter() {}
};

long orgseed = 0;
int SeedCount = 0;
static long sglGameSeed;
static CCritSect sgMemCrit;
static int sgnWidth;   /* retained in retail .sbss even though unused here */

/* @0x8003DA28 ENGINE.CPP:45 */
int GetDirection(int x1, int y1, int x2, int y2)
{
    int mx, my, md;

    mx = x2 - x1;
    my = y2 - y1;
    if (mx >= 0) {
        if (my >= 0) {
            md = 0;
            if ((mx << 1) < my) md = 1;
            if ((my << 1) < mx) md = 7;
        } else {
            md = 6;
            my = -my;
            if ((mx << 1) < my) md = 5;
            if ((my << 1) < mx) md = 7;
        }
    } else {
        if (my >= 0) {
            md = 2;
            mx = -mx;
            if ((mx << 1) < my) md = 1;
            if ((my << 1) < mx) md = 3;
        } else {
            md = 4;
            mx = -mx;
            my = -my;
            if ((mx << 1) < my) md = 5;
            if ((my << 1) < mx) md = 3;
        }
    }
    return md;
}

/* @0x8003DACC ENGINE.CPP:94 */
void SetRndSeed(long s)
{
    sglGameSeed = s;
    SeedCount = 0;
}

/* @0x8003DADC ENGINE.CPP:102 */
long GetRndSeed(void)
{
    SeedCount++;
    static const unsigned long INCREMENT = 1;
    static const unsigned long MULTIPLIER = 0x015a4e35L;
    sglGameSeed = MULTIPLIER * sglGameSeed + INCREMENT;
    return abs(sglGameSeed);
}

/* @0x8003DB24 ENGINE.CPP:113 */
long ENG_random(long v)
{
    if (v <= 0) return 0;

    if (v < 0x0ffff) return (GetRndSeed() >> 16) % v;

    return GetRndSeed() % v;
}

/* @0x8003DB90 ENGINE.CPP:371 */
unsigned char *DiabloAllocPtr(unsigned long dwBytes)
{
    sgMemCrit.Enter();
    unsigned char *rv = (unsigned char *)SMemAlloc(dwBytes, "source/ENGINE.cpp", 385, 0);
    return rv;
}

/* @0x8003DBDC ENGINE.CPP:432 */
void mem_free_dbg(void *p)
{
    if (!p) return;
    sgMemCrit.Enter();
    SMemFree(p, "source/ENGINE.cpp", 466, 0);
}

/* @0x8003DC2C ENGINE.CPP:490 */
unsigned char *LoadFileInMem(const char *pszName, unsigned long *pdwFileLen)
{
    return 0;
}

/* @0x8003DC34 ENGINE.CPP:568 */
void PlayInGameMovie(const char *pszMovie)
{
}
