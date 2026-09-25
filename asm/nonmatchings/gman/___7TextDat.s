.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ___7TextDat, 0x48

glabel ___7TextDat
    /* 81EA8 80091EA8 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 81EAC 80091EAC 1400B1AF */  sw         $s1, 0x14($sp)
    /* 81EB0 80091EB0 21888000 */  addu       $s1, $a0, $zero
    /* 81EB4 80091EB4 1000B0AF */  sw         $s0, 0x10($sp)
    /* 81EB8 80091EB8 1800BFAF */  sw         $ra, 0x18($sp)
    /* 81EBC 80091EBC A14E020C */  jal        DumpData__7TextDat
    /* 81EC0 80091EC0 2180A000 */   addu      $s0, $a1, $zero
    /* 81EC4 80091EC4 01001032 */  andi       $s0, $s0, 0x1
    /* 81EC8 80091EC8 03000012 */  beqz       $s0, .L80091ED8
    /* 81ECC 80091ECC 00000000 */   nop
    /* 81ED0 80091ED0 BE44000C */  jal        __builtin_delete
    /* 81ED4 80091ED4 21202002 */   addu      $a0, $s1, $zero
  .L80091ED8:
    /* 81ED8 80091ED8 1800BF8F */  lw         $ra, 0x18($sp)
    /* 81EDC 80091EDC 1400B18F */  lw         $s1, 0x14($sp)
    /* 81EE0 80091EE0 1000B08F */  lw         $s0, 0x10($sp)
    /* 81EE4 80091EE4 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 81EE8 80091EE8 0800E003 */  jr         $ra
    /* 81EEC 80091EEC 00000000 */   nop
endlabel ___7TextDat
