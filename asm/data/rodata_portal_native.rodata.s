.include "macro.inc"
.section .rodata, "a"
dlabel D_80118E24
    /* 108E24 80118E24 70737873 */ .word 0x73787370
    /* 108E28 80118E28 72632F67 */ .word 0x672F6372
    /* 108E2C 80118E2C 6D616E2E */ .word 0x2E6E616D
enddlabel D_80118E24
dlabel native_portal_tail
    /* 108E30 80118E30 */ .short 0x0068
    /* 108E32 80118E32 */ .short 0x0069
enddlabel native_portal_tail
