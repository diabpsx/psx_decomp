.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AS_GetBlock__FP6SFXHDR, 0x30

glabel AS_GetBlock__FP6SFXHDR
    /* 8ABF4 8009ABF4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 8ABF8 8009ABF8 1000B0AF */  sw         $s0, 0x10($sp)
    /* 8ABFC 8009ABFC 21808000 */  addu       $s0, $a0, $zero
    /* 8AC00 8009AC00 1400BFAF */  sw         $ra, 0x14($sp)
    /* 8AC04 8009AC04 53BE000C */  jal        systemtask
    /* 8AC08 8009AC08 21200000 */   addu      $a0, $zero, $zero
    /* 8AC0C 8009AC0C 0D000292 */  lbu        $v0, 0xD($s0)
    /* 8AC10 8009AC10 1400BF8F */  lw         $ra, 0x14($sp)
    /* 8AC14 8009AC14 1000B08F */  lw         $s0, 0x10($sp)
    /* 8AC18 8009AC18 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 8AC1C 8009AC1C 0800E003 */  jr         $ra
    /* 8AC20 8009AC20 00000000 */   nop
endlabel AS_GetBlock__FP6SFXHDR
