.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitBoy__Fv, 0x13C

glabel InitBoy__Fv
    /* 2A868 8003A868 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 2A86C 8003A86C 60000524 */  addiu      $a1, $zero, 0x60
    /* 2A870 8003A870 01000624 */  addiu      $a2, $zero, 0x1
    /* 2A874 8003A874 08000724 */  addiu      $a3, $zero, 0x8
    /* 2A878 8003A878 9C10848F */  lw         $a0, %gp_rel(numtowners)($gp)
    /* 2A87C 8003A87C 01000224 */  addiu      $v0, $zero, 0x1
    /* 2A880 8003A880 A11082A3 */  sb         $v0, %gp_rel(boyloadflag)($gp)
    /* 2A884 8003A884 0B000224 */  addiu      $v0, $zero, 0xB
    /* 2A888 8003A888 1000A2AF */  sw         $v0, 0x10($sp)
    /* 2A88C 8003A88C 35000224 */  addiu      $v0, $zero, 0x35
    /* 2A890 8003A890 1400A2AF */  sw         $v0, 0x14($sp)
    /* 2A894 8003A894 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 2A898 8003A898 1800A2AF */  sw         $v0, 0x18($sp)
    /* 2A89C 8003A89C 0A000224 */  addiu      $v0, $zero, 0xA
    /* 2A8A0 8003A8A0 2000BFAF */  sw         $ra, 0x20($sp)
    /* 2A8A4 8003A8A4 13E8000C */  jal        InitTownerInfo__FilUciiici
    /* 2A8A8 8003A8A8 1C00A2AF */   sw        $v0, 0x1C($sp)
    /* 2A8AC 8003A8AC 9C10848F */  lw         $a0, %gp_rel(numtowners)($gp)
    /* 2A8B0 8003A8B0 69E8000C */  jal        InitQstSnds__Fi
    /* 2A8B4 8003A8B4 00000000 */   nop
    /* 2A8B8 8003A8B8 1180043C */  lui        $a0, %hi(D_80111240)
    /* 2A8BC 8003A8BC 40128424 */  addiu      $a0, $a0, %lo(D_80111240)
    /* 2A8C0 8003A8C0 0BF7000C */  jal        LoadFileInMem__FPCcPUl
    /* 2A8C4 8003A8C4 21280000 */   addu      $a1, $zero, $zero
    /* 2A8C8 8003A8C8 9C10848F */  lw         $a0, %gp_rel(numtowners)($gp)
    /* 2A8CC 8003A8CC 21280000 */  addu       $a1, $zero, $zero
    /* 2A8D0 8003A8D0 40180400 */  sll        $v1, $a0, 1
    /* 2A8D4 8003A8D4 21186400 */  addu       $v1, $v1, $a0
    /* 2A8D8 8003A8D8 00190300 */  sll        $v1, $v1, 4
    /* 2A8DC 8003A8DC 21186400 */  addu       $v1, $v1, $a0
    /* 2A8E0 8003A8E0 80180300 */  sll        $v1, $v1, 2
    /* 2A8E4 8003A8E4 21206000 */  addu       $a0, $v1, $zero
    /* 2A8E8 8003A8E8 0D80033C */  lui        $v1, %hi(towner + 0x9C)
    /* 2A8EC 8003A8EC 1CFF6324 */  addiu      $v1, $v1, %lo(towner + 0x9C)
    /* 2A8F0 8003A8F0 21188300 */  addu       $v1, $a0, $v1
    /* 2A8F4 8003A8F4 0D80013C */  lui        $at, %hi(towner + 0xC0)
    /* 2A8F8 8003A8F8 21082400 */  addu       $at, $at, $a0
    /* 2A8FC 8003A8FC 40FF22AC */  sw         $v0, %lo(towner + 0xC0)($at)
  .L8003A900:
    /* 2A900 8003A900 0D80013C */  lui        $at, %hi(towner + 0xC0)
    /* 2A904 8003A904 21082400 */  addu       $at, $at, $a0
    /* 2A908 8003A908 40FF228C */  lw         $v0, %lo(towner + 0xC0)($at)
    /* 2A90C 8003A90C 0100A524 */  addiu      $a1, $a1, 0x1
    /* 2A910 8003A910 000062AC */  sw         $v0, 0x0($v1)
    /* 2A914 8003A914 0800A228 */  slti       $v0, $a1, 0x8
    /* 2A918 8003A918 F9FF4014 */  bnez       $v0, .L8003A900
    /* 2A91C 8003A91C 04006324 */   addiu     $v1, $v1, 0x4
    /* 2A920 8003A920 14000624 */  addiu      $a2, $zero, 0x14
    /* 2A924 8003A924 9C10848F */  lw         $a0, %gp_rel(numtowners)($gp)
    /* 2A928 8003A928 00000000 */  nop
    /* 2A92C 8003A92C 40100400 */  sll        $v0, $a0, 1
    /* 2A930 8003A930 21104400 */  addu       $v0, $v0, $a0
    /* 2A934 8003A934 00110200 */  sll        $v0, $v0, 4
    /* 2A938 8003A938 21104400 */  addu       $v0, $v0, $a0
    /* 2A93C 8003A93C 80100200 */  sll        $v0, $v0, 2
    /* 2A940 8003A940 0D80013C */  lui        $at, %hi(towner + 0x9C)
    /* 2A944 8003A944 21082200 */  addu       $at, $at, $v0
    /* 2A948 8003A948 1CFF258C */  lw         $a1, %lo(towner + 0x9C)($at)
    /* 2A94C 8003A94C 14000324 */  addiu      $v1, $zero, 0x14
    /* 2A950 8003A950 0D80013C */  lui        $at, %hi(towner + 0xBC)
    /* 2A954 8003A954 21082200 */  addu       $at, $at, $v0
    /* 2A958 8003A958 3CFF23AC */  sw         $v1, %lo(towner + 0xBC)($at)
    /* 2A95C 8003A95C FFE7000C */  jal        NewTownerAnim__FiPUcii
    /* 2A960 8003A960 06000724 */   addiu     $a3, $zero, 0x6
    /* 2A964 8003A964 9C10848F */  lw         $a0, %gp_rel(numtowners)($gp)
    /* 2A968 8003A968 D8040324 */  addiu      $v1, $zero, 0x4D8
    /* 2A96C 8003A96C 40100400 */  sll        $v0, $a0, 1
    /* 2A970 8003A970 21104400 */  addu       $v0, $v0, $a0
    /* 2A974 8003A974 00110200 */  sll        $v0, $v0, 4
    /* 2A978 8003A978 21104400 */  addu       $v0, $v0, $a0
    /* 2A97C 8003A97C 80100200 */  sll        $v0, $v0, 2
    /* 2A980 8003A980 01008424 */  addiu      $a0, $a0, 0x1
    /* 2A984 8003A984 0D80013C */  lui        $at, %hi(towner + 0x98)
    /* 2A988 8003A988 21082200 */  addu       $at, $at, $v0
    /* 2A98C 8003A98C 18FF23AC */  sw         $v1, %lo(towner + 0x98)($at)
    /* 2A990 8003A990 9C1084AF */  sw         $a0, %gp_rel(numtowners)($gp)
    /* 2A994 8003A994 2000BF8F */  lw         $ra, 0x20($sp)
    /* 2A998 8003A998 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 2A99C 8003A99C 0800E003 */  jr         $ra
    /* 2A9A0 8003A9A0 00000000 */   nop
endlabel InitBoy__Fv
