.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching IsLoaded__C7TextDat, 0xC

glabel IsLoaded__C7TextDat
    /* 852E8 800952E8 4400828C */  lw         $v0, 0x44($a0)
    /* 852EC 800952EC 0800E003 */  jr         $ra
    /* 852F0 800952F0 2B100200 */   sltu      $v0, $zero, $v0
endlabel IsLoaded__C7TextDat
