.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ActivateCharacterMemcard__Fii, 0xBC

glabel ActivateCharacterMemcard__Fii
    /* 957CC 800A57CC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 957D0 800A57D0 1400BFAF */  sw         $ra, 0x14($sp)
    /* 957D4 800A57D4 E495020C */  jal        ActivateMemcard__Fii
    /* 957D8 800A57D8 1000B0AF */   sw        $s0, 0x10($sp)
    /* 957DC 800A57DC 1280023C */  lui        $v0, %hi(CharacterBlockLoaded)
    /* 957E0 800A57E0 40B2428C */  lw         $v0, %lo(CharacterBlockLoaded)($v0)
    /* 957E4 800A57E4 00000000 */  nop
    /* 957E8 800A57E8 1F004014 */  bnez       $v0, .L800A5868
    /* 957EC 800A57EC 01000224 */   addiu     $v0, $zero, 0x1
    /* 957F0 800A57F0 1580103C */  lui        $s0, %hi(D_801576F0)
    /* 957F4 800A57F4 F0761026 */  addiu      $s0, $s0, %lo(D_801576F0)
    /* 957F8 800A57F8 21200002 */  addu       $a0, $s0, $zero
    /* 957FC 800A57FC 21280000 */  addu       $a1, $zero, $zero
    /* 95800 800A5800 E940000C */  jal        memset
    /* 95804 800A5804 E01D0624 */   addiu     $a2, $zero, 0x1DE0
    /* 95808 800A5808 1280043C */  lui        $a0, %hi(current_card)
    /* 9580C 800A580C 60B4848C */  lw         $a0, %lo(current_card)($a0)
    /* 95810 800A5810 1280053C */  lui        $a1, %hi(DiabloCharacterFile)
    /* 95814 800A5814 18B4A58C */  lw         $a1, %lo(DiabloCharacterFile)($a1)
    /* 95818 800A5818 6465050C */  jal        func_80159590
    /* 9581C 800A581C 00000000 */   nop
    /* 95820 800A5820 21284000 */  addu       $a1, $v0, $zero
    /* 95824 800A5824 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 95828 800A5828 0C00A210 */  beq        $a1, $v0, .L800A585C
    /* 9582C 800A582C 00000000 */   nop
    /* 95830 800A5830 1280043C */  lui        $a0, %hi(current_card)
    /* 95834 800A5834 60B4848C */  lw         $a0, %lo(current_card)($a0)
    /* 95838 800A5838 E270050C */  jal        func_8015C388
    /* 9583C 800A583C 00000000 */   nop
    /* 95840 800A5840 08004010 */  beqz       $v0, .L800A5864
    /* 95844 800A5844 21200002 */   addu      $a0, $s0, $zero
    /* 95848 800A5848 21280000 */  addu       $a1, $zero, $zero
    /* 9584C 800A584C E940000C */  jal        memset
    /* 95850 800A5850 E01D0624 */   addiu     $a2, $zero, 0x1DE0
    /* 95854 800A5854 1A960208 */  j          .L800A5868
    /* 95858 800A5858 01000224 */   addiu     $v0, $zero, 0x1
  .L800A585C:
    /* 9585C 800A585C ED99020C */  jal        PantsDelay__Fv
    /* 95860 800A5860 00000000 */   nop
  .L800A5864:
    /* 95864 800A5864 01000224 */  addiu      $v0, $zero, 0x1
  .L800A5868:
    /* 95868 800A5868 EC0980AF */  sw         $zero, %gp_rel(countdownloadcharblock)($gp)
    /* 9586C 800A586C 1280013C */  lui        $at, %hi(CharacterBlockLoaded)
    /* 95870 800A5870 40B222AC */  sw         $v0, %lo(CharacterBlockLoaded)($at)
    /* 95874 800A5874 1400BF8F */  lw         $ra, 0x14($sp)
    /* 95878 800A5878 1000B08F */  lw         $s0, 0x10($sp)
    /* 9587C 800A587C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 95880 800A5880 0800E003 */  jr         $ra
    /* 95884 800A5884 00000000 */   nop
endlabel ActivateCharacterMemcard__Fii
