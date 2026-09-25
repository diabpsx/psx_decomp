.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetSize__C15CCreatureAction, 0x28

glabel GetSize__C15CCreatureAction
    /* 84190 80094190 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 84194 80094194 02008490 */  lbu        $a0, 0x2($a0)
    /* 84198 80094198 04000524 */  addiu      $a1, $zero, 0x4
    /* 8419C 8009419C 1000BFAF */  sw         $ra, 0x10($sp)
    /* 841A0 800941A0 7883000C */  jal        GU_AlignVal
    /* 841A4 800941A4 0C008424 */   addiu     $a0, $a0, 0xC
    /* 841A8 800941A8 1000BF8F */  lw         $ra, 0x10($sp)
    /* 841AC 800941AC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 841B0 800941B0 0800E003 */  jr         $ra
    /* 841B4 800941B4 00000000 */   nop
endlabel GetSize__C15CCreatureAction
