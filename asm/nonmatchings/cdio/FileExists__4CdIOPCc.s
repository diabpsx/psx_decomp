.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FileExists__4CdIOPCc, 0x24

glabel FileExists__4CdIOPCc
    /* 76CDC 80086CDC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 76CE0 80086CE0 1000BFAF */  sw         $ra, 0x10($sp)
    /* 76CE4 80086CE4 2120A000 */  addu       $a0, $a1, $zero
    /* 76CE8 80086CE8 FE1E020C */  jal        BL_FileExists__FPcc
    /* 76CEC 80086CEC 01000524 */   addiu     $a1, $zero, 0x1
    /* 76CF0 80086CF0 1000BF8F */  lw         $ra, 0x10($sp)
    /* 76CF4 80086CF4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 76CF8 80086CF8 0800E003 */  jr         $ra
    /* 76CFC 80086CFC 00000000 */   nop
endlabel FileExists__4CdIOPCc
