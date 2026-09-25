.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FreeTownerGFX__Fv, 0xA4

glabel FreeTownerGFX__Fv
    /* 2B064 8003B064 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 2B068 8003B068 1400B1AF */  sw         $s1, 0x14($sp)
    /* 2B06C 8003B06C 21880000 */  addu       $s1, $zero, $zero
    /* 2B070 8003B070 1000B0AF */  sw         $s0, 0x10($sp)
    /* 2B074 8003B074 21800000 */  addu       $s0, $zero, $zero
    /* 2B078 8003B078 1800BFAF */  sw         $ra, 0x18($sp)
  .L8003B07C:
    /* 2B07C 8003B07C 1000222A */  slti       $v0, $s1, 0x10
    /* 2B080 8003B080 17004010 */  beqz       $v0, .L8003B0E0
    /* 2B084 8003B084 00000000 */   nop
    /* 2B088 8003B088 0D80013C */  lui        $at, %hi(towner + 0xC0)
    /* 2B08C 8003B08C 21083000 */  addu       $at, $at, $s0
    /* 2B090 8003B090 40FF248C */  lw         $a0, %lo(towner + 0xC0)($at)
    /* 2B094 8003B094 A410828F */  lw         $v0, %gp_rel(pCowCels)($gp)
    /* 2B098 8003B098 00000000 */  nop
    /* 2B09C 8003B09C 06008214 */  bne        $a0, $v0, .L8003B0B8
    /* 2B0A0 8003B0A0 00000000 */   nop
    /* 2B0A4 8003B0A4 0D80013C */  lui        $at, %hi(towner + 0xC0)
    /* 2B0A8 8003B0A8 21083000 */  addu       $at, $at, $s0
    /* 2B0AC 8003B0AC 40FF20AC */  sw         $zero, %lo(towner + 0xC0)($at)
    /* 2B0B0 8003B0B0 36EC0008 */  j          .L8003B0D8
    /* 2B0B4 8003B0B4 C4001026 */   addiu     $s0, $s0, 0xC4
  .L8003B0B8:
    /* 2B0B8 8003B0B8 06008010 */  beqz       $a0, .L8003B0D4
    /* 2B0BC 8003B0BC 00000000 */   nop
    /* 2B0C0 8003B0C0 0D80013C */  lui        $at, %hi(towner + 0xC0)
    /* 2B0C4 8003B0C4 21083000 */  addu       $at, $at, $s0
    /* 2B0C8 8003B0C8 40FF20AC */  sw         $zero, %lo(towner + 0xC0)($at)
    /* 2B0CC 8003B0CC F7F6000C */  jal        mem_free_dbg__FPv
    /* 2B0D0 8003B0D0 00000000 */   nop
  .L8003B0D4:
    /* 2B0D4 8003B0D4 C4001026 */  addiu      $s0, $s0, 0xC4
  .L8003B0D8:
    /* 2B0D8 8003B0D8 1FEC0008 */  j          .L8003B07C
    /* 2B0DC 8003B0DC 01003126 */   addiu     $s1, $s1, 0x1
  .L8003B0E0:
    /* 2B0E0 8003B0E0 A410848F */  lw         $a0, %gp_rel(pCowCels)($gp)
    /* 2B0E4 8003B0E4 A41080AF */  sw         $zero, %gp_rel(pCowCels)($gp)
    /* 2B0E8 8003B0E8 F7F6000C */  jal        mem_free_dbg__FPv
    /* 2B0EC 8003B0EC 00000000 */   nop
    /* 2B0F0 8003B0F0 1800BF8F */  lw         $ra, 0x18($sp)
    /* 2B0F4 8003B0F4 1400B18F */  lw         $s1, 0x14($sp)
    /* 2B0F8 8003B0F8 1000B08F */  lw         $s0, 0x10($sp)
    /* 2B0FC 8003B0FC 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 2B100 8003B100 0800E003 */  jr         $ra
    /* 2B104 8003B104 00000000 */   nop
endlabel FreeTownerGFX__Fv
