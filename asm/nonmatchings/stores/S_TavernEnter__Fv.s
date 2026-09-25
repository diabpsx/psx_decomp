.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching S_TavernEnter__Fv, 0x74

glabel S_TavernEnter__Fv
    /* 63F08 80073F08 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 63F0C 80073F0C 0421838F */  lw         $v1, %gp_rel(D_8011C884)($gp)
    /* 63F10 80073F10 09000224 */  addiu      $v0, $zero, 0x9
    /* 63F14 80073F14 1000BFAF */  sw         $ra, 0x10($sp)
    /* 63F18 80073F18 211380A3 */  sb         $zero, %gp_rel(WFlag)($gp)
    /* 63F1C 80073F1C 05006210 */  beq        $v1, $v0, .L80073F34
    /* 63F20 80073F20 0B000224 */   addiu     $v0, $zero, 0xB
    /* 63F24 80073F24 10006210 */  beq        $v1, $v0, .L80073F68
    /* 63F28 80073F28 00000000 */   nop
    /* 63F2C 80073F2C DBCF0108 */  j          .L80073F6C
    /* 63F30 80073F30 00000000 */   nop
  .L80073F34:
    /* 63F34 80073F34 03000224 */  addiu      $v0, $zero, 0x3
    /* 63F38 80073F38 442182AF */  sw         $v0, %gp_rel(D_8011C8C4)($gp)
    /* 63F3C 80073F3C 15000224 */  addiu      $v0, $zero, 0x15
    /* 63F40 80073F40 0C2182AF */  sw         $v0, %gp_rel(D_8011C88C)($gp)
    /* 63F44 80073F44 A1000224 */  addiu      $v0, $zero, 0xA1
    /* 63F48 80073F48 2C2182AF */  sw         $v0, %gp_rel(D_8011C8AC)($gp)
    /* 63F4C 80073F4C A8000224 */  addiu      $v0, $zero, 0xA8
    /* 63F50 80073F50 082183AF */  sw         $v1, %gp_rel(D_8011C888)($gp)
    /* 63F54 80073F54 302182AF */  sw         $v0, %gp_rel(D_8011C8B0)($gp)
    /* 63F58 80073F58 5BBE010C */  jal        StartStore__Fc
    /* 63F5C 80073F5C 13000424 */   addiu     $a0, $zero, 0x13
    /* 63F60 80073F60 DBCF0108 */  j          .L80073F6C
    /* 63F64 80073F64 00000000 */   nop
  .L80073F68:
    /* 63F68 80073F68 601380A3 */  sb         $zero, %gp_rel(stextflag)($gp)
  .L80073F6C:
    /* 63F6C 80073F6C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 63F70 80073F70 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 63F74 80073F74 0800E003 */  jr         $ra
    /* 63F78 80073F78 00000000 */   nop
endlabel S_TavernEnter__Fv
