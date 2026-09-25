.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching dumpasync, 0x8

glabel dumpasync
    /* 13730 80023730 0800E003 */  jr         $ra
    /* 13734 80023734 00000000 */   nop
endlabel dumpasync
