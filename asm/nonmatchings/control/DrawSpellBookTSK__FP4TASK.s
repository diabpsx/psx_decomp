.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawSpellBookTSK__FP4TASK, 0x190

glabel DrawSpellBookTSK__FP4TASK
    /* 20D44 80030D44 1280023C */  lui        $v0, %hi(Qfromoptions)
    /* 20D48 80030D48 28B24290 */  lbu        $v0, %lo(Qfromoptions)($v0)
    /* 20D4C 80030D4C D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 20D50 80030D50 1400B1AF */  sw         $s1, 0x14($sp)
    /* 20D54 80030D54 03001124 */  addiu      $s1, $zero, 0x3
    /* 20D58 80030D58 2000BFAF */  sw         $ra, 0x20($sp)
    /* 20D5C 80030D5C 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 20D60 80030D60 1800B2AF */  sw         $s2, 0x18($sp)
    /* 20D64 80030D64 0A004014 */  bnez       $v0, .L80030D90
    /* 20D68 80030D68 1000B0AF */   sw        $s0, 0x10($sp)
    /* 20D6C 80030D6C 02000424 */  addiu      $a0, $zero, 0x2
    /* 20D70 80030D70 21280000 */  addu       $a1, $zero, $zero
    /* 20D74 80030D74 21300000 */  addu       $a2, $zero, $zero
    /* 20D78 80030D78 53EB010C */  jal        PostGamePad__Fiiii
    /* 20D7C 80030D7C 21380000 */   addu      $a3, $zero, $zero
    /* 20D80 80030D80 D7F3000C */  jal        stream_stop__Fv
    /* 20D84 80030D84 00000000 */   nop
    /* 20D88 80030D88 896E020C */  jal        GLUE_SuspendGame__Fv
    /* 20D8C 80030D8C 00000000 */   nop
  .L80030D90:
    /* 20D90 80030D90 EEF3000C */  jal        stream_pause__Fv
    /* 20D94 80030D94 00000000 */   nop
    /* 20D98 80030D98 1280023C */  lui        $v0, %hi(Qfromoptions)
    /* 20D9C 80030D9C 28B24290 */  lbu        $v0, %lo(Qfromoptions)($v0)
    /* 20DA0 80030DA0 00000000 */  nop
    /* 20DA4 80030DA4 0B004014 */  bnez       $v0, .L80030DD4
    /* 20DA8 80030DA8 00000000 */   nop
    /* 20DAC 80030DAC 01001024 */  addiu      $s0, $zero, 0x1
    /* 20DB0 80030DB0 01001324 */  addiu      $s3, $zero, 0x1
    /* 20DB4 80030DB4 FFFF1224 */  addiu      $s2, $zero, -0x1
  .L80030DB8:
    /* 20DB8 80030DB8 1280013C */  lui        $at, %hi(ignore_buttons)
    /* 20DBC 80030DBC D0BB33AC */  sw         $s3, %lo(ignore_buttons)($at)
    /* 20DC0 80030DC0 EE80000C */  jal        TSK_Sleep
    /* 20DC4 80030DC4 01000424 */   addiu     $a0, $zero, 0x1
    /* 20DC8 80030DC8 FFFF1026 */  addiu      $s0, $s0, -0x1
    /* 20DCC 80030DCC FAFF1216 */  bne        $s0, $s2, .L80030DB8
    /* 20DD0 80030DD0 00000000 */   nop
  .L80030DD4:
    /* 20DD4 80030DD4 460F8293 */  lbu        $v0, %gp_rel(sbookflag)($gp)
    /* 20DD8 80030DD8 00000000 */  nop
    /* 20DDC 80030DDC 15004010 */  beqz       $v0, .L80030E34
    /* 20DE0 80030DE0 00000000 */   nop
    /* 20DE4 80030DE4 1280023C */  lui        $v0, %hi(options_pad)
    /* 20DE8 80030DE8 50B2428C */  lw         $v0, %lo(options_pad)($v0)
    /* 20DEC 80030DEC 00000000 */  nop
    /* 20DF0 80030DF0 10004004 */  bltz       $v0, .L80030E34
    /* 20DF4 80030DF4 00000000 */   nop
    /* 20DF8 80030DF8 1280103C */  lui        $s0, %hi(myplr)
    /* 20DFC 80030DFC 08BA108E */  lw         $s0, %lo(myplr)($s0)
    /* 20E00 80030E00 1280013C */  lui        $at, %hi(myplr)
    /* 20E04 80030E04 08BA22AC */  sw         $v0, %lo(myplr)($at)
    /* 20E08 80030E08 B6D9000C */  jal        DrawSpellBook__Fb
    /* 20E0C 80030E0C 0100242E */   sltiu     $a0, $s1, 0x1
    /* 20E10 80030E10 02002012 */  beqz       $s1, .L80030E1C
    /* 20E14 80030E14 00000000 */   nop
    /* 20E18 80030E18 FFFF3126 */  addiu      $s1, $s1, -0x1
  .L80030E1C:
    /* 20E1C 80030E1C 1280013C */  lui        $at, %hi(myplr)
    /* 20E20 80030E20 08BA30AC */  sw         $s0, %lo(myplr)($at)
    /* 20E24 80030E24 EE80000C */  jal        TSK_Sleep
    /* 20E28 80030E28 01000424 */   addiu     $a0, $zero, 0x1
    /* 20E2C 80030E2C 75C30008 */  j          .L80030DD4
    /* 20E30 80030E30 00000000 */   nop
  .L80030E34:
    /* 20E34 80030E34 C6F5000C */  jal        PlaySFX__Fi
    /* 20E38 80030E38 33000424 */   addiu     $a0, $zero, 0x33
    /* 20E3C 80030E3C 1280023C */  lui        $v0, %hi(Qfromoptions)
    /* 20E40 80030E40 28B24290 */  lbu        $v0, %lo(Qfromoptions)($v0)
    /* 20E44 80030E44 00000000 */  nop
    /* 20E48 80030E48 11004014 */  bnez       $v0, .L80030E90
    /* 20E4C 80030E4C 05000424 */   addiu     $a0, $zero, 0x5
    /* 20E50 80030E50 21280000 */  addu       $a1, $zero, $zero
    /* 20E54 80030E54 21300000 */  addu       $a2, $zero, $zero
    /* 20E58 80030E58 53EB010C */  jal        PostGamePad__Fiiii
    /* 20E5C 80030E5C 21380000 */   addu      $a3, $zero, $zero
    /* 20E60 80030E60 07F4000C */  jal        stream_resume__Fv
    /* 20E64 80030E64 00000000 */   nop
    /* 20E68 80030E68 9E6E020C */  jal        GLUE_ResumeGame__Fv
    /* 20E6C 80030E6C 00000000 */   nop
    /* 20E70 80030E70 EC6E020C */  jal        GLUE_SetShowPanelFlag__Fb
    /* 20E74 80030E74 01000424 */   addiu     $a0, $zero, 0x1
    /* 20E78 80030E78 E16E020C */  jal        GLUE_SetShowGameScreenFlag__Fb
    /* 20E7C 80030E7C 01000424 */   addiu     $a0, $zero, 0x1
    /* 20E80 80030E80 E86E020C */  jal        GLUE_SetHomingScrollFlag__Fb
    /* 20E84 80030E84 01000424 */   addiu     $a0, $zero, 0x1
    /* 20E88 80030E88 ADC30008 */  j          .L80030EB4
    /* 20E8C 80030E8C 00000000 */   nop
  .L80030E90:
    /* 20E90 80030E90 E16E020C */  jal        GLUE_SetShowGameScreenFlag__Fb
    /* 20E94 80030E94 01000424 */   addiu     $a0, $zero, 0x1
    /* 20E98 80030E98 EE80000C */  jal        TSK_Sleep
    /* 20E9C 80030E9C 01000424 */   addiu     $a0, $zero, 0x1
    /* 20EA0 80030EA0 04000224 */  addiu      $v0, $zero, 0x4
    /* 20EA4 80030EA4 1280013C */  lui        $at, %hi(Qfromoptions)
    /* 20EA8 80030EA8 28B222A0 */  sb         $v0, %lo(Qfromoptions)($at)
    /* 20EAC 80030EAC 73AA020C */  jal        ToggleOptions__Fv
    /* 20EB0 80030EB0 00000000 */   nop
  .L80030EB4:
    /* 20EB4 80030EB4 2000BF8F */  lw         $ra, 0x20($sp)
    /* 20EB8 80030EB8 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 20EBC 80030EBC 1800B28F */  lw         $s2, 0x18($sp)
    /* 20EC0 80030EC0 1400B18F */  lw         $s1, 0x14($sp)
    /* 20EC4 80030EC4 1000B08F */  lw         $s0, 0x10($sp)
    /* 20EC8 80030EC8 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 20ECC 80030ECC 0800E003 */  jr         $ra
    /* 20ED0 80030ED0 00000000 */   nop
endlabel DrawSpellBookTSK__FP4TASK
