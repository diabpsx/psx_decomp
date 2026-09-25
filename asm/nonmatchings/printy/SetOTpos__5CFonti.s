.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetOTpos__5CFonti, 0xC

glabel SetOTpos__5CFonti
    /* 7ABA0 8008ABA0 0402828C */  lw         $v0, 0x204($a0)
    /* 7ABA4 8008ABA4 0800E003 */  jr         $ra
    /* 7ABA8 8008ABA8 040285AC */   sw        $a1, 0x204($a0)
endlabel SetOTpos__5CFonti
