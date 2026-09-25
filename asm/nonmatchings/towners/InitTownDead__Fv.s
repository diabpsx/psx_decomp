.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitTownDead__Fv, 0x134

glabel InitTownDead__Fv
    /* 2A4CC 8003A4CC D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 2A4D0 8003A4D0 60000524 */  addiu      $a1, $zero, 0x60
    /* 2A4D4 8003A4D4 01000624 */  addiu      $a2, $zero, 0x1
    /* 2A4D8 8003A4D8 02000724 */  addiu      $a3, $zero, 0x2
    /* 2A4DC 8003A4DC 9C10848F */  lw         $a0, %gp_rel(numtowners)($gp)
    /* 2A4E0 8003A4E0 18000224 */  addiu      $v0, $zero, 0x18
    /* 2A4E4 8003A4E4 1000A2AF */  sw         $v0, 0x10($sp)
    /* 2A4E8 8003A4E8 20000224 */  addiu      $v0, $zero, 0x20
    /* 2A4EC 8003A4EC 1400A2AF */  sw         $v0, 0x14($sp)
    /* 2A4F0 8003A4F0 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 2A4F4 8003A4F4 1800A2AF */  sw         $v0, 0x18($sp)
    /* 2A4F8 8003A4F8 0A000224 */  addiu      $v0, $zero, 0xA
    /* 2A4FC 8003A4FC 2000BFAF */  sw         $ra, 0x20($sp)
    /* 2A500 8003A500 13E8000C */  jal        InitTownerInfo__FilUciiici
    /* 2A504 8003A504 1C00A2AF */   sw        $v0, 0x1C($sp)
    /* 2A508 8003A508 9C10848F */  lw         $a0, %gp_rel(numtowners)($gp)
    /* 2A50C 8003A50C 69E8000C */  jal        InitQstSnds__Fi
    /* 2A510 8003A510 00000000 */   nop
    /* 2A514 8003A514 1180043C */  lui        $a0, %hi(D_801111EC)
    /* 2A518 8003A518 EC118424 */  addiu      $a0, $a0, %lo(D_801111EC)
    /* 2A51C 8003A51C 0BF7000C */  jal        LoadFileInMem__FPCcPUl
    /* 2A520 8003A520 21280000 */   addu      $a1, $zero, $zero
    /* 2A524 8003A524 9C10848F */  lw         $a0, %gp_rel(numtowners)($gp)
    /* 2A528 8003A528 21280000 */  addu       $a1, $zero, $zero
    /* 2A52C 8003A52C 40180400 */  sll        $v1, $a0, 1
    /* 2A530 8003A530 21186400 */  addu       $v1, $v1, $a0
    /* 2A534 8003A534 00190300 */  sll        $v1, $v1, 4
    /* 2A538 8003A538 21186400 */  addu       $v1, $v1, $a0
    /* 2A53C 8003A53C 80180300 */  sll        $v1, $v1, 2
    /* 2A540 8003A540 21206000 */  addu       $a0, $v1, $zero
    /* 2A544 8003A544 0D80033C */  lui        $v1, %hi(towner + 0x9C)
    /* 2A548 8003A548 1CFF6324 */  addiu      $v1, $v1, %lo(towner + 0x9C)
    /* 2A54C 8003A54C 21188300 */  addu       $v1, $a0, $v1
    /* 2A550 8003A550 0D80013C */  lui        $at, %hi(towner + 0xC0)
    /* 2A554 8003A554 21082400 */  addu       $at, $at, $a0
    /* 2A558 8003A558 40FF22AC */  sw         $v0, %lo(towner + 0xC0)($at)
  .L8003A55C:
    /* 2A55C 8003A55C 0D80013C */  lui        $at, %hi(towner + 0xC0)
    /* 2A560 8003A560 21082400 */  addu       $at, $at, $a0
    /* 2A564 8003A564 40FF228C */  lw         $v0, %lo(towner + 0xC0)($at)
    /* 2A568 8003A568 0100A524 */  addiu      $a1, $a1, 0x1
    /* 2A56C 8003A56C 000062AC */  sw         $v0, 0x0($v1)
    /* 2A570 8003A570 0800A228 */  slti       $v0, $a1, 0x8
    /* 2A574 8003A574 F9FF4014 */  bnez       $v0, .L8003A55C
    /* 2A578 8003A578 04006324 */   addiu     $v1, $v1, 0x4
    /* 2A57C 8003A57C 08000624 */  addiu      $a2, $zero, 0x8
    /* 2A580 8003A580 9C10848F */  lw         $a0, %gp_rel(numtowners)($gp)
    /* 2A584 8003A584 00000000 */  nop
    /* 2A588 8003A588 40100400 */  sll        $v0, $a0, 1
    /* 2A58C 8003A58C 21104400 */  addu       $v0, $v0, $a0
    /* 2A590 8003A590 00110200 */  sll        $v0, $v0, 4
    /* 2A594 8003A594 21104400 */  addu       $v0, $v0, $a0
    /* 2A598 8003A598 80100200 */  sll        $v0, $v0, 2
    /* 2A59C 8003A59C 0D80013C */  lui        $at, %hi(towner + 0xAC)
    /* 2A5A0 8003A5A0 21082200 */  addu       $at, $at, $v0
    /* 2A5A4 8003A5A4 2CFF258C */  lw         $a1, %lo(towner + 0xAC)($at)
    /* 2A5A8 8003A5A8 08000324 */  addiu      $v1, $zero, 0x8
    /* 2A5AC 8003A5AC 0D80013C */  lui        $at, %hi(towner + 0xBC)
    /* 2A5B0 8003A5B0 21082200 */  addu       $at, $at, $v0
    /* 2A5B4 8003A5B4 3CFF23AC */  sw         $v1, %lo(towner + 0xBC)($at)
    /* 2A5B8 8003A5B8 FFE7000C */  jal        NewTownerAnim__FiPUcii
    /* 2A5BC 8003A5BC 06000724 */   addiu     $a3, $zero, 0x6
    /* 2A5C0 8003A5C0 9C10848F */  lw         $a0, %gp_rel(numtowners)($gp)
    /* 2A5C4 8003A5C4 E0040324 */  addiu      $v1, $zero, 0x4E0
    /* 2A5C8 8003A5C8 40100400 */  sll        $v0, $a0, 1
    /* 2A5CC 8003A5CC 21104400 */  addu       $v0, $v0, $a0
    /* 2A5D0 8003A5D0 00110200 */  sll        $v0, $v0, 4
    /* 2A5D4 8003A5D4 21104400 */  addu       $v0, $v0, $a0
    /* 2A5D8 8003A5D8 80100200 */  sll        $v0, $v0, 2
    /* 2A5DC 8003A5DC 01008424 */  addiu      $a0, $a0, 0x1
    /* 2A5E0 8003A5E0 0D80013C */  lui        $at, %hi(towner + 0x98)
    /* 2A5E4 8003A5E4 21082200 */  addu       $at, $at, $v0
    /* 2A5E8 8003A5E8 18FF23AC */  sw         $v1, %lo(towner + 0x98)($at)
    /* 2A5EC 8003A5EC 9C1084AF */  sw         $a0, %gp_rel(numtowners)($gp)
    /* 2A5F0 8003A5F0 2000BF8F */  lw         $ra, 0x20($sp)
    /* 2A5F4 8003A5F4 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 2A5F8 8003A5F8 0800E003 */  jr         $ra
    /* 2A5FC 8003A5FC 00000000 */   nop
endlabel InitTownDead__Fv
