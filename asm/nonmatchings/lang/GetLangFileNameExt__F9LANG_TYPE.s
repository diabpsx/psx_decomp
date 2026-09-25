.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetLangFileNameExt__F9LANG_TYPE, 0x80

glabel GetLangFileNameExt__F9LANG_TYPE
    /* 6B844 8007B844 0600822C */  sltiu      $v0, $a0, 0x6
    /* 6B848 8007B848 1B004010 */  beqz       $v0, .L8007B8B8
    /* 6B84C 8007B84C 80100400 */   sll       $v0, $a0, 2
    /* 6B850 8007B850 1280013C */  lui        $at, %hi(jtbl_80118C80)
    /* 6B854 8007B854 21082200 */  addu       $at, $at, $v0
    /* 6B858 8007B858 808C228C */  lw         $v0, %lo(jtbl_80118C80)($at)
    /* 6B85C 8007B85C 00000000 */  nop
    /* 6B860 8007B860 08004000 */  jr         $v0
    /* 6B864 8007B864 00000000 */   nop
  jlabel .L8007B868
    /* 6B868 8007B868 1280023C */  lui        $v0, %hi(D_8011BC04)
    /* 6B86C 8007B86C 04BC4224 */  addiu      $v0, $v0, %lo(D_8011BC04)
    /* 6B870 8007B870 2FEE0108 */  j          .L8007B8BC
    /* 6B874 8007B874 00000000 */   nop
  jlabel .L8007B878
    /* 6B878 8007B878 1280023C */  lui        $v0, %hi(D_8011BC08)
    /* 6B87C 8007B87C 08BC4224 */  addiu      $v0, $v0, %lo(D_8011BC08)
    /* 6B880 8007B880 2FEE0108 */  j          .L8007B8BC
    /* 6B884 8007B884 00000000 */   nop
  jlabel .L8007B888
    /* 6B888 8007B888 1280023C */  lui        $v0, %hi(D_8011BC0C)
    /* 6B88C 8007B88C 0CBC4224 */  addiu      $v0, $v0, %lo(D_8011BC0C)
    /* 6B890 8007B890 2FEE0108 */  j          .L8007B8BC
    /* 6B894 8007B894 00000000 */   nop
  jlabel .L8007B898
    /* 6B898 8007B898 1280023C */  lui        $v0, %hi(D_8011BC10)
    /* 6B89C 8007B89C 10BC4224 */  addiu      $v0, $v0, %lo(D_8011BC10)
    /* 6B8A0 8007B8A0 2FEE0108 */  j          .L8007B8BC
    /* 6B8A4 8007B8A4 00000000 */   nop
  jlabel .L8007B8A8
    /* 6B8A8 8007B8A8 1280023C */  lui        $v0, %hi(D_8011BC14)
    /* 6B8AC 8007B8AC 14BC4224 */  addiu      $v0, $v0, %lo(D_8011BC14)
    /* 6B8B0 8007B8B0 2FEE0108 */  j          .L8007B8BC
    /* 6B8B4 8007B8B4 00000000 */   nop
  jlabel .L8007B8B8
    /* 6B8B8 8007B8B8 21100000 */  addu       $v0, $zero, $zero
  .L8007B8BC:
    /* 6B8BC 8007B8BC 0800E003 */  jr         $ra
    /* 6B8C0 8007B8C0 00000000 */   nop
endlabel GetLangFileNameExt__F9LANG_TYPE
