.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitDrunk__Fv, 0x134

glabel InitDrunk__Fv
    /* 2AC0C 8003AC0C D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 2AC10 8003AC10 60000524 */  addiu      $a1, $zero, 0x60
    /* 2AC14 8003AC14 01000624 */  addiu      $a2, $zero, 0x1
    /* 2AC18 8003AC18 05000724 */  addiu      $a3, $zero, 0x5
    /* 2AC1C 8003AC1C 9C10848F */  lw         $a0, %gp_rel(numtowners)($gp)
    /* 2AC20 8003AC20 47000224 */  addiu      $v0, $zero, 0x47
    /* 2AC24 8003AC24 1000A2AF */  sw         $v0, 0x10($sp)
    /* 2AC28 8003AC28 54000224 */  addiu      $v0, $zero, 0x54
    /* 2AC2C 8003AC2C 1400A2AF */  sw         $v0, 0x14($sp)
    /* 2AC30 8003AC30 04000224 */  addiu      $v0, $zero, 0x4
    /* 2AC34 8003AC34 1800A2AF */  sw         $v0, 0x18($sp)
    /* 2AC38 8003AC38 0A000224 */  addiu      $v0, $zero, 0xA
    /* 2AC3C 8003AC3C 2000BFAF */  sw         $ra, 0x20($sp)
    /* 2AC40 8003AC40 13E8000C */  jal        InitTownerInfo__FilUciiici
    /* 2AC44 8003AC44 1C00A2AF */   sw        $v0, 0x1C($sp)
    /* 2AC48 8003AC48 9C10848F */  lw         $a0, %gp_rel(numtowners)($gp)
    /* 2AC4C 8003AC4C 69E8000C */  jal        InitQstSnds__Fi
    /* 2AC50 8003AC50 00000000 */   nop
    /* 2AC54 8003AC54 1180043C */  lui        $a0, %hi(D_80111298)
    /* 2AC58 8003AC58 98128424 */  addiu      $a0, $a0, %lo(D_80111298)
    /* 2AC5C 8003AC5C 0BF7000C */  jal        LoadFileInMem__FPCcPUl
    /* 2AC60 8003AC60 21280000 */   addu      $a1, $zero, $zero
    /* 2AC64 8003AC64 9C10848F */  lw         $a0, %gp_rel(numtowners)($gp)
    /* 2AC68 8003AC68 21280000 */  addu       $a1, $zero, $zero
    /* 2AC6C 8003AC6C 40180400 */  sll        $v1, $a0, 1
    /* 2AC70 8003AC70 21186400 */  addu       $v1, $v1, $a0
    /* 2AC74 8003AC74 00190300 */  sll        $v1, $v1, 4
    /* 2AC78 8003AC78 21186400 */  addu       $v1, $v1, $a0
    /* 2AC7C 8003AC7C 80180300 */  sll        $v1, $v1, 2
    /* 2AC80 8003AC80 21206000 */  addu       $a0, $v1, $zero
    /* 2AC84 8003AC84 0D80033C */  lui        $v1, %hi(towner + 0x9C)
    /* 2AC88 8003AC88 1CFF6324 */  addiu      $v1, $v1, %lo(towner + 0x9C)
    /* 2AC8C 8003AC8C 21188300 */  addu       $v1, $a0, $v1
    /* 2AC90 8003AC90 0D80013C */  lui        $at, %hi(towner + 0xC0)
    /* 2AC94 8003AC94 21082400 */  addu       $at, $at, $a0
    /* 2AC98 8003AC98 40FF22AC */  sw         $v0, %lo(towner + 0xC0)($at)
  .L8003AC9C:
    /* 2AC9C 8003AC9C 0D80013C */  lui        $at, %hi(towner + 0xC0)
    /* 2ACA0 8003ACA0 21082400 */  addu       $at, $at, $a0
    /* 2ACA4 8003ACA4 40FF228C */  lw         $v0, %lo(towner + 0xC0)($at)
    /* 2ACA8 8003ACA8 0100A524 */  addiu      $a1, $a1, 0x1
    /* 2ACAC 8003ACAC 000062AC */  sw         $v0, 0x0($v1)
    /* 2ACB0 8003ACB0 0800A228 */  slti       $v0, $a1, 0x8
    /* 2ACB4 8003ACB4 F9FF4014 */  bnez       $v0, .L8003AC9C
    /* 2ACB8 8003ACB8 04006324 */   addiu     $v1, $v1, 0x4
    /* 2ACBC 8003ACBC 12000624 */  addiu      $a2, $zero, 0x12
    /* 2ACC0 8003ACC0 9C10848F */  lw         $a0, %gp_rel(numtowners)($gp)
    /* 2ACC4 8003ACC4 00000000 */  nop
    /* 2ACC8 8003ACC8 40100400 */  sll        $v0, $a0, 1
    /* 2ACCC 8003ACCC 21104400 */  addu       $v0, $v0, $a0
    /* 2ACD0 8003ACD0 00110200 */  sll        $v0, $v0, 4
    /* 2ACD4 8003ACD4 21104400 */  addu       $v0, $v0, $a0
    /* 2ACD8 8003ACD8 80100200 */  sll        $v0, $v0, 2
    /* 2ACDC 8003ACDC 0D80013C */  lui        $at, %hi(towner + 0x9C)
    /* 2ACE0 8003ACE0 21082200 */  addu       $at, $at, $v0
    /* 2ACE4 8003ACE4 1CFF258C */  lw         $a1, %lo(towner + 0x9C)($at)
    /* 2ACE8 8003ACE8 12000324 */  addiu      $v1, $zero, 0x12
    /* 2ACEC 8003ACEC 0D80013C */  lui        $at, %hi(towner + 0xBC)
    /* 2ACF0 8003ACF0 21082200 */  addu       $at, $at, $v0
    /* 2ACF4 8003ACF4 3CFF23AC */  sw         $v1, %lo(towner + 0xBC)($at)
    /* 2ACF8 8003ACF8 FFE7000C */  jal        NewTownerAnim__FiPUcii
    /* 2ACFC 8003ACFC 03000724 */   addiu     $a3, $zero, 0x3
    /* 2AD00 8003AD00 9C10848F */  lw         $a0, %gp_rel(numtowners)($gp)
    /* 2AD04 8003AD04 3E010324 */  addiu      $v1, $zero, 0x13E
    /* 2AD08 8003AD08 40100400 */  sll        $v0, $a0, 1
    /* 2AD0C 8003AD0C 21104400 */  addu       $v0, $v0, $a0
    /* 2AD10 8003AD10 00110200 */  sll        $v0, $v0, 4
    /* 2AD14 8003AD14 21104400 */  addu       $v0, $v0, $a0
    /* 2AD18 8003AD18 80100200 */  sll        $v0, $v0, 2
    /* 2AD1C 8003AD1C 01008424 */  addiu      $a0, $a0, 0x1
    /* 2AD20 8003AD20 0D80013C */  lui        $at, %hi(towner + 0x98)
    /* 2AD24 8003AD24 21082200 */  addu       $at, $at, $v0
    /* 2AD28 8003AD28 18FF23AC */  sw         $v1, %lo(towner + 0x98)($at)
    /* 2AD2C 8003AD2C 9C1084AF */  sw         $a0, %gp_rel(numtowners)($gp)
    /* 2AD30 8003AD30 2000BF8F */  lw         $ra, 0x20($sp)
    /* 2AD34 8003AD34 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 2AD38 8003AD38 0800E003 */  jr         $ra
    /* 2AD3C 8003AD3C 00000000 */   nop
endlabel InitDrunk__Fv
