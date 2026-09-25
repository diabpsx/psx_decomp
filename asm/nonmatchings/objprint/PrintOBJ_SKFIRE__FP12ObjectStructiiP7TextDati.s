.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PrintOBJ_SKFIRE__FP12ObjectStructiiP7TextDati, 0x64

glabel PrintOBJ_SKFIRE__FP12ObjectStructiiP7TextDati
    /* 6ECB0 8007ECB0 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 6ECB4 8007ECB4 2400B1AF */  sw         $s1, 0x24($sp)
    /* 6ECB8 8007ECB8 2188A000 */  addu       $s1, $a1, $zero
    /* 6ECBC 8007ECBC 2800B2AF */  sw         $s2, 0x28($sp)
    /* 6ECC0 8007ECC0 2190C000 */  addu       $s2, $a2, $zero
    /* 6ECC4 8007ECC4 2000B0AF */  sw         $s0, 0x20($sp)
    /* 6ECC8 8007ECC8 4000B08F */  lw         $s0, 0x40($sp)
    /* 6ECCC 8007ECCC 2C00BFAF */  sw         $ra, 0x2C($sp)
    /* 6ECD0 8007ECD0 1400A0AF */  sw         $zero, 0x14($sp)
    /* 6ECD4 8007ECD4 1800A0AF */  sw         $zero, 0x18($sp)
    /* 6ECD8 8007ECD8 7AF6010C */  jal        DefaultObjPrint__FP12ObjectStructiiP7TextDatiii
    /* 6ECDC 8007ECDC 1000B0AF */   sw        $s0, 0x10($sp)
    /* 6ECE0 8007ECE0 21202002 */  addu       $a0, $s1, $zero
    /* 6ECE4 8007ECE4 21284002 */  addu       $a1, $s2, $zero
    /* 6ECE8 8007ECE8 21300002 */  addu       $a2, $s0, $zero
    /* 6ECEC 8007ECEC 74F7010C */  jal        PrintOBJ_FIRE__Fiii
    /* 6ECF0 8007ECF0 21804000 */   addu      $s0, $v0, $zero
    /* 6ECF4 8007ECF4 21100002 */  addu       $v0, $s0, $zero
    /* 6ECF8 8007ECF8 2C00BF8F */  lw         $ra, 0x2C($sp)
    /* 6ECFC 8007ECFC 2800B28F */  lw         $s2, 0x28($sp)
    /* 6ED00 8007ED00 2400B18F */  lw         $s1, 0x24($sp)
    /* 6ED04 8007ED04 2000B08F */  lw         $s0, 0x20($sp)
    /* 6ED08 8007ED08 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 6ED0C 8007ED0C 0800E003 */  jr         $ra
    /* 6ED10 8007ED10 00000000 */   nop
endlabel PrintOBJ_SKFIRE__FP12ObjectStructiiP7TextDati
