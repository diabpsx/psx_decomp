.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SendPsyqString, 0x8

glabel SendPsyqString
    /* 10ED8 80020ED8 0800E003 */  jr         $ra
    /* 10EDC 80020EDC 00000000 */   nop
endlabel SendPsyqString
