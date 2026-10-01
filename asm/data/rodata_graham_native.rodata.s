.include "macro.inc"
.section .rodata, "a"
dlabel D_80110B98
    /* 100B98 80110B98 */ .asciz "psxsrc/gman.h"
.align 2
    /* 100BA8 80110BA8 70737873 */ .word 0x73787370
    /* 100BAC 80110BAC 72632F63 */ .word 0x632F6372
    /* 100BB0 80110BB0 706C6179 */ .word 0x79616C70
    /* 100BB4 80110BB4 65722E68 */ .word 0x682E7265
enddlabel D_80110B98
dlabel native_graham_tail
    /* 100BB8 80110BB8 */ .byte 0x00
    /* 100BB9 80110BB9 */ .byte 0xDC
    /* 100BBA 80110BBA */ .byte 0x04
    /* 100BBB 80110BBB */ .byte 0x00
enddlabel native_graham_tail
