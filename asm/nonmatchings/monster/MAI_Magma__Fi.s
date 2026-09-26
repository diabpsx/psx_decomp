.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MAI_Magma__Fi, 0x2C

glabel MAI_Magma__Fi
    /* 18B28 80152720 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 18B2C 80152724 15000524 */  addiu      $a1, $zero, 0x15
    /* 18B30 80152728 01000624 */  addiu      $a2, $zero, 0x1
    /* 18B34 8015272C 04000724 */  addiu      $a3, $zero, 0x4
    /* 18B38 80152730 1800BFAF */  sw         $ra, 0x18($sp)
    /* 18B3C 80152734 8C48050C */  jal        MAI_RoundRanged__FiiUciUc
    /* 18B40 80152738 1000A0AF */   sw        $zero, 0x10($sp)
    /* 18B44 8015273C 1800BF8F */  lw         $ra, 0x18($sp)
    /* 18B48 80152740 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 18B4C 80152744 0800E003 */  jr         $ra
    /* 18B50 80152748 00000000 */   nop
endlabel MAI_Magma__Fi
