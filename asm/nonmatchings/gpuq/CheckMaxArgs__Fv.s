.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CheckMaxArgs__Fv, 0x34

glabel CheckMaxArgs__Fv
    /* 733B0 800833B0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 733B4 800833B4 2403838F */  lw         $v1, %gp_rel(ArgsSoFar)($gp)
    /* 733B8 800833B8 1E000224 */  addiu      $v0, $zero, 0x1E
    /* 733BC 800833BC 05006214 */  bne        $v1, $v0, .L800833D4
    /* 733C0 800833C0 1000BFAF */   sw        $ra, 0x10($sp)
    /* 733C4 800833C4 9E4E000C */  jal        DrawSync
    /* 733C8 800833C8 21200000 */   addu      $a0, $zero, $zero
    /* 733CC 800833CC FC0C020C */  jal        GPUQ_FlushQ__Fv
    /* 733D0 800833D0 00000000 */   nop
  .L800833D4:
    /* 733D4 800833D4 1000BF8F */  lw         $ra, 0x10($sp)
    /* 733D8 800833D8 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 733DC 800833DC 0800E003 */  jr         $ra
    /* 733E0 800833E0 00000000 */   nop
endlabel CheckMaxArgs__Fv
