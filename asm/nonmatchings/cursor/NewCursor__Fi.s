.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching NewCursor__Fi, 0x20

glabel NewCursor__Fi
    /* 27804 80037804 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 27808 80037808 1000BFAF */  sw         $ra, 0x10($sp)
    /* 2780C 8003780C E8DD000C */  jal        SetCursor__Fi
    /* 27810 80037810 00000000 */   nop
    /* 27814 80037814 1000BF8F */  lw         $ra, 0x10($sp)
    /* 27818 80037818 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 2781C 8003781C 0800E003 */  jr         $ra
    /* 27820 80037820 00000000 */   nop
endlabel NewCursor__Fi
