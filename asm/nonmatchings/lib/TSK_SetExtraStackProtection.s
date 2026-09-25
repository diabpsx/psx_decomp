.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TSK_SetExtraStackProtection, 0x10

glabel TSK_SetExtraStackProtection
    /* 10B34 80020B34 1280013C */  lui        $at, %hi(D_8011C9C4)
    /* 10B38 80020B38 C4C924A0 */  sb         $a0, %lo(D_8011C9C4)($at)
    /* 10B3C 80020B3C 0800E003 */  jr         $ra
    /* 10B40 80020B40 00000000 */   nop
endlabel TSK_SetExtraStackProtection
