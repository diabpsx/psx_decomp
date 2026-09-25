.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PrintOBJ_CANDLE1__FP12ObjectStructiiP7TextDati, 0x24

glabel PrintOBJ_CANDLE1__FP12ObjectStructiiP7TextDati
    /* 6EC2C 8007EC2C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 6EC30 8007EC30 3000A28F */  lw         $v0, 0x30($sp)
    /* 6EC34 8007EC34 1800BFAF */  sw         $ra, 0x18($sp)
    /* 6EC38 8007EC38 DFF6010C */  jal        LightObjPrint__FP12ObjectStructiiP7TextDati
    /* 6EC3C 8007EC3C 1000A2AF */   sw        $v0, 0x10($sp)
    /* 6EC40 8007EC40 1800BF8F */  lw         $ra, 0x18($sp)
    /* 6EC44 8007EC44 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 6EC48 8007EC48 0800E003 */  jr         $ra
    /* 6EC4C 8007EC4C 00000000 */   nop
endlabel PrintOBJ_CANDLE1__FP12ObjectStructiiP7TextDati
