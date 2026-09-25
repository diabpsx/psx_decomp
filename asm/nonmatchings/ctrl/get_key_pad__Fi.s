.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching get_key_pad__Fi, 0x38

glabel get_key_pad__Fi
    /* 8C728 8009C728 0D80053C */  lui        $a1, %hi(pad_txt)
    /* 8C72C 8009C72C 64C3A524 */  addiu      $a1, $a1, %lo(pad_txt)
    /* 8C730 8009C730 21180000 */  addu       $v1, $zero, $zero
  .L8009C734:
    /* 8C734 8009C734 0400A28C */  lw         $v0, 0x4($a1)
    /* 8C738 8009C738 00000000 */  nop
    /* 8C73C 8009C73C 06004410 */  beq        $v0, $a0, .L8009C758
    /* 8C740 8009C740 21106000 */   addu      $v0, $v1, $zero
    /* 8C744 8009C744 01006324 */  addiu      $v1, $v1, 0x1
    /* 8C748 8009C748 0E006228 */  slti       $v0, $v1, 0xE
    /* 8C74C 8009C74C F9FF4014 */  bnez       $v0, .L8009C734
    /* 8C750 8009C750 0C00A524 */   addiu     $a1, $a1, 0xC
    /* 8C754 8009C754 FFFF0224 */  addiu      $v0, $zero, -0x1
  .L8009C758:
    /* 8C758 8009C758 0800E003 */  jr         $ra
    /* 8C75C 8009C75C 00000000 */   nop
endlabel get_key_pad__Fi
