.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GAL_GetNumFreeHeaders, 0x10

glabel GAL_GetNumFreeHeaders
    /* 1307C 8002307C 1280023C */  lui        $v0, %hi(D_8011C9EC)
    /* 13080 80023080 ECC9428C */  lw         $v0, %lo(D_8011C9EC)($v0)
    /* 13084 80023084 0800E003 */  jr         $ra
    /* 13088 80023088 00000000 */   nop
endlabel GAL_GetNumFreeHeaders
