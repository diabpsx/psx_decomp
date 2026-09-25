.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching pad_func_select__Fi, 0xC4

glabel pad_func_select__Fi
    /* 90D98 800A0D98 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 90D9C 800A0D9C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 90DA0 800A0DA0 21808000 */  addu       $s0, $a0, $zero
    /* 90DA4 800A0DA4 1280023C */  lui        $v0, %hi(stextflag)
    /* 90DA8 800A0DA8 E0BA4280 */  lb         $v0, %lo(stextflag)($v0)
    /* 90DAC 800A0DAC 1280033C */  lui        $v1, %hi(qtextflag)
    /* 90DB0 800A0DB0 60B96390 */  lbu        $v1, %lo(qtextflag)($v1)
    /* 90DB4 800A0DB4 1280043C */  lui        $a0, %hi(_spselflag + 0x4)
    /* 90DB8 800A0DB8 54B6848C */  lw         $a0, %lo(_spselflag + 0x4)($a0)
    /* 90DBC 800A0DBC 25104300 */  or         $v0, $v0, $v1
    /* 90DC0 800A0DC0 1280033C */  lui        $v1, %hi(_spselflag)
    /* 90DC4 800A0DC4 50B6638C */  lw         $v1, %lo(_spselflag)($v1)
    /* 90DC8 800A0DC8 1400BFAF */  sw         $ra, 0x14($sp)
    /* 90DCC 800A0DCC 25104300 */  or         $v0, $v0, $v1
    /* 90DD0 800A0DD0 25104400 */  or         $v0, $v0, $a0
    /* 90DD4 800A0DD4 1280033C */  lui        $v1, %hi(sbookflag)
    /* 90DD8 800A0DD8 C6B66390 */  lbu        $v1, %lo(sbookflag)($v1)
    /* 90DDC 800A0DDC 1280043C */  lui        $a0, %hi(invflag)
    /* 90DE0 800A0DE0 2CC38490 */  lbu        $a0, %lo(invflag)($a0)
    /* 90DE4 800A0DE4 25104300 */  or         $v0, $v0, $v1
    /* 90DE8 800A0DE8 25104400 */  or         $v0, $v0, $a0
    /* 90DEC 800A0DEC 1280033C */  lui        $v1, %hi(questlog)
    /* 90DF0 800A0DF0 29BA6390 */  lbu        $v1, %lo(questlog)($v1)
    /* 90DF4 800A0DF4 1280043C */  lui        $a0, %hi(chrflag)
    /* 90DF8 800A0DF8 C0B68490 */  lbu        $a0, %lo(chrflag)($a0)
    /* 90DFC 800A0DFC 25104300 */  or         $v0, $v0, $v1
    /* 90E00 800A0E00 25104400 */  or         $v0, $v0, $a0
    /* 90E04 800A0E04 10004014 */  bnez       $v0, .L800A0E48
    /* 90E08 800A0E08 00000000 */   nop
    /* 90E0C 800A0E0C 73AA020C */  jal        ToggleOptions__Fv
    /* 90E10 800A0E10 00000000 */   nop
    /* 90E14 800A0E14 1280023C */  lui        $v0, %hi(optionsflag)
    /* 90E18 800A0E18 48B2428C */  lw         $v0, %lo(optionsflag)($v0)
    /* 90E1C 800A0E1C 00000000 */  nop
    /* 90E20 800A0E20 07004010 */  beqz       $v0, .L800A0E40
    /* 90E24 800A0E24 FFFF0224 */   addiu     $v0, $zero, -0x1
    /* 90E28 800A0E28 C6F5000C */  jal        PlaySFX__Fi
    /* 90E2C 800A0E2C 33000424 */   addiu     $a0, $zero, 0x33
    /* 90E30 800A0E30 1280013C */  lui        $at, %hi(options_pad)
    /* 90E34 800A0E34 50B230AC */  sw         $s0, %lo(options_pad)($at)
    /* 90E38 800A0E38 92830208 */  j          .L800A0E48
    /* 90E3C 800A0E3C 00000000 */   nop
  .L800A0E40:
    /* 90E40 800A0E40 1280013C */  lui        $at, %hi(options_pad)
    /* 90E44 800A0E44 50B222AC */  sw         $v0, %lo(options_pad)($at)
  .L800A0E48:
    /* 90E48 800A0E48 1400BF8F */  lw         $ra, 0x14($sp)
    /* 90E4C 800A0E4C 1000B08F */  lw         $s0, 0x10($sp)
    /* 90E50 800A0E50 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 90E54 800A0E54 0800E003 */  jr         $ra
    /* 90E58 800A0E58 00000000 */   nop
endlabel pad_func_select__Fi
