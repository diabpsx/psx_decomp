/* BIRD.CPP -- Diablo PSX (Climax 1998) reconstruction: town birds (PSX-only, no PC twin).
 * Bodies from the retail oracle (asm/nonmatchings/bird) + SYM (scratch/tuinfo.py BIRD.CPP) + refs/skeleton drafts.
 * Layouts / externs / prototypes from DIABPSX.SYM (tools/symhdr.py -> psxsrc/gen/*_bird.h). */
#include "diabpsx_types.h"
#include "psxsrc/psyq.h"
#include "psxsrc/textfileinfo_header.h"
#include "psxsrc/textdat_header.h"
#include "psxsrc/gen/structs_bird.h"
#include "psxsrc/gen/externs_bird.h"
#include "psxsrc/gen/protos_bird.h"

#define TSFX_BIRDCHR1 0xDC

/* Original CPLAYER.H layout and unused diagnostic inline. */
class CPlayer : public TextDat {
public:
    long hndDatMem;
    unsigned short NumOfPlayers;
    BOOL InTown;
    unsigned short PlayerNum, Tpage;
    int TexId, LastScrX, LastScrY, LastOtPos;
    static CPlayer *PActiveArray[2];
    static CPlayer *GetPlayer(int PNum)
    {
        if ((unsigned)PNum >= 2) DBG_Error(NULL, "psxsrc/cplayer.h", 65);
        return PActiveArray[PNum];
    }
};

/* BLOCK.H CBlocks (sizeof 264): ClipRect @+0xC0 is the only field this TU reads */
struct CBlocks {
    unsigned char _pad0[0xC0];
    RECT ClipRect;                                  /* +0xC0 */
    unsigned char _pad1[0x108 - 0xC8];

    void GetScrXY(RECT &R, int x, int y, int sxoff, int syoff);   /* @0x8009185C BLOCK.CPP:2723 */
    static void ShadScaleSkew(POLY_FT4 *Ft4);                           /* @0x80091930 BLOCK.CPP:2745 */
    int GetOtPos(int LogicalY)                                      /* BLOCK.H:177 */
    {
        int OtPos = ClipRect.y + LogicalY + PosAdj;
        if (OtPos < -0x43) OtPos = -0x43;
        if (OtPos > 0x19B) OtPos = 0x19B;
        return OtPos + 0x4D;
    }
};

#include "psxsrc/primpool.h"

struct BIRDSTRUCT BirdList[16] = { { 0 } };   /* @0x800CD374, initialized storage */
char hop_height = 6;              /* @0x8011B29D (.sdata) */
static Perch perches[4] = { { 0x3A, 0x44 }, { 0x11, 0x1B }, { 0x22, 0x1E }, { 0x4B, 0x18 } };   /* @0x8011B2A0 */
static BOOL BirdFrig = 0;         /* @0x8011B2A8 */
static int last_seenx[2];         /* @0x8011C720 */
static int last_seeny[2];         /* @0x8011C728 */

extern void BIRD_StartPerch(BIRDSTRUCT *b);
extern void BIRD_StartFly(BIRDSTRUCT *b);
extern void BIRD_StartLanding(BIRDSTRUCT *b);

/* @0x800AB6B0 BIRD.CPP:47 */
void SetBirdFrig(BOOL f)
{
    if (f != BirdFrig) {
        BirdFrig = f;
        HappyMan(f ? 0x1C : 0);
    }
}

/* @0x800AB6E4 BIRD.CPP:84 */
unsigned char BirdDistanceOK(int WorldXa, int WorldYa, int WorldXb, int WorldYb)
{
    int wx = abs(WorldXa - WorldXb);
    int wy = abs(WorldYa - WorldYb);
    if (wx < 25 && wy < 25)
        return 1;
    return 0;
}

extern void BirdWorld(BIRDSTRUCT *b, int wx, int wy);

/* @0x800AB73C BIRD.CPP:100 */
void AlterBirdPos(BIRDSTRUCT *b, unsigned char rnd)
{
    int offsx = offset_x[b->dir];
    int offsy = offset_y[b->dir];

    if (rnd) {
        b->flyvar -= 2;
    } else {
        b->flyvar--;
    }
    if (b->flyvar <= 0) {
        if (BirdFrig) {
            b->flyvar = ENG_random(5) + 5;
        } else {
            b->flyvar = ENG_random(10) + 5;
        }
        if (b->newdir != b->dir) {
            if (rnd) {
                b->dir += b->rnddir;
            } else {
                if (b->dir < b->newdir) {
                    b->dir++;
                } else if (b->dir > b->newdir) {
                    b->dir--;
                }
            }
            if (b->dir < 0) {
                b->dir += 8;
            } else if (b->dir > 7) {
                b->dir -= 8;
            }
        }
    }
    b->WorldX += offsx;
    b->WorldY += offsy;
    BirdWorld(b, b->WorldX, b->WorldY);
}

/* @0x800AB894 BIRD.CPP:156 */
void BirdWorld(BIRDSTRUCT *b, int wx, int wy)
{
    int x = wx % 8;
    int y = wy % 8;

    if (wx < 0)
        wx = 0;
    if (wy < 0)
        wy = 0;
    b->_bx = wx >> 3;
    b->_by = wy >> 3;
    b->_bxoff = (x - y) << 2;
    b->WorldX = wx;
    b->WorldY = wy;
    b->_byoff = ((x + y - 8) >> 1) << 2;
}

/* @0x800AB910 BIRD.CPP:174 */
BOOL CheckDist(int x, int y)
{
    int x1;
    int y1;

    for (int i = 0; i < 2; i++) {
        if (plr[i].plractive) {
            x1 = abs(x - plr[i]._px);
            y1 = abs(y - plr[i]._py);
            if (abs(x1) < 5 && abs(y1) < 5)
                return i + 1;
        }
    }
    return 0;
}

extern int GetPerch(BIRDSTRUCT *b);

/* @0x800AB9F8 BIRD.CPP:200 */
int BirdScared(BIRDSTRUCT *b)
{
    int scared = 0;
    int p = GetPerch(b);
    int i;

    if (b->mode == BIRD_FLY && b->leader == NULL)
        i = CheckDist(perches[p].x, perches[p].y);
    else
        i = CheckDist(b->_bx, b->_by);
    if (i) {
        i--;
        PlayerStruct *player = &plr[i];
        if (last_seenx[i] != player->WorldX || last_seeny[i] != player->WorldY)
            scared = i + 1;
        last_seenx[i] = player->WorldX;
        last_seeny[i] = player->WorldY;
    }
    return scared;
}

/* @0x800ABB24 BIRD.CPP:232 */
int GetPerch(BIRDSTRUCT *b)
{
    if (b->leader)
        b = b->leader;
    for (int n = 0; n < 16; n += 4) {
        if (&BirdList[n] == b)
            return n / 4;
    }
    return 0;
}

/* @0x800ABB78 BIRD.CPP:250 */
void BIRD_StartHop(BIRDSTRUCT *b)
{
    int nd = ENG_random(8);
    int x = offset_x[nd] * hop_height;
    int y = offset_y[nd] * hop_height;

    if (!b->leadflag) {
        if (!BirdDistanceOK(b->leader->WorldX, b->leader->WorldY, b->WorldX + x, b->WorldY + y))
            nd = GetDirection(b->_bx, b->_by, b->leader->_bx, b->leader->_by);
    } else {
        Perch *p = &perches[GetPerch(b)];
        if (!BirdDistanceOK(p->x << 3, p->y << 3, b->WorldX + x, b->WorldY + y))
            nd = GetDirection(b->_bx, b->_by, p->x, p->y);
    }
    b->flyvar = ENG_random(3) + 1;
    x = offset_x[nd];
    y = offset_y[nd];
    x *= hop_height + b->flyvar;
    y *= hop_height + b->flyvar;
    if (!SolidLoc((b->WorldX + x) >> 3, (b->WorldY + y) >> 3)) {
        b->dir = nd;
        b->mode = BIRD_HOP;
        b->flytime = hop_height;
    } else {
        b->flytime = ENG_random(50) + 10;
    }
}

/* @0x800ABD4C BIRD.CPP:292 */
void BIRD_DoHop(BIRDSTRUCT *b)
{
    if (hop_height / 2 >= b->flytime)
        b->height--;
    else
        b->height++;
    b->WorldX += offset_x[b->dir];
    b->WorldY += offset_y[b->dir];
    BirdWorld(b, b->WorldX, b->WorldY);
    b->animcount = 0;
    b->flytime--;
    if (b->flytime <= 0) {
        b->height = 0;
        b->flyvar--;
        if (b->flyvar == 0)
            BIRD_StartPerch(b);
    }
}

/* @0x800ABE50 BIRD.CPP:323 */
void BIRD_StartPerch(BIRDSTRUCT *b)
{
    b->mode = BIRD_PERCH;
    b->flytime = ENG_random(50) + 50;
    last_seenx[0] = plr[0].WorldX;
    last_seeny[0] = plr[0].WorldY;
    last_seenx[1] = plr[1].WorldX;
    last_seeny[1] = plr[1].WorldY;
}

/* @0x800ABEB8 BIRD.CPP:339 */
void BIRD_DoPerch(BIRDSTRUCT *b)
{
    if (BirdScared(b)) {
        if (b->leader)
            BIRD_StartFly(b->leader);
        else
            BIRD_StartFly(b);
    } else {
        b->flytime--;
        if (b->flytime == 0)
            BIRD_StartHop(b);
    }
}

/* @0x800ABF3C BIRD.CPP:363 */
void BIRD_DoScatter(BIRDSTRUCT *b)
{
    b->flytime--;
    if (b->flytime <= 0) {
        b->mode = BIRD_FLY;
        b->flytime = ENG_random(50) + 50;
        b->flyvar = ENG_random(10) + 5;
    }
    if (b->height < 50) {
        b->height += ENG_random(2);
        b->animcount += 8;
    }
    AlterBirdPos(b, 1);
}

/* @0x800ABFE0 BIRD.CPP:381 */
void CheckDirOk(BIRDSTRUCT *b)
{
    int x;
    int y;
    int ofx;
    int ofy;
    BOOL posok;

    for (int d = 0; d < 8; d++) {
        posok = 1;
        x = b->WorldX;
        y = b->WorldY;
        ofx = offset_x[b->dir];
        ofy = offset_y[b->dir];
        for (int i = 0; i < 50; i++) {
            if (SolidLoc(x >> 3, y >> 3)) {
                posok = 0;
            } else {
                x += ofx;
                y += ofy;
            }
        }
        if (posok)
            return;
        b->dir++;
        b->dir %= 8;
    }
}

/* @0x800AC0F0 BIRD.CPP:416 */
void BIRD_StartScatter(BIRDSTRUCT *b)
{
    b->mode = BIRD_SCATTER;
    b->flytime = ENG_random(100) + 50;
    b->flyvar = ENG_random(50) + 5;
    if (b->leadflag) {
        b->newdir = ENG_random(8);
    } else {
        b->newdir = GetDirection(b->_bx, b->_by, b->leader->_bx, b->leader->_by) - 4;
        if (b->newdir < 0)
            b->newdir += 4;
    }
    CheckDirOk(b);
}

/* @0x800AC190 BIRD.CPP:437 */
void BIRD_StartFly(BIRDSTRUCT *b)
{
    BIRDSTRUCT *leader = b->leader;

    if (b->mode == BIRD_FLY || b->mode == BIRD_SCATTER)
        return;
    BIRD_StartScatter(b);
    if (b->visible)
        PlaySFX(TSFX_BIRDCHR1);
    if (leader == NULL) {
        b++;
        for (int i = 0; i < 3; i++)
            BIRD_StartScatter(b++);
    }
}

/* @0x800AC21C BIRD.CPP:468 */
void BIRD_DoFly(BIRDSTRUCT *b)
{
    int pnum = GetPerch(b);

    b->flytime--;
    if (b->flytime == 0) {
        if (!BirdFrig) {
            b->flytime = ENG_random(20) + 10;
            if (b->leadflag) {
                if (BirdScared(b))
                    b->newdir = ENG_random(8);
                else
                    b->newdir = GetDirection(b->_bx, b->_by, perches[pnum].x, perches[pnum].y);
            } else {
                b->newdir = GetDirection(b->_bx, b->_by, b->leader->_bx, b->leader->_by);
            }
        } else {
            b->newdir = GetDirection(b->_bx, b->_by, plr[0]._px, plr[0]._py);
            b->flytime = ENG_random(5) + 5;
        }
        if (b->leadflag) {
            if (!BirdScared(b) && !BirdFrig) {
                int x = offset_x[b->dir];
                int y = offset_y[b->dir];
                x *= b->height;
                y *= b->height;
                if (BirdDistanceOK(perches[pnum].x << 3, perches[pnum].y << 3, b->WorldX + x, b->WorldY + y)
                    && !SolidLoc((b->WorldX + x) >> 3, (b->WorldY + y) >> 3))
                    BIRD_StartLanding(b);
            }
        }
    }
    if (b->leadflag) {
        if (b->height < 50) {
            b->animcount += 8;
            b->height += ENG_random(2);
        }
    } else if (b->leader->mode != BIRD_LANDING && b->leader->mode != BIRD_PERCH) {
        if (b->height < b->leader->height)
            b->height += ENG_random(2);
        else if (b->leader->height < b->height)
            b->height -= ENG_random(2);
        if (b->height != b->leader->height)
            b->animcount += 8;
    }
    AlterBirdPos(b, 0);
}

/* @0x800AC514 BIRD.CPP:536 */
void BIRD_StartLanding(BIRDSTRUCT *b)
{
    b->mode = BIRD_LANDING;
}

/* @0x800AC520 BIRD.CPP:555 */
void BIRD_DoLanding(BIRDSTRUCT *b)
{
    b->height--;
    AlterBirdPos(b, 1);
    if (b->height <= 0) {
        b->height = 0;
        if (!SolidLoc(b->_bx, b->_by))
            BIRD_StartPerch(b);
    }
}

/* @0x800AC58C BIRD.CPP:572 */
void PlaceFlock(BIRDSTRUCT *leader)
{
    BIRDSTRUCT *b = leader;

    b++;
    for (int i = 0; i < 3; i++) {
        b->leader = leader;
        b->animcount = 0;
        b->flyvar = 0;
        b->WorldX = leader->WorldX - (10 - ENG_random(20));
        b->WorldY = leader->WorldY - (10 - ENG_random(20));
        BirdWorld(b, b->WorldX, b->WorldY);
        BIRD_StartPerch(b);
        b->leadflag = 0;
        b->dir = ENG_random(8);
        b->rnddir = ENG_random(2) - 1;
        if (b->rnddir == 0)
            b->rnddir = 1;
        b++;
    }
}

/* @0x800AC674 BIRD.CPP:599 */
void ProcessFlock(BIRDSTRUCT *b)
{
    BIRDSTRUCT *leader = b->leader;

    if (b->mode == BIRD_FLY && (leader->mode == BIRD_PERCH || leader->mode == BIRD_HOP)) {
        int x = offset_x[b->dir];
        int y = offset_y[b->dir];
        x *= b->height;
        y *= b->height;
        if (BirdDistanceOK(leader->WorldX, leader->WorldY, b->WorldX + x, b->WorldY + y)) {
            if (!SolidLoc((b->WorldX + x) >> 3, (b->WorldY + y) >> 3))
                BIRD_StartLanding(b);
        }
    }
}

/* @0x800AC764 BIRD.CPP:637 */
void InitBird(void)
{
    BIRDSTRUCT *b = BirdList;
    int p = 0;

    for (int i = 0; i < 16; i += 4) {
        b->dir = ENG_random(7);
        b->animcount = 0;
        b->flyvar = 0;
        b->height = 0;
        b->WorldX = perches[p].x << 3;
        b->WorldY = perches[p].y << 3;
        BirdWorld(b, b->WorldX, b->WorldY);
        BIRD_StartPerch(b);
        PlaceFlock(b);
        b->leadflag = 1;
        b->leader = NULL;
        b += 4;
        p++;
    }
}

/* @0x800AC838 BIRD.CPP:668 */
void ProcessBird(void)
{
    BIRDSTRUCT *b = BirdList;

    if (PauseMode || stextflag || qtextflag)
        return;
    for (int i = 0; i < 16; i++) {
        switch (b->mode) {
        case BIRD_HOP:
            BIRD_DoHop(b);
            break;
        case BIRD_PERCH:
            BIRD_DoPerch(b);
            break;
        case BIRD_FLY:
            BIRD_DoFly(b);
            break;
        case BIRD_SCATTER:
            BIRD_DoScatter(b);
            break;
        case BIRD_LANDING:
            BIRD_DoLanding(b);
            break;
        }
        if (!b->leadflag)
            ProcessFlock(b);
        b->animcount++;
        if (b->animcount >= 16)
            b->animcount = 0;
        b++;
    }
}

/* @0x800AC97C BIRD.CPP:715 */
int GetBirdFrame(BIRDSTRUCT *b)
{
    int banim = b->dir;

    if (b->mode == BIRD_PERCH || b->mode == BIRD_HOP) {
        switch (banim) {
        case 1:
        case 2:
        case 3:
        case 4:
            banim = 0;
            break;
        case 0:
        case 5:
        case 6:
        case 7:
            banim = 1;
            break;
        }
        banim *= 2;
        banim += b->animcount >> 3;
        return banim + 16;
    }
    banim *= 2;
    if (b->mode == BIRD_LANDING)
        banim += 1;
    else
        banim += b->animcount >> 3;
    return banim;
}

/* @0x800ACA14 BIRD.CPP:750 */
void bscale(POLY_FT4 *Ft4, int height)
{
    int x = (abs(Ft4->x1 - Ft4->x0) / 2) << 8;
    int y = (abs(Ft4->y1 - Ft4->y0) / 2) << 8;

    if (!height)
        height = 1;
    x /= 50;
    y /= 50;
    x *= height;
    y *= height;
    x >>= 8;
    y >>= 8;
    Ft4->x0 += x;
    Ft4->x1 -= x;
    Ft4->x2 += x;
    Ft4->x3 -= x;
    Ft4->y0 += y;
    Ft4->y1 += y;
    Ft4->y2 -= y;
    Ft4->y3 -= y;
}

/* @0x800ACB44 BIRD.CPP:775 */
void doshadow(BIRDSTRUCT *b, int x, int y)
{
    CBlocks *gb = BL_GetCurrentBlocks();
    POLY_FT4 *Ft4;
    TextDat *Dat = MissDat;

    if (b->height > 40)
        return;
    x -= b->height;
    y -= b->height >> 1;
    if ((unsigned)x < 320 && (unsigned)y < 240) {
        int ot = gb->GetOtPos(y);
        PRIM_GetPrim(&Ft4);
        Dat->PrepareFt4(Ft4, GetBirdFrame(b), x, y, 0, 0);
        bscale(Ft4, b->height);
        addPrim(ThisOt + ot, Ft4);
        gb->ShadScaleSkew(Ft4);
    }
}

/* @0x800ACC6C BIRD.CPP:834 */
void DrawLBird(void)
{
    BIRDSTRUCT *ThisBird;
    POLY_FT4 *Ft4;
    CBlocks *gblock = BL_GetCurrentBlocks();
    int ScrXOff;
    int ScrYOff;
    int x;
    int y;
    RECT R;
    TextDat *Dat = MissDat;

    ThisBird = BirdList;
    if (leveltype == 0) {
        for (int i = 0; i < 16; i++) {
            ScrXOff = (ThisBird->_bxoff * 625) / 1000;
            ScrYOff = (ThisBird->_byoff * 625) / 1000;
            gblock->GetScrXY(R, ThisBird->_bx * 20, ThisBird->_by * 20, ScrXOff, ScrYOff);
            x = R.x;
            y = R.y;
            if ((unsigned)x < 320 && y >= 0 && y - ThisBird->height < 240) {
                int ot = gblock->GetOtPos(y + ThisBird->height);
                PRIM_GetPrim(&Ft4);
                Dat->PrepareFt4(Ft4, GetBirdFrame(ThisBird), x, y - ThisBird->height, 0, 0);
                addPrim(ThisOt + ot, Ft4);
                ThisBird->visible = 1;
            } else {
                ThisBird->visible = 0;
            }
            doshadow(ThisBird, x, y - ThisBird->height);
            ThisBird++;
        }
    }
}
