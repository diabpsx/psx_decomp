.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CustomPlayerInit__FR12PlayerStruct, 0x8

glabel CustomPlayerInit__FR12PlayerStruct
    /* 7D33C 8008D33C 0800E003 */  jr         $ra
    /* 7D340 8008D340 540180A0 */   sb        $zero, 0x154($a0)
endlabel CustomPlayerInit__FR12PlayerStruct
