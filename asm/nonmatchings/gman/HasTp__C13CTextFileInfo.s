.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching HasTp__C13CTextFileInfo, 0x28

glabel HasTp__C13CTextFileInfo
    /* 853BC 800953BC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 853C0 800953C0 1000BFAF */  sw         $ra, 0x10($sp)
    /* 853C4 800953C4 1280053C */  lui        $a1, %hi(D_8011ACEC)
    /* 853C8 800953C8 ECACA524 */  addiu      $a1, $a1, %lo(D_8011ACEC)
    /* 853CC 800953CC BD51020C */  jal        HasFile__C13CTextFileInfoPc
    /* 853D0 800953D0 00000000 */   nop
    /* 853D4 800953D4 1000BF8F */  lw         $ra, 0x10($sp)
    /* 853D8 800953D8 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 853DC 800953DC 0800E003 */  jr         $ra
    /* 853E0 800953E0 00000000 */   nop
endlabel HasTp__C13CTextFileInfo
