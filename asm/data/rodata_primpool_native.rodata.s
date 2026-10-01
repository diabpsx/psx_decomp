.include "macro.inc"
.section .rodata, "a"
.align 2
dlabel D_8010FFC4
    /* FFFC4 8010FFC4 */ .asciz "psxsrc/gman.h"
.align 2
enddlabel D_8010FFC4
dlabel D_8010FFD4
    /* FFFD4 8010FFD4 */ .asciz "PRIMPOOL"
enddlabel D_8010FFD4
/* Original bytes after the final string terminator, outside source ownership. */
dlabel primpool_rodata_padding
    /* FFFDD 8010FFDD */ .byte 0x49
    /* FFFDE 8010FFDE */ .byte 0x41
    /* FFFDF 8010FFDF */ .byte 0x42
enddlabel primpool_rodata_padding
