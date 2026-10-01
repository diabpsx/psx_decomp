.include "macro.inc"
.section .rodata, "a"

/* Original bytes, with the source-string/padding boundary made explicit. */
dlabel D_8011133C
    /* 10133C 8011133C 70737873 */ .word 0x73787370
    /* 101340 80111340 72632F67 */ .word 0x672F6372
    /* 101344 80111344 6D616E2E */ .word 0x2E6E616D
enddlabel D_8011133C
dlabel native_error_tail
    /* 101348 80111348 */ .short 0x0068
    /* 10134A 8011134A */ .short 0x006F
enddlabel native_error_tail
