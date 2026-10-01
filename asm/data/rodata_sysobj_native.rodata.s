.include "macro.inc"
.section .rodata, "a"
.align 2
dlabel D_80110198
    /* 100198 80110198 */ .asciz "psxsrc/SYSOBJ.CPP"
enddlabel D_80110198
/* Original alignment bytes, not source string data. */
dlabel sysobj_rodata_padding
    /* 1001AA 801101AA */ .byte 0x04
    /* 1001AB 801101AB */ .byte 0x00
enddlabel sysobj_rodata_padding
