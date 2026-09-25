.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CalcPlrInv__FiUc, 0xB0

glabel CalcPlrInv__FiUc
    /* 2FB18 8003FB18 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 2FB1C 8003FB1C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 2FB20 8003FB20 21808000 */  addu       $s0, $a0, $zero
    /* 2FB24 8003FB24 1400B1AF */  sw         $s1, 0x14($sp)
    /* 2FB28 8003FB28 1800BFAF */  sw         $ra, 0x18($sp)
    /* 2FB2C 8003FB2C D5FD000C */  jal        CalcPlrItemMin__Fi
    /* 2FB30 8003FB30 2188A000 */   addu      $s1, $a1, $zero
    /* 2FB34 8003FB34 5FFD000C */  jal        CalcSelfItems__Fi
    /* 2FB38 8003FB38 21200002 */   addu      $a0, $s0, $zero
    /* 2FB3C 8003FB3C 21200002 */  addu       $a0, $s0, $zero
    /* 2FB40 8003FB40 ACF9000C */  jal        CalcPlrItemVals__FiUc
    /* 2FB44 8003FB44 FF002532 */   andi      $a1, $s1, 0xFF
    /* 2FB48 8003FB48 D5FD000C */  jal        CalcPlrItemMin__Fi
    /* 2FB4C 8003FB4C 21200002 */   addu      $a0, $s0, $zero
    /* 2FB50 8003FB50 0DFE000C */  jal        CalcPlrBookVals__Fi
    /* 2FB54 8003FB54 21200002 */   addu      $a0, $s0, $zero
    /* 2FB58 8003FB58 4CFC000C */  jal        CalcPlrScrolls__Fi
    /* 2FB5C 8003FB5C 21200002 */   addu      $a0, $s0, $zero
    /* 2FB60 8003FB60 40201000 */  sll        $a0, $s0, 1
    /* 2FB64 8003FB64 21209000 */  addu       $a0, $a0, $s0
    /* 2FB68 8003FB68 80200400 */  sll        $a0, $a0, 2
    /* 2FB6C 8003FB6C 21209000 */  addu       $a0, $a0, $s0
    /* 2FB70 8003FB70 00210400 */  sll        $a0, $a0, 4
    /* 2FB74 8003FB74 23209000 */  subu       $a0, $a0, $s0
    /* 2FB78 8003FB78 80200400 */  sll        $a0, $a0, 2
    /* 2FB7C 8003FB7C 21209000 */  addu       $a0, $a0, $s0
    /* 2FB80 8003FB80 C0200400 */  sll        $a0, $a0, 3
    /* 2FB84 8003FB84 0E80023C */  lui        $v0, %hi(plr)
    /* 2FB88 8003FB88 38A54224 */  addiu      $v0, $v0, %lo(plr)
    /* 2FB8C 8003FB8C 2CFD000C */  jal        CalcPlrStaff__FP12PlayerStruct
    /* 2FB90 8003FB90 21208200 */   addu      $a0, $a0, $v0
    /* 2FB94 8003FB94 1280023C */  lui        $v0, %hi(currlevel)
    /* 2FB98 8003FB98 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 2FB9C 8003FB9C 00000000 */  nop
    /* 2FBA0 8003FBA0 03004014 */  bnez       $v0, .L8003FBB0
    /* 2FBA4 8003FBA4 00000000 */   nop
    /* 2FBA8 8003FBA8 1622010C */  jal        RecalcStoreStats__Fv
    /* 2FBAC 8003FBAC 00000000 */   nop
  .L8003FBB0:
    /* 2FBB0 8003FBB0 1800BF8F */  lw         $ra, 0x18($sp)
    /* 2FBB4 8003FBB4 1400B18F */  lw         $s1, 0x14($sp)
    /* 2FBB8 8003FBB8 1000B08F */  lw         $s0, 0x10($sp)
    /* 2FBBC 8003FBBC 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 2FBC0 8003FBC0 0800E003 */  jr         $ra
    /* 2FBC4 8003FBC4 00000000 */   nop
endlabel CalcPlrInv__FiUc
