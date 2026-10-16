.include "macro.inc"
.section .sdata, "wa"

/* PRIMPOOL.CPP small data (retail 0x8011AAB4..0x8011AAC8); the native member supplies every byte. */
dlabel ThisOt
    /* 10AAB4 8011AAB4 00000000 */ .word 0x00000000
enddlabel ThisOt

dlabel ThisPrimAddr
    /* 10AAB8 8011AAB8 00000000 */ .word 0x00000000
enddlabel ThisPrimAddr

dlabel AddrToAvoid
    /* 10AABC 8011AABC 00000000 */ .word 0x00000000
    /* 10AAC0 8011AAC0 00000000 */ .word 0x00000000
    /* 10AAC4 8011AAC4 4001F000 */ .word 0x00F00140
enddlabel AddrToAvoid
