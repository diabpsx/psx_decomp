.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching __5DatIOUl, 0x3C

glabel __5DatIOUl
    /* 76744 80086744 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 76748 80086748 1000B0AF */  sw         $s0, 0x10($sp)
    /* 7674C 8008674C 1400BFAF */  sw         $ra, 0x14($sp)
    /* 76750 80086750 1F16020C */  jal        __6FileIOUl
    /* 76754 80086754 21808000 */   addu      $s0, $a0, $zero
    /* 76758 80086758 1180023C */  lui        $v0, %hi(_vt_5DatIO)
    /* 7675C 8008675C CC014224 */  addiu      $v0, $v0, %lo(_vt_5DatIO)
    /* 76760 80086760 DB8C000C */  jal        DDXinit
    /* 76764 80086764 100002AE */   sw        $v0, 0x10($s0)
    /* 76768 80086768 21100002 */  addu       $v0, $s0, $zero
    /* 7676C 8008676C 1400BF8F */  lw         $ra, 0x14($sp)
    /* 76770 80086770 1000B08F */  lw         $s0, 0x10($sp)
    /* 76774 80086774 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 76778 80086778 0800E003 */  jr         $ra
    /* 7677C 8008677C 00000000 */   nop
endlabel __5DatIOUl
