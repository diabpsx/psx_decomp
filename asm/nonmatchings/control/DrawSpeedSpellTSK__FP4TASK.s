.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawSpeedSpellTSK__FP4TASK, 0x130

glabel DrawSpeedSpellTSK__FP4TASK
    /* 20ED4 80030ED4 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 20ED8 80030ED8 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 20EDC 80030EDC 01001324 */  addiu      $s3, $zero, 0x1
    /* 20EE0 80030EE0 2400BFAF */  sw         $ra, 0x24($sp)
    /* 20EE4 80030EE4 2000B4AF */  sw         $s4, 0x20($sp)
    /* 20EE8 80030EE8 1800B2AF */  sw         $s2, 0x18($sp)
    /* 20EEC 80030EEC 1400B1AF */  sw         $s1, 0x14($sp)
    /* 20EF0 80030EF0 1000B0AF */  sw         $s0, 0x10($sp)
    /* 20EF4 80030EF4 1C00828C */  lw         $v0, 0x1C($a0)
    /* 20EF8 80030EF8 00000000 */  nop
    /* 20EFC 80030EFC 0000518C */  lw         $s1, 0x0($v0)
    /* 20F00 80030F00 EE80000C */  jal        TSK_Sleep
    /* 20F04 80030F04 01000424 */   addiu     $a0, $zero, 0x1
    /* 20F08 80030F08 40101100 */  sll        $v0, $s1, 1
    /* 20F0C 80030F0C 21105100 */  addu       $v0, $v0, $s1
    /* 20F10 80030F10 80100200 */  sll        $v0, $v0, 2
    /* 20F14 80030F14 21105100 */  addu       $v0, $v0, $s1
    /* 20F18 80030F18 00110200 */  sll        $v0, $v0, 4
    /* 20F1C 80030F1C 23105100 */  subu       $v0, $v0, $s1
    /* 20F20 80030F20 80100200 */  sll        $v0, $v0, 2
    /* 20F24 80030F24 21105100 */  addu       $v0, $v0, $s1
    /* 20F28 80030F28 C0A00200 */  sll        $s4, $v0, 3
  .L80030F2C:
    /* 20F2C 80030F2C 29006012 */  beqz       $s3, .L80030FD4
    /* 20F30 80030F30 80101100 */   sll       $v0, $s1, 2
    /* 20F34 80030F34 C16E020C */  jal        GLUE_Finished__Fv
    /* 20F38 80030F38 00000000 */   nop
    /* 20F3C 80030F3C 01004238 */  xori       $v0, $v0, 0x1
    /* 20F40 80030F40 24004010 */  beqz       $v0, .L80030FD4
    /* 20F44 80030F44 80101100 */   sll       $v0, $s1, 2
    /* 20F48 80030F48 1280123C */  lui        $s2, %hi(options_pad)
    /* 20F4C 80030F4C 50B2528E */  lw         $s2, %lo(options_pad)($s2)
    /* 20F50 80030F50 1280033C */  lui        $v1, %hi(invflag)
    /* 20F54 80030F54 2CC36390 */  lbu        $v1, %lo(invflag)($v1)
    /* 20F58 80030F58 400F8293 */  lbu        $v0, %gp_rel(chrflag)($gp)
    /* 20F5C 80030F5C 460F9093 */  lbu        $s0, %gp_rel(sbookflag)($gp)
    /* 20F60 80030F60 25186200 */  or         $v1, $v1, $v0
    /* 20F64 80030F64 1280023C */  lui        $v0, %hi(questlog)
    /* 20F68 80030F68 29BA4290 */  lbu        $v0, %lo(questlog)($v0)
    /* 20F6C 80030F6C 1280013C */  lui        $at, %hi(options_pad)
    /* 20F70 80030F70 50B231AC */  sw         $s1, %lo(options_pad)($at)
    /* 20F74 80030F74 25104300 */  or         $v0, $v0, $v1
    /* 20F78 80030F78 DB8C020C */  jal        SelectorActive__Fv
    /* 20F7C 80030F7C 25800202 */   or        $s0, $s0, $v0
    /* 20F80 80030F80 25800202 */  or         $s0, $s0, $v0
    /* 20F84 80030F84 07000016 */  bnez       $s0, .L80030FA4
    /* 20F88 80030F88 03002426 */   addiu     $a0, $s1, 0x3
    /* 20F8C 80030F8C 21280000 */  addu       $a1, $zero, $zero
    /* 20F90 80030F90 21300000 */  addu       $a2, $zero, $zero
    /* 20F94 80030F94 53EB010C */  jal        PostGamePad__Fiiii
    /* 20F98 80030F98 21380000 */   addu      $a3, $zero, $zero
    /* 20F9C 80030F9C 2EC4000C */  jal        DrawSpellList__Fv
    /* 20FA0 80030FA0 00000000 */   nop
  .L80030FA4:
    /* 20FA4 80030FA4 1280013C */  lui        $at, %hi(options_pad)
    /* 20FA8 80030FA8 50B232AC */  sw         $s2, %lo(options_pad)($at)
    /* 20FAC 80030FAC EE80000C */  jal        TSK_Sleep
    /* 20FB0 80030FB0 01000424 */   addiu     $a0, $zero, 0x1
    /* 20FB4 80030FB4 0E80013C */  lui        $at, %hi(plr + 0x1D)
    /* 20FB8 80030FB8 21083400 */  addu       $at, $at, $s4
    /* 20FBC 80030FBC 55A52290 */  lbu        $v0, %lo(plr + 0x1D)($at)
    /* 20FC0 80030FC0 00000000 */  nop
    /* 20FC4 80030FC4 D9FF4014 */  bnez       $v0, .L80030F2C
    /* 20FC8 80030FC8 00000000 */   nop
    /* 20FCC 80030FCC CBC30008 */  j          .L80030F2C
    /* 20FD0 80030FD0 21980000 */   addu      $s3, $zero, $zero
  .L80030FD4:
    /* 20FD4 80030FD4 1280013C */  lui        $at, %hi(_spselflag)
    /* 20FD8 80030FD8 21082200 */  addu       $at, $at, $v0
    /* 20FDC 80030FDC 50B620AC */  sw         $zero, %lo(_spselflag)($at)
    /* 20FE0 80030FE0 2400BF8F */  lw         $ra, 0x24($sp)
    /* 20FE4 80030FE4 2000B48F */  lw         $s4, 0x20($sp)
    /* 20FE8 80030FE8 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 20FEC 80030FEC 1800B28F */  lw         $s2, 0x18($sp)
    /* 20FF0 80030FF0 1400B18F */  lw         $s1, 0x14($sp)
    /* 20FF4 80030FF4 1000B08F */  lw         $s0, 0x10($sp)
    /* 20FF8 80030FF8 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 20FFC 80030FFC 0800E003 */  jr         $ra
    /* 21000 80031000 00000000 */   nop
endlabel DrawSpeedSpellTSK__FP4TASK
