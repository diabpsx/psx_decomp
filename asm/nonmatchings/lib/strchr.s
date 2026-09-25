.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching strchr, 0x38

glabel strchr
    /* 44C 8001044C 00008680 */  lb         $a2, 0x0($a0)
    /* 450 80010450 00000000 */  nop
    /* 454 80010454 07000610 */  beq        $zero, $a2, .L80010474
    /* 458 80010458 00000000 */   nop
    /* 45C 8001045C 0300C510 */  beq        $a2, $a1, .L8001046C
    /* 460 80010460 00000000 */   nop
    /* 464 80010464 13410008 */  j          strchr
    /* 468 80010468 01008424 */   addiu     $a0, $a0, 0x1
  .L8001046C:
    /* 46C 8001046C 0800E003 */  jr         $ra
    /* 470 80010470 21108000 */   addu      $v0, $a0, $zero
  .L80010474:
    /* 474 80010474 FDFF8610 */  beq        $a0, $a2, .L8001046C
    /* 478 80010478 00000000 */   nop
    /* 47C 8001047C 0800E003 */  jr         $ra
    /* 480 80010480 21100000 */   addu      $v0, $zero, $zero
endlabel strchr
