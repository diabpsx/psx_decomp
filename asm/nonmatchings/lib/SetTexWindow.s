.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetTexWindow, 0x38

glabel SetTexWindow
    /* 4740 80014740 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 4744 80014744 1000B0AF */  sw         $s0, 0x10($sp)
    /* 4748 80014748 21808000 */  addu       $s0, $a0, $zero
    /* 474C 8001474C 02000224 */  addiu      $v0, $zero, 0x2
    /* 4750 80014750 2120A000 */  addu       $a0, $a1, $zero
    /* 4754 80014754 1400BFAF */  sw         $ra, 0x14($sp)
    /* 4758 80014758 AC53000C */  jal        func_80014EB0
    /* 475C 8001475C 030002A2 */   sb        $v0, 0x3($s0)
    /* 4760 80014760 040002AE */  sw         $v0, 0x4($s0)
    /* 4764 80014764 080000AE */  sw         $zero, 0x8($s0)
    /* 4768 80014768 1400BF8F */  lw         $ra, 0x14($sp)
    /* 476C 8001476C 1000B08F */  lw         $s0, 0x10($sp)
    /* 4770 80014770 0800E003 */  jr         $ra
    /* 4774 80014774 1800BD27 */   addiu     $sp, $sp, 0x18
endlabel SetTexWindow
