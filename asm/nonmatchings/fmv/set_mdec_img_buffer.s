.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching set_mdec_img_buffer, 0x34

glabel set_mdec_img_buffer
    /* 1CB28 80156720 21300000 */  addu       $a2, $zero, $zero
    /* 1CB2C 80156724 2128C000 */  addu       $a1, $a2, $zero
    /* 1CB30 80156728 1580033C */  lui        $v1, %hi(imgbuf)
    /* 1CB34 8015672C 10496324 */  addiu      $v1, $v1, %lo(imgbuf)
  .L80156730:
    /* 1CB38 80156730 000064AC */  sw         $a0, 0x0($v1)
    /* 1CB3C 80156734 00198424 */  addiu      $a0, $a0, 0x1900
    /* 1CB40 80156738 0019C624 */  addiu      $a2, $a2, 0x1900
    /* 1CB44 8015673C 0100A524 */  addiu      $a1, $a1, 0x1
    /* 1CB48 80156740 1500A228 */  slti       $v0, $a1, 0x15
    /* 1CB4C 80156744 FAFF4014 */  bnez       $v0, .L80156730
    /* 1CB50 80156748 04006324 */   addiu     $v1, $v1, 0x4
    /* 1CB54 8015674C 0800E003 */  jr         $ra
    /* 1CB58 80156750 2110C000 */   addu      $v0, $a2, $zero
endlabel set_mdec_img_buffer
