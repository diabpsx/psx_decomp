.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ClrDiabloMsg__Fv, 0x2C

glabel ClrDiabloMsg__Fv
    /* 2DCD8 8003DCD8 4F000324 */  addiu      $v1, $zero, 0x4F
    /* 2DCDC 8003DCDC 0D80023C */  lui        $v0, %hi(msgtable + 0x4F)
    /* 2DCE0 8003DCE0 3F1B4224 */  addiu      $v0, $v0, %lo(msgtable + 0x4F)
  .L8003DCE4:
    /* 2DCE4 8003DCE4 000040A0 */  sb         $zero, 0x0($v0)
    /* 2DCE8 8003DCE8 FFFF6324 */  addiu      $v1, $v1, -0x1
    /* 2DCEC 8003DCEC FDFF6104 */  bgez       $v1, .L8003DCE4
    /* 2DCF0 8003DCF0 FFFF4224 */   addiu     $v0, $v0, -0x1
    /* 2DCF4 8003DCF4 EB1080A3 */  sb         $zero, %gp_rel(msgflag)($gp)
    /* 2DCF8 8003DCF8 EA1080A3 */  sb         $zero, %gp_rel(msgcnt)($gp)
    /* 2DCFC 8003DCFC 0800E003 */  jr         $ra
    /* 2DD00 8003DD00 00000000 */   nop
endlabel ClrDiabloMsg__Fv
