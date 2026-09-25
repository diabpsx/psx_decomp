.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching purgeablemem, 0x60

glabel purgeablemem
    /* 1B52C 8002B52C 201D838F */  lw         $v1, %gp_rel(defaultmc)($gp)
    /* 1B530 8002B530 1380023C */  lui        $v0, %hi(D_80137A78)
    /* 1B534 8002B534 787A4224 */  addiu      $v0, $v0, %lo(D_80137A78)
    /* 1B538 8002B538 12006210 */  beq        $v1, $v0, .L8002B584
    /* 1B53C 8002B53C 21100000 */   addu      $v0, $zero, $zero
    /* 1B540 8002B540 0000638C */  lw         $v1, 0x0($v1)
    /* 1B544 8002B544 00000000 */  nop
    /* 1B548 8002B548 0D006010 */  beqz       $v1, .L8002B580
    /* 1B54C 8002B54C 21200000 */   addu      $a0, $zero, $zero
  .L8002B550:
    /* 1B550 8002B550 1800628C */  lw         $v0, 0x18($v1)
    /* 1B554 8002B554 00000000 */  nop
    /* 1B558 8002B558 08004230 */  andi       $v0, $v0, 0x8
    /* 1B55C 8002B55C 04004010 */  beqz       $v0, .L8002B570
    /* 1B560 8002B560 00000000 */   nop
    /* 1B564 8002B564 1000628C */  lw         $v0, 0x10($v1)
    /* 1B568 8002B568 00000000 */  nop
    /* 1B56C 8002B56C 21208200 */  addu       $a0, $a0, $v0
  .L8002B570:
    /* 1B570 8002B570 2000638C */  lw         $v1, 0x20($v1)
    /* 1B574 8002B574 00000000 */  nop
    /* 1B578 8002B578 F5FF6014 */  bnez       $v1, .L8002B550
    /* 1B57C 8002B57C 00000000 */   nop
  .L8002B580:
    /* 1B580 8002B580 21108000 */  addu       $v0, $a0, $zero
  .L8002B584:
    /* 1B584 8002B584 0800E003 */  jr         $ra
    /* 1B588 8002B588 00000000 */   nop
endlabel purgeablemem
