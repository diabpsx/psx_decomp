.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching S_BarmaidEnter__Fv, 0x74

glabel S_BarmaidEnter__Fv
    /* 63F7C 80073F7C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 63F80 80073F80 0421838F */  lw         $v1, %gp_rel(D_8011C884)($gp)
    /* 63F84 80073F84 09000224 */  addiu      $v0, $zero, 0x9
    /* 63F88 80073F88 1000BFAF */  sw         $ra, 0x10($sp)
    /* 63F8C 80073F8C 211380A3 */  sb         $zero, %gp_rel(WFlag)($gp)
    /* 63F90 80073F90 05006210 */  beq        $v1, $v0, .L80073FA8
    /* 63F94 80073F94 0B000224 */   addiu     $v0, $zero, 0xB
    /* 63F98 80073F98 10006210 */  beq        $v1, $v0, .L80073FDC
    /* 63F9C 80073F9C 00000000 */   nop
    /* 63FA0 80073FA0 F8CF0108 */  j          .L80073FE0
    /* 63FA4 80073FA4 00000000 */   nop
  .L80073FA8:
    /* 63FA8 80073FA8 07000224 */  addiu      $v0, $zero, 0x7
    /* 63FAC 80073FAC 442182AF */  sw         $v0, %gp_rel(D_8011C8C4)($gp)
    /* 63FB0 80073FB0 17000224 */  addiu      $v0, $zero, 0x17
    /* 63FB4 80073FB4 0C2182AF */  sw         $v0, %gp_rel(D_8011C88C)($gp)
    /* 63FB8 80073FB8 B4000224 */  addiu      $v0, $zero, 0xB4
    /* 63FBC 80073FBC 2C2182AF */  sw         $v0, %gp_rel(D_8011C8AC)($gp)
    /* 63FC0 80073FC0 BB000224 */  addiu      $v0, $zero, 0xBB
    /* 63FC4 80073FC4 082183AF */  sw         $v1, %gp_rel(D_8011C888)($gp)
    /* 63FC8 80073FC8 302182AF */  sw         $v0, %gp_rel(D_8011C8B0)($gp)
    /* 63FCC 80073FCC 5BBE010C */  jal        StartStore__Fc
    /* 63FD0 80073FD0 13000424 */   addiu     $a0, $zero, 0x13
    /* 63FD4 80073FD4 F8CF0108 */  j          .L80073FE0
    /* 63FD8 80073FD8 00000000 */   nop
  .L80073FDC:
    /* 63FDC 80073FDC 601380A3 */  sb         $zero, %gp_rel(stextflag)($gp)
  .L80073FE0:
    /* 63FE0 80073FE0 1000BF8F */  lw         $ra, 0x10($sp)
    /* 63FE4 80073FE4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 63FE8 80073FE8 0800E003 */  jr         $ra
    /* 63FEC 80073FEC 00000000 */   nop
endlabel S_BarmaidEnter__Fv
