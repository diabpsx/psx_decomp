.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitTeller__Fv, 0x134

glabel InitTeller__Fv
    /* 2AAD8 8003AAD8 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 2AADC 8003AADC 60000524 */  addiu      $a1, $zero, 0x60
    /* 2AAE0 8003AAE0 01000624 */  addiu      $a2, $zero, 0x1
    /* 2AAE4 8003AAE4 04000724 */  addiu      $a3, $zero, 0x4
    /* 2AAE8 8003AAE8 9C10848F */  lw         $a0, %gp_rel(numtowners)($gp)
    /* 2AAEC 8003AAEC 3E000224 */  addiu      $v0, $zero, 0x3E
    /* 2AAF0 8003AAF0 1000A2AF */  sw         $v0, 0x10($sp)
    /* 2AAF4 8003AAF4 47000224 */  addiu      $v0, $zero, 0x47
    /* 2AAF8 8003AAF8 1400A2AF */  sw         $v0, 0x14($sp)
    /* 2AAFC 8003AAFC 02000224 */  addiu      $v0, $zero, 0x2
    /* 2AB00 8003AB00 1800A2AF */  sw         $v0, 0x18($sp)
    /* 2AB04 8003AB04 0A000224 */  addiu      $v0, $zero, 0xA
    /* 2AB08 8003AB08 2000BFAF */  sw         $ra, 0x20($sp)
    /* 2AB0C 8003AB0C 13E8000C */  jal        InitTownerInfo__FilUciiici
    /* 2AB10 8003AB10 1C00A2AF */   sw        $v0, 0x1C($sp)
    /* 2AB14 8003AB14 9C10848F */  lw         $a0, %gp_rel(numtowners)($gp)
    /* 2AB18 8003AB18 69E8000C */  jal        InitQstSnds__Fi
    /* 2AB1C 8003AB1C 00000000 */   nop
    /* 2AB20 8003AB20 1180043C */  lui        $a0, %hi(D_80111278)
    /* 2AB24 8003AB24 78128424 */  addiu      $a0, $a0, %lo(D_80111278)
    /* 2AB28 8003AB28 0BF7000C */  jal        LoadFileInMem__FPCcPUl
    /* 2AB2C 8003AB2C 21280000 */   addu      $a1, $zero, $zero
    /* 2AB30 8003AB30 9C10848F */  lw         $a0, %gp_rel(numtowners)($gp)
    /* 2AB34 8003AB34 21280000 */  addu       $a1, $zero, $zero
    /* 2AB38 8003AB38 40180400 */  sll        $v1, $a0, 1
    /* 2AB3C 8003AB3C 21186400 */  addu       $v1, $v1, $a0
    /* 2AB40 8003AB40 00190300 */  sll        $v1, $v1, 4
    /* 2AB44 8003AB44 21186400 */  addu       $v1, $v1, $a0
    /* 2AB48 8003AB48 80180300 */  sll        $v1, $v1, 2
    /* 2AB4C 8003AB4C 21206000 */  addu       $a0, $v1, $zero
    /* 2AB50 8003AB50 0D80033C */  lui        $v1, %hi(towner + 0x9C)
    /* 2AB54 8003AB54 1CFF6324 */  addiu      $v1, $v1, %lo(towner + 0x9C)
    /* 2AB58 8003AB58 21188300 */  addu       $v1, $a0, $v1
    /* 2AB5C 8003AB5C 0D80013C */  lui        $at, %hi(towner + 0xC0)
    /* 2AB60 8003AB60 21082400 */  addu       $at, $at, $a0
    /* 2AB64 8003AB64 40FF22AC */  sw         $v0, %lo(towner + 0xC0)($at)
  .L8003AB68:
    /* 2AB68 8003AB68 0D80013C */  lui        $at, %hi(towner + 0xC0)
    /* 2AB6C 8003AB6C 21082400 */  addu       $at, $at, $a0
    /* 2AB70 8003AB70 40FF228C */  lw         $v0, %lo(towner + 0xC0)($at)
    /* 2AB74 8003AB74 0100A524 */  addiu      $a1, $a1, 0x1
    /* 2AB78 8003AB78 000062AC */  sw         $v0, 0x0($v1)
    /* 2AB7C 8003AB7C 0800A228 */  slti       $v0, $a1, 0x8
    /* 2AB80 8003AB80 F9FF4014 */  bnez       $v0, .L8003AB68
    /* 2AB84 8003AB84 04006324 */   addiu     $v1, $v1, 0x4
    /* 2AB88 8003AB88 19000624 */  addiu      $a2, $zero, 0x19
    /* 2AB8C 8003AB8C 9C10848F */  lw         $a0, %gp_rel(numtowners)($gp)
    /* 2AB90 8003AB90 00000000 */  nop
    /* 2AB94 8003AB94 40100400 */  sll        $v0, $a0, 1
    /* 2AB98 8003AB98 21104400 */  addu       $v0, $v0, $a0
    /* 2AB9C 8003AB9C 00110200 */  sll        $v0, $v0, 4
    /* 2ABA0 8003ABA0 21104400 */  addu       $v0, $v0, $a0
    /* 2ABA4 8003ABA4 80100200 */  sll        $v0, $v0, 2
    /* 2ABA8 8003ABA8 0D80013C */  lui        $at, %hi(towner + 0x9C)
    /* 2ABAC 8003ABAC 21082200 */  addu       $at, $at, $v0
    /* 2ABB0 8003ABB0 1CFF258C */  lw         $a1, %lo(towner + 0x9C)($at)
    /* 2ABB4 8003ABB4 19000324 */  addiu      $v1, $zero, 0x19
    /* 2ABB8 8003ABB8 0D80013C */  lui        $at, %hi(towner + 0xBC)
    /* 2ABBC 8003ABBC 21082200 */  addu       $at, $at, $v0
    /* 2ABC0 8003ABC0 3CFF23AC */  sw         $v1, %lo(towner + 0xBC)($at)
    /* 2ABC4 8003ABC4 FFE7000C */  jal        NewTownerAnim__FiPUcii
    /* 2ABC8 8003ABC8 03000724 */   addiu     $a3, $zero, 0x3
    /* 2ABCC 8003ABCC 9C10848F */  lw         $a0, %gp_rel(numtowners)($gp)
    /* 2ABD0 8003ABD0 9C000324 */  addiu      $v1, $zero, 0x9C
    /* 2ABD4 8003ABD4 40100400 */  sll        $v0, $a0, 1
    /* 2ABD8 8003ABD8 21104400 */  addu       $v0, $v0, $a0
    /* 2ABDC 8003ABDC 00110200 */  sll        $v0, $v0, 4
    /* 2ABE0 8003ABE0 21104400 */  addu       $v0, $v0, $a0
    /* 2ABE4 8003ABE4 80100200 */  sll        $v0, $v0, 2
    /* 2ABE8 8003ABE8 01008424 */  addiu      $a0, $a0, 0x1
    /* 2ABEC 8003ABEC 0D80013C */  lui        $at, %hi(towner + 0x98)
    /* 2ABF0 8003ABF0 21082200 */  addu       $at, $at, $v0
    /* 2ABF4 8003ABF4 18FF23AC */  sw         $v1, %lo(towner + 0x98)($at)
    /* 2ABF8 8003ABF8 9C1084AF */  sw         $a0, %gp_rel(numtowners)($gp)
    /* 2ABFC 8003ABFC 2000BF8F */  lw         $ra, 0x20($sp)
    /* 2AC00 8003AC00 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 2AC04 8003AC04 0800E003 */  jr         $ra
    /* 2AC08 8003AC08 00000000 */   nop
endlabel InitTeller__Fv
