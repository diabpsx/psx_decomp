.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MAI_Storm__Fi, 0x2C

glabel MAI_Storm__Fi
    /* 18B54 8015274C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 18B58 80152750 16000524 */  addiu      $a1, $zero, 0x16
    /* 18B5C 80152754 01000624 */  addiu      $a2, $zero, 0x1
    /* 18B60 80152758 04000724 */  addiu      $a3, $zero, 0x4
    /* 18B64 8015275C 1800BFAF */  sw         $ra, 0x18($sp)
    /* 18B68 80152760 8C48050C */  jal        MAI_RoundRanged__FiiUciUc
    /* 18B6C 80152764 1000A0AF */   sw        $zero, 0x10($sp)
    /* 18B70 80152768 1800BF8F */  lw         $ra, 0x18($sp)
    /* 18B74 8015276C 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 18B78 80152770 0800E003 */  jr         $ra
    /* 18B7C 80152774 00000000 */   nop
endlabel MAI_Storm__Fi
