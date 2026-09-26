.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PSX_OPT_SaveGame__FiPc, 0x120

glabel PSX_OPT_SaveGame__FiPc
    /* 22B38 8015C730 80FFBD27 */  addiu      $sp, $sp, -0x80
    /* 22B3C 8015C734 7000B4AF */  sw         $s4, 0x70($sp)
    /* 22B40 8015C738 21A08000 */  addu       $s4, $a0, $zero
    /* 22B44 8015C73C 7400B5AF */  sw         $s5, 0x74($sp)
    /* 22B48 8015C740 21A8A000 */  addu       $s5, $a1, $zero
    /* 22B4C 8015C744 6000B0AF */  sw         $s0, 0x60($sp)
    /* 22B50 8015C748 04001024 */  addiu      $s0, $zero, 0x4
    /* 22B54 8015C74C 2000A427 */  addiu      $a0, $sp, 0x20
    /* 22B58 8015C750 1280053C */  lui        $a1, %hi(D_8011BE54)
    /* 22B5C 8015C754 54BEA524 */  addiu      $a1, $a1, %lo(D_8011BE54)
    /* 22B60 8015C758 0E80063C */  lui        $a2, %hi(D_800E3C94)
    /* 22B64 8015C75C 943CC624 */  addiu      $a2, $a2, %lo(D_800E3C94)
    /* 22B68 8015C760 0E80073C */  lui        $a3, %hi(D_800E3CB4)
    /* 22B6C 8015C764 B43CE724 */  addiu      $a3, $a3, %lo(D_800E3CB4)
    /* 22B70 8015C768 7C00BFAF */  sw         $ra, 0x7C($sp)
    /* 22B74 8015C76C 7800B6AF */  sw         $s6, 0x78($sp)
    /* 22B78 8015C770 6C00B3AF */  sw         $s3, 0x6C($sp)
    /* 22B7C 8015C774 6800B2AF */  sw         $s2, 0x68($sp)
    /* 22B80 8015C778 9767000C */  jal        sprintf
    /* 22B84 8015C77C 6400B1AF */   sw        $s1, 0x64($sp)
    /* 22B88 8015C780 1480133C */  lui        $s3, %hi(save_buffer)
    /* 22B8C 8015C784 EC367326 */  addiu      $s3, $s3, %lo(save_buffer)
    /* 22B90 8015C788 542193AF */  sw         $s3, %gp_rel(D_8011C8D4)($gp)
    /* 22B94 8015C78C 4A72050C */  jal        SaveOptions__Fv
    /* 22B98 8015C790 FFFF1124 */   addiu     $s1, $zero, -0x1
    /* 22B9C 8015C794 D2EC010C */  jal        LANG_GetLang__Fv
    /* 22BA0 8015C798 00000000 */   nop
    /* 22BA4 8015C79C BB6E050C */  jal        ISave__Fi
    /* 22BA8 8015C7A0 21204000 */   addu      $a0, $v0, $zero
    /* 22BAC 8015C7A4 A671050C */  jal        GetIcon__Fv
    /* 22BB0 8015C7A8 00000000 */   nop
    /* 22BB4 8015C7AC 0E80123C */  lui        $s2, %hi(IconBuffer + 0x28)
    /* 22BB8 8015C7B0 E83C5226 */  addiu      $s2, $s2, %lo(IconBuffer + 0x28)
    /* 22BBC 8015C7B4 E0FF5626 */  addiu      $s6, $s2, -0x20
  .L8015C7B8:
    /* 22BC0 8015C7B8 1280043C */  lui        $a0, %hi(current_card)
    /* 22BC4 8015C7BC 60B4848C */  lw         $a0, %lo(current_card)($a0)
    /* 22BC8 8015C7C0 1280053C */  lui        $a1, %hi(DiabloOptionFile)
    /* 22BCC 8015C7C4 14B4A58C */  lw         $a1, %lo(DiabloOptionFile)($a1)
    /* 22BD0 8015C7C8 6465050C */  jal        GetFileNumber__FiPc
    /* 22BD4 8015C7CC 00000000 */   nop
    /* 22BD8 8015C7D0 06005110 */  beq        $v0, $s1, .L8015C7EC
    /* 22BDC 8015C7D4 21208002 */   addu      $a0, $s4, $zero
    /* 22BE0 8015C7D8 1280043C */  lui        $a0, %hi(current_card)
    /* 22BE4 8015C7DC 60B4848C */  lw         $a0, %lo(current_card)($a0)
    /* 22BE8 8015C7E0 480B050C */  jal        delete_card_file__Fii
    /* 22BEC 8015C7E4 21284000 */   addu      $a1, $v0, $zero
    /* 22BF0 8015C7E8 21208002 */  addu       $a0, $s4, $zero
  .L8015C7EC:
    /* 22BF4 8015C7EC 01300524 */  addiu      $a1, $zero, 0x3001
    /* 22BF8 8015C7F0 2130A002 */  addu       $a2, $s5, $zero
    /* 22BFC 8015C7F4 2000A727 */  addiu      $a3, $sp, 0x20
    /* 22C00 8015C7F8 581B0224 */  addiu      $v0, $zero, 0x1B58
    /* 22C04 8015C7FC 1000B2AF */  sw         $s2, 0x10($sp)
    /* 22C08 8015C800 1400B6AF */  sw         $s6, 0x14($sp)
    /* 22C0C 8015C804 1800A2AF */  sw         $v0, 0x18($sp)
    /* 22C10 8015C808 2E0C050C */  jal        write_card_file__FiiPcT2PUcPUsiT4
    /* 22C14 8015C80C 1C00B3AF */   sw        $s3, 0x1C($sp)
    /* 22C18 8015C810 FFFF1026 */  addiu      $s0, $s0, -0x1
    /* 22C1C 8015C814 03001112 */  beq        $s0, $s1, .L8015C824
    /* 22C20 8015C818 00000000 */   nop
    /* 22C24 8015C81C E6FF4014 */  bnez       $v0, .L8015C7B8
    /* 22C28 8015C820 00000000 */   nop
  .L8015C824:
    /* 22C2C 8015C824 7C00BF8F */  lw         $ra, 0x7C($sp)
    /* 22C30 8015C828 7800B68F */  lw         $s6, 0x78($sp)
    /* 22C34 8015C82C 7400B58F */  lw         $s5, 0x74($sp)
    /* 22C38 8015C830 7000B48F */  lw         $s4, 0x70($sp)
    /* 22C3C 8015C834 6C00B38F */  lw         $s3, 0x6C($sp)
    /* 22C40 8015C838 6800B28F */  lw         $s2, 0x68($sp)
    /* 22C44 8015C83C 6400B18F */  lw         $s1, 0x64($sp)
    /* 22C48 8015C840 6000B08F */  lw         $s0, 0x60($sp)
    /* 22C4C 8015C844 8000BD27 */  addiu      $sp, $sp, 0x80
    /* 22C50 8015C848 0800E003 */  jr         $ra
    /* 22C54 8015C84C 00000000 */   nop
endlabel PSX_OPT_SaveGame__FiPc
