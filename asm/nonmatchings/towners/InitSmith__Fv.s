.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitSmith__Fv, 0x130

glabel InitSmith__Fv
    /* 2A264 8003A264 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 2A268 8003A268 60000524 */  addiu      $a1, $zero, 0x60
    /* 2A26C 8003A26C 01000624 */  addiu      $a2, $zero, 0x1
    /* 2A270 8003A270 21380000 */  addu       $a3, $zero, $zero
    /* 2A274 8003A274 9C10848F */  lw         $a0, %gp_rel(numtowners)($gp)
    /* 2A278 8003A278 3E000224 */  addiu      $v0, $zero, 0x3E
    /* 2A27C 8003A27C 1000A2AF */  sw         $v0, 0x10($sp)
    /* 2A280 8003A280 3F000224 */  addiu      $v0, $zero, 0x3F
    /* 2A284 8003A284 1400A2AF */  sw         $v0, 0x14($sp)
    /* 2A288 8003A288 0A000224 */  addiu      $v0, $zero, 0xA
    /* 2A28C 8003A28C 2000BFAF */  sw         $ra, 0x20($sp)
    /* 2A290 8003A290 1800A0AF */  sw         $zero, 0x18($sp)
    /* 2A294 8003A294 13E8000C */  jal        InitTownerInfo__FilUciiici
    /* 2A298 8003A298 1C00A2AF */   sw        $v0, 0x1C($sp)
    /* 2A29C 8003A29C 9C10848F */  lw         $a0, %gp_rel(numtowners)($gp)
    /* 2A2A0 8003A2A0 69E8000C */  jal        InitQstSnds__Fi
    /* 2A2A4 8003A2A4 00000000 */   nop
    /* 2A2A8 8003A2A8 1180043C */  lui        $a0, %hi(D_801111B8)
    /* 2A2AC 8003A2AC B8118424 */  addiu      $a0, $a0, %lo(D_801111B8)
    /* 2A2B0 8003A2B0 0BF7000C */  jal        LoadFileInMem__FPCcPUl
    /* 2A2B4 8003A2B4 21280000 */   addu      $a1, $zero, $zero
    /* 2A2B8 8003A2B8 9C10848F */  lw         $a0, %gp_rel(numtowners)($gp)
    /* 2A2BC 8003A2BC 21280000 */  addu       $a1, $zero, $zero
    /* 2A2C0 8003A2C0 40180400 */  sll        $v1, $a0, 1
    /* 2A2C4 8003A2C4 21186400 */  addu       $v1, $v1, $a0
    /* 2A2C8 8003A2C8 00190300 */  sll        $v1, $v1, 4
    /* 2A2CC 8003A2CC 21186400 */  addu       $v1, $v1, $a0
    /* 2A2D0 8003A2D0 80180300 */  sll        $v1, $v1, 2
    /* 2A2D4 8003A2D4 21206000 */  addu       $a0, $v1, $zero
    /* 2A2D8 8003A2D8 0D80033C */  lui        $v1, %hi(towner + 0x9C)
    /* 2A2DC 8003A2DC 1CFF6324 */  addiu      $v1, $v1, %lo(towner + 0x9C)
    /* 2A2E0 8003A2E0 21188300 */  addu       $v1, $a0, $v1
    /* 2A2E4 8003A2E4 0D80013C */  lui        $at, %hi(towner + 0xC0)
    /* 2A2E8 8003A2E8 21082400 */  addu       $at, $at, $a0
    /* 2A2EC 8003A2EC 40FF22AC */  sw         $v0, %lo(towner + 0xC0)($at)
  .L8003A2F0:
    /* 2A2F0 8003A2F0 0D80013C */  lui        $at, %hi(towner + 0xC0)
    /* 2A2F4 8003A2F4 21082400 */  addu       $at, $at, $a0
    /* 2A2F8 8003A2F8 40FF228C */  lw         $v0, %lo(towner + 0xC0)($at)
    /* 2A2FC 8003A2FC 0100A524 */  addiu      $a1, $a1, 0x1
    /* 2A300 8003A300 000062AC */  sw         $v0, 0x0($v1)
    /* 2A304 8003A304 0800A228 */  slti       $v0, $a1, 0x8
    /* 2A308 8003A308 F9FF4014 */  bnez       $v0, .L8003A2F0
    /* 2A30C 8003A30C 04006324 */   addiu     $v1, $v1, 0x4
    /* 2A310 8003A310 10000624 */  addiu      $a2, $zero, 0x10
    /* 2A314 8003A314 9C10848F */  lw         $a0, %gp_rel(numtowners)($gp)
    /* 2A318 8003A318 00000000 */  nop
    /* 2A31C 8003A31C 40100400 */  sll        $v0, $a0, 1
    /* 2A320 8003A320 21104400 */  addu       $v0, $v0, $a0
    /* 2A324 8003A324 00110200 */  sll        $v0, $v0, 4
    /* 2A328 8003A328 21104400 */  addu       $v0, $v0, $a0
    /* 2A32C 8003A32C 80100200 */  sll        $v0, $v0, 2
    /* 2A330 8003A330 0D80013C */  lui        $at, %hi(towner + 0xA0)
    /* 2A334 8003A334 21082200 */  addu       $at, $at, $v0
    /* 2A338 8003A338 20FF258C */  lw         $a1, %lo(towner + 0xA0)($at)
    /* 2A33C 8003A33C 10000324 */  addiu      $v1, $zero, 0x10
    /* 2A340 8003A340 0D80013C */  lui        $at, %hi(towner + 0xBC)
    /* 2A344 8003A344 21082200 */  addu       $at, $at, $v0
    /* 2A348 8003A348 3CFF23AC */  sw         $v1, %lo(towner + 0xBC)($at)
    /* 2A34C 8003A34C FFE7000C */  jal        NewTownerAnim__FiPUcii
    /* 2A350 8003A350 03000724 */   addiu     $a3, $zero, 0x3
    /* 2A354 8003A354 9C10848F */  lw         $a0, %gp_rel(numtowners)($gp)
    /* 2A358 8003A358 A8010324 */  addiu      $v1, $zero, 0x1A8
    /* 2A35C 8003A35C 40100400 */  sll        $v0, $a0, 1
    /* 2A360 8003A360 21104400 */  addu       $v0, $v0, $a0
    /* 2A364 8003A364 00110200 */  sll        $v0, $v0, 4
    /* 2A368 8003A368 21104400 */  addu       $v0, $v0, $a0
    /* 2A36C 8003A36C 80100200 */  sll        $v0, $v0, 2
    /* 2A370 8003A370 01008424 */  addiu      $a0, $a0, 0x1
    /* 2A374 8003A374 0D80013C */  lui        $at, %hi(towner + 0x98)
    /* 2A378 8003A378 21082200 */  addu       $at, $at, $v0
    /* 2A37C 8003A37C 18FF23AC */  sw         $v1, %lo(towner + 0x98)($at)
    /* 2A380 8003A380 9C1084AF */  sw         $a0, %gp_rel(numtowners)($gp)
    /* 2A384 8003A384 2000BF8F */  lw         $ra, 0x20($sp)
    /* 2A388 8003A388 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 2A38C 8003A38C 0800E003 */  jr         $ra
    /* 2A390 8003A390 00000000 */   nop
endlabel InitSmith__Fv
