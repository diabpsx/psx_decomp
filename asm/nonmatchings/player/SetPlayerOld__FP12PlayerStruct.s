.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetPlayerOld__FP12PlayerStruct, 0x14

glabel SetPlayerOld__FP12PlayerStruct
    /* 50DFC 80060DFC 30008294 */  lhu        $v0, 0x30($a0)
    /* 50E00 80060E00 32008394 */  lhu        $v1, 0x32($a0)
    /* 50E04 80060E04 380082A4 */  sh         $v0, 0x38($a0)
    /* 50E08 80060E08 0800E003 */  jr         $ra
    /* 50E0C 80060E0C 3A0083A4 */   sh        $v1, 0x3A($a0)
endlabel SetPlayerOld__FP12PlayerStruct
