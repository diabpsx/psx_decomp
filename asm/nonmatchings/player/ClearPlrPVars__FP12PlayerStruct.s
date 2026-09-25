.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ClearPlrPVars__FP12PlayerStruct, 0x1C

glabel ClearPlrPVars__FP12PlayerStruct
    /* 4FE38 8005FE38 560180A4 */  sh         $zero, 0x156($a0)
    /* 4FE3C 8005FE3C 580180A4 */  sh         $zero, 0x158($a0)
    /* 4FE40 8005FE40 5A0180A4 */  sh         $zero, 0x15A($a0)
    /* 4FE44 8005FE44 5C0180A4 */  sh         $zero, 0x15C($a0)
    /* 4FE48 8005FE48 5E0180A4 */  sh         $zero, 0x15E($a0)
    /* 4FE4C 8005FE4C 0800E003 */  jr         $ra
    /* 4FE50 8005FE50 640180A4 */   sh        $zero, 0x164($a0)
endlabel ClearPlrPVars__FP12PlayerStruct
