.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching checkvalid__Fv, 0x64

glabel checkvalid__Fv
    /* 8C760 8009C760 06000624 */  addiu      $a2, $zero, 0x6
    /* 8C764 8009C764 08000524 */  addiu      $a1, $zero, 0x8
    /* 8C768 8009C768 21180000 */  addu       $v1, $zero, $zero
    /* 8C76C 8009C76C 0D80043C */  lui        $a0, %hi(txt_actions + 0xC)
    /* 8C770 8009C770 18C48424 */  addiu      $a0, $a0, %lo(txt_actions + 0xC)
  .L8009C774:
    /* 8C774 8009C774 2A106600 */  slt        $v0, $v1, $a2
    /* 8C778 8009C778 0B004014 */  bnez       $v0, .L8009C7A8
    /* 8C77C 8009C77C 2A10A300 */   slt       $v0, $a1, $v1
    /* 8C780 8009C780 09004014 */  bnez       $v0, .L8009C7A8
    /* 8C784 8009C784 00000000 */   nop
    /* 8C788 8009C788 F8FF828C */  lw         $v0, -0x8($a0)
    /* 8C78C 8009C78C 00000000 */  nop
    /* 8C790 8009C790 05004014 */  bnez       $v0, .L8009C7A8
    /* 8C794 8009C794 00000000 */   nop
    /* 8C798 8009C798 0000828C */  lw         $v0, 0x0($a0)
    /* 8C79C 8009C79C 00000000 */  nop
    /* 8C7A0 8009C7A0 06004010 */  beqz       $v0, .L8009C7BC
    /* 8C7A4 8009C7A4 21100000 */   addu      $v0, $zero, $zero
  .L8009C7A8:
    /* 8C7A8 8009C7A8 01006324 */  addiu      $v1, $v1, 0x1
    /* 8C7AC 8009C7AC 14006228 */  slti       $v0, $v1, 0x14
    /* 8C7B0 8009C7B0 F0FF4014 */  bnez       $v0, .L8009C774
    /* 8C7B4 8009C7B4 10008424 */   addiu     $a0, $a0, 0x10
    /* 8C7B8 8009C7B8 01000224 */  addiu      $v0, $zero, 0x1
  .L8009C7BC:
    /* 8C7BC 8009C7BC 0800E003 */  jr         $ra
    /* 8C7C0 8009C7C0 00000000 */   nop
endlabel checkvalid__Fv
