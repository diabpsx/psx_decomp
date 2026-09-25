.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GAL_GetLastErrorText, 0x28

glabel GAL_GetLastErrorText
    /* 126A8 800226A8 1280043C */  lui        $a0, %hi(D_8011C9D4)
    /* 126AC 800226AC D4C9848C */  lw         $a0, %lo(D_8011C9D4)($a0)
    /* 126B0 800226B0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 126B4 800226B4 1000BFAF */  sw         $ra, 0x10($sp)
    /* 126B8 800226B8 9A89000C */  jal        GAL_GetErrorText
    /* 126BC 800226BC 00000000 */   nop
    /* 126C0 800226C0 1000BF8F */  lw         $ra, 0x10($sp)
    /* 126C4 800226C4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 126C8 800226C8 0800E003 */  jr         $ra
    /* 126CC 800226CC 00000000 */   nop
endlabel GAL_GetLastErrorText
