.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawManaShield__FP12PlayerStruct, 0x8

glabel DrawManaShield__FP12PlayerStruct
    /* 8B9BC 8009B9BC 0800E003 */  jr         $ra
    /* 8B9C0 8009B9C0 00000000 */   nop
endlabel DrawManaShield__FP12PlayerStruct
