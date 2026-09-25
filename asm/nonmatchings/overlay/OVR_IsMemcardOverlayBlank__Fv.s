.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching OVR_IsMemcardOverlayBlank__Fv, 0x2C

glabel OVR_IsMemcardOverlayBlank__Fv
    /* 853F8 800953F8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 853FC 800953FC 1000BFAF */  sw         $ra, 0x10($sp)
    /* 85400 80095400 21200000 */  addu       $a0, $zero, $zero
    /* 85404 80095404 1180053C */  lui        $a1, %hi(D_801105BC)
    /* 85408 80095408 BC05A524 */  addiu      $a1, $a1, %lo(D_801105BC)
    /* 8540C 8009540C A583000C */  jal        DBG_Error
    /* 85410 80095410 78000624 */   addiu     $a2, $zero, 0x78
    /* 85414 80095414 1000BF8F */  lw         $ra, 0x10($sp)
    /* 85418 80095418 01000224 */  addiu      $v0, $zero, 0x1
    /* 8541C 8009541C 0800E003 */  jr         $ra
    /* 85420 80095420 1800BD27 */   addiu     $sp, $sp, 0x18
endlabel OVR_IsMemcardOverlayBlank__Fv
