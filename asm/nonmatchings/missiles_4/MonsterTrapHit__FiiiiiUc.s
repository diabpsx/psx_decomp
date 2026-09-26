.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MonsterTrapHit__FiiiiiUc, 0x30

glabel MonsterTrapHit__FiiiiiUc
    /* 1454 8013B04C C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 1458 8013B050 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 145C 8013B054 21888000 */  addu       $s1, $a0, $zero
    /* 1460 8013B058 2C00B5AF */  sw         $s5, 0x2C($sp)
    /* 1464 8013B05C 21A8A000 */  addu       $s5, $a1, $zero
    /* 1468 8013B060 3400B7AF */  sw         $s7, 0x34($sp)
    /* 146C 8013B064 21B8C000 */  addu       $s7, $a2, $zero
    /* 1470 8013B068 1800B0AF */  sw         $s0, 0x18($sp)
    /* 1474 8013B06C 2180E000 */  addu       $s0, $a3, $zero
    /* 1478 8013B070 2800B4AF */  sw         $s4, 0x28($sp)
    /* 147C 8013B074 40101100 */  sll        $v0, $s1, 1
    /* 1480 8013B078 21105100 */  addu       $v0, $v0, $s1
endlabel MonsterTrapHit__FiiiiiUc
