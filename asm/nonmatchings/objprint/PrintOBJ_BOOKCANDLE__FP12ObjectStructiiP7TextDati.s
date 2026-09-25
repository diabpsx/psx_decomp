.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PrintOBJ_BOOKCANDLE__FP12ObjectStructiiP7TextDati, 0x24

glabel PrintOBJ_BOOKCANDLE__FP12ObjectStructiiP7TextDati
    /* 6E8C0 8007E8C0 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 6E8C4 8007E8C4 3000A28F */  lw         $v0, 0x30($sp)
    /* 6E8C8 8007E8C8 1800BFAF */  sw         $ra, 0x18($sp)
    /* 6E8CC 8007E8CC DFF6010C */  jal        LightObjPrint__FP12ObjectStructiiP7TextDati
    /* 6E8D0 8007E8D0 1000A2AF */   sw        $v0, 0x10($sp)
    /* 6E8D4 8007E8D4 1800BF8F */  lw         $ra, 0x18($sp)
    /* 6E8D8 8007E8D8 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 6E8DC 8007E8DC 0800E003 */  jr         $ra
    /* 6E8E0 8007E8E0 00000000 */   nop
endlabel PrintOBJ_BOOKCANDLE__FP12ObjectStructiiP7TextDati
