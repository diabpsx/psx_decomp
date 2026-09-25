.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetCreature__7TextDati_8007ee2c, 0x1C

glabel GetCreature__7TextDati_8007ee2c
    /* 6EE2C 8007EE2C 80280500 */  sll        $a1, $a1, 2
    /* 6EE30 8007EE30 3400828C */  lw         $v0, 0x34($a0)
    /* 6EE34 8007EE34 3800838C */  lw         $v1, 0x38($a0)
    /* 6EE38 8007EE38 2128A200 */  addu       $a1, $a1, $v0
    /* 6EE3C 8007EE3C 0000A28C */  lw         $v0, 0x0($a1)
    /* 6EE40 8007EE40 0800E003 */  jr         $ra
    /* 6EE44 8007EE44 21106200 */   addu      $v0, $v1, $v0
endlabel GetCreature__7TextDati_8007ee2c
