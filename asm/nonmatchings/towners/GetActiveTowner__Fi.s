.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetActiveTowner__Fi, 0x54

glabel GetActiveTowner__Fi
    /* 29F88 80039F88 F8FFBD27 */  addiu      $sp, $sp, -0x8
    /* 29F8C 80039F8C 9C10828F */  lw         $v0, %gp_rel(numtowners)($gp)
    /* 29F90 80039F90 00000000 */  nop
    /* 29F94 80039F94 0D004018 */  blez       $v0, .L80039FCC
    /* 29F98 80039F98 21180000 */   addu      $v1, $zero, $zero
    /* 29F9C 80039F9C 21304000 */  addu       $a2, $v0, $zero
    /* 29FA0 80039FA0 21280000 */  addu       $a1, $zero, $zero
  .L80039FA4:
    /* 29FA4 80039FA4 0D80013C */  lui        $at, %hi(towner + 0x4)
    /* 29FA8 80039FA8 21082500 */  addu       $at, $at, $a1
    /* 29FAC 80039FAC 84FE228C */  lw         $v0, %lo(towner + 0x4)($at)
    /* 29FB0 80039FB0 00000000 */  nop
    /* 29FB4 80039FB4 06004410 */  beq        $v0, $a0, .L80039FD0
    /* 29FB8 80039FB8 21106000 */   addu      $v0, $v1, $zero
    /* 29FBC 80039FBC 01006324 */  addiu      $v1, $v1, 0x1
    /* 29FC0 80039FC0 2A106600 */  slt        $v0, $v1, $a2
    /* 29FC4 80039FC4 F7FF4014 */  bnez       $v0, .L80039FA4
    /* 29FC8 80039FC8 C400A524 */   addiu     $a1, $a1, 0xC4
  .L80039FCC:
    /* 29FCC 80039FCC FFFF0224 */  addiu      $v0, $zero, -0x1
  .L80039FD0:
    /* 29FD0 80039FD0 0800BD27 */  addiu      $sp, $sp, 0x8
    /* 29FD4 80039FD4 0800E003 */  jr         $ra
    /* 29FD8 80039FD8 00000000 */   nop
endlabel GetActiveTowner__Fi
