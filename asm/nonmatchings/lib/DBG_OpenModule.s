.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DBG_OpenModule, 0x8

glabel DBG_OpenModule
    /* 10E54 80020E54 0800E003 */  jr         $ra
    /* 10E58 80020E58 01000234 */   ori       $v0, $zero, 0x1
endlabel DBG_OpenModule
