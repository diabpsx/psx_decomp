.include "macro.inc"
.section .rodata, "a"
.align 2

dlabel D_801189FC
    /* 1089FC 801189FC */ .asciz "psxsrc/gman.h"
.align 2
enddlabel D_801189FC

dlabel D_80118A0C
    /* 108A0C 80118A0C 736F7572 */ .word 0x72756F73
    /* 108A10 80118A10 63652F53 */ .word 0x532F6563
    /* 108A14 80118A14 4F554E44 */ .word 0x444E554F
    /* 108A18 80118A18 2E637070 */ .word 0x7070632E
    /* 108A1C 80118A1C */ .byte 0x00
enddlabel D_80118A0C

/* Preserved retail alignment bytes, not source-owned string data. */
dlabel sound_rodata_padding
    /* 108A1D 80118A1D */ .byte 0xCA
    /* 108A1E 80118A1E */ .byte 0x69
    /* 108A1F 80118A1F */ .byte 0x00
enddlabel sound_rodata_padding
