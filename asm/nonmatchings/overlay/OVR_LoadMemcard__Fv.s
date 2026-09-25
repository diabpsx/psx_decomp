.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching OVR_LoadMemcard__Fv, 0x2C

glabel OVR_LoadMemcard__Fv
    /* 854C4 800954C4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 854C8 800954C8 1000BFAF */  sw         $ra, 0x10($sp)
    /* 854CC 800954CC 21200000 */  addu       $a0, $zero, $zero
    /* 854D0 800954D0 1180053C */  lui        $a1, %hi(D_801105BC)
    /* 854D4 800954D4 BC05A524 */  addiu      $a1, $a1, %lo(D_801105BC)
    /* 854D8 800954D8 A583000C */  jal        DBG_Error
    /* 854DC 800954DC A5000624 */   addiu     $a2, $zero, 0xA5
    /* 854E0 800954E0 1000BF8F */  lw         $ra, 0x10($sp)
    /* 854E4 800954E4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 854E8 800954E8 0800E003 */  jr         $ra
    /* 854EC 800954EC 00000000 */   nop
endlabel OVR_LoadMemcard__Fv
