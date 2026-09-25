.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching LoTskKill, 0x70

glabel LoTskKill
    /* 109C8 800209C8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 109CC 800209CC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 109D0 800209D0 21808000 */  addu       $s0, $a0, $zero
    /* 109D4 800209D4 1280043C */  lui        $a0, %hi(D_8011C98C)
    /* 109D8 800209D8 8CC98424 */  addiu      $a0, $a0, %lo(D_8011C98C)
    /* 109DC 800209DC 1400BFAF */  sw         $ra, 0x14($sp)
    /* 109E0 800209E0 5782000C */  jal        DetachFromList
    /* 109E4 800209E4 21280002 */   addu      $a1, $s0, $zero
    /* 109E8 800209E8 5400048E */  lw         $a0, 0x54($s0)
    /* 109EC 800209EC 1886000C */  jal        GAL_Free
    /* 109F0 800209F0 00000000 */   nop
    /* 109F4 800209F4 1280033C */  lui        $v1, %hi(D_8011C9A4)
    /* 109F8 800209F8 A4C9638C */  lw         $v1, %lo(D_8011C9A4)($v1)
    /* 109FC 800209FC FF004230 */  andi       $v0, $v0, 0xFF
    /* 10A00 80020A00 FFFF6324 */  addiu      $v1, $v1, -0x1
    /* 10A04 80020A04 1280013C */  lui        $at, %hi(D_8011C9A4)
    /* 10A08 80020A08 A4C923AC */  sw         $v1, %lo(D_8011C9A4)($at)
    /* 10A0C 80020A0C 05004014 */  bnez       $v0, .L80020A24
    /* 10A10 80020A10 21200000 */   addu      $a0, $zero, $zero
    /* 10A14 80020A14 1180053C */  lui        $a1, %hi(D_8010E730)
    /* 10A18 80020A18 30E7A524 */  addiu      $a1, $a1, %lo(D_8010E730)
    /* 10A1C 80020A1C A583000C */  jal        DBG_Error
    /* 10A20 80020A20 DD020634 */   ori       $a2, $zero, 0x2DD
  .L80020A24:
    /* 10A24 80020A24 1400BF8F */  lw         $ra, 0x14($sp)
    /* 10A28 80020A28 1000B08F */  lw         $s0, 0x10($sp)
    /* 10A2C 80020A2C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 10A30 80020A30 0800E003 */  jr         $ra
    /* 10A34 80020A34 00000000 */   nop
endlabel LoTskKill
