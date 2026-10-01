/* GPUQ.CPP -- Diablo PSX (Climax 1998) reconstruction: queued GPU image transfers (LoadImage/MoveImage
 * batched once per frame). Bodies from the retail oracle (asm/nonmatchings/gpuq) + SYM
 * (scratch/tuinfo.py GPUQ.CPP). The refs/skeleton draft's field names for LOAD_IMAGE_ARGS are
 * internally inconsistent (Ghidra guesses); the layout here is re-derived directly from the raw --
 * see gen/structs_gpuq.h for the byte-by-byte proof. Layouts / externs / prototypes from
 * DIABPSX.SYM (tools/symhdr.py -> psxsrc/gen/*_gpuq.h). */
#include "diabpsx_types.h"
#include "psxsrc/psyq.h"
#include "psxsrc/gen/structs_gpuq.h"
#include "psxsrc/gen/externs_gpuq.h"
#include "psxsrc/gen/protos_gpuq.h"
#include "psxsrc/gpuq.h"

/* MoveImage isn't in the shared psyq.h yet -- same local-declaration convention as EnterCriticalSection
 * in biglump.cpp/fmv.cpp for a PsyQ libgpu call this TU is the first to need. */
extern "C" int MoveImage(RECT *rect, int x, int y);

/* TU-owned (EXT class in the SYM, defined here -- 30-entry queue drained once per frame). */
struct LOAD_IMAGE_ARGS AllArgs[30] = {{0}};
int ArgsSoFar;

void GPUQ_FlushQ(void);

/* @0x800833B0 GPUQ.CPP:76 */
void CheckMaxArgs(void)
{
    if (ArgsSoFar == 0x1E) {
        DrawSync(0);
        GPUQ_FlushQ();
    }
}

/* @0x800833E4 GPUQ.CPP:96 */
unsigned char GPUQ_InitModule(void)
{
    ArgsSoFar = 0;
    return 1;
}

/* @0x800833F0 GPUQ.CPP:106 */
void GPUQ_FlushQ(void)
{
    int f;
    LOAD_IMAGE_ARGS *Img;

    for (f = 0; f < ArgsSoFar; f++) {
        Img = &AllArgs[f];
        if (Img->Flags & 4) {
            MoveImage(&Img->Rect, Img->MoveX, Img->MoveY);
        } else if (Img->Flags & 1) {
            LoadImage(&Img->Rect, (unsigned long *)Img->Addr);
        } else {
            void *ImgMem = GAL_Lock(Img->Handle);
            if (ImgMem == 0)
                DBG_Error(0, "psxsrc/GPUQ.CPP", 0x7C);
            LoadImage(&Img->Rect, (unsigned long *)((long)ImgMem + Img->Offset));
        }
    }
    DrawSync(0);
    for (f = 0; f < ArgsSoFar; f++) {
        LOAD_IMAGE_ARGS *A = &AllArgs[f];
        unsigned char GalRet;
        if (!(A->Flags & 5)) {
            if (A->Flags & 2)
                GalRet = GAL_Free(A->Handle);
            else
                GalRet = GAL_Unlock(A->Handle);
            if (!GalRet)
                DBG_Error(0, "psxsrc/GPUQ.CPP", 0x91);
        }
    }
    ArgsSoFar = 0;
}

/* @0x80083564 GPUQ.CPP:159 */
void GPUQ_LoadImage(RECT *Rect, long ImgHandle, int Offset)
{
    LOAD_IMAGE_ARGS *Args;

    CheckMaxArgs();
    Args = &AllArgs[ArgsSoFar];
    Args->Offset = Offset;
    Args->Rect.x = Rect->x;
    Args->Rect.y = Rect->y;
    ArgsSoFar++;
    Args->Rect.w = Rect->w;
    Args->Rect.h = Rect->h;
    Args->Handle = ImgHandle;
    Args->Flags &= ~2;
    Args->Flags &= ~4;
    Args->Flags &= ~1;
}

/* @0x80083618 GPUQ.CPP:220 */
void GPUQ_DiscardHandle(long hnd)
{
    int f;

    for (f = 0; f < ArgsSoFar; f++) {
        if (!(AllArgs[f].Flags & 1) && AllArgs[f].Handle == hnd) {
            AllArgs[f].Flags |= 2;
            return;
        }
    }
    if (!GAL_Free(hnd))
        DBG_Error(0, "psxsrc/GPUQ.CPP", 0xEE);
}

/* @0x800836B8 GPUQ.CPP:249 */
void GPUQ_LoadClutAddr(int X, int Y, int Cols, void *Addr)
{
    LOAD_IMAGE_ARGS *Args;

    CheckMaxArgs();
    Args = &AllArgs[ArgsSoFar];
    Args->Rect.h = 1;
    ArgsSoFar++;
    Args->Rect.x = (short)X;
    Args->Rect.y = (short)Y;
    Args->Rect.w = (short)Cols;
    Args->Addr = Addr;
    Args->Flags = (Args->Flags & ~4) | 1;
}

/* @0x80083754 GPUQ.CPP:276 */
void GPUQ_MoveImage(RECT *R, int x, int y)
{
    LOAD_IMAGE_ARGS *Args;

    CheckMaxArgs();
    Args = &AllArgs[ArgsSoFar];
    Args->Rect = *R;
    Args->MoveX = (unsigned short)x;
    Args->MoveY = (unsigned short)y;
    Args->Flags |= 4;
    ArgsSoFar++;
}
