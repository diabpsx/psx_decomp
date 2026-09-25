.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ReleaseMap__4AMapP6DLevel, 0x90

glabel ReleaseMap__4AMapP6DLevel
    /* 71D98 80081D98 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 71D9C 80081D9C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 71DA0 80081DA0 21808000 */  addu       $s0, $a0, $zero
    /* 71DA4 80081DA4 1400BFAF */  sw         $ra, 0x14($sp)
    /* 71DA8 80081DA8 0C00028E */  lw         $v0, 0xC($s0)
    /* 71DAC 80081DAC 00000000 */  nop
    /* 71DB0 80081DB0 0500A210 */  beq        $a1, $v0, .L80081DC8
    /* 71DB4 80081DB4 21200000 */   addu      $a0, $zero, $zero
    /* 71DB8 80081DB8 1280053C */  lui        $a1, %hi(D_80118E58)
    /* 71DBC 80081DBC 588EA524 */  addiu      $a1, $a1, %lo(D_80118E58)
    /* 71DC0 80081DC0 A583000C */  jal        DBG_Error
    /* 71DC4 80081DC4 56010624 */   addiu     $a2, $zero, 0x156
  .L80081DC8:
    /* 71DC8 80081DC8 0400038E */  lw         $v1, 0x4($s0)
    /* 71DCC 80081DCC FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 71DD0 80081DD0 05006214 */  bne        $v1, $v0, .L80081DE8
    /* 71DD4 80081DD4 21200000 */   addu      $a0, $zero, $zero
    /* 71DD8 80081DD8 1280053C */  lui        $a1, %hi(D_80118E58)
    /* 71DDC 80081DDC 588EA524 */  addiu      $a1, $a1, %lo(D_80118E58)
    /* 71DE0 80081DE0 A583000C */  jal        DBG_Error
    /* 71DE4 80081DE4 5A010624 */   addiu     $a2, $zero, 0x15A
  .L80081DE8:
    /* 71DE8 80081DE8 0400048E */  lw         $a0, 0x4($s0)
    /* 71DEC 80081DEC F785000C */  jal        GAL_Unlock
    /* 71DF0 80081DF0 00000000 */   nop
    /* 71DF4 80081DF4 FF004230 */  andi       $v0, $v0, 0xFF
    /* 71DF8 80081DF8 05004014 */  bnez       $v0, .L80081E10
    /* 71DFC 80081DFC 21200000 */   addu      $a0, $zero, $zero
    /* 71E00 80081E00 1280053C */  lui        $a1, %hi(D_80118E58)
    /* 71E04 80081E04 588EA524 */  addiu      $a1, $a1, %lo(D_80118E58)
    /* 71E08 80081E08 A583000C */  jal        DBG_Error
    /* 71E0C 80081E0C 5F010624 */   addiu     $a2, $zero, 0x15F
  .L80081E10:
    /* 71E10 80081E10 0C0000AE */  sw         $zero, 0xC($s0)
    /* 71E14 80081E14 1400BF8F */  lw         $ra, 0x14($sp)
    /* 71E18 80081E18 1000B08F */  lw         $s0, 0x10($sp)
    /* 71E1C 80081E1C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 71E20 80081E20 0800E003 */  jr         $ra
    /* 71E24 80081E24 00000000 */   nop
endlabel ReleaseMap__4AMapP6DLevel
