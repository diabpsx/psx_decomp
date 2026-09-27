/* SCRATCH.CPP -- Diablo PSX (Climax 1998) reconstruction: scratch highlight-palette cache (PSX-only).
 * Bodies from the retail oracle (asm/nonmatchings/scratch) + SYM (scratch/tuinfo.py SCRATCH.CPP / TUTILS.H).
 * TUTILS.H templates TLinkedList<T> / Collection<T,N> are emitted out of line here for PalEntry / 20. */
#include "diabpsx_types.h"
#include "psxsrc/psyq.h"
#include "glibdev/gdebug.h"

void GPUQ_MoveImage(RECT *R, int x, int y);                 /* @GPUQ.CPP */
void GPUQ_LoadClutAddr(int x, int y, int Cols, void *Addr);  /* @GPUQ.CPP */

/* ---- TUTILS.H ---------------------------------------------------------------------------- */
template <class T> class TLinkedList {
public:
    T *Next;   /* +0x0 */
    T *Prev;   /* +0x4 */

    void DetachFromList(T **Head)   /* TUTILS.H:46 */
    {
        if (Prev)
            Prev->Next = Next;
        else
            *Head = Next;
        if (Next)
            Next->Prev = Prev;
    }
    void AddToList(T **Head)        /* TUTILS.H:57 */
    {
        Prev = NULL;
        Next = *Head;
        if (Next)
            Next->Prev = (T *)this;
        *Head = (T *)this;
    }
    T *GetNext() const { return Next; }   /* TUTILS.H:67 */
};

template <class T, int N> class Collection {
public:
    int ObjsUsed;    /* +0x0 */
    T Objects[N];    /* +0x4 */
    T *Used;
    T *Unused;

    void MoveFromUnusedToUsed(T *RetObj)   /* TUTILS.H:83 */
    {
        RetObj->DetachFromList(&Unused);
        RetObj->AddToList(&Used);
        ObjsUsed++;
    }
    void MoveFromUsedToUnused(T *RetObj)   /* TUTILS.H:90 */
    {
        RetObj->DetachFromList(&Used);
        RetObj->AddToList(&Unused);
        ObjsUsed--;
    }
    void Init()                            /* TUTILS.H:98 */
    {
        Used = NULL;
        Unused = NULL;
        ObjsUsed = 0;
        for (int f = 0; f < N; f++)
            Objects[f].AddToList(&Unused);
    }
    T *GetObj()                            /* TUTILS.H:110 */
    {
        T *RetObj = Unused;
        if (RetObj)
            MoveFromUnusedToUsed(RetObj);
        return RetObj;
    }
    int GetNumOfObjs() { return N; }       /* TUTILS.H:132 */
};

/* ---- SCRATCH.CPP --------------------------------------------------------------------------- */
struct InitPos {
    unsigned short x;
    unsigned short y;
};

class PalEntry : public TLinkedList<PalEntry> {
public:
    unsigned short PixVal;      /* +0x08 */
    unsigned short MyX;         /* +0x0A */
    unsigned short MyY;         /* +0x0C */
    unsigned short Clut;        /* +0x0E */
    unsigned short SourceClut;  /* +0x10 */
    unsigned short NumOfCols;   /* +0x12 */
    unsigned short JustUsed;    /* +0x14 */

    BOOL IsEqual(unsigned short _SourceClut, unsigned short _PixVal, int _NumOfCols) const { return _SourceClut == SourceClut && _PixVal == PixVal && NumOfCols == _NumOfCols; }   /* 77 */
    unsigned short GetClut() const { return Clut; }   /* 82 */
    void Init() { NumOfCols = 0; }                     /* 83 */
    BOOL SetJustUsed(BOOL NewVal)                      /* 86 */
    {
        return NewVal;
    }
    void Set(const InitPos &NewPos)                    /* 93 */
    {
        MyX = NewPos.x;
        MyY = NewPos.y;
        Clut = (MyY << 6) | ((MyX >> 4) & 0x3F);
    }
    void Set(unsigned short _SourceClut, unsigned short _PixVal, int _NumOfCols)   /* 101 */
    {
        SourceClut = _SourceClut;
        PixVal = _PixVal | 0x8000;
        NumOfCols = _NumOfCols;
    }
    void MakePal(unsigned short _SourceClut, unsigned short _PixVal, int _NumOfCols);
};

class PalCollection : public Collection<PalEntry, 20> {
public:
    void Init(const InitPos *IPos);
    PalEntry *FindPal(unsigned short SourceClut, unsigned short PixVal, int NumOfCols);
    PalEntry *NewPal(unsigned short SourceClut, unsigned short PixVal, int NumOfCols);
    unsigned short GetHighlightPal(unsigned short SourceClut, unsigned short PixVal, int NumOfCols);
    void UpdatePals();
};

PalCollection ThePals;          /* @0x800CBDAC */
unsigned short ShadClut = 0;    /* @0x8011AE24 (.sdata) */

static const InitPos InitialPositions[20] = {   /* @0x80110A74 */
    { 0x00, 0xFB }, { 0x10, 0xFB }, { 0x20, 0xFB }, { 0x30, 0xFB },
    { 0x00, 0xFC }, { 0x10, 0xFC }, { 0x20, 0xFC }, { 0x30, 0xFC },
    { 0x00, 0xFD }, { 0x10, 0xFD }, { 0x20, 0xFD }, { 0x30, 0xFD },
    { 0x00, 0xFE }, { 0x10, 0xFE }, { 0x20, 0xFE }, { 0x30, 0xFE },
    { 0x00, 0xFF }, { 0x10, 0xFF }, { 0x20, 0xFF }, { 0x30, 0xFF },
};

void SCR_DumpClut(void);

/* @0x8009AC78 SCRATCH.CPP:162 */
unsigned short SCR_GetBlackClut(void)
{
    return ShadClut;
}

/* @0x8009AC84 SCRATCH.CPP:171 */
void SCR_Open(void)
{
    ThePals.Init(InitialPositions);
    SCR_DumpClut();
}

/* @0x8009ACBC SCRATCH.CPP:181 */
void SCR_DumpClut(void)
{
    RECT R;
    unsigned short ColVal;
    unsigned short BlankPal[64];

    ColVal = 0x8000;
    for (int f = 0; f < 64; f++)
        BlankPal[f] = ColVal;
    BlankPal[0] = 0;
    setRECT(&R, 320, 255, 64, 1);
    LoadImage(&R, (u_long *)BlankPal);
    DrawSync(0);
    ShadClut = (255 << 6) | (320 >> 4);
}

/* @0x8009AD30 SCRATCH.CPP:212 */
unsigned short SCR_NeedHighlightPal(unsigned short Clut, unsigned short PixVal, int NumOfCols)
{
    return ThePals.GetHighlightPal(Clut, PixVal, NumOfCols);
}

/* @0x8009AD64 SCRATCH.CPP:223 */
void PalCollection::Init(const InitPos *IPos)
{
    Collection<PalEntry, 20>::Init();
    for (int f = 0; f < GetNumOfObjs(); f++) {
        Objects[f].Set(IPos[f]);
        Objects[f].Init();
    }
}

/* @0x8009ADF4 SCRATCH.CPP:247 */
PalEntry *PalCollection::FindPal(unsigned short SourceClut, unsigned short PixVal, int NumOfCols)
{
    PalEntry *RetPal;

    for (RetPal = Used; RetPal; RetPal = RetPal->GetNext()) {
        if (RetPal->IsEqual(SourceClut, PixVal, NumOfCols))
            return RetPal;
    }
    for (RetPal = Unused; RetPal; RetPal = RetPal->GetNext()) {
        if (RetPal->IsEqual(SourceClut, PixVal, NumOfCols)) {
            MoveFromUnusedToUsed(RetPal);
            return RetPal;
        }
    }
    return NULL;
}

/* @0x8009AED0 SCRATCH.CPP:289 */
PalEntry *PalCollection::NewPal(unsigned short SourceClut, unsigned short PixVal, int NumOfCols)
{
    PalEntry *RetPal = GetObj();

    if (!RetPal)
        DBG_Error(NULL, "psxsrc/SCRATCH.CPP", 307);
    RetPal->MakePal(SourceClut, PixVal, NumOfCols);
    return RetPal;
}

/* @0x8009AF50 SCRATCH.CPP:319 */
void PalEntry::MakePal(unsigned short _SourceClut, unsigned short _PixVal, int _NumOfCols)
{
    RECT SourceRect;

    Set(_SourceClut, _PixVal, _NumOfCols);
    SourceRect.x = (_SourceClut & 0x3F) << 4;
    SourceRect.y = _SourceClut >> 6;
    SourceRect.w = NumOfCols - 1;
    SourceRect.h = 1;
    GPUQ_MoveImage(&SourceRect, MyX, MyY);
    GPUQ_LoadClutAddr(MyX + NumOfCols - 1, MyY, 1, &PixVal);
}

/* @0x8009AFF0 SCRATCH.CPP:346 */
unsigned short PalCollection::GetHighlightPal(unsigned short SourceClut, unsigned short PixVal, int NumOfCols)
{
    PalEntry *RetPal = NewPal(SourceClut, PixVal, NumOfCols);

    RetPal->SetJustUsed(1);
    return RetPal->GetClut();
}

/* @0x8009B038 SCRATCH.CPP:376 */
void PalCollection::UpdatePals()
{
    PalEntry *ThisPal = Used;

    while (ThisPal) {
        PalEntry *NextPal = ThisPal->GetNext();
        if (ThisPal->SetJustUsed(0) == 0)
            MoveFromUsedToUnused(ThisPal);
        ThisPal = NextPal;
    }
}

/* @0x8009B0AC SCRATCH.CPP:402 */
void SCR_Handler(void)
{
    ThePals.UpdatePals();
}
