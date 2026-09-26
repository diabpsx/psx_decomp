.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching func_8013AC70, 0x8C

glabel func_8013AC70
    /* 1078 8013AC70 21308000 */  addu       $a2, $a0, $zero
    /* 107C 8013AC74 1480053C */  lui        $a1, %hi(D_80139CB0)
    /* 1080 8013AC78 B09CA524 */  addiu      $a1, $a1, %lo(D_80139CB0)
    /* 1084 8013AC7C 0F000324 */  addiu      $v1, $zero, 0xF
    /* 1088 8013AC80 FFFF0724 */  addiu      $a3, $zero, -0x1
  .L8013AC84:
    /* 108C 8013AC84 0000A28C */  lw         $v0, 0x0($a1)
    /* 1090 8013AC88 0400A524 */  addiu      $a1, $a1, 0x4
    /* 1094 8013AC8C FFFF6324 */  addiu      $v1, $v1, -0x1
    /* 1098 8013AC90 0000C2AC */  sw         $v0, 0x0($a2)
    /* 109C 8013AC94 FBFF6714 */  bne        $v1, $a3, .L8013AC84
    /* 10A0 8013AC98 0400C624 */   addiu     $a2, $a2, 0x4
    /* 10A4 8013AC9C 40008624 */  addiu      $a2, $a0, 0x40
    /* 10A8 8013ACA0 1480053C */  lui        $a1, %hi(D_80139CF0)
    /* 10AC 8013ACA4 F09CA524 */  addiu      $a1, $a1, %lo(D_80139CF0)
    /* 10B0 8013ACA8 0F000324 */  addiu      $v1, $zero, 0xF
    /* 10B4 8013ACAC FFFF0724 */  addiu      $a3, $zero, -0x1
  .L8013ACB0:
    /* 10B8 8013ACB0 0000A28C */  lw         $v0, 0x0($a1)
    /* 10BC 8013ACB4 0400A524 */  addiu      $a1, $a1, 0x4
    /* 10C0 8013ACB8 FFFF6324 */  addiu      $v1, $v1, -0x1
    /* 10C4 8013ACBC 0000C2AC */  sw         $v0, 0x0($a2)
    /* 10C8 8013ACC0 FBFF6714 */  bne        $v1, $a3, .L8013ACB0
    /* 10CC 8013ACC4 0400C624 */   addiu     $a2, $a2, 0x4
    /* 10D0 8013ACC8 80008624 */  addiu      $a2, $a0, 0x80
    /* 10D4 8013ACCC 1480053C */  lui        $a1, %hi(D_80139D34)
    /* 10D8 8013ACD0 349DA524 */  addiu      $a1, $a1, %lo(D_80139D34)
    /* 10DC 8013ACD4 1F000324 */  addiu      $v1, $zero, 0x1F
    /* 10E0 8013ACD8 FFFF0724 */  addiu      $a3, $zero, -0x1
  .L8013ACDC:
    /* 10E4 8013ACDC 0000A28C */  lw         $v0, 0x0($a1)
    /* 10E8 8013ACE0 0400A524 */  addiu      $a1, $a1, 0x4
    /* 10EC 8013ACE4 FFFF6324 */  addiu      $v1, $v1, -0x1
    /* 10F0 8013ACE8 0000C2AC */  sw         $v0, 0x0($a2)
    /* 10F4 8013ACEC FBFF6714 */  bne        $v1, $a3, .L8013ACDC
    /* 10F8 8013ACF0 0400C624 */   addiu     $a2, $a2, 0x4
    /* 10FC 8013ACF4 0800E003 */  jr         $ra
    /* 1100 8013ACF8 21108000 */   addu      $v0, $a0, $zero
endlabel func_8013AC70
