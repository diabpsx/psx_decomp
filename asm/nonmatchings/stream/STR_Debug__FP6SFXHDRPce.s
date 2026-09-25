.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching STR_Debug__FP6SFXHDRPce, 0x14

glabel STR_Debug__FP6SFXHDRPce
    /* 88AF8 80098AF8 0400A5AF */  sw         $a1, 0x4($sp)
    /* 88AFC 80098AFC 0800A6AF */  sw         $a2, 0x8($sp)
    /* 88B00 80098B00 0C00A7AF */  sw         $a3, 0xC($sp)
    /* 88B04 80098B04 0800E003 */  jr         $ra
    /* 88B08 80098B08 00000000 */   nop
endlabel STR_Debug__FP6SFXHDRPce
