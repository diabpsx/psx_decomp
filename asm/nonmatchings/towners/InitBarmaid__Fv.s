.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitBarmaid__Fv, 0x134

glabel InitBarmaid__Fv
    /* 2A734 8003A734 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 2A738 8003A738 60000524 */  addiu      $a1, $zero, 0x60
    /* 2A73C 8003A73C 01000624 */  addiu      $a2, $zero, 0x1
    /* 2A740 8003A740 07000724 */  addiu      $a3, $zero, 0x7
    /* 2A744 8003A744 9C10848F */  lw         $a0, %gp_rel(numtowners)($gp)
    /* 2A748 8003A748 2B000224 */  addiu      $v0, $zero, 0x2B
    /* 2A74C 8003A74C 1000A2AF */  sw         $v0, 0x10($sp)
    /* 2A750 8003A750 42000224 */  addiu      $v0, $zero, 0x42
    /* 2A754 8003A754 1400A2AF */  sw         $v0, 0x14($sp)
    /* 2A758 8003A758 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 2A75C 8003A75C 1800A2AF */  sw         $v0, 0x18($sp)
    /* 2A760 8003A760 0A000224 */  addiu      $v0, $zero, 0xA
    /* 2A764 8003A764 2000BFAF */  sw         $ra, 0x20($sp)
    /* 2A768 8003A768 13E8000C */  jal        InitTownerInfo__FilUciiici
    /* 2A76C 8003A76C 1C00A2AF */   sw        $v0, 0x1C($sp)
    /* 2A770 8003A770 9C10848F */  lw         $a0, %gp_rel(numtowners)($gp)
    /* 2A774 8003A774 69E8000C */  jal        InitQstSnds__Fi
    /* 2A778 8003A778 00000000 */   nop
    /* 2A77C 8003A77C 1180043C */  lui        $a0, %hi(D_80111224)
    /* 2A780 8003A780 24128424 */  addiu      $a0, $a0, %lo(D_80111224)
    /* 2A784 8003A784 0BF7000C */  jal        LoadFileInMem__FPCcPUl
    /* 2A788 8003A788 21280000 */   addu      $a1, $zero, $zero
    /* 2A78C 8003A78C 9C10848F */  lw         $a0, %gp_rel(numtowners)($gp)
    /* 2A790 8003A790 21280000 */  addu       $a1, $zero, $zero
    /* 2A794 8003A794 40180400 */  sll        $v1, $a0, 1
    /* 2A798 8003A798 21186400 */  addu       $v1, $v1, $a0
    /* 2A79C 8003A79C 00190300 */  sll        $v1, $v1, 4
    /* 2A7A0 8003A7A0 21186400 */  addu       $v1, $v1, $a0
    /* 2A7A4 8003A7A4 80180300 */  sll        $v1, $v1, 2
    /* 2A7A8 8003A7A8 21206000 */  addu       $a0, $v1, $zero
    /* 2A7AC 8003A7AC 0D80033C */  lui        $v1, %hi(towner + 0x9C)
    /* 2A7B0 8003A7B0 1CFF6324 */  addiu      $v1, $v1, %lo(towner + 0x9C)
    /* 2A7B4 8003A7B4 21188300 */  addu       $v1, $a0, $v1
    /* 2A7B8 8003A7B8 0D80013C */  lui        $at, %hi(towner + 0xC0)
    /* 2A7BC 8003A7BC 21082400 */  addu       $at, $at, $a0
    /* 2A7C0 8003A7C0 40FF22AC */  sw         $v0, %lo(towner + 0xC0)($at)
  .L8003A7C4:
    /* 2A7C4 8003A7C4 0D80013C */  lui        $at, %hi(towner + 0xC0)
    /* 2A7C8 8003A7C8 21082400 */  addu       $at, $at, $a0
    /* 2A7CC 8003A7CC 40FF228C */  lw         $v0, %lo(towner + 0xC0)($at)
    /* 2A7D0 8003A7D0 0100A524 */  addiu      $a1, $a1, 0x1
    /* 2A7D4 8003A7D4 000062AC */  sw         $v0, 0x0($v1)
    /* 2A7D8 8003A7D8 0800A228 */  slti       $v0, $a1, 0x8
    /* 2A7DC 8003A7DC F9FF4014 */  bnez       $v0, .L8003A7C4
    /* 2A7E0 8003A7E0 04006324 */   addiu     $v1, $v1, 0x4
    /* 2A7E4 8003A7E4 12000624 */  addiu      $a2, $zero, 0x12
    /* 2A7E8 8003A7E8 9C10848F */  lw         $a0, %gp_rel(numtowners)($gp)
    /* 2A7EC 8003A7EC 00000000 */  nop
    /* 2A7F0 8003A7F0 40100400 */  sll        $v0, $a0, 1
    /* 2A7F4 8003A7F4 21104400 */  addu       $v0, $v0, $a0
    /* 2A7F8 8003A7F8 00110200 */  sll        $v0, $v0, 4
    /* 2A7FC 8003A7FC 21104400 */  addu       $v0, $v0, $a0
    /* 2A800 8003A800 80100200 */  sll        $v0, $v0, 2
    /* 2A804 8003A804 0D80013C */  lui        $at, %hi(towner + 0x9C)
    /* 2A808 8003A808 21082200 */  addu       $at, $at, $v0
    /* 2A80C 8003A80C 1CFF258C */  lw         $a1, %lo(towner + 0x9C)($at)
    /* 2A810 8003A810 12000324 */  addiu      $v1, $zero, 0x12
    /* 2A814 8003A814 0D80013C */  lui        $at, %hi(towner + 0xBC)
    /* 2A818 8003A818 21082200 */  addu       $at, $at, $v0
    /* 2A81C 8003A81C 3CFF23AC */  sw         $v1, %lo(towner + 0xBC)($at)
    /* 2A820 8003A820 FFE7000C */  jal        NewTownerAnim__FiPUcii
    /* 2A824 8003A824 06000724 */   addiu     $a3, $zero, 0x6
    /* 2A828 8003A828 9C10848F */  lw         $a0, %gp_rel(numtowners)($gp)
    /* 2A82C 8003A82C 84010324 */  addiu      $v1, $zero, 0x184
    /* 2A830 8003A830 40100400 */  sll        $v0, $a0, 1
    /* 2A834 8003A834 21104400 */  addu       $v0, $v0, $a0
    /* 2A838 8003A838 00110200 */  sll        $v0, $v0, 4
    /* 2A83C 8003A83C 21104400 */  addu       $v0, $v0, $a0
    /* 2A840 8003A840 80100200 */  sll        $v0, $v0, 2
    /* 2A844 8003A844 01008424 */  addiu      $a0, $a0, 0x1
    /* 2A848 8003A848 0D80013C */  lui        $at, %hi(towner + 0x98)
    /* 2A84C 8003A84C 21082200 */  addu       $at, $at, $v0
    /* 2A850 8003A850 18FF23AC */  sw         $v1, %lo(towner + 0x98)($at)
    /* 2A854 8003A854 9C1084AF */  sw         $a0, %gp_rel(numtowners)($gp)
    /* 2A858 8003A858 2000BF8F */  lw         $ra, 0x20($sp)
    /* 2A85C 8003A85C 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 2A860 8003A860 0800E003 */  jr         $ra
    /* 2A864 8003A864 00000000 */   nop
endlabel InitBarmaid__Fv
