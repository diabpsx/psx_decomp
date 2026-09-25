.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PrintOBJ_STORYCANDLE__FP12ObjectStructiiP7TextDati, 0x24

glabel PrintOBJ_STORYCANDLE__FP12ObjectStructiiP7TextDati
    /* 6EC08 8007EC08 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 6EC0C 8007EC0C 3000A28F */  lw         $v0, 0x30($sp)
    /* 6EC10 8007EC10 1800BFAF */  sw         $ra, 0x18($sp)
    /* 6EC14 8007EC14 DFF6010C */  jal        LightObjPrint__FP12ObjectStructiiP7TextDati
    /* 6EC18 8007EC18 1000A2AF */   sw        $v0, 0x10($sp)
    /* 6EC1C 8007EC1C 1800BF8F */  lw         $ra, 0x18($sp)
    /* 6EC20 8007EC20 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 6EC24 8007EC24 0800E003 */  jr         $ra
    /* 6EC28 8007EC28 00000000 */   nop
endlabel PrintOBJ_STORYCANDLE__FP12ObjectStructiiP7TextDati
