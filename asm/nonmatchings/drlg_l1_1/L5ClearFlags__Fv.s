.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching L5ClearFlags__Fv, 0x50

glabel L5ClearFlags__Fv
    /* 3784 8013D37C 21300000 */  addu       $a2, $zero, $zero
    /* 3788 8013D380 21280000 */  addu       $a1, $zero, $zero
  .L8013D384:
    /* 378C 8013D384 21200000 */  addu       $a0, $zero, $zero
  .L8013D388:
    /* 3790 8013D388 1280033C */  lui        $v1, %hi(mydflags)
    /* 3794 8013D38C D8C0638C */  lw         $v1, %lo(mydflags)($v1)
    /* 3798 8013D390 2110A400 */  addu       $v0, $a1, $a0
    /* 379C 8013D394 21186200 */  addu       $v1, $v1, $v0
    /* 37A0 8013D398 00006290 */  lbu        $v0, 0x0($v1)
    /* 37A4 8013D39C 01008424 */  addiu      $a0, $a0, 0x1
    /* 37A8 8013D3A0 BF004230 */  andi       $v0, $v0, 0xBF
    /* 37AC 8013D3A4 000062A0 */  sb         $v0, 0x0($v1)
    /* 37B0 8013D3A8 28008228 */  slti       $v0, $a0, 0x28
    /* 37B4 8013D3AC F6FF4014 */  bnez       $v0, .L8013D388
    /* 37B8 8013D3B0 00000000 */   nop
    /* 37BC 8013D3B4 0100C624 */  addiu      $a2, $a2, 0x1
    /* 37C0 8013D3B8 2800C228 */  slti       $v0, $a2, 0x28
    /* 37C4 8013D3BC F1FF4014 */  bnez       $v0, .L8013D384
    /* 37C8 8013D3C0 2800A524 */   addiu     $a1, $a1, 0x28
    /* 37CC 8013D3C4 0800E003 */  jr         $ra
    /* 37D0 8013D3C8 00000000 */   nop
endlabel L5ClearFlags__Fv
