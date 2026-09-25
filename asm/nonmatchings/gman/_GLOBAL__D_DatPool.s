.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching _GLOBAL__D_DatPool, 0x58

glabel _GLOBAL__D_DatPool
    /* 85080 80095080 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 85084 80095084 0C80023C */  lui        $v0, %hi(DatPool)
    /* 85088 80095088 948B4224 */  addiu      $v0, $v0, %lo(DatPool)
    /* 8508C 8009508C 1800BFAF */  sw         $ra, 0x18($sp)
    /* 85090 80095090 1400B1AF */  sw         $s1, 0x14($sp)
    /* 85094 80095094 0A004010 */  beqz       $v0, .L800950C0
    /* 85098 80095098 1000B0AF */   sw        $s0, 0x10($sp)
    /* 8509C 8009509C C0085024 */  addiu      $s0, $v0, 0x8C0
    /* 850A0 800950A0 07000212 */  beq        $s0, $v0, .L800950C0
    /* 850A4 800950A4 21884000 */   addu      $s1, $v0, $zero
    /* 850A8 800950A8 90FF1026 */  addiu      $s0, $s0, -0x70
  .L800950AC:
    /* 850AC 800950AC 21200002 */  addu       $a0, $s0, $zero
    /* 850B0 800950B0 AA47020C */  jal        ___7TextDat
    /* 850B4 800950B4 02000524 */   addiu     $a1, $zero, 0x2
    /* 850B8 800950B8 FCFF1116 */  bne        $s0, $s1, .L800950AC
    /* 850BC 800950BC 90FF1026 */   addiu     $s0, $s0, -0x70
  .L800950C0:
    /* 850C0 800950C0 1800BF8F */  lw         $ra, 0x18($sp)
    /* 850C4 800950C4 1400B18F */  lw         $s1, 0x14($sp)
    /* 850C8 800950C8 1000B08F */  lw         $s0, 0x10($sp)
    /* 850CC 800950CC 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 850D0 800950D0 0800E003 */  jr         $ra
    /* 850D4 800950D4 00000000 */   nop
endlabel _GLOBAL__D_DatPool
