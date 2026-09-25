.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PrintOBJ_CANDLE2__FP12ObjectStructiiP7TextDati, 0x24

glabel PrintOBJ_CANDLE2__FP12ObjectStructiiP7TextDati
    /* 6EC50 8007EC50 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 6EC54 8007EC54 3000A28F */  lw         $v0, 0x30($sp)
    /* 6EC58 8007EC58 1800BFAF */  sw         $ra, 0x18($sp)
    /* 6EC5C 8007EC5C DFF6010C */  jal        LightObjPrint__FP12ObjectStructiiP7TextDati
    /* 6EC60 8007EC60 1000A2AF */   sw        $v0, 0x10($sp)
    /* 6EC64 8007EC64 1800BF8F */  lw         $ra, 0x18($sp)
    /* 6EC68 8007EC68 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 6EC6C 8007EC6C 0800E003 */  jr         $ra
    /* 6EC70 8007EC70 00000000 */   nop
endlabel PrintOBJ_CANDLE2__FP12ObjectStructiiP7TextDati
