.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GAL_SetErrorChecking, 0x10

glabel GAL_SetErrorChecking
    /* 112D4 800212D4 1280013C */  lui        $at, %hi(D_8011C9DC)
    /* 112D8 800212D8 DCC924A0 */  sb         $a0, %lo(D_8011C9DC)($at)
    /* 112DC 800212DC 0800E003 */  jr         $ra
    /* 112E0 800212E0 00000000 */   nop
endlabel GAL_SetErrorChecking
