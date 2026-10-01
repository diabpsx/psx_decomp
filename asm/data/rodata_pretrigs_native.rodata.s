.include "macro.inc"
.section .rodata, "a"
.align 2

dlabel D_80119D44
    /* 109D44 80119D44 */ .asciz "psxsrc/gman.h"
.align 2
    /* 109D54 80119D54 */ .asciz "psxsrc/cplayer.h"
enddlabel D_80119D44

/* Unowned retail bytes after the final string terminator. */
dlabel pretrigs_rodata_padding
    /* 109D65 80119D65 */ .byte 0x0A
    /* 109D66 80119D66 */ .byte 0x01
    /* 109D67 80119D67 */ .byte 0x80
enddlabel pretrigs_rodata_padding
