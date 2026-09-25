.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching timercount, 0x3C

glabel timercount
    /* 1FCC8 8002FCC8 21280000 */  addu       $a1, $zero, $zero
    /* 1FCCC 8002FCCC 21200000 */  addu       $a0, $zero, $zero
    /* 1FCD0 8002FCD0 0B80033C */  lui        $v1, %hi(tmrsub)
    /* 1FCD4 8002FCD4 44706324 */  addiu      $v1, $v1, %lo(tmrsub)
  .L8002FCD8:
    /* 1FCD8 8002FCD8 0000628C */  lw         $v0, 0x0($v1)
    /* 1FCDC 8002FCDC 00000000 */  nop
    /* 1FCE0 8002FCE0 02004010 */  beqz       $v0, .L8002FCEC
    /* 1FCE4 8002FCE4 00000000 */   nop
    /* 1FCE8 8002FCE8 0100A524 */  addiu      $a1, $a1, 0x1
  .L8002FCEC:
    /* 1FCEC 8002FCEC 01008424 */  addiu      $a0, $a0, 0x1
    /* 1FCF0 8002FCF0 08008228 */  slti       $v0, $a0, 0x8
    /* 1FCF4 8002FCF4 F8FF4014 */  bnez       $v0, .L8002FCD8
    /* 1FCF8 8002FCF8 04006324 */   addiu     $v1, $v1, 0x4
    /* 1FCFC 8002FCFC 0800E003 */  jr         $ra
    /* 1FD00 8002FD00 2110A000 */   addu      $v0, $a1, $zero
endlabel timercount
