.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitDungMsgs__FP12PlayerStruct, 0x8

glabel InitDungMsgs__FP12PlayerStruct
    /* 56440 80066440 0800E003 */  jr         $ra
    /* 56444 80066444 E11980A0 */   sb        $zero, 0x19E1($a0)
endlabel InitDungMsgs__FP12PlayerStruct
