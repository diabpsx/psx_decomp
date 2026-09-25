.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ModifyPlrStr__Fii, 0x11C

glabel ModifyPlrStr__Fii
    /* 55DA0 80065DA0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 55DA4 80065DA4 21388000 */  addu       $a3, $a0, $zero
    /* 55DA8 80065DA8 40100700 */  sll        $v0, $a3, 1
    /* 55DAC 80065DAC 21104700 */  addu       $v0, $v0, $a3
    /* 55DB0 80065DB0 80100200 */  sll        $v0, $v0, 2
    /* 55DB4 80065DB4 21104700 */  addu       $v0, $v0, $a3
    /* 55DB8 80065DB8 00110200 */  sll        $v0, $v0, 4
    /* 55DBC 80065DBC 23104700 */  subu       $v0, $v0, $a3
    /* 55DC0 80065DC0 80100200 */  sll        $v0, $v0, 2
    /* 55DC4 80065DC4 21104700 */  addu       $v0, $v0, $a3
    /* 55DC8 80065DC8 C0100200 */  sll        $v0, $v0, 3
    /* 55DCC 80065DCC 0E80033C */  lui        $v1, %hi(plr)
    /* 55DD0 80065DD0 38A56324 */  addiu      $v1, $v1, %lo(plr)
    /* 55DD4 80065DD4 21304300 */  addu       $a2, $v0, $v1
    /* 55DD8 80065DD8 1000BFAF */  sw         $ra, 0x10($sp)
    /* 55DDC 80065DDC F600C280 */  lb         $v0, 0xF6($a2)
    /* 55DE0 80065DE0 FA00C484 */  lh         $a0, 0xFA($a2)
    /* 55DE4 80065DE4 00110200 */  sll        $v0, $v0, 4
    /* 55DE8 80065DE8 0E80013C */  lui        $at, %hi(MaxStats)
    /* 55DEC 80065DEC 21082200 */  addu       $at, $at, $v0
    /* 55DF0 80065DF0 38A4238C */  lw         $v1, %lo(MaxStats)($at)
    /* 55DF4 80065DF4 21108500 */  addu       $v0, $a0, $a1
    /* 55DF8 80065DF8 2A106200 */  slt        $v0, $v1, $v0
    /* 55DFC 80065DFC 02004010 */  beqz       $v0, .L80065E08
    /* 55E00 80065E00 00000000 */   nop
    /* 55E04 80065E04 23286400 */  subu       $a1, $v1, $a0
  .L80065E08:
    /* 55E08 80065E08 FA00C394 */  lhu        $v1, 0xFA($a2)
    /* 55E0C 80065E0C F800C294 */  lhu        $v0, 0xF8($a2)
    /* 55E10 80065E10 21186500 */  addu       $v1, $v1, $a1
    /* 55E14 80065E14 FA00C3A4 */  sh         $v1, 0xFA($a2)
    /* 55E18 80065E18 F600C380 */  lb         $v1, 0xF6($a2)
    /* 55E1C 80065E1C 21104500 */  addu       $v0, $v0, $a1
    /* 55E20 80065E20 F800C2A4 */  sh         $v0, 0xF8($a2)
    /* 55E24 80065E24 01000224 */  addiu      $v0, $zero, 0x1
    /* 55E28 80065E28 10006214 */  bne        $v1, $v0, .L80065E6C
    /* 55E2C 80065E2C 00000000 */   nop
    /* 55E30 80065E30 F800C284 */  lh         $v0, 0xF8($a2)
    /* 55E34 80065E34 0001C384 */  lh         $v1, 0x100($a2)
    /* 55E38 80065E38 3C01C480 */  lb         $a0, 0x13C($a2)
    /* 55E3C 80065E3C 21104300 */  addu       $v0, $v0, $v1
    /* 55E40 80065E40 18004400 */  mult       $v0, $a0
    /* 55E44 80065E44 12100000 */  mflo       $v0
    /* 55E48 80065E48 EB51033C */  lui        $v1, (0x51EB851F >> 16)
    /* 55E4C 80065E4C 1F856334 */  ori        $v1, $v1, (0x51EB851F & 0xFFFF)
    /* 55E50 80065E50 18004300 */  mult       $v0, $v1
    /* 55E54 80065E54 C3170200 */  sra        $v0, $v0, 31
    /* 55E58 80065E58 10400000 */  mfhi       $t0
    /* 55E5C 80065E5C 83190800 */  sra        $v1, $t0, 6
    /* 55E60 80065E60 23186200 */  subu       $v1, $v1, $v0
    /* 55E64 80065E64 A8970108 */  j          .L80065EA0
    /* 55E68 80065E68 0C01C3AC */   sw        $v1, 0x10C($a2)
  .L80065E6C:
    /* 55E6C 80065E6C F800C384 */  lh         $v1, 0xF8($a2)
    /* 55E70 80065E70 3C01C280 */  lb         $v0, 0x13C($a2)
    /* 55E74 80065E74 00000000 */  nop
    /* 55E78 80065E78 18006200 */  mult       $v1, $v0
    /* 55E7C 80065E7C 12180000 */  mflo       $v1
    /* 55E80 80065E80 EB51023C */  lui        $v0, (0x51EB851F >> 16)
    /* 55E84 80065E84 1F854234 */  ori        $v0, $v0, (0x51EB851F & 0xFFFF)
    /* 55E88 80065E88 18006200 */  mult       $v1, $v0
    /* 55E8C 80065E8C C31F0300 */  sra        $v1, $v1, 31
    /* 55E90 80065E90 10400000 */  mfhi       $t0
    /* 55E94 80065E94 43110800 */  sra        $v0, $t0, 5
    /* 55E98 80065E98 23104300 */  subu       $v0, $v0, $v1
    /* 55E9C 80065E9C 0C01C2AC */  sw         $v0, 0x10C($a2)
  .L80065EA0:
    /* 55EA0 80065EA0 2120E000 */  addu       $a0, $a3, $zero
    /* 55EA4 80065EA4 C6FE000C */  jal        CalcPlrInv__FiUc
    /* 55EA8 80065EA8 01000524 */   addiu     $a1, $zero, 0x1
    /* 55EAC 80065EAC 1000BF8F */  lw         $ra, 0x10($sp)
    /* 55EB0 80065EB0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 55EB4 80065EB4 0800E003 */  jr         $ra
    /* 55EB8 80065EB8 00000000 */   nop
endlabel ModifyPlrStr__Fii
