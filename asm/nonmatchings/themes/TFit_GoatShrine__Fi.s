.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TFit_GoatShrine__Fi, 0x98

glabel TFit_GoatShrine__Fi
    /* 22578 8015C170 1280023C */  lui        $v0, %hi(nummtypes)
    /* 2257C 8015C174 9CC2428C */  lw         $v0, %lo(nummtypes)($v0)
    /* 22580 8015C178 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 22584 8015C17C 2000B2AF */  sw         $s2, 0x20($sp)
    /* 22588 8015C180 21908000 */  addu       $s2, $a0, $zero
    /* 2258C 8015C184 1800B0AF */  sw         $s0, 0x18($sp)
    /* 22590 8015C188 21800000 */  addu       $s0, $zero, $zero
    /* 22594 8015C18C 2400BFAF */  sw         $ra, 0x24($sp)
    /* 22598 8015C190 15004018 */  blez       $v0, .L8015C1E8
    /* 2259C 8015C194 1C00B1AF */   sw        $s1, 0x1C($sp)
    /* 225A0 8015C198 21880000 */  addu       $s1, $zero, $zero
  .L8015C19C:
    /* 225A4 8015C19C 1180013C */  lui        $at, %hi(Monsters + 0x12)
    /* 225A8 8015C1A0 21083100 */  addu       $at, $at, $s1
    /* 225AC 8015C1A4 CEA32490 */  lbu        $a0, %lo(Monsters + 0x12)($at)
    /* 225B0 8015C1A8 EC87050C */  jal        IsGoat__Fi
    /* 225B4 8015C1AC 00000000 */   nop
    /* 225B8 8015C1B0 FF004230 */  andi       $v0, $v0, 0xFF
    /* 225BC 8015C1B4 06004010 */  beqz       $v0, .L8015C1D0
    /* 225C0 8015C1B8 00000000 */   nop
    /* 225C4 8015C1BC 201A90AF */  sw         $s0, %gp_rel(themeVar1)($gp)
    /* 225C8 8015C1C0 BF6F050C */  jal        TFit_Obj5__Fi
    /* 225CC 8015C1C4 21204002 */   addu      $a0, $s2, $zero
    /* 225D0 8015C1C8 7B700508 */  j          .L8015C1EC
    /* 225D4 8015C1CC FF004230 */   andi      $v0, $v0, 0xFF
  .L8015C1D0:
    /* 225D8 8015C1D0 1280023C */  lui        $v0, %hi(nummtypes)
    /* 225DC 8015C1D4 9CC2428C */  lw         $v0, %lo(nummtypes)($v0)
    /* 225E0 8015C1D8 01001026 */  addiu      $s0, $s0, 0x1
    /* 225E4 8015C1DC 2A100202 */  slt        $v0, $s0, $v0
    /* 225E8 8015C1E0 EEFF4014 */  bnez       $v0, .L8015C19C
    /* 225EC 8015C1E4 1C003126 */   addiu     $s1, $s1, 0x1C
  .L8015C1E8:
    /* 225F0 8015C1E8 21100000 */  addu       $v0, $zero, $zero
  .L8015C1EC:
    /* 225F4 8015C1EC 2400BF8F */  lw         $ra, 0x24($sp)
    /* 225F8 8015C1F0 2000B28F */  lw         $s2, 0x20($sp)
    /* 225FC 8015C1F4 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 22600 8015C1F8 1800B08F */  lw         $s0, 0x18($sp)
    /* 22604 8015C1FC 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 22608 8015C200 0800E003 */  jr         $ra
    /* 2260C 8015C204 00000000 */   nop
endlabel TFit_GoatShrine__Fi
