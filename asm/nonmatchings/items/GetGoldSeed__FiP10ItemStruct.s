.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetGoldSeed__FiP10ItemStruct, 0x168

glabel GetGoldSeed__FiP10ItemStruct
    /* 2FD0C 8003FD0C C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 2FD10 8003FD10 2000B0AF */  sw         $s0, 0x20($sp)
    /* 2FD14 8003FD14 21808000 */  addu       $s0, $a0, $zero
    /* 2FD18 8003FD18 3000B4AF */  sw         $s4, 0x30($sp)
    /* 2FD1C 8003FD1C 21A0A000 */  addu       $s4, $a1, $zero
    /* 2FD20 8003FD20 2800B2AF */  sw         $s2, 0x28($sp)
    /* 2FD24 8003FD24 40901000 */  sll        $s2, $s0, 1
    /* 2FD28 8003FD28 21105002 */  addu       $v0, $s2, $s0
    /* 2FD2C 8003FD2C 80100200 */  sll        $v0, $v0, 2
    /* 2FD30 8003FD30 21105000 */  addu       $v0, $v0, $s0
    /* 2FD34 8003FD34 00110200 */  sll        $v0, $v0, 4
    /* 2FD38 8003FD38 23105000 */  subu       $v0, $v0, $s0
    /* 2FD3C 8003FD3C 80100200 */  sll        $v0, $v0, 2
    /* 2FD40 8003FD40 21105000 */  addu       $v0, $v0, $s0
    /* 2FD44 8003FD44 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 2FD48 8003FD48 C0980200 */  sll        $s3, $v0, 3
    /* 2FD4C 8003FD4C 3400BFAF */  sw         $ra, 0x34($sp)
    /* 2FD50 8003FD50 2400B1AF */  sw         $s1, 0x24($sp)
  .L8003FD54:
    /* 2FD54 8003FD54 B7F6000C */  jal        GetRndSeed__Fv
    /* 2FD58 8003FD58 01001124 */   addiu     $s1, $zero, 0x1
    /* 2FD5C 8003FD5C 21200000 */  addu       $a0, $zero, $zero
    /* 2FD60 8003FD60 0811838F */  lw         $v1, %gp_rel(numitems)($gp)
    /* 2FD64 8003FD64 00000000 */  nop
    /* 2FD68 8003FD68 16006018 */  blez       $v1, .L8003FDC4
    /* 2FD6C 8003FD6C 21384000 */   addu      $a3, $v0, $zero
    /* 2FD70 8003FD70 21286000 */  addu       $a1, $v1, $zero
  .L8003FD74:
    /* 2FD74 8003FD74 0D80013C */  lui        $at, %hi(itemactive)
    /* 2FD78 8003FD78 21082400 */  addu       $at, $at, $a0
    /* 2FD7C 8003FD7C 54532280 */  lb         $v0, %lo(itemactive)($at)
    /* 2FD80 8003FD80 00000000 */  nop
    /* 2FD84 8003FD84 C0180200 */  sll        $v1, $v0, 3
    /* 2FD88 8003FD88 23186200 */  subu       $v1, $v1, $v0
    /* 2FD8C 8003FD8C 80180300 */  sll        $v1, $v1, 2
    /* 2FD90 8003FD90 23186200 */  subu       $v1, $v1, $v0
    /* 2FD94 8003FD94 80180300 */  sll        $v1, $v1, 2
    /* 2FD98 8003FD98 0D80013C */  lui        $at, %hi(item + 0x10)
    /* 2FD9C 8003FD9C 21082300 */  addu       $at, $at, $v1
    /* 2FDA0 8003FDA0 641D228C */  lw         $v0, %lo(item + 0x10)($at)
    /* 2FDA4 8003FDA4 00000000 */  nop
    /* 2FDA8 8003FDA8 02004714 */  bne        $v0, $a3, .L8003FDB4
    /* 2FDAC 8003FDAC 00000000 */   nop
    /* 2FDB0 8003FDB0 21880000 */  addu       $s1, $zero, $zero
  .L8003FDB4:
    /* 2FDB4 8003FDB4 01008424 */  addiu      $a0, $a0, 0x1
    /* 2FDB8 8003FDB8 2A108500 */  slt        $v0, $a0, $a1
    /* 2FDBC 8003FDBC EDFF4014 */  bnez       $v0, .L8003FD74
    /* 2FDC0 8003FDC0 00000000 */   nop
  .L8003FDC4:
    /* 2FDC4 8003FDC4 21304002 */  addu       $a2, $s2, $zero
    /* 2FDC8 8003FDC8 0E80013C */  lui        $at, %hi(plr + 0x1584)
    /* 2FDCC 8003FDCC 21083300 */  addu       $at, $at, $s3
    /* 2FDD0 8003FDD0 BCBA228C */  lw         $v0, %lo(plr + 0x1584)($at)
    /* 2FDD4 8003FDD4 00000000 */  nop
    /* 2FDD8 8003FDD8 19004018 */  blez       $v0, .L8003FE40
    /* 2FDDC 8003FDDC 21200000 */   addu      $a0, $zero, $zero
    /* 2FDE0 8003FDE0 21280000 */  addu       $a1, $zero, $zero
  .L8003FDE4:
    /* 2FDE4 8003FDE4 2110D000 */  addu       $v0, $a2, $s0
    /* 2FDE8 8003FDE8 80100200 */  sll        $v0, $v0, 2
    /* 2FDEC 8003FDEC 21105000 */  addu       $v0, $v0, $s0
    /* 2FDF0 8003FDF0 00110200 */  sll        $v0, $v0, 4
    /* 2FDF4 8003FDF4 23105000 */  subu       $v0, $v0, $s0
    /* 2FDF8 8003FDF8 80100200 */  sll        $v0, $v0, 2
    /* 2FDFC 8003FDFC 21105000 */  addu       $v0, $v0, $s0
    /* 2FE00 8003FE00 C0180200 */  sll        $v1, $v0, 3
    /* 2FE04 8003FE04 2110A300 */  addu       $v0, $a1, $v1
    /* 2FE08 8003FE08 0E80013C */  lui        $at, %hi(plr + 0x4B4)
    /* 2FE0C 8003FE0C 21082200 */  addu       $at, $at, $v0
    /* 2FE10 8003FE10 ECA9228C */  lw         $v0, %lo(plr + 0x4B4)($at)
    /* 2FE14 8003FE14 00000000 */  nop
    /* 2FE18 8003FE18 02004714 */  bne        $v0, $a3, .L8003FE24
    /* 2FE1C 8003FE1C 00000000 */   nop
    /* 2FE20 8003FE20 21880000 */  addu       $s1, $zero, $zero
  .L8003FE24:
    /* 2FE24 8003FE24 0E80013C */  lui        $at, %hi(plr + 0x1584)
    /* 2FE28 8003FE28 21082300 */  addu       $at, $at, $v1
    /* 2FE2C 8003FE2C BCBA228C */  lw         $v0, %lo(plr + 0x1584)($at)
    /* 2FE30 8003FE30 01008424 */  addiu      $a0, $a0, 0x1
    /* 2FE34 8003FE34 2A108200 */  slt        $v0, $a0, $v0
    /* 2FE38 8003FE38 EAFF4014 */  bnez       $v0, .L8003FDE4
    /* 2FE3C 8003FE3C 6C00A524 */   addiu     $a1, $a1, 0x6C
  .L8003FE40:
    /* 2FE40 8003FE40 FF002232 */  andi       $v0, $s1, 0xFF
    /* 2FE44 8003FE44 C3FF4010 */  beqz       $v0, .L8003FD54
    /* 2FE48 8003FE48 00000000 */   nop
    /* 2FE4C 8003FE4C 100087AE */  sw         $a3, 0x10($s4)
    /* 2FE50 8003FE50 3400BF8F */  lw         $ra, 0x34($sp)
    /* 2FE54 8003FE54 3000B48F */  lw         $s4, 0x30($sp)
    /* 2FE58 8003FE58 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 2FE5C 8003FE5C 2800B28F */  lw         $s2, 0x28($sp)
    /* 2FE60 8003FE60 2400B18F */  lw         $s1, 0x24($sp)
    /* 2FE64 8003FE64 2000B08F */  lw         $s0, 0x20($sp)
    /* 2FE68 8003FE68 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 2FE6C 8003FE6C 0800E003 */  jr         $ra
    /* 2FE70 8003FE70 00000000 */   nop
endlabel GetGoldSeed__FiP10ItemStruct
