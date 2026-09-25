.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Init_ctrl_pos__Fv, 0xB8

glabel Init_ctrl_pos__Fv
    /* 8C820 8009C820 A0088293 */  lbu        $v0, %gp_rel(ctrlflag)($gp)
    /* 8C824 8009C824 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 8C828 8009C828 1400BFAF */  sw         $ra, 0x14($sp)
    /* 8C82C 8009C82C 24004014 */  bnez       $v0, .L8009C8C0
    /* 8C830 8009C830 1000B0AF */   sw        $s0, 0x10($sp)
    /* 8C834 8009C834 1280023C */  lui        $v0, %hi(FeFlag)
    /* 8C838 8009C838 74B34290 */  lbu        $v0, %lo(FeFlag)($v0)
    /* 8C83C 8009C83C 00000000 */  nop
    /* 8C840 8009C840 05004010 */  beqz       $v0, .L8009C858
    /* 8C844 8009C844 00000000 */   nop
    /* 8C848 8009C848 1280023C */  lui        $v0, %hi(they_pressed)
    /* 8C84C 8009C84C 90B2428C */  lw         $v0, %lo(they_pressed)($v0)
    /* 8C850 8009C850 1280013C */  lui        $at, %hi(options_pad)
    /* 8C854 8009C854 50B222AC */  sw         $v0, %lo(options_pad)($at)
  .L8009C858:
    /* 8C858 8009C858 1280103C */  lui        $s0, %hi(D_8011CDF0)
    /* 8C85C 8009C85C F0CD1026 */  addiu      $s0, $s0, %lo(D_8011CDF0)
    /* 8C860 8009C860 21200002 */  addu       $a0, $s0, $zero
    /* 8C864 8009C864 491F80A3 */  sb         $zero, %gp_rel(D_8011C6C9)($gp)
    /* 8C868 8009C868 4A1F80A3 */  sb         $zero, %gp_rel(D_8011C6CA)($gp)
    /* 8C86C 8009C86C 9C0880AF */  sw         $zero, %gp_rel(D_8011B01C)($gp)
    /* 8C870 8009C870 FE76020C */  jal        SetBorder__6Dialogi_8009dbf8
    /* 8C874 8009C874 12000524 */   addiu     $a1, $zero, 0x12
    /* 8C878 8009C878 1280053C */  lui        $a1, %hi(BORDERR)
    /* 8C87C 8009C87C F7ABA590 */  lbu        $a1, %lo(BORDERR)($a1)
    /* 8C880 8009C880 1280063C */  lui        $a2, %hi(BORDERG)
    /* 8C884 8009C884 F8ABC690 */  lbu        $a2, %lo(BORDERG)($a2)
    /* 8C888 8009C888 1280073C */  lui        $a3, %hi(BORDERB)
    /* 8C88C 8009C88C F9ABE790 */  lbu        $a3, %lo(BORDERB)($a3)
    /* 8C890 8009C890 F676020C */  jal        SetRGB__6DialogUcUcUc_8009dbd8
    /* 8C894 8009C894 21200002 */   addu      $a0, $s0, $zero
    /* 8C898 8009C898 0B000424 */  addiu      $a0, $zero, 0xB
    /* 8C89C 8009C89C 0D80063C */  lui        $a2, %hi(txt_actions)
    /* 8C8A0 8009C8A0 0CC4C624 */  addiu      $a2, $a2, %lo(txt_actions)
    /* 8C8A4 8009C8A4 1280053C */  lui        $a1, %hi(options_pad)
    /* 8C8A8 8009C8A8 50B2A58C */  lw         $a1, %lo(options_pad)($a1)
    /* 8C8AC 8009C8AC 01000224 */  addiu      $v0, $zero, 0x1
    /* 8C8B0 8009C8B0 481F80A3 */  sb         $zero, %gp_rel(D_8011C6C8)($gp)
    /* 8C8B4 8009C8B4 A00882A3 */  sb         $v0, %gp_rel(ctrlflag)($gp)
    /* 8C8B8 8009C8B8 53EB010C */  jal        PostGamePad__Fiiii
    /* 8C8BC 8009C8BC 21380000 */   addu      $a3, $zero, $zero
  .L8009C8C0:
    /* 8C8C0 8009C8C0 01000224 */  addiu      $v0, $zero, 0x1
    /* 8C8C4 8009C8C4 1400BF8F */  lw         $ra, 0x14($sp)
    /* 8C8C8 8009C8C8 1000B08F */  lw         $s0, 0x10($sp)
    /* 8C8CC 8009C8CC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 8C8D0 8009C8D0 0800E003 */  jr         $ra
    /* 8C8D4 8009C8D4 00000000 */   nop
endlabel Init_ctrl_pos__Fv
