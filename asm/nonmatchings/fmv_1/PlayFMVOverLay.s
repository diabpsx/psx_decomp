.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PlayFMVOverLay, 0x88

glabel PlayFMVOverLay
    /* 1E760 80158358 1280033C */  lui        $v1, %hi(sglMasterVolume)
    /* 1E764 8015835C 9CBB638C */  lw         $v1, %lo(sglMasterVolume)($v1)
    /* 1E768 80158360 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 1E76C 80158364 1000A4AF */  sw         $a0, 0x10($sp)
    /* 1E770 80158368 1280043C */  lui        $a0, %hi(D_80121D08)
    /* 1E774 8015836C 081D8424 */  addiu      $a0, $a0, %lo(D_80121D08)
    /* 1E778 80158370 2800BFAF */  sw         $ra, 0x28($sp)
    /* 1E77C 80158374 1800A5AF */  sw         $a1, 0x18($sp)
    /* 1E780 80158378 2000A6AF */  sw         $a2, 0x20($sp)
    /* 1E784 8015837C 80130300 */  sll        $v0, $v1, 14
    /* 1E788 80158380 23104300 */  subu       $v0, $v0, $v1
    /* 1E78C 80158384 03120200 */  sra        $v0, $v0, 8
    /* 1E790 80158388 600D82AF */  sw         $v0, %gp_rel(sfx_volume)($gp)
    /* 1E794 8015838C DB40000C */  jal        setjmp
    /* 1E798 80158390 00000000 */   nop
    /* 1E79C 80158394 0E004014 */  bnez       $v0, .L801583D0
    /* 1E7A0 80158398 00000000 */   nop
    /* 1E7A4 8015839C 1000A78F */  lw         $a3, 0x10($sp)
    /* 1E7A8 801583A0 1380043C */  lui        $a0, %hi(D_8012E534)
    /* 1E7AC 801583A4 34E58424 */  addiu      $a0, $a0, %lo(D_8012E534)
    /* 1E7B0 801583A8 D81F87AF */  sw         $a3, %gp_rel(D_8011C758)($gp)
    /* 1E7B4 801583AC 1800A78F */  lw         $a3, 0x18($sp)
    /* 1E7B8 801583B0 1680053C */  lui        $a1, %hi(LoPlayFMVOverLay)
    /* 1E7BC 801583B4 E083A524 */  addiu      $a1, $a1, %lo(LoPlayFMVOverLay)
    /* 1E7C0 801583B8 DC1F87AF */  sw         $a3, %gp_rel(D_8011C75C)($gp)
    /* 1E7C4 801583BC 2000A78F */  lw         $a3, 0x20($sp)
    /* 1E7C8 801583C0 00000000 */  nop
    /* 1E7CC 801583C4 E01F87AF */  sw         $a3, %gp_rel(D_8011C760)($gp)
    /* 1E7D0 801583C8 5F84000C */  jal        GSYS_SetStackAndJump
    /* 1E7D4 801583CC 21300000 */   addu      $a2, $zero, $zero
  .L801583D0:
    /* 1E7D8 801583D0 2800BF8F */  lw         $ra, 0x28($sp)
    /* 1E7DC 801583D4 21100000 */  addu       $v0, $zero, $zero
    /* 1E7E0 801583D8 0800E003 */  jr         $ra
    /* 1E7E4 801583DC 3000BD27 */   addiu     $sp, $sp, 0x30
endlabel PlayFMVOverLay
