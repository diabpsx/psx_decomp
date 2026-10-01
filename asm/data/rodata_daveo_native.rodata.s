.include "macro.inc"
.section .rodata, "a"
dlabel D_8011009C
    /* 10009C 8011009C 70737873 */ .word 0x73787370
    /* 1000A0 801100A0 72632F67 */ .word 0x672F6372
    /* 1000A4 801100A4 6D616E2E */ .word 0x2E6E616D
enddlabel D_8011009C
dlabel native_daveo_tail
    /* 1000A8 801100A8 */ .short 0x0068
    /* 1000AA 801100AA */ .short 0x0004
enddlabel native_daveo_tail
