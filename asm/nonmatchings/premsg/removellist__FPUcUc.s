.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching removellist__FPUcUc, 0x38

glabel removellist__FPUcUc
    /* 29424 8016301C FF00A530 */  andi       $a1, $a1, 0xFF
    /* 29428 80163020 FF000624 */  addiu      $a2, $zero, 0xFF
    /* 2942C 80163024 7F008324 */  addiu      $v1, $a0, 0x7F
  .L80163028:
    /* 29430 80163028 00008290 */  lbu        $v0, 0x0($a0)
    /* 29434 8016302C 00000000 */  nop
    /* 29438 80163030 02004514 */  bne        $v0, $a1, .L8016303C
    /* 2943C 80163034 00000000 */   nop
    /* 29440 80163038 000086A0 */  sb         $a2, 0x0($a0)
  .L8016303C:
    /* 29444 8016303C 01008424 */  addiu      $a0, $a0, 0x1
    /* 29448 80163040 2A108300 */  slt        $v0, $a0, $v1
    /* 2944C 80163044 F8FF4014 */  bnez       $v0, .L80163028
    /* 29450 80163048 00000000 */   nop
    /* 29454 8016304C 0800E003 */  jr         $ra
    /* 29458 80163050 00000000 */   nop
endlabel removellist__FPUcUc
