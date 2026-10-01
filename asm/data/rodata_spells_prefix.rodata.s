.include "macro.inc"
.section .rodata, "a"

/* Unreferenced header literals preceding SPELLS' source-owned jump table.
 * Exact retail range 0x801189C0..0x801189E8; original full scaffold retained
 * in rodata_spells.rodata.s for comparison. */
.align 2
dlabel D_801189C0
.asciz "psxsrc/gman.h"
.align 2
.asciz "psxsrc/cplayer.h"
.align 2
.asciz ""
.align 2
enddlabel D_801189C0
