.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PreGameOnlyTestRoutine__Fv, 0x28

glabel PreGameOnlyTestRoutine__Fv
    /* 4 80139BFC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 8 80139C00 1000BFAF */  sw         $ra, 0x10($sp)
    /* C 80139C04 1180043C */  lui        $a0, %hi(D_8011101C)
    /* 10 80139C08 1C108424 */  addiu      $a0, $a0, %lo(D_8011101C)
    /* 14 80139C0C 9B83000C */  jal        DBG_SendMessage
    /* 18 80139C10 00000000 */   nop
    /* 1C 80139C14 1000BF8F */  lw         $ra, 0x10($sp)
    /* 20 80139C18 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 24 80139C1C 0800E003 */  jr         $ra
    /* 28 80139C20 00000000 */   nop
endlabel PreGameOnlyTestRoutine__Fv
