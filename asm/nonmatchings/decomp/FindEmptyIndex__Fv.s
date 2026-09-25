.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FindEmptyIndex__Fv, 0x38

glabel FindEmptyIndex__Fv
    /* 944EC 800A44EC 21180000 */  addu       $v1, $zero, $zero
    /* 944F0 800A44F0 1280043C */  lui        $a0, %hi(D_8011D050)
    /* 944F4 800A44F4 50D08424 */  addiu      $a0, $a0, %lo(D_8011D050)
  .L800A44F8:
    /* 944F8 800A44F8 0000828C */  lw         $v0, 0x0($a0)
    /* 944FC 800A44FC 00000000 */  nop
    /* 94500 800A4500 06004010 */  beqz       $v0, .L800A451C
    /* 94504 800A4504 21106000 */   addu      $v0, $v1, $zero
    /* 94508 800A4508 01006324 */  addiu      $v1, $v1, 0x1
    /* 9450C 800A450C 0A006228 */  slti       $v0, $v1, 0xA
    /* 94510 800A4510 F9FF4014 */  bnez       $v0, .L800A44F8
    /* 94514 800A4514 04008424 */   addiu     $a0, $a0, 0x4
    /* 94518 800A4518 FFFF0224 */  addiu      $v0, $zero, -0x1
  .L800A451C:
    /* 9451C 800A451C 0800E003 */  jr         $ra
    /* 94520 800A4520 00000000 */   nop
endlabel FindEmptyIndex__Fv
