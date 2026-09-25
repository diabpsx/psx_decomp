.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetFadeLevel__Fi, 0x30

glabel SetFadeLevel__Fi
    /* 6EE7C 8007EE7C 80000224 */  addiu      $v0, $zero, 0x80
    /* 6EE80 8007EE80 23184400 */  subu       $v1, $v0, $a0
    /* 6EE84 8007EE84 03006104 */  bgez       $v1, .L8007EE94
    /* 6EE88 8007EE88 81006228 */   slti      $v0, $v1, 0x81
    /* 6EE8C 8007EE8C 21180000 */  addu       $v1, $zero, $zero
    /* 6EE90 8007EE90 81006228 */  slti       $v0, $v1, 0x81
  .L8007EE94:
    /* 6EE94 8007EE94 02004014 */  bnez       $v0, .L8007EEA0
    /* 6EE98 8007EE98 00000000 */   nop
    /* 6EE9C 8007EE9C 80000324 */  addiu      $v1, $zero, 0x80
  .L8007EEA0:
    /* 6EEA0 8007EEA0 E61483A3 */  sb         $v1, %gp_rel(D_8011BC66)($gp)
    /* 6EEA4 8007EEA4 0800E003 */  jr         $ra
    /* 6EEA8 8007EEA8 00000000 */   nop
endlabel SetFadeLevel__Fi
