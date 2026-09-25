.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching lockedmem, 0x60

glabel lockedmem
    /* 1B46C 8002B46C 201D838F */  lw         $v1, %gp_rel(defaultmc)($gp)
    /* 1B470 8002B470 1380023C */  lui        $v0, %hi(D_80137A78)
    /* 1B474 8002B474 787A4224 */  addiu      $v0, $v0, %lo(D_80137A78)
    /* 1B478 8002B478 12006210 */  beq        $v1, $v0, .L8002B4C4
    /* 1B47C 8002B47C 21100000 */   addu      $v0, $zero, $zero
    /* 1B480 8002B480 0000638C */  lw         $v1, 0x0($v1)
    /* 1B484 8002B484 00000000 */  nop
    /* 1B488 8002B488 0D006010 */  beqz       $v1, .L8002B4C0
    /* 1B48C 8002B48C 21200000 */   addu      $a0, $zero, $zero
  .L8002B490:
    /* 1B490 8002B490 1800628C */  lw         $v0, 0x18($v1)
    /* 1B494 8002B494 00000000 */  nop
    /* 1B498 8002B498 18004230 */  andi       $v0, $v0, 0x18
    /* 1B49C 8002B49C 04004014 */  bnez       $v0, .L8002B4B0
    /* 1B4A0 8002B4A0 00000000 */   nop
    /* 1B4A4 8002B4A4 1000628C */  lw         $v0, 0x10($v1)
    /* 1B4A8 8002B4A8 00000000 */  nop
    /* 1B4AC 8002B4AC 21208200 */  addu       $a0, $a0, $v0
  .L8002B4B0:
    /* 1B4B0 8002B4B0 2000638C */  lw         $v1, 0x20($v1)
    /* 1B4B4 8002B4B4 00000000 */  nop
    /* 1B4B8 8002B4B8 F5FF6014 */  bnez       $v1, .L8002B490
    /* 1B4BC 8002B4BC 00000000 */   nop
  .L8002B4C0:
    /* 1B4C0 8002B4C0 21108000 */  addu       $v0, $a0, $zero
  .L8002B4C4:
    /* 1B4C4 8002B4C4 0800E003 */  jr         $ra
    /* 1B4C8 8002B4C8 00000000 */   nop
endlabel lockedmem
