.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TownBarOwner__Fv, 0x9C

glabel TownBarOwner__Fv
    /* 2B27C 8003B27C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 2B280 8003B280 03000424 */  addiu      $a0, $zero, 0x3
    /* 2B284 8003B284 1400BFAF */  sw         $ra, 0x14($sp)
    /* 2B288 8003B288 E2E7000C */  jal        GetActiveTowner__Fi
    /* 2B28C 8003B28C 1000B0AF */   sw        $s0, 0x10($sp)
    /* 2B290 8003B290 21804000 */  addu       $s0, $v0, $zero
    /* 2B294 8003B294 42EC000C */  jal        TownCtrlMsg__Fi
    /* 2B298 8003B298 21200002 */   addu      $a0, $s0, $zero
    /* 2B29C 8003B29C 1280023C */  lui        $v0, %hi(qtextflag)
    /* 2B2A0 8003B2A0 60B94290 */  lbu        $v0, %lo(qtextflag)($v0)
    /* 2B2A4 8003B2A4 00000000 */  nop
    /* 2B2A8 8003B2A8 16004014 */  bnez       $v0, .L8003B304
    /* 2B2AC 8003B2AC 03000224 */   addiu     $v0, $zero, 0x3
    /* 2B2B0 8003B2B0 0E80033C */  lui        $v1, %hi(quests + 0x8E)
    /* 2B2B4 8003B2B4 CEDA6390 */  lbu        $v1, %lo(quests + 0x8E)($v1)
    /* 2B2B8 8003B2B8 00000000 */  nop
    /* 2B2BC 8003B2BC 11006214 */  bne        $v1, $v0, .L8003B304
    /* 2B2C0 8003B2C0 00000000 */   nop
    /* 2B2C4 8003B2C4 A2108293 */  lbu        $v0, %gp_rel(bannerflag)($gp)
    /* 2B2C8 8003B2C8 00000000 */  nop
    /* 2B2CC 8003B2CC 0D004010 */  beqz       $v0, .L8003B304
    /* 2B2D0 8003B2D0 40101000 */   sll       $v0, $s0, 1
    /* 2B2D4 8003B2D4 21105000 */  addu       $v0, $v0, $s0
    /* 2B2D8 8003B2D8 00110200 */  sll        $v0, $v0, 4
    /* 2B2DC 8003B2DC 21105000 */  addu       $v0, $v0, $s0
    /* 2B2E0 8003B2E0 80100200 */  sll        $v0, $v0, 2
    /* 2B2E4 8003B2E4 0D80013C */  lui        $at, %hi(towner + 0xC)
    /* 2B2E8 8003B2E8 21082200 */  addu       $at, $at, $v0
    /* 2B2EC 8003B2EC 8CFE258C */  lw         $a1, %lo(towner + 0xC)($at)
    /* 2B2F0 8003B2F0 0D80013C */  lui        $at, %hi(towner + 0x8)
    /* 2B2F4 8003B2F4 21082200 */  addu       $at, $at, $v0
    /* 2B2F8 8003B2F8 88FE248C */  lw         $a0, %lo(towner + 0x8)($at)
    /* 2B2FC 8003B2FC 447F010C */  jal        IsDplayer__Fii
    /* 2B300 8003B300 0100A524 */   addiu     $a1, $a1, 0x1
  .L8003B304:
    /* 2B304 8003B304 1400BF8F */  lw         $ra, 0x14($sp)
    /* 2B308 8003B308 1000B08F */  lw         $s0, 0x10($sp)
    /* 2B30C 8003B30C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 2B310 8003B310 0800E003 */  jr         $ra
    /* 2B314 8003B314 00000000 */   nop
endlabel TownBarOwner__Fv
