.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching streamblocksfree, 0x38

glabel streamblocksfree
    /* 1F450 8002F450 781D838F */  lw         $v1, %gp_rel(cdms)($gp)
    /* 1F454 8002F454 00000000 */  nop
    /* 1F458 8002F458 09006010 */  beqz       $v1, .L8002F480
    /* 1F45C 8002F45C 21100000 */   addu      $v0, $zero, $zero
    /* 1F460 8002F460 7400638C */  lw         $v1, 0x74($v1)
    /* 1F464 8002F464 00000000 */  nop
    /* 1F468 8002F468 05006010 */  beqz       $v1, .L8002F480
    /* 1F46C 8002F46C 00000000 */   nop
  .L8002F470:
    /* 1F470 8002F470 9800638C */  lw         $v1, 0x98($v1)
    /* 1F474 8002F474 00000000 */  nop
    /* 1F478 8002F478 FDFF6014 */  bnez       $v1, .L8002F470
    /* 1F47C 8002F47C 01004224 */   addiu     $v0, $v0, 0x1
  .L8002F480:
    /* 1F480 8002F480 0800E003 */  jr         $ra
    /* 1F484 8002F484 00000000 */   nop
endlabel streamblocksfree
