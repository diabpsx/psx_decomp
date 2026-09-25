.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching pad_func_Chr__Fi, 0x134

glabel pad_func_Chr__Fi
    /* 91FE0 800A1FE0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 91FE4 800A1FE4 1000B0AF */  sw         $s0, 0x10($sp)
    /* 91FE8 800A1FE8 21808000 */  addu       $s0, $a0, $zero
    /* 91FEC 800A1FEC 1280023C */  lui        $v0, %hi(invflag)
    /* 91FF0 800A1FF0 2CC34290 */  lbu        $v0, %lo(invflag)($v0)
    /* 91FF4 800A1FF4 1280033C */  lui        $v1, %hi(stextflag)
    /* 91FF8 800A1FF8 E0BA6380 */  lb         $v1, %lo(stextflag)($v1)
    /* 91FFC 800A1FFC 1280043C */  lui        $a0, %hi(qtextflag)
    /* 92000 800A2000 60B98490 */  lbu        $a0, %lo(qtextflag)($a0)
    /* 92004 800A2004 1400BFAF */  sw         $ra, 0x14($sp)
    /* 92008 800A2008 25104300 */  or         $v0, $v0, $v1
    /* 9200C 800A200C 25104400 */  or         $v0, $v0, $a0
    /* 92010 800A2010 1280033C */  lui        $v1, %hi(_spselflag)
    /* 92014 800A2014 50B6638C */  lw         $v1, %lo(_spselflag)($v1)
    /* 92018 800A2018 1280043C */  lui        $a0, %hi(_spselflag + 0x4)
    /* 9201C 800A201C 54B6848C */  lw         $a0, %lo(_spselflag + 0x4)($a0)
    /* 92020 800A2020 25104300 */  or         $v0, $v0, $v1
    /* 92024 800A2024 25104400 */  or         $v0, $v0, $a0
    /* 92028 800A2028 1280033C */  lui        $v1, %hi(sbookflag)
    /* 9202C 800A202C C6B66390 */  lbu        $v1, %lo(sbookflag)($v1)
    /* 92030 800A2030 1280043C */  lui        $a0, %hi(questlog)
    /* 92034 800A2034 29BA8490 */  lbu        $a0, %lo(questlog)($a0)
    /* 92038 800A2038 25104300 */  or         $v0, $v0, $v1
    /* 9203C 800A203C 25104400 */  or         $v0, $v0, $a0
    /* 92040 800A2040 1280033C */  lui        $v1, %hi(optionsflag)
    /* 92044 800A2044 48B2638C */  lw         $v1, %lo(optionsflag)($v1)
    /* 92048 800A2048 1280013C */  lui        $at, %hi(_SpdBeltSelFlag)
    /* 9204C 800A204C 21083000 */  addu       $at, $at, $s0
    /* 92050 800A2050 C4BB2490 */  lbu        $a0, %lo(_SpdBeltSelFlag)($at)
    /* 92054 800A2054 25104300 */  or         $v0, $v0, $v1
    /* 92058 800A2058 25104400 */  or         $v0, $v0, $a0
    /* 9205C 800A205C 28004014 */  bnez       $v0, .L800A2100
    /* 92060 800A2060 00000000 */   nop
    /* 92064 800A2064 1280023C */  lui        $v0, %hi(chrflag)
    /* 92068 800A2068 C0B64290 */  lbu        $v0, %lo(chrflag)($v0)
    /* 9206C 800A206C 00000000 */  nop
    /* 92070 800A2070 01004238 */  xori       $v0, $v0, 0x1
    /* 92074 800A2074 1280013C */  lui        $at, %hi(chrflag)
    /* 92078 800A2078 C0B622A0 */  sb         $v0, %lo(chrflag)($at)
    /* 9207C 800A207C 19004010 */  beqz       $v0, .L800A20E4
    /* 92080 800A2080 FFFF0224 */   addiu     $v0, $zero, -0x1
    /* 92084 800A2084 03000212 */  beq        $s0, $v0, .L800A2094
    /* 92088 800A2088 00000000 */   nop
    /* 9208C 800A208C C6F5000C */  jal        PlaySFX__Fi
    /* 92090 800A2090 33000424 */   addiu     $a0, $zero, 0x33
  .L800A2094:
    /* 92094 800A2094 E385020C */  jal        RemoveTargetCursor__Fi
    /* 92098 800A2098 21200002 */   addu      $a0, $s0, $zero
    /* 9209C 800A209C 02000424 */  addiu      $a0, $zero, 0x2
    /* 920A0 800A20A0 21280000 */  addu       $a1, $zero, $zero
    /* 920A4 800A20A4 21300000 */  addu       $a2, $zero, $zero
    /* 920A8 800A20A8 01000224 */  addiu      $v0, $zero, 0x1
    /* 920AC 800A20AC 1280013C */  lui        $at, %hi(initchr)
    /* 920B0 800A20B0 6CB622AC */  sw         $v0, %lo(initchr)($at)
    /* 920B4 800A20B4 1280013C */  lui        $at, %hi(options_pad)
    /* 920B8 800A20B8 50B230AC */  sw         $s0, %lo(options_pad)($at)
    /* 920BC 800A20BC 53EB010C */  jal        PostGamePad__Fiiii
    /* 920C0 800A20C0 21380000 */   addu      $a3, $zero, $zero
    /* 920C4 800A20C4 21200000 */  addu       $a0, $zero, $zero
    /* 920C8 800A20C8 0380053C */  lui        $a1, %hi(DrawChrTSK__FP4TASK)
    /* 920CC 800A20CC 485BA524 */  addiu      $a1, $a1, %lo(DrawChrTSK__FP4TASK)
    /* 920D0 800A20D0 00100624 */  addiu      $a2, $zero, 0x1000
    /* 920D4 800A20D4 0480000C */  jal        TSK_AddTask
    /* 920D8 800A20D8 21380000 */   addu      $a3, $zero, $zero
    /* 920DC 800A20DC 40880208 */  j          .L800A2100
    /* 920E0 800A20E0 00000000 */   nop
  .L800A20E4:
    /* 920E4 800A20E4 C6F5000C */  jal        PlaySFX__Fi
    /* 920E8 800A20E8 33000424 */   addiu     $a0, $zero, 0x33
    /* 920EC 800A20EC 05000424 */  addiu      $a0, $zero, 0x5
    /* 920F0 800A20F0 21280000 */  addu       $a1, $zero, $zero
    /* 920F4 800A20F4 21300000 */  addu       $a2, $zero, $zero
    /* 920F8 800A20F8 53EB010C */  jal        PostGamePad__Fiiii
    /* 920FC 800A20FC 21380000 */   addu      $a3, $zero, $zero
  .L800A2100:
    /* 92100 800A2100 1400BF8F */  lw         $ra, 0x14($sp)
    /* 92104 800A2104 1000B08F */  lw         $s0, 0x10($sp)
    /* 92108 800A2108 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 9210C 800A210C 0800E003 */  jr         $ra
    /* 92110 800A2110 00000000 */   nop
endlabel pad_func_Chr__Fi
