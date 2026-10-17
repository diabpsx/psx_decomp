#ifndef PSXSRC_TUTILS_H
#define PSXSRC_TUTILS_H
/* TUTILS.H -- Climax PSX template utilities (C:\diabpsx\PSXSRC\TUTILS.H): the intrusive linked list and the
 * fixed-size object collection (SCRATCH.CPP's PalEntry / 20 instantiation), and the texture-page coordinate
 * helpers.  Line numbers per the retail SYM: the templates' members are emitted out of line per instantiating
 * TU (-fno-inline); GetTpY/GetTpX are file-static functions, emitted in place by each TU that includes them. */
#include "diabpsx_types.h"

template <class T> class TLinkedList {
public:
    T *Next;   /* +0x0 */
    T *Prev;   /* +0x4 */

#line 45
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
#line 67
    T *GetNext() const { return Next; }   /* TUTILS.H:67 */
};

template <class T, int N> class Collection {
public:
    int ObjsUsed;    /* +0x0 */
    T Objects[N];    /* +0x4 */
    T *Used;
    T *Unused;

#line 82
    void MoveFromUnusedToUsed(T *RetObj)   /* TUTILS.H:83 */
    {
        RetObj->DetachFromList(&Unused);
        RetObj->AddToList(&Used);
        ObjsUsed++;
    }
#line 89
    void MoveFromUsedToUnused(T *RetObj)   /* TUTILS.H:90 */
    {
        RetObj->DetachFromList(&Used);
        RetObj->AddToList(&Unused);
        ObjsUsed--;
    }
#line 97
    void Init()                            /* TUTILS.H:98 */
    {
        Used = NULL;
        Unused = NULL;
        ObjsUsed = 0;

        for (int f = 0; f < N; f++)
            Objects[f].AddToList(&Unused);
    }
#line 109
    T *GetObj()                            /* TUTILS.H:110 */
    {
        T *RetObj = Unused;

        if (RetObj)
            MoveFromUnusedToUsed(RetObj);

        return RetObj;
    }
#line 132
    int GetNumOfObjs() { return N; }       /* TUTILS.H:132 */
};

#ifndef TUTILS_TEMPLATES_ONLY   /* [INFERRED] SCRATCH.CPP (TUTILS.H templates only) carries no GetTpY/GetTpX copies, the other includers do */
#line 176
static int GetTpY(unsigned short tpage)   /* TUTILS.H:177 */
{
    return ((tpage << 4) & 0x100) | ((tpage >> 2) & 0x200);
}

#line 181
static int GetTpX(unsigned short tpage)   /* TUTILS.H:182 */
{
    return (tpage << 6) & 0x3C0;
}
#endif

#endif
