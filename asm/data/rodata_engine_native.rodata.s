.include "macro.inc"
.section .rodata, "a"

/* Preserve the original filename and its two trailing padding bytes. */
dlabel D_80111328
    /* 101328 80111328 736F7572 */ .word 0x72756F73
    /* 10132C 8011132C 63652F45 */ .word 0x452F6563
    /* 101330 80111330 4E47494E */ .word 0x4E49474E
    /* 101334 80111334 452E6370 */ .word 0x70632E45
enddlabel D_80111328
dlabel native_engine_tail
    /* 101338 80111338 */ .short 0x0070
    /* 10133A 8011133A */ .short 0x006F
enddlabel native_engine_tail
