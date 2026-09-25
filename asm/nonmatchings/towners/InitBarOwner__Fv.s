.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitBarOwner__Fv, 0x138

glabel InitBarOwner__Fv
    /* 2A394 8003A394 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 2A398 8003A398 60000524 */  addiu      $a1, $zero, 0x60
    /* 2A39C 8003A39C 01000624 */  addiu      $a2, $zero, 0x1
    /* 2A3A0 8003A3A0 03000724 */  addiu      $a3, $zero, 0x3
    /* 2A3A4 8003A3A4 9C10848F */  lw         $a0, %gp_rel(numtowners)($gp)
    /* 2A3A8 8003A3A8 37000224 */  addiu      $v0, $zero, 0x37
    /* 2A3AC 8003A3AC 1000A2AF */  sw         $v0, 0x10($sp)
    /* 2A3B0 8003A3B0 3E000224 */  addiu      $v0, $zero, 0x3E
    /* 2A3B4 8003A3B4 1400A2AF */  sw         $v0, 0x14($sp)
    /* 2A3B8 8003A3B8 03000224 */  addiu      $v0, $zero, 0x3
    /* 2A3BC 8003A3BC 1800A2AF */  sw         $v0, 0x18($sp)
    /* 2A3C0 8003A3C0 0A000224 */  addiu      $v0, $zero, 0xA
    /* 2A3C4 8003A3C4 2000BFAF */  sw         $ra, 0x20($sp)
    /* 2A3C8 8003A3C8 A21080A3 */  sb         $zero, %gp_rel(bannerflag)($gp)
    /* 2A3CC 8003A3CC 13E8000C */  jal        InitTownerInfo__FilUciiici
    /* 2A3D0 8003A3D0 1C00A2AF */   sw        $v0, 0x1C($sp)
    /* 2A3D4 8003A3D4 9C10848F */  lw         $a0, %gp_rel(numtowners)($gp)
    /* 2A3D8 8003A3D8 69E8000C */  jal        InitQstSnds__Fi
    /* 2A3DC 8003A3DC 00000000 */   nop
    /* 2A3E0 8003A3E0 1180043C */  lui        $a0, %hi(D_801111D4)
    /* 2A3E4 8003A3E4 D4118424 */  addiu      $a0, $a0, %lo(D_801111D4)
    /* 2A3E8 8003A3E8 0BF7000C */  jal        LoadFileInMem__FPCcPUl
    /* 2A3EC 8003A3EC 21280000 */   addu      $a1, $zero, $zero
    /* 2A3F0 8003A3F0 9C10848F */  lw         $a0, %gp_rel(numtowners)($gp)
    /* 2A3F4 8003A3F4 21280000 */  addu       $a1, $zero, $zero
    /* 2A3F8 8003A3F8 40180400 */  sll        $v1, $a0, 1
    /* 2A3FC 8003A3FC 21186400 */  addu       $v1, $v1, $a0
    /* 2A400 8003A400 00190300 */  sll        $v1, $v1, 4
    /* 2A404 8003A404 21186400 */  addu       $v1, $v1, $a0
    /* 2A408 8003A408 80180300 */  sll        $v1, $v1, 2
    /* 2A40C 8003A40C 21206000 */  addu       $a0, $v1, $zero
    /* 2A410 8003A410 0D80033C */  lui        $v1, %hi(towner + 0x9C)
    /* 2A414 8003A414 1CFF6324 */  addiu      $v1, $v1, %lo(towner + 0x9C)
    /* 2A418 8003A418 21188300 */  addu       $v1, $a0, $v1
    /* 2A41C 8003A41C 0D80013C */  lui        $at, %hi(towner + 0xC0)
    /* 2A420 8003A420 21082400 */  addu       $at, $at, $a0
    /* 2A424 8003A424 40FF22AC */  sw         $v0, %lo(towner + 0xC0)($at)
  .L8003A428:
    /* 2A428 8003A428 0D80013C */  lui        $at, %hi(towner + 0xC0)
    /* 2A42C 8003A42C 21082400 */  addu       $at, $at, $a0
    /* 2A430 8003A430 40FF228C */  lw         $v0, %lo(towner + 0xC0)($at)
    /* 2A434 8003A434 0100A524 */  addiu      $a1, $a1, 0x1
    /* 2A438 8003A438 000062AC */  sw         $v0, 0x0($v1)
    /* 2A43C 8003A43C 0800A228 */  slti       $v0, $a1, 0x8
    /* 2A440 8003A440 F9FF4014 */  bnez       $v0, .L8003A428
    /* 2A444 8003A444 04006324 */   addiu     $v1, $v1, 0x4
    /* 2A448 8003A448 10000624 */  addiu      $a2, $zero, 0x10
    /* 2A44C 8003A44C 9C10848F */  lw         $a0, %gp_rel(numtowners)($gp)
    /* 2A450 8003A450 00000000 */  nop
    /* 2A454 8003A454 40100400 */  sll        $v0, $a0, 1
    /* 2A458 8003A458 21104400 */  addu       $v0, $v0, $a0
    /* 2A45C 8003A45C 00110200 */  sll        $v0, $v0, 4
    /* 2A460 8003A460 21104400 */  addu       $v0, $v0, $a0
    /* 2A464 8003A464 80100200 */  sll        $v0, $v0, 2
    /* 2A468 8003A468 0D80013C */  lui        $at, %hi(towner + 0xA0)
    /* 2A46C 8003A46C 21082200 */  addu       $at, $at, $v0
    /* 2A470 8003A470 20FF258C */  lw         $a1, %lo(towner + 0xA0)($at)
    /* 2A474 8003A474 10000324 */  addiu      $v1, $zero, 0x10
    /* 2A478 8003A478 0D80013C */  lui        $at, %hi(towner + 0xBC)
    /* 2A47C 8003A47C 21082200 */  addu       $at, $at, $v0
    /* 2A480 8003A480 3CFF23AC */  sw         $v1, %lo(towner + 0xBC)($at)
    /* 2A484 8003A484 FFE7000C */  jal        NewTownerAnim__FiPUcii
    /* 2A488 8003A488 03000724 */   addiu     $a3, $zero, 0x3
    /* 2A48C 8003A48C 9C10848F */  lw         $a0, %gp_rel(numtowners)($gp)
    /* 2A490 8003A490 E5020324 */  addiu      $v1, $zero, 0x2E5
    /* 2A494 8003A494 40100400 */  sll        $v0, $a0, 1
    /* 2A498 8003A498 21104400 */  addu       $v0, $v0, $a0
    /* 2A49C 8003A49C 00110200 */  sll        $v0, $v0, 4
    /* 2A4A0 8003A4A0 21104400 */  addu       $v0, $v0, $a0
    /* 2A4A4 8003A4A4 80100200 */  sll        $v0, $v0, 2
    /* 2A4A8 8003A4A8 01008424 */  addiu      $a0, $a0, 0x1
    /* 2A4AC 8003A4AC 0D80013C */  lui        $at, %hi(towner + 0x98)
    /* 2A4B0 8003A4B0 21082200 */  addu       $at, $at, $v0
    /* 2A4B4 8003A4B4 18FF23AC */  sw         $v1, %lo(towner + 0x98)($at)
    /* 2A4B8 8003A4B8 9C1084AF */  sw         $a0, %gp_rel(numtowners)($gp)
    /* 2A4BC 8003A4BC 2000BF8F */  lw         $ra, 0x20($sp)
    /* 2A4C0 8003A4C0 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 2A4C4 8003A4C4 0800E003 */  jr         $ra
    /* 2A4C8 8003A4C8 00000000 */   nop
endlabel InitBarOwner__Fv
