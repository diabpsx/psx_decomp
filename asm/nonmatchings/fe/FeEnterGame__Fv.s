.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FeEnterGame__Fv, 0x28

glabel FeEnterGame__Fv
    /* 1FD0 8013BBC8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1FD4 8013BBCC 02000224 */  addiu      $v0, $zero, 0x2
    /* 1FD8 8013BBD0 1000BFAF */  sw         $ra, 0x10($sp)
    /* 1FDC 8013BBD4 F40B82A3 */  sb         $v0, %gp_rel(FeFlag)($gp)
    /* 1FE0 8013BBD8 ADEE040C */  jal        FeCopyPlayerInfoForReturn__Fv
    /* 1FE4 8013BBDC 00000000 */   nop
    /* 1FE8 8013BBE0 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1FEC 8013BBE4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1FF0 8013BBE8 0800E003 */  jr         $ra
    /* 1FF4 8013BBEC 00000000 */   nop
endlabel FeEnterGame__Fv
