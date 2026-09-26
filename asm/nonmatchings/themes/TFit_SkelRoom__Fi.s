.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TFit_SkelRoom__Fi, 0xB0

glabel TFit_SkelRoom__Fi
    /* 224C8 8015C0C0 1280023C */  lui        $v0, %hi(leveltype)
    /* 224CC 8015C0C4 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 224D0 8015C0C8 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 224D4 8015C0CC 2000B2AF */  sw         $s2, 0x20($sp)
    /* 224D8 8015C0D0 21908000 */  addu       $s2, $a0, $zero
    /* 224DC 8015C0D4 2400BFAF */  sw         $ra, 0x24($sp)
    /* 224E0 8015C0D8 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 224E4 8015C0DC FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 224E8 8015C0E0 0200422C */  sltiu      $v0, $v0, 0x2
    /* 224EC 8015C0E4 1A004010 */  beqz       $v0, .L8015C150
    /* 224F0 8015C0E8 1800B0AF */   sw        $s0, 0x18($sp)
    /* 224F4 8015C0EC 1280023C */  lui        $v0, %hi(nummtypes)
    /* 224F8 8015C0F0 9CC2428C */  lw         $v0, %lo(nummtypes)($v0)
    /* 224FC 8015C0F4 00000000 */  nop
    /* 22500 8015C0F8 15004018 */  blez       $v0, .L8015C150
    /* 22504 8015C0FC 21800000 */   addu      $s0, $zero, $zero
    /* 22508 8015C100 21880000 */  addu       $s1, $zero, $zero
  .L8015C104:
    /* 2250C 8015C104 1180013C */  lui        $at, %hi(Monsters + 0x12)
    /* 22510 8015C108 21083100 */  addu       $at, $at, $s1
    /* 22514 8015C10C CEA32490 */  lbu        $a0, %lo(Monsters + 0x12)($at)
    /* 22518 8015C110 27FD010C */  jal        IsSkel__Fi
    /* 2251C 8015C114 00000000 */   nop
    /* 22520 8015C118 FF004230 */  andi       $v0, $v0, 0xFF
    /* 22524 8015C11C 06004010 */  beqz       $v0, .L8015C138
    /* 22528 8015C120 00000000 */   nop
    /* 2252C 8015C124 201A90AF */  sw         $s0, %gp_rel(themeVar1)($gp)
    /* 22530 8015C128 BF6F050C */  jal        TFit_Obj5__Fi
    /* 22534 8015C12C 21204002 */   addu      $a0, $s2, $zero
    /* 22538 8015C130 55700508 */  j          .L8015C154
    /* 2253C 8015C134 FF004230 */   andi      $v0, $v0, 0xFF
  .L8015C138:
    /* 22540 8015C138 1280023C */  lui        $v0, %hi(nummtypes)
    /* 22544 8015C13C 9CC2428C */  lw         $v0, %lo(nummtypes)($v0)
    /* 22548 8015C140 01001026 */  addiu      $s0, $s0, 0x1
    /* 2254C 8015C144 2A100202 */  slt        $v0, $s0, $v0
    /* 22550 8015C148 EEFF4014 */  bnez       $v0, .L8015C104
    /* 22554 8015C14C 1C003126 */   addiu     $s1, $s1, 0x1C
  .L8015C150:
    /* 22558 8015C150 21100000 */  addu       $v0, $zero, $zero
  .L8015C154:
    /* 2255C 8015C154 2400BF8F */  lw         $ra, 0x24($sp)
    /* 22560 8015C158 2000B28F */  lw         $s2, 0x20($sp)
    /* 22564 8015C15C 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 22568 8015C160 1800B08F */  lw         $s0, 0x18($sp)
    /* 2256C 8015C164 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 22570 8015C168 0800E003 */  jr         $ra
    /* 22574 8015C16C 00000000 */   nop
endlabel TFit_SkelRoom__Fi
