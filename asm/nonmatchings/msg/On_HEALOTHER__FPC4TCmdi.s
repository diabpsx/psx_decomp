.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching On_HEALOTHER__FPC4TCmdi, 0x28

glabel On_HEALOTHER__FPC4TCmdi
    /* 4160C 8005160C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 41610 80051610 02008294 */  lhu        $v0, 0x2($a0)
    /* 41614 80051614 2120A000 */  addu       $a0, $a1, $zero
    /* 41618 80051618 1000BFAF */  sw         $ra, 0x10($sp)
    /* 4161C 8005161C AEDE010C */  jal        DoHealOther__Fii
    /* 41620 80051620 21284000 */   addu      $a1, $v0, $zero
    /* 41624 80051624 1000BF8F */  lw         $ra, 0x10($sp)
    /* 41628 80051628 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 4162C 8005162C 0800E003 */  jr         $ra
    /* 41630 80051630 00000000 */   nop
endlabel On_HEALOTHER__FPC4TCmdi
