.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching RemovePlrFromMap__FP12PlayerStruct, 0x8

glabel RemovePlrFromMap__FP12PlayerStruct
    /* 512F4 800612F4 0800E003 */  jr         $ra
    /* 512F8 800612F8 00000000 */   nop
endlabel RemovePlrFromMap__FP12PlayerStruct
