.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GAL_GetLastTypeAlloced, 0x10

glabel GAL_GetLastTypeAlloced
    /* 1308C 8002308C 1280023C */  lui        $v0, %hi(D_8011C9F0)
    /* 13090 80023090 F0C9428C */  lw         $v0, %lo(D_8011C9F0)($v0)
    /* 13094 80023094 0800E003 */  jr         $ra
    /* 13098 80023098 00000000 */   nop
endlabel GAL_GetLastTypeAlloced
