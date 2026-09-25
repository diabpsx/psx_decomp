.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching remove_padval__Fi, 0x40

glabel remove_padval__Fi
    /* 8C8D8 8009C8D8 21280000 */  addu       $a1, $zero, $zero
    /* 8C8DC 8009C8DC 0D80033C */  lui        $v1, %hi(txt_actions + 0x4)
    /* 8C8E0 8009C8E0 10C46324 */  addiu      $v1, $v1, %lo(txt_actions + 0x4)
  .L8009C8E4:
    /* 8C8E4 8009C8E4 0000628C */  lw         $v0, 0x0($v1)
    /* 8C8E8 8009C8E8 00000000 */  nop
    /* 8C8EC 8009C8EC 03004414 */  bne        $v0, $a0, .L8009C8FC
    /* 8C8F0 8009C8F0 2110A000 */   addu      $v0, $a1, $zero
    /* 8C8F4 8009C8F4 44720208 */  j          .L8009C910
    /* 8C8F8 8009C8F8 000060AC */   sw        $zero, 0x0($v1)
  .L8009C8FC:
    /* 8C8FC 8009C8FC 0100A524 */  addiu      $a1, $a1, 0x1
    /* 8C900 8009C900 1400A228 */  slti       $v0, $a1, 0x14
    /* 8C904 8009C904 F7FF4014 */  bnez       $v0, .L8009C8E4
    /* 8C908 8009C908 10006324 */   addiu     $v1, $v1, 0x10
    /* 8C90C 8009C90C FFFF0224 */  addiu      $v0, $zero, -0x1
  .L8009C910:
    /* 8C910 8009C910 0800E003 */  jr         $ra
    /* 8C914 8009C914 00000000 */   nop
endlabel remove_padval__Fi
