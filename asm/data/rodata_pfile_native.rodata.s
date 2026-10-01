.include "macro.inc"
.section .rodata, "a"
dlabel D_8011773C
    /* 10773C 8011773C 70737873 */ .word 0x73787370
    /* 107740 80117740 72632F67 */ .word 0x672F6372
    /* 107744 80117744 6D616E2E */ .word 0x2E6E616D
enddlabel D_8011773C
dlabel native_pfile_tail
    /* 107748 80117748 */ .short 0x0068
    /* 10774A 8011774A */ .short 0x800B
enddlabel native_pfile_tail
