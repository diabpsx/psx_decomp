.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitWitch__Fv, 0x134

glabel InitWitch__Fv
    /* 2A600 8003A600 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 2A604 8003A604 60000524 */  addiu      $a1, $zero, 0x60
    /* 2A608 8003A608 01000624 */  addiu      $a2, $zero, 0x1
    /* 2A60C 8003A60C 06000724 */  addiu      $a3, $zero, 0x6
    /* 2A610 8003A610 9C10848F */  lw         $a0, %gp_rel(numtowners)($gp)
    /* 2A614 8003A614 50000224 */  addiu      $v0, $zero, 0x50
    /* 2A618 8003A618 1000A2AF */  sw         $v0, 0x10($sp)
    /* 2A61C 8003A61C 14000224 */  addiu      $v0, $zero, 0x14
    /* 2A620 8003A620 1400A2AF */  sw         $v0, 0x14($sp)
    /* 2A624 8003A624 05000224 */  addiu      $v0, $zero, 0x5
    /* 2A628 8003A628 1800A2AF */  sw         $v0, 0x18($sp)
    /* 2A62C 8003A62C 0A000224 */  addiu      $v0, $zero, 0xA
    /* 2A630 8003A630 2000BFAF */  sw         $ra, 0x20($sp)
    /* 2A634 8003A634 13E8000C */  jal        InitTownerInfo__FilUciiici
    /* 2A638 8003A638 1C00A2AF */   sw        $v0, 0x1C($sp)
    /* 2A63C 8003A63C 9C10848F */  lw         $a0, %gp_rel(numtowners)($gp)
    /* 2A640 8003A640 69E8000C */  jal        InitQstSnds__Fi
    /* 2A644 8003A644 00000000 */   nop
    /* 2A648 8003A648 1180043C */  lui        $a0, %hi(D_80111208)
    /* 2A64C 8003A64C 08128424 */  addiu      $a0, $a0, %lo(D_80111208)
    /* 2A650 8003A650 0BF7000C */  jal        LoadFileInMem__FPCcPUl
    /* 2A654 8003A654 21280000 */   addu      $a1, $zero, $zero
    /* 2A658 8003A658 9C10848F */  lw         $a0, %gp_rel(numtowners)($gp)
    /* 2A65C 8003A65C 21280000 */  addu       $a1, $zero, $zero
    /* 2A660 8003A660 40180400 */  sll        $v1, $a0, 1
    /* 2A664 8003A664 21186400 */  addu       $v1, $v1, $a0
    /* 2A668 8003A668 00190300 */  sll        $v1, $v1, 4
    /* 2A66C 8003A66C 21186400 */  addu       $v1, $v1, $a0
    /* 2A670 8003A670 80180300 */  sll        $v1, $v1, 2
    /* 2A674 8003A674 21206000 */  addu       $a0, $v1, $zero
    /* 2A678 8003A678 0D80033C */  lui        $v1, %hi(towner + 0x9C)
    /* 2A67C 8003A67C 1CFF6324 */  addiu      $v1, $v1, %lo(towner + 0x9C)
    /* 2A680 8003A680 21188300 */  addu       $v1, $a0, $v1
    /* 2A684 8003A684 0D80013C */  lui        $at, %hi(towner + 0xC0)
    /* 2A688 8003A688 21082400 */  addu       $at, $at, $a0
    /* 2A68C 8003A68C 40FF22AC */  sw         $v0, %lo(towner + 0xC0)($at)
  .L8003A690:
    /* 2A690 8003A690 0D80013C */  lui        $at, %hi(towner + 0xC0)
    /* 2A694 8003A694 21082400 */  addu       $at, $at, $a0
    /* 2A698 8003A698 40FF228C */  lw         $v0, %lo(towner + 0xC0)($at)
    /* 2A69C 8003A69C 0100A524 */  addiu      $a1, $a1, 0x1
    /* 2A6A0 8003A6A0 000062AC */  sw         $v0, 0x0($v1)
    /* 2A6A4 8003A6A4 0800A228 */  slti       $v0, $a1, 0x8
    /* 2A6A8 8003A6A8 F9FF4014 */  bnez       $v0, .L8003A690
    /* 2A6AC 8003A6AC 04006324 */   addiu     $v1, $v1, 0x4
    /* 2A6B0 8003A6B0 13000624 */  addiu      $a2, $zero, 0x13
    /* 2A6B4 8003A6B4 9C10848F */  lw         $a0, %gp_rel(numtowners)($gp)
    /* 2A6B8 8003A6B8 00000000 */  nop
    /* 2A6BC 8003A6BC 40100400 */  sll        $v0, $a0, 1
    /* 2A6C0 8003A6C0 21104400 */  addu       $v0, $v0, $a0
    /* 2A6C4 8003A6C4 00110200 */  sll        $v0, $v0, 4
    /* 2A6C8 8003A6C8 21104400 */  addu       $v0, $v0, $a0
    /* 2A6CC 8003A6CC 80100200 */  sll        $v0, $v0, 2
    /* 2A6D0 8003A6D0 0D80013C */  lui        $at, %hi(towner + 0x9C)
    /* 2A6D4 8003A6D4 21082200 */  addu       $at, $at, $v0
    /* 2A6D8 8003A6D8 1CFF258C */  lw         $a1, %lo(towner + 0x9C)($at)
    /* 2A6DC 8003A6DC 13000324 */  addiu      $v1, $zero, 0x13
    /* 2A6E0 8003A6E0 0D80013C */  lui        $at, %hi(towner + 0xBC)
    /* 2A6E4 8003A6E4 21082200 */  addu       $at, $at, $v0
    /* 2A6E8 8003A6E8 3CFF23AC */  sw         $v1, %lo(towner + 0xBC)($at)
    /* 2A6EC 8003A6EC FFE7000C */  jal        NewTownerAnim__FiPUcii
    /* 2A6F0 8003A6F0 06000724 */   addiu     $a3, $zero, 0x6
    /* 2A6F4 8003A6F4 9C10848F */  lw         $a0, %gp_rel(numtowners)($gp)
    /* 2A6F8 8003A6F8 0E000324 */  addiu      $v1, $zero, 0xE
    /* 2A6FC 8003A6FC 40100400 */  sll        $v0, $a0, 1
    /* 2A700 8003A700 21104400 */  addu       $v0, $v0, $a0
    /* 2A704 8003A704 00110200 */  sll        $v0, $v0, 4
    /* 2A708 8003A708 21104400 */  addu       $v0, $v0, $a0
    /* 2A70C 8003A70C 80100200 */  sll        $v0, $v0, 2
    /* 2A710 8003A710 01008424 */  addiu      $a0, $a0, 0x1
    /* 2A714 8003A714 0D80013C */  lui        $at, %hi(towner + 0x98)
    /* 2A718 8003A718 21082200 */  addu       $at, $at, $v0
    /* 2A71C 8003A71C 18FF23AC */  sw         $v1, %lo(towner + 0x98)($at)
    /* 2A720 8003A720 9C1084AF */  sw         $a0, %gp_rel(numtowners)($gp)
    /* 2A724 8003A724 2000BF8F */  lw         $ra, 0x20($sp)
    /* 2A728 8003A728 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 2A72C 8003A72C 0800E003 */  jr         $ra
    /* 2A730 8003A730 00000000 */   nop
endlabel InitWitch__Fv
