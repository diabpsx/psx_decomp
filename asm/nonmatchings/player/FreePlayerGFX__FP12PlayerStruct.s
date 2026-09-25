.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FreePlayerGFX__FP12PlayerStruct, 0x8

glabel FreePlayerGFX__FP12PlayerStruct
    /* 4FE14 8005FE14 0800E003 */  jr         $ra
    /* 4FE18 8005FE18 840180AC */   sw        $zero, 0x184($a0)
endlabel FreePlayerGFX__FP12PlayerStruct
