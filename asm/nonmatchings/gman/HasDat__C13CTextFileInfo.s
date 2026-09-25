.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching HasDat__C13CTextFileInfo, 0x28

glabel HasDat__C13CTextFileInfo
    /* 85394 80095394 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 85398 80095398 1000BFAF */  sw         $ra, 0x10($sp)
    /* 8539C 8009539C 1280053C */  lui        $a1, %hi(D_8011ACF0)
    /* 853A0 800953A0 F0ACA524 */  addiu      $a1, $a1, %lo(D_8011ACF0)
    /* 853A4 800953A4 BD51020C */  jal        HasFile__C13CTextFileInfoPc
    /* 853A8 800953A8 00000000 */   nop
    /* 853AC 800953AC 1000BF8F */  lw         $ra, 0x10($sp)
    /* 853B0 800953B0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 853B4 800953B4 0800E003 */  jr         $ra
    /* 853B8 800953B8 00000000 */   nop
endlabel HasDat__C13CTextFileInfo
