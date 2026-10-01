.include "macro.inc"
.section .rodata, "a"
.align 2
dlabel D_80110BDC
    /* 100BDC 80110BDC */ .asciz "psxsrc/gman.h"
.align 2
enddlabel D_80110BDC
dlabel D_80110BEC
    /* 100BEC 80110BEC */ .asciz "psxsrc/cplayer.h"
.align 2
enddlabel D_80110BEC
dlabel D_80110C00
    /* 100C00 80110C00 */ .asciz "psxsrc/primpool.h"
enddlabel D_80110C00
/* Original trailing alignment bytes, not source-owned strings. */
dlabel davel_rodata_padding
    /* 100C12 80110C12 */ .byte 0x6C
    /* 100C13 80110C13 */ .byte 0x00
enddlabel davel_rodata_padding
