.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ___17CTempPauseMessage, 0x28

glabel ___17CTempPauseMessage
    /* 792C0 800892C0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 792C4 800892C4 1180023C */  lui        $v0, %hi(_vt_17CTempPauseMessage)
    /* 792C8 800892C8 D0034224 */  addiu      $v0, $v0, %lo(_vt_17CTempPauseMessage)
    /* 792CC 800892CC 1000BFAF */  sw         $ra, 0x10($sp)
    /* 792D0 800892D0 DF24020C */  jal        ___14CPauseMessages
    /* 792D4 800892D4 040082AC */   sw        $v0, 0x4($a0)
    /* 792D8 800892D8 1000BF8F */  lw         $ra, 0x10($sp)
    /* 792DC 800892DC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 792E0 800892E0 0800E003 */  jr         $ra
    /* 792E4 800892E4 00000000 */   nop
endlabel ___17CTempPauseMessage
