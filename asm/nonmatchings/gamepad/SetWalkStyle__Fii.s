.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetWalkStyle__Fii, 0x70

glabel SetWalkStyle__Fii
    /* 6B00C 8007B00C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 6B010 8007B010 1000B0AF */  sw         $s0, 0x10($sp)
    /* 6B014 8007B014 2180A000 */  addu       $s0, $a1, $zero
    /* 6B018 8007B018 0B000424 */  addiu      $a0, $zero, 0xB
    /* 6B01C 8007B01C 21280000 */  addu       $a1, $zero, $zero
    /* 6B020 8007B020 1400B1AF */  sw         $s1, 0x14($sp)
    /* 6B024 8007B024 0D80113C */  lui        $s1, %hi(txt_actions)
    /* 6B028 8007B028 0CC43126 */  addiu      $s1, $s1, %lo(txt_actions)
    /* 6B02C 8007B02C 21302002 */  addu       $a2, $s1, $zero
    /* 6B030 8007B030 1800BFAF */  sw         $ra, 0x18($sp)
    /* 6B034 8007B034 53EB010C */  jal        PostGamePad__Fiiii
    /* 6B038 8007B038 21380000 */   addu      $a3, $zero, $zero
    /* 6B03C 8007B03C 09000424 */  addiu      $a0, $zero, 0x9
    /* 6B040 8007B040 21280000 */  addu       $a1, $zero, $zero
    /* 6B044 8007B044 21302002 */  addu       $a2, $s1, $zero
    /* 6B048 8007B048 0D80113C */  lui        $s1, %hi(txt_actions + 0x24)
    /* 6B04C 8007B04C 30C4318E */  lw         $s1, %lo(txt_actions + 0x24)($s1)
    /* 6B050 8007B050 0D80013C */  lui        $at, %hi(txt_actions + 0x24)
    /* 6B054 8007B054 30C430AC */  sw         $s0, %lo(txt_actions + 0x24)($at)
    /* 6B058 8007B058 53EB010C */  jal        PostGamePad__Fiiii
    /* 6B05C 8007B05C 21380000 */   addu      $a3, $zero, $zero
    /* 6B060 8007B060 21102002 */  addu       $v0, $s1, $zero
    /* 6B064 8007B064 1800BF8F */  lw         $ra, 0x18($sp)
    /* 6B068 8007B068 1400B18F */  lw         $s1, 0x14($sp)
    /* 6B06C 8007B06C 1000B08F */  lw         $s0, 0x10($sp)
    /* 6B070 8007B070 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 6B074 8007B074 0800E003 */  jr         $ra
    /* 6B078 8007B078 00000000 */   nop
endlabel SetWalkStyle__Fii
