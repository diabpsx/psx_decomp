.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching func_8013AE3C, 0x3C

glabel func_8013AE3C
    /* 1244 8013AE3C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1248 8013AE40 05008014 */  bnez       $a0, .L8013AE58
    /* 124C 8013AE44 1000BFAF */   sw        $ra, 0x10($sp)
    /* 1250 8013AE48 42EC040C */  jal        func_8013B108
    /* 1254 8013AE4C 00000000 */   nop
    /* 1258 8013AE50 9AEB0408 */  j          .L8013AE68
    /* 125C 8013AE54 00000000 */   nop
  .L8013AE58:
    /* 1260 8013AE58 8CEC040C */  jal        func_8013B230
    /* 1264 8013AE5C 00000000 */   nop
    /* 1268 8013AE60 42170200 */  srl        $v0, $v0, 29
    /* 126C 8013AE64 01004230 */  andi       $v0, $v0, 0x1
  .L8013AE68:
    /* 1270 8013AE68 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1274 8013AE6C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1278 8013AE70 0800E003 */  jr         $ra
    /* 127C 8013AE74 00000000 */   nop
endlabel func_8013AE3C
