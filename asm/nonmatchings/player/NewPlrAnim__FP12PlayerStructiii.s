.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching NewPlrAnim__FP12PlayerStructiii, 0x1C

glabel NewPlrAnim__FP12PlayerStructiii
    /* 4FE1C 8005FE1C 01000224 */  addiu      $v0, $zero, 0x1
    /* 4FE20 8005FE20 880185A0 */  sb         $a1, 0x188($a0)
    /* 4FE24 8005FE24 500086AC */  sw         $a2, 0x50($a0)
    /* 4FE28 8005FE28 540082AC */  sw         $v0, 0x54($a0)
    /* 4FE2C 8005FE2C 4C0080AC */  sw         $zero, 0x4C($a0)
    /* 4FE30 8005FE30 0800E003 */  jr         $ra
    /* 4FE34 8005FE34 480087AC */   sw        $a3, 0x48($a0)
endlabel NewPlrAnim__FP12PlayerStructiii
