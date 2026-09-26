.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching func_8013AE78, 0x3C

glabel func_8013AE78
    /* 1280 8013AE78 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1284 8013AE7C 05008014 */  bnez       $a0, .L8013AE94
    /* 1288 8013AE80 1000BFAF */   sw        $ra, 0x10($sp)
    /* 128C 8013AE84 67EC040C */  jal        func_8013B19C
    /* 1290 8013AE88 00000000 */   nop
    /* 1294 8013AE8C A9EB0408 */  j          .L8013AEA4
    /* 1298 8013AE90 00000000 */   nop
  .L8013AE94:
    /* 129C 8013AE94 8CEC040C */  jal        func_8013B230
    /* 12A0 8013AE98 00000000 */   nop
    /* 12A4 8013AE9C 02160200 */  srl        $v0, $v0, 24
    /* 12A8 8013AEA0 01004230 */  andi       $v0, $v0, 0x1
  .L8013AEA4:
    /* 12AC 8013AEA4 1000BF8F */  lw         $ra, 0x10($sp)
    /* 12B0 8013AEA8 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 12B4 8013AEAC 0800E003 */  jr         $ra
    /* 12B8 8013AEB0 00000000 */   nop
endlabel func_8013AE78
