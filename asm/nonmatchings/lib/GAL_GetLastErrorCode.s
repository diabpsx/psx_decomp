.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GAL_GetLastErrorCode, 0x10

glabel GAL_GetLastErrorCode
    /* 12698 80022698 1280023C */  lui        $v0, %hi(D_8011C9D4)
    /* 1269C 8002269C D4C9428C */  lw         $v0, %lo(D_8011C9D4)($v0)
    /* 126A0 800226A0 0800E003 */  jr         $ra
    /* 126A4 800226A4 00000000 */   nop
endlabel GAL_GetLastErrorCode
