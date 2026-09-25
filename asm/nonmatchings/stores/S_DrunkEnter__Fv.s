.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching S_DrunkEnter__Fv, 0x74

glabel S_DrunkEnter__Fv
    /* 63FF0 80073FF0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 63FF4 80073FF4 0421838F */  lw         $v1, %gp_rel(D_8011C884)($gp)
    /* 63FF8 80073FF8 09000224 */  addiu      $v0, $zero, 0x9
    /* 63FFC 80073FFC 1000BFAF */  sw         $ra, 0x10($sp)
    /* 64000 80074000 211380A3 */  sb         $zero, %gp_rel(WFlag)($gp)
    /* 64004 80074004 05006210 */  beq        $v1, $v0, .L8007401C
    /* 64008 80074008 0B000224 */   addiu     $v0, $zero, 0xB
    /* 6400C 8007400C 10006210 */  beq        $v1, $v0, .L80074050
    /* 64010 80074010 00000000 */   nop
    /* 64014 80074014 15D00108 */  j          .L80074054
    /* 64018 80074018 00000000 */   nop
  .L8007401C:
    /* 6401C 8007401C 05000224 */  addiu      $v0, $zero, 0x5
    /* 64020 80074020 442182AF */  sw         $v0, %gp_rel(D_8011C8C4)($gp)
    /* 64024 80074024 16000224 */  addiu      $v0, $zero, 0x16
    /* 64028 80074028 0C2182AF */  sw         $v0, %gp_rel(D_8011C88C)($gp)
    /* 6402C 8007402C C9000224 */  addiu      $v0, $zero, 0xC9
    /* 64030 80074030 2C2182AF */  sw         $v0, %gp_rel(D_8011C8AC)($gp)
    /* 64034 80074034 D3000224 */  addiu      $v0, $zero, 0xD3
    /* 64038 80074038 082183AF */  sw         $v1, %gp_rel(D_8011C888)($gp)
    /* 6403C 8007403C 302182AF */  sw         $v0, %gp_rel(D_8011C8B0)($gp)
    /* 64040 80074040 5BBE010C */  jal        StartStore__Fc
    /* 64044 80074044 13000424 */   addiu     $a0, $zero, 0x13
    /* 64048 80074048 15D00108 */  j          .L80074054
    /* 6404C 8007404C 00000000 */   nop
  .L80074050:
    /* 64050 80074050 601380A3 */  sb         $zero, %gp_rel(stextflag)($gp)
  .L80074054:
    /* 64054 80074054 1000BF8F */  lw         $ra, 0x10($sp)
    /* 64058 80074058 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 6405C 8007405C 0800E003 */  jr         $ra
    /* 64060 80074060 00000000 */   nop
endlabel S_DrunkEnter__Fv
