.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetFreeMemHdrBlock, 0x88

glabel GetFreeMemHdrBlock
    /* 12088 80022088 1280023C */  lui        $v0, %hi(D_8011C9D0)
    /* 1208C 8002208C D0C9428C */  lw         $v0, %lo(D_8011C9D0)($v0)
    /* 12090 80022090 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 12094 80022094 1000B0AF */  sw         $s0, 0x10($sp)
    /* 12098 80022098 21800000 */  addu       $s0, $zero, $zero
    /* 1209C 8002209C 16004010 */  beqz       $v0, .L800220F8
    /* 120A0 800220A0 1400BFAF */   sw        $ra, 0x14($sp)
    /* 120A4 800220A4 1280023C */  lui        $v0, %hi(D_8011C9EC)
    /* 120A8 800220A8 ECC9428C */  lw         $v0, %lo(D_8011C9EC)($v0)
    /* 120AC 800220AC 1280033C */  lui        $v1, %hi(D_8011C9E8)
    /* 120B0 800220B0 E8C9638C */  lw         $v1, %lo(D_8011C9E8)($v1)
    /* 120B4 800220B4 FFFF4424 */  addiu      $a0, $v0, -0x1
    /* 120B8 800220B8 1280013C */  lui        $at, %hi(D_8011C9EC)
    /* 120BC 800220BC ECC924AC */  sw         $a0, %lo(D_8011C9EC)($at)
    /* 120C0 800220C0 07006010 */  beqz       $v1, .L800220E0
    /* 120C4 800220C4 09000234 */   ori       $v0, $zero, 0x9
    /* 120C8 800220C8 05008214 */  bne        $a0, $v0, .L800220E0
    /* 120CC 800220CC 00000000 */   nop
    /* 120D0 800220D0 1180043C */  lui        $a0, %hi(D_8010E8A8)
    /* 120D4 800220D4 A8E88424 */  addiu      $a0, $a0, %lo(D_8010E8A8)
    /* 120D8 800220D8 9B83000C */  jal        DBG_SendMessage
    /* 120DC 800220DC 00000000 */   nop
  .L800220E0:
    /* 120E0 800220E0 1280103C */  lui        $s0, %hi(D_8011C9D0)
    /* 120E4 800220E4 D0C9108E */  lw         $s0, %lo(D_8011C9D0)($s0)
    /* 120E8 800220E8 1280043C */  lui        $a0, %hi(D_8011C9D0)
    /* 120EC 800220EC D0C98424 */  addiu      $a0, $a0, %lo(D_8011C9D0)
    /* 120F0 800220F0 A386000C */  jal        DetachHdrFromList
    /* 120F4 800220F4 21280002 */   addu      $a1, $s0, $zero
  .L800220F8:
    /* 120F8 800220F8 21100002 */  addu       $v0, $s0, $zero
    /* 120FC 800220FC 1400BF8F */  lw         $ra, 0x14($sp)
    /* 12100 80022100 1000B08F */  lw         $s0, 0x10($sp)
    /* 12104 80022104 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 12108 80022108 0800E003 */  jr         $ra
    /* 1210C 8002210C 00000000 */   nop
endlabel GetFreeMemHdrBlock
