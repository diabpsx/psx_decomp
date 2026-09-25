.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GamePadTask__FP4TASK, 0xF8

glabel GamePadTask__FP4TASK
    /* 6AC34 8007AC34 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 6AC38 8007AC38 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 6AC3C 8007AC3C 01001324 */  addiu      $s3, $zero, 0x1
    /* 6AC40 8007AC40 2000BFAF */  sw         $ra, 0x20($sp)
    /* 6AC44 8007AC44 1800B2AF */  sw         $s2, 0x18($sp)
    /* 6AC48 8007AC48 1400B1AF */  sw         $s1, 0x14($sp)
    /* 6AC4C 8007AC4C 1000B0AF */  sw         $s0, 0x10($sp)
  .L8007AC50:
    /* 6AC50 8007AC50 1280123C */  lui        $s2, %hi(sel_data)
    /* 6AC54 8007AC54 2CB7528E */  lw         $s2, %lo(sel_data)($s2)
    /* 6AC58 8007AC58 1280113C */  lui        $s1, %hi(myplr)
    /* 6AC5C 8007AC5C 08BA318E */  lw         $s1, %lo(myplr)($s1)
    /* 6AC60 8007AC60 C16E020C */  jal        GLUE_Finished__Fv
    /* 6AC64 8007AC64 21800000 */   addu      $s0, $zero, $zero
    /* 6AC68 8007AC68 0E004014 */  bnez       $v0, .L8007ACA4
    /* 6AC6C 8007AC6C 00000000 */   nop
    /* 6AC70 8007AC70 1280023C */  lui        $v0, %hi(CDWAIT)
    /* 6AC74 8007AC74 ECAD428C */  lw         $v0, %lo(CDWAIT)($v0)
    /* 6AC78 8007AC78 00000000 */  nop
    /* 6AC7C 8007AC7C 09004014 */  bnez       $v0, .L8007ACA4
    /* 6AC80 8007AC80 00000000 */   nop
    /* 6AC84 8007AC84 1280023C */  lui        $v0, %hi(demo_finish)
    /* 6AC88 8007AC88 BCAB428C */  lw         $v0, %lo(demo_finish)($v0)
    /* 6AC8C 8007AC8C 00000000 */  nop
    /* 6AC90 8007AC90 04004014 */  bnez       $v0, .L8007ACA4
    /* 6AC94 8007AC94 00000000 */   nop
    /* 6AC98 8007AC98 7708020C */  jal        IS_GameOver__Fv
    /* 6AC9C 8007AC9C 00000000 */   nop
    /* 6ACA0 8007ACA0 0100502C */  sltiu      $s0, $v0, 0x1
  .L8007ACA4:
    /* 6ACA4 8007ACA4 11000012 */  beqz       $s0, .L8007ACEC
    /* 6ACA8 8007ACA8 00000000 */   nop
    /* 6ACAC 8007ACAC 1380043C */  lui        $a0, %hi(D_8012FC48)
    /* 6ACB0 8007ACB0 48FC8424 */  addiu      $a0, $a0, %lo(D_8012FC48)
    /* 6ACB4 8007ACB4 1280013C */  lui        $at, %hi(sel_data)
    /* 6ACB8 8007ACB8 2CB733AC */  sw         $s3, %lo(sel_data)($at)
    /* 6ACBC 8007ACBC 1280013C */  lui        $at, %hi(myplr)
    /* 6ACC0 8007ACC0 08BA33AC */  sw         $s3, %lo(myplr)($at)
    /* 6ACC4 8007ACC4 5EE9010C */  jal        Handle__7GamePad
    /* 6ACC8 8007ACC8 00000000 */   nop
    /* 6ACCC 8007ACCC 1380043C */  lui        $a0, %hi(D_8012FB68)
    /* 6ACD0 8007ACD0 68FB8424 */  addiu      $a0, $a0, %lo(D_8012FB68)
    /* 6ACD4 8007ACD4 1280013C */  lui        $at, %hi(sel_data)
    /* 6ACD8 8007ACD8 2CB720AC */  sw         $zero, %lo(sel_data)($at)
    /* 6ACDC 8007ACDC 1280013C */  lui        $at, %hi(myplr)
    /* 6ACE0 8007ACE0 08BA20AC */  sw         $zero, %lo(myplr)($at)
    /* 6ACE4 8007ACE4 5EE9010C */  jal        Handle__7GamePad
    /* 6ACE8 8007ACE8 00000000 */   nop
  .L8007ACEC:
    /* 6ACEC 8007ACEC 1280013C */  lui        $at, %hi(myplr)
    /* 6ACF0 8007ACF0 08BA31AC */  sw         $s1, %lo(myplr)($at)
    /* 6ACF4 8007ACF4 1280013C */  lui        $at, %hi(sel_data)
    /* 6ACF8 8007ACF8 2CB732AC */  sw         $s2, %lo(sel_data)($at)
    /* 6ACFC 8007ACFC EE80000C */  jal        TSK_Sleep
    /* 6AD00 8007AD00 01000424 */   addiu     $a0, $zero, 0x1
    /* 6AD04 8007AD04 14EB0108 */  j          .L8007AC50
    /* 6AD08 8007AD08 00000000 */   nop
    /* 6AD0C 8007AD0C 2000BF8F */  lw         $ra, 0x20($sp)
    /* 6AD10 8007AD10 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 6AD14 8007AD14 1800B28F */  lw         $s2, 0x18($sp)
    /* 6AD18 8007AD18 1400B18F */  lw         $s1, 0x14($sp)
    /* 6AD1C 8007AD1C 1000B08F */  lw         $s0, 0x10($sp)
    /* 6AD20 8007AD20 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 6AD24 8007AD24 0800E003 */  jr         $ra
    /* 6AD28 8007AD28 00000000 */   nop
endlabel GamePadTask__FP4TASK
