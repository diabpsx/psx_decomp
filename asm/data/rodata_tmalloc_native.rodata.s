.include "macro.inc"
.section .rodata, "a"
.align 2
dlabel D_80110394
    /* 100394 80110394 */ .asciz "psxsrc/TMALLOC.CPP"
.align 2
enddlabel D_80110394
dlabel D_801103A8
    /* 1003A8 801103A8 */ .asciz "OUT OF TMALLOC SLOTS"
enddlabel D_801103A8
/* Original nonzero alignment bytes, outside source ownership. */
dlabel tmalloc_rodata_padding
    /* 1003BD 801103BD */ .byte 0x63
    /* 1003BE 801103BE */ .byte 0x75
    /* 1003BF 801103BF */ .byte 0x01
enddlabel tmalloc_rodata_padding
