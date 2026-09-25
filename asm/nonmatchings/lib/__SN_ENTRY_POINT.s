.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

/* Handwritten function */
nonmatching __SN_ENTRY_POINT, 0xA8

glabel __SN_ENTRY_POINT
    /* F20 80010F20 1280023C */  lui        $v0, %hi(D_8011C604)
    /* F24 80010F24 04C64224 */  addiu      $v0, $v0, %lo(D_8011C604)
    /* F28 80010F28 1480033C */  lui        $v1, %hi(D_80139BF8)
    /* F2C 80010F2C F89B6324 */  addiu      $v1, $v1, %lo(D_80139BF8)
  .L80010F30:
    /* F30 80010F30 000040AC */  sw         $zero, 0x0($v0)
    /* F34 80010F34 04004224 */  addiu      $v0, $v0, 0x4
    /* F38 80010F38 2B084300 */  sltu       $at, $v0, $v1
    /* F3C 80010F3C FCFF2014 */  bnez       $at, .L80010F30
    /* F40 80010F40 00000000 */   nop
    /* F44 80010F44 0B80023C */  lui        $v0, %hi(_ramsize)
    /* F48 80010F48 B842428C */  lw         $v0, %lo(_ramsize)($v0)
    /* F4C 80010F4C 00000000 */  nop
    /* F50 80010F50 F8FF4220 */  addi       $v0, $v0, -0x8 /* handwritten instruction */
    /* F54 80010F54 0080083C */  lui        $t0, %hi(D_80000004)
    /* F58 80010F58 25E84800 */  or         $sp, $v0, $t0
    /* F5C 80010F5C 1480043C */  lui        $a0, %hi(D_80139BF8)
    /* F60 80010F60 F89B8424 */  addiu      $a0, $a0, %lo(D_80139BF8)
    /* F64 80010F64 C0200400 */  sll        $a0, $a0, 3
    /* F68 80010F68 C2200400 */  srl        $a0, $a0, 3
    /* F6C 80010F6C 0B80033C */  lui        $v1, %hi(_stacksize)
    /* F70 80010F70 B442638C */  lw         $v1, %lo(_stacksize)($v1)
    /* F74 80010F74 00000000 */  nop
    /* F78 80010F78 23284300 */  subu       $a1, $v0, $v1
    /* F7C 80010F7C 2328A400 */  subu       $a1, $a1, $a0
    /* F80 80010F80 0B80013C */  lui        $at, %hi(__heapsize)
    /* F84 80010F84 984225AC */  sw         $a1, %lo(__heapsize)($at)
    /* F88 80010F88 25208800 */  or         $a0, $a0, $t0
    /* F8C 80010F8C 0B80013C */  lui        $at, %hi(__heapbase)
    /* F90 80010F90 944224AC */  sw         $a0, %lo(__heapbase)($at)
    /* F94 80010F94 1280013C */  lui        $at, %hi(D_8011C908)
    /* F98 80010F98 08C93FAC */  sw         $ra, %lo(D_8011C908)($at)
    /* F9C 80010F9C 12801C3C */  lui        $gp, %hi(_gp)
    /* FA0 80010FA0 80A79C27 */  addiu      $gp, $gp, %lo(_gp)
    /* FA4 80010FA4 21F0A003 */  addu       $fp, $sp, $zero
    /* FA8 80010FA8 4B46000C */  jal        InitHeap
    /* FAC 80010FAC 04008420 */   addi      $a0, $a0, %lo(D_80000004) /* handwritten instruction */
    /* FB0 80010FB0 12801F3C */  lui        $ra, %hi(D_8011C908)
    /* FB4 80010FB4 08C9FF8F */  lw         $ra, %lo(D_8011C908)($ra)
    /* FB8 80010FB8 00000000 */  nop
    /* FBC 80010FBC 8183000C */  jal        main
    /* FC0 80010FC0 00000000 */   nop
    /* FC4 80010FC4 4D000000 */  break      0, 1
endlabel __SN_ENTRY_POINT
