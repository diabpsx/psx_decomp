.include "macro.inc"
.section .rodata, "a"
.align 2
dlabel D_80110C38
    /* 100C38 80110C38 */ .asciz "psxsrc/gman.h"
.align 2
enddlabel D_80110C38
dlabel D_80110C48
    /* 100C48 80110C48 */ .asciz "psxsrc/DECOMP.CPP"
enddlabel D_80110C48
/* Original alignment bytes outside the source string pool. */
dlabel decomp_rodata_padding
    /* 100C5A 80110C5A */ .byte 0x04
    /* 100C5B 80110C5B */ .byte 0x00
enddlabel decomp_rodata_padding
