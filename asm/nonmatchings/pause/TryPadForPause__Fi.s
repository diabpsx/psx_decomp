.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TryPadForPause__Fi, 0x2C

glabel TryPadForPause__Fi
    /* 78640 80088640 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 78644 80088644 1000BFAF */  sw         $ra, 0x10($sp)
    /* 78648 80088648 FD25020C */  jal        PAD_GetPad__FiUc
    /* 7864C 8008864C 21280000 */   addu      $a1, $zero, $zero
    /* 78650 80088650 2B25020C */  jal        GetDown__C4CPad_800894ac
    /* 78654 80088654 21204000 */   addu      $a0, $v0, $zero
    /* 78658 80088658 10004230 */  andi       $v0, $v0, 0x10
    /* 7865C 8008865C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 78660 80088660 2B100200 */  sltu       $v0, $zero, $v0
    /* 78664 80088664 0800E003 */  jr         $ra
    /* 78668 80088668 1800BD27 */   addiu     $sp, $sp, 0x18
endlabel TryPadForPause__Fi
