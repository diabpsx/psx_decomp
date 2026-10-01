.include "macro.inc"

.section .rodata, "a"

dlabel D_80118D68
    /* 108D68 80118D68 */ .asciz "psxsrc/gman.h"
.align 2
enddlabel D_80118D68

dlabel D_80118D78
    /* 108D78 80118D78 */ .asciz "source/MLIST.cpp"
    /* final three alignment bytes remain scaffold-owned */
.align 2
enddlabel D_80118D78
