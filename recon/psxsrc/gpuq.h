#ifndef PSXSRC_GPUQ_H
#define PSXSRC_GPUQ_H
/* GPUQ.CPP — queued GPU transfers (SYM signatures) */
#include "psxsrc/psyq.h"
void GPUQ_LoadImage(RECT *R, long hnd, int Flags);
void GPUQ_DiscardHandle(long hnd);
#endif
