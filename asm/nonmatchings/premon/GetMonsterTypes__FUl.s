.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetMonsterTypes__FUl, 0xC0

glabel GetMonsterTypes__FUl
    /* 25E90 8015FA88 D8FCBD27 */  addiu      $sp, $sp, -0x328
    /* 25E94 8015FA8C 21308000 */  addu       $a2, $a0, $zero
    /* 25E98 8015FA90 1280043C */  lui        $a0, %hi(currlevel)
    /* 25E9C 8015FA94 0CC18490 */  lbu        $a0, %lo(currlevel)($a0)
    /* 25EA0 8015FA98 1000A527 */  addiu      $a1, $sp, 0x10
    /* 25EA4 8015FA9C 2003BFAF */  sw         $ra, 0x320($sp)
    /* 25EA8 8015FAA0 1C03B3AF */  sw         $s3, 0x31C($sp)
    /* 25EAC 8015FAA4 1803B2AF */  sw         $s2, 0x318($sp)
    /* 25EB0 8015FAA8 1403B1AF */  sw         $s1, 0x314($sp)
    /* 25EB4 8015FAAC FEF5010C */  jal        ML_GetPresetMonsters__FiPiUl
    /* 25EB8 8015FAB0 1003B0AF */   sw        $s0, 0x310($sp)
    /* 25EBC 8015FAB4 21884000 */  addu       $s1, $v0, $zero
    /* 25EC0 8015FAB8 1B00201A */  blez       $s1, .L8015FB28
    /* 25EC4 8015FABC 1000B327 */   addiu     $s3, $sp, 0x10
    /* 25EC8 8015FAC0 80101100 */  sll        $v0, $s1, 2
    /* 25ECC 8015FAC4 21905300 */  addu       $s2, $v0, $s3
  .L8015FAC8:
    /* 25ED0 8015FAC8 1280023C */  lui        $v0, %hi(nummtypes)
    /* 25ED4 8015FACC 9CC2428C */  lw         $v0, %lo(nummtypes)($v0)
    /* 25ED8 8015FAD0 00000000 */  nop
    /* 25EDC 8015FAD4 10004228 */  slti       $v0, $v0, 0x10
    /* 25EE0 8015FAD8 13004010 */  beqz       $v0, .L8015FB28
    /* 25EE4 8015FADC 00000000 */   nop
    /* 25EE8 8015FAE0 11002012 */  beqz       $s1, .L8015FB28
    /* 25EEC 8015FAE4 00000000 */   nop
    /* 25EF0 8015FAE8 C9F6000C */  jal        ENG_random__Fl
    /* 25EF4 8015FAEC 21202002 */   addu      $a0, $s1, $zero
    /* 25EF8 8015FAF0 0803A427 */  addiu      $a0, $sp, 0x308
    /* 25EFC 8015FAF4 80800200 */  sll        $s0, $v0, 2
    /* 25F00 8015FAF8 21801302 */  addu       $s0, $s0, $s3
    /* 25F04 8015FAFC 0000028E */  lw         $v0, 0x0($s0)
    /* 25F08 8015FB00 FCFF5226 */  addiu      $s2, $s2, -0x4
    /* 25F0C 8015FB04 BA7D050C */  jal        SwapMonsterType__FPi
    /* 25F10 8015FB08 0803A2AF */   sw        $v0, 0x308($sp)
    /* 25F14 8015FB0C 0803A48F */  lw         $a0, 0x308($sp)
    /* 25F18 8015FB10 637E050C */  jal        AddMonsterType__Fii
    /* 25F1C 8015FB14 01000524 */   addiu     $a1, $zero, 0x1
    /* 25F20 8015FB18 0000428E */  lw         $v0, 0x0($s2)
    /* 25F24 8015FB1C FFFF3126 */  addiu      $s1, $s1, -0x1
    /* 25F28 8015FB20 E9FF201E */  bgtz       $s1, .L8015FAC8
    /* 25F2C 8015FB24 000002AE */   sw        $v0, 0x0($s0)
  .L8015FB28:
    /* 25F30 8015FB28 2003BF8F */  lw         $ra, 0x320($sp)
    /* 25F34 8015FB2C 1C03B38F */  lw         $s3, 0x31C($sp)
    /* 25F38 8015FB30 1803B28F */  lw         $s2, 0x318($sp)
    /* 25F3C 8015FB34 1403B18F */  lw         $s1, 0x314($sp)
    /* 25F40 8015FB38 1003B08F */  lw         $s0, 0x310($sp)
    /* 25F44 8015FB3C 2803BD27 */  addiu      $sp, $sp, 0x328
    /* 25F48 8015FB40 0800E003 */  jr         $ra
    /* 25F4C 8015FB44 00000000 */   nop
endlabel GetMonsterTypes__FUl
