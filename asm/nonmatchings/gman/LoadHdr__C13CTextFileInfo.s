.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching LoadHdr__C13CTextFileInfo, 0x28

glabel LoadHdr__C13CTextFileInfo
    /* 845E4 800945E4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 845E8 800945E8 1000BFAF */  sw         $ra, 0x10($sp)
    /* 845EC 800945EC 1280053C */  lui        $a1, %hi(D_8011AD14)
    /* 845F0 800945F0 14ADA524 */  addiu      $a1, $a1, %lo(D_8011AD14)
    /* 845F4 800945F4 9551020C */  jal        GetFile__C13CTextFileInfoPcUl
    /* 845F8 800945F8 01800634 */   ori       $a2, $zero, 0x8001
    /* 845FC 800945FC 1000BF8F */  lw         $ra, 0x10($sp)
    /* 84600 80094600 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 84604 80094604 0800E003 */  jr         $ra
    /* 84608 80094608 00000000 */   nop
endlabel LoadHdr__C13CTextFileInfo
