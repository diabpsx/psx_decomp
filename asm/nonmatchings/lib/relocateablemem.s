.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching relocateablemem, 0x60

glabel relocateablemem
    /* 1B4CC 8002B4CC 201D838F */  lw         $v1, %gp_rel(defaultmc)($gp)
    /* 1B4D0 8002B4D0 1380023C */  lui        $v0, %hi(D_80137A78)
    /* 1B4D4 8002B4D4 787A4224 */  addiu      $v0, $v0, %lo(D_80137A78)
    /* 1B4D8 8002B4D8 12006210 */  beq        $v1, $v0, .L8002B524
    /* 1B4DC 8002B4DC 21100000 */   addu      $v0, $zero, $zero
    /* 1B4E0 8002B4E0 0000638C */  lw         $v1, 0x0($v1)
    /* 1B4E4 8002B4E4 00000000 */  nop
    /* 1B4E8 8002B4E8 0D006010 */  beqz       $v1, .L8002B520
    /* 1B4EC 8002B4EC 21200000 */   addu      $a0, $zero, $zero
  .L8002B4F0:
    /* 1B4F0 8002B4F0 1800628C */  lw         $v0, 0x18($v1)
    /* 1B4F4 8002B4F4 00000000 */  nop
    /* 1B4F8 8002B4F8 10004230 */  andi       $v0, $v0, 0x10
    /* 1B4FC 8002B4FC 04004010 */  beqz       $v0, .L8002B510
    /* 1B500 8002B500 00000000 */   nop
    /* 1B504 8002B504 1000628C */  lw         $v0, 0x10($v1)
    /* 1B508 8002B508 00000000 */  nop
    /* 1B50C 8002B50C 21208200 */  addu       $a0, $a0, $v0
  .L8002B510:
    /* 1B510 8002B510 2000638C */  lw         $v1, 0x20($v1)
    /* 1B514 8002B514 00000000 */  nop
    /* 1B518 8002B518 F5FF6014 */  bnez       $v1, .L8002B4F0
    /* 1B51C 8002B51C 00000000 */   nop
  .L8002B520:
    /* 1B520 8002B520 21108000 */  addu       $v0, $a0, $zero
  .L8002B524:
    /* 1B524 8002B524 0800E003 */  jr         $ra
    /* 1B528 8002B528 00000000 */   nop
endlabel relocateablemem
