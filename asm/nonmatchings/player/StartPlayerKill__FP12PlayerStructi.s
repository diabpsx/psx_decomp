.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching StartPlayerKill__FP12PlayerStructi, 0x1FC

glabel StartPlayerKill__FP12PlayerStructi
    /* 51948 80061948 1280023C */  lui        $v0, %hi(gbActivePlayers)
    /* 5194C 8006194C A3B94290 */  lbu        $v0, %lo(gbActivePlayers)($v0)
    /* 51950 80061950 68FFBD27 */  addiu      $sp, $sp, -0x98
    /* 51954 80061954 8400B1AF */  sw         $s1, 0x84($sp)
    /* 51958 80061958 21888000 */  addu       $s1, $a0, $zero
    /* 5195C 8006195C 8C00B3AF */  sw         $s3, 0x8C($sp)
    /* 51960 80061960 2198A000 */  addu       $s3, $a1, $zero
    /* 51964 80061964 8800B2AF */  sw         $s2, 0x88($sp)
    /* 51968 80061968 8000B0AF */  sw         $s0, 0x80($sp)
    /* 5196C 8006196C 01001024 */  addiu      $s0, $zero, 0x1
    /* 51970 80061970 9000BFAF */  sw         $ra, 0x90($sp)
    /* 51974 80061974 1280013C */  lui        $at, %hi(automapflag)
    /* 51978 80061978 7BC320A0 */  sb         $zero, %lo(automapflag)($at)
    /* 5197C 8006197C 05005014 */  bne        $v0, $s0, .L80061994
    /* 51980 80061980 21902002 */   addu      $s2, $s1, $zero
    /* 51984 80061984 1280013C */  lui        $at, %hi(automapflag)
    /* 51988 80061988 7BC320A0 */  sb         $zero, %lo(automapflag)($at)
    /* 5198C 8006198C FD22020C */  jal        PA_SetPauseOk__Fb
    /* 51990 80061990 21200000 */   addu      $a0, $zero, $zero
  .L80061994:
    /* 51994 80061994 1C01228E */  lw         $v0, 0x11C($s1)
    /* 51998 80061998 00000000 */  nop
    /* 5199C 8006199C 05004014 */  bnez       $v0, .L800619B4
    /* 519A0 800619A0 08000224 */   addiu     $v0, $zero, 0x8
    /* 519A4 800619A4 0000238E */  lw         $v1, 0x0($s1)
    /* 519A8 800619A8 00000000 */  nop
    /* 519AC 800619AC 5D006210 */  beq        $v1, $v0, .L80061B24
    /* 519B0 800619B0 00000000 */   nop
  .L800619B4:
    /* 519B4 800619B4 F6002382 */  lb         $v1, 0xF6($s1)
    /* 519B8 800619B8 00000000 */  nop
    /* 519BC 800619BC 05006014 */  bnez       $v1, .L800619D4
    /* 519C0 800619C0 0B000424 */   addiu     $a0, $zero, 0xB
    /* 519C4 800619C4 30002586 */  lh         $a1, 0x30($s1)
    /* 519C8 800619C8 32002686 */  lh         $a2, 0x32($s1)
    /* 519CC 800619CC 7F860108 */  j          .L800619FC
    /* 519D0 800619D0 00000000 */   nop
  .L800619D4:
    /* 519D4 800619D4 05007014 */  bne        $v1, $s0, .L800619EC
    /* 519D8 800619D8 02000224 */   addiu     $v0, $zero, 0x2
    /* 519DC 800619DC 30002586 */  lh         $a1, 0x30($s1)
    /* 519E0 800619E0 32002686 */  lh         $a2, 0x32($s1)
    /* 519E4 800619E4 7F860108 */  j          .L800619FC
    /* 519E8 800619E8 AB020424 */   addiu     $a0, $zero, 0x2AB
  .L800619EC:
    /* 519EC 800619EC 05006214 */  bne        $v1, $v0, .L80061A04
    /* 519F0 800619F0 43020424 */   addiu     $a0, $zero, 0x243
    /* 519F4 800619F4 30002586 */  lh         $a1, 0x30($s1)
    /* 519F8 800619F8 32002686 */  lh         $a2, 0x32($s1)
  .L800619FC:
    /* 519FC 800619FC E1F5000C */  jal        PlaySfxLoc__Fiii
    /* 51A00 80061A00 00000000 */   nop
  .L80061A04:
    /* 51A04 80061A04 1280033C */  lui        $v1, %hi(gbActivePlayers)
    /* 51A08 80061A08 A3B96390 */  lbu        $v1, %lo(gbActivePlayers)($v1)
    /* 51A0C 80061A0C 01000224 */  addiu      $v0, $zero, 0x1
    /* 51A10 80061A10 03006214 */  bne        $v1, $v0, .L80061A20
    /* 51A14 80061A14 00000000 */   nop
    /* 51A18 80061A18 E86E020C */  jal        GLUE_SetHomingScrollFlag__Fb
    /* 51A1C 80061A1C 21200000 */   addu      $a0, $zero, $zero
  .L80061A20:
    /* 51A20 80061A20 787F010C */  jal        plrind__FP12PlayerStruct
    /* 51A24 80061A24 21202002 */   addu      $a0, $s1, $zero
    /* 51A28 80061A28 1280033C */  lui        $v1, %hi(_spselflag)
    /* 51A2C 80061A2C 50B66324 */  addiu      $v1, $v1, %lo(_spselflag)
    /* 51A30 80061A30 80100200 */  sll        $v0, $v0, 2
    /* 51A34 80061A34 21804300 */  addu       $s0, $v0, $v1
    /* 51A38 80061A38 0000048E */  lw         $a0, 0x0($s0)
    /* 51A3C 80061A3C 00000000 */  nop
    /* 51A40 80061A40 04008010 */  beqz       $a0, .L80061A54
    /* 51A44 80061A44 01000224 */   addiu     $v0, $zero, 0x1
    /* 51A48 80061A48 5281000C */  jal        TSK_Kill
    /* 51A4C 80061A4C 00000000 */   nop
    /* 51A50 80061A50 01000224 */  addiu      $v0, $zero, 0x1
  .L80061A54:
    /* 51A54 80061A54 000000AE */  sw         $zero, 0x0($s0)
    /* 51A58 80061A58 1280013C */  lui        $at, %hi(PauseMode)
    /* 51A5C 80061A5C A4B722A0 */  sb         $v0, %lo(PauseMode)($at)
    /* 51A60 80061A60 02000424 */  addiu      $a0, $zero, 0x2
  .L80061A64:
    /* 51A64 80061A64 EE80000C */  jal        TSK_Sleep
    /* 51A68 80061A68 00000000 */   nop
    /* 51A6C 80061A6C 1280023C */  lui        $v0, %hi(sghStream)
    /* 51A70 80061A70 34B8428C */  lw         $v0, %lo(sghStream)($v0)
    /* 51A74 80061A74 00000000 */  nop
    /* 51A78 80061A78 FAFF4014 */  bnez       $v0, .L80061A64
    /* 51A7C 80061A7C 01000424 */   addiu     $a0, $zero, 0x1
    /* 51A80 80061A80 1280013C */  lui        $at, %hi(PauseMode)
    /* 51A84 80061A84 A4B720A0 */  sb         $zero, %lo(PauseMode)($at)
    /* 51A88 80061A88 43004282 */  lb         $v0, 0x43($s2)
    /* 51A8C 80061A8C 00000000 */  nop
    /* 51A90 80061A90 05004010 */  beqz       $v0, .L80061AA8
    /* 51A94 80061A94 00000000 */   nop
    /* 51A98 80061A98 21202002 */  addu       $a0, $s1, $zero
    /* 51A9C 80061A9C 430040A2 */  sb         $zero, 0x43($s2)
    /* 51AA0 80061AA0 957F010C */  jal        SetPlrAnims__FP12PlayerStruct
    /* 51AA4 80061AA4 840140AE */   sw        $zero, 0x184($s2)
  .L80061AA8:
    /* 51AA8 80061AA8 21202002 */  addu       $a0, $s1, $zero
    /* 51AAC 80061AAC 01000524 */  addiu      $a1, $zero, 0x1
    /* 51AB0 80061AB0 A801468E */  lw         $a2, 0x1A8($s2)
    /* 51AB4 80061AB4 877F010C */  jal        NewPlrAnim__FP12PlayerStructiii
    /* 51AB8 80061AB8 01000724 */   addiu     $a3, $zero, 0x1
    /* 51ABC 80061ABC 21202002 */  addu       $a0, $s1, $zero
    /* 51AC0 80061AC0 21280000 */  addu       $a1, $zero, $zero
    /* 51AC4 80061AC4 08000224 */  addiu      $v0, $zero, 0x8
    /* 51AC8 80061AC8 01001024 */  addiu      $s0, $zero, 0x1
    /* 51ACC 80061ACC 000042AE */  sw         $v0, 0x0($s2)
    /* 51AD0 80061AD0 D20040A2 */  sb         $zero, 0xD2($s2)
    /* 51AD4 80061AD4 5A98010C */  jal        SetPlayerHitPoints__FP12PlayerStructi
    /* 51AD8 80061AD8 D30050A2 */   sb        $s0, 0xD3($s2)
    /* 51ADC 80061ADC 21202002 */  addu       $a0, $s1, $zero
    /* 51AE0 80061AE0 1280033C */  lui        $v1, %hi(currlevel)
    /* 51AE4 80061AE4 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 51AE8 80061AE8 01000224 */  addiu      $v0, $zero, 0x1
    /* 51AEC 80061AEC 640142A6 */  sh         $v0, 0x164($s2)
    /* 51AF0 80061AF0 7F83010C */  jal        SetPlayerOld__FP12PlayerStruct
    /* 51AF4 80061AF4 5A0043A2 */   sb        $v1, 0x5A($s2)
    /* 51AF8 80061AF8 1280013C */  lui        $at, %hi(drawhpflag)
    /* 51AFC 80061AFC BEB630A0 */  sb         $s0, %lo(drawhpflag)($at)
    /* 51B00 80061B00 787F010C */  jal        plrind__FP12PlayerStruct
    /* 51B04 80061B04 21202002 */   addu      $a0, $s1, $zero
    /* 51B08 80061B08 21202002 */  addu       $a0, $s1, $zero
    /* 51B0C 80061B0C 1E000324 */  addiu      $v1, $zero, 0x1E
    /* 51B10 80061B10 1280013C */  lui        $at, %hi(D_8011C878)
    /* 51B14 80061B14 21082200 */  addu       $at, $at, $v0
    /* 51B18 80061B18 78C823A0 */  sb         $v1, %lo(D_8011C878)($at)
    /* 51B1C 80061B1C EB85010C */  jal        StartPlayerDropItems__FP12PlayerStructi
    /* 51B20 80061B20 21286002 */   addu      $a1, $s3, $zero
  .L80061B24:
    /* 51B24 80061B24 9000BF8F */  lw         $ra, 0x90($sp)
    /* 51B28 80061B28 8C00B38F */  lw         $s3, 0x8C($sp)
    /* 51B2C 80061B2C 8800B28F */  lw         $s2, 0x88($sp)
    /* 51B30 80061B30 8400B18F */  lw         $s1, 0x84($sp)
    /* 51B34 80061B34 8000B08F */  lw         $s0, 0x80($sp)
    /* 51B38 80061B38 9800BD27 */  addiu      $sp, $sp, 0x98
    /* 51B3C 80061B3C 0800E003 */  jr         $ra
    /* 51B40 80061B40 00000000 */   nop
endlabel StartPlayerKill__FP12PlayerStructi
