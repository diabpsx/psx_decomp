#ifndef SOURCE_STORM_H
#define SOURCE_STORM_H
/* STORM.H -- the Storm library header as the PSX build saw it (C:\diabpsx\SOURCE\STORM.H).  The Win32
 * critical section is compiled out: CCritSect::Enter is an empty inline (STORM.H:1104), emitted out of line
 * in ENGINE.CPP; Leave is never called on PSX. */
#include "diabpsx_types.h"

class CCritSect {
    unsigned long m_critsect;   /* +0x0 (SYM) */
public:
    void Enter() {}   /* STORM.H:1104 */
};

#endif
