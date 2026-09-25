.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetBorder__6Dialogi_80069264, 0x8

glabel SetBorder__6Dialogi_80069264
    /* 59264 80069264 0800E003 */  jr         $ra
    /* 59268 80069268 040085AC */   sw        $a1, 0x4($a0)
endlabel SetBorder__6Dialogi_80069264
