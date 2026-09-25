.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MakeFname__C13CTextFileInfoPcPCc, 0x48

glabel MakeFname__C13CTextFileInfoPcPCc
    /* 8460C 8009460C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 84610 80094610 1000B0AF */  sw         $s0, 0x10($sp)
    /* 84614 80094614 2180A000 */  addu       $s0, $a1, $zero
    /* 84618 80094618 1400B1AF */  sw         $s1, 0x14($sp)
    /* 8461C 8009461C 2188C000 */  addu       $s1, $a2, $zero
    /* 84620 80094620 0000858C */  lw         $a1, 0x0($a0)
    /* 84624 80094624 1800BFAF */  sw         $ra, 0x18($sp)
    /* 84628 80094628 F240000C */  jal        strcpy
    /* 8462C 8009462C 21200002 */   addu      $a0, $s0, $zero
    /* 84630 80094630 21200002 */  addu       $a0, $s0, $zero
    /* 84634 80094634 FC40000C */  jal        strcat
    /* 84638 80094638 21282002 */   addu      $a1, $s1, $zero
    /* 8463C 8009463C 1800BF8F */  lw         $ra, 0x18($sp)
    /* 84640 80094640 1400B18F */  lw         $s1, 0x14($sp)
    /* 84644 80094644 1000B08F */  lw         $s0, 0x10($sp)
    /* 84648 80094648 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 8464C 8009464C 0800E003 */  jr         $ra
    /* 84650 80094650 00000000 */   nop
endlabel MakeFname__C13CTextFileInfoPcPCc
