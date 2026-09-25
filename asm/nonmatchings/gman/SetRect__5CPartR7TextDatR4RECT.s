.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetRect__5CPartR7TextDatR4RECT, 0x7C

glabel SetRect__5CPartR7TextDatR4RECT
    /* 84EA8 80094EA8 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 84EAC 80094EAC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 84EB0 80094EB0 21808000 */  addu       $s0, $a0, $zero
    /* 84EB4 80094EB4 2120A000 */  addu       $a0, $a1, $zero
    /* 84EB8 80094EB8 1800BFAF */  sw         $ra, 0x18($sp)
    /* 84EBC 80094EBC 1400B1AF */  sw         $s1, 0x14($sp)
    /* 84EC0 80094EC0 0000058E */  lw         $a1, 0x0($s0)
    /* 84EC4 80094EC4 DB54020C */  jal        GetFr__7TextDati_8009536c
    /* 84EC8 80094EC8 2188C000 */   addu      $s1, $a2, $zero
    /* 84ECC 80094ECC 04000396 */  lhu        $v1, 0x4($s0)
    /* 84ED0 80094ED0 00000000 */  nop
    /* 84ED4 80094ED4 000023A6 */  sh         $v1, 0x0($s1)
    /* 84ED8 80094ED8 06000396 */  lhu        $v1, 0x6($s0)
    /* 84EDC 80094EDC 00000000 */  nop
    /* 84EE0 80094EE0 23180300 */  negu       $v1, $v1
    /* 84EE4 80094EE4 020023A6 */  sh         $v1, 0x2($s1)
    /* 84EE8 80094EE8 0800438C */  lw         $v1, 0x8($v0)
    /* 84EEC 80094EEC 00000000 */  nop
    /* 84EF0 80094EF0 FF016330 */  andi       $v1, $v1, 0x1FF
    /* 84EF4 80094EF4 040023A6 */  sh         $v1, 0x4($s1)
    /* 84EF8 80094EF8 0800428C */  lw         $v0, 0x8($v0)
    /* 84EFC 80094EFC 00000000 */  nop
    /* 84F00 80094F00 42120200 */  srl        $v0, $v0, 9
    /* 84F04 80094F04 FF014230 */  andi       $v0, $v0, 0x1FF
    /* 84F08 80094F08 060022A6 */  sh         $v0, 0x6($s1)
    /* 84F0C 80094F0C 1800BF8F */  lw         $ra, 0x18($sp)
    /* 84F10 80094F10 1400B18F */  lw         $s1, 0x14($sp)
    /* 84F14 80094F14 1000B08F */  lw         $s0, 0x10($sp)
    /* 84F18 80094F18 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 84F1C 80094F1C 0800E003 */  jr         $ra
    /* 84F20 80094F20 00000000 */   nop
endlabel SetRect__5CPartR7TextDatR4RECT
