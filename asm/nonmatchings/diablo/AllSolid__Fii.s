.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AllSolid__Fii, 0x40

glabel AllSolid__Fii
    /* 28F94 80038F94 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 28F98 80038F98 1000B0AF */  sw         $s0, 0x10($sp)
    /* 28F9C 80038F9C 21808000 */  addu       $s0, $a0, $zero
    /* 28FA0 80038FA0 1400B1AF */  sw         $s1, 0x14($sp)
    /* 28FA4 80038FA4 1800BFAF */  sw         $ra, 0x18($sp)
    /* 28FA8 80038FA8 F20A020C */  jal        SetSOLID__Fii
    /* 28FAC 80038FAC 2188A000 */   addu      $s1, $a1, $zero
    /* 28FB0 80038FB0 21200002 */  addu       $a0, $s0, $zero
    /* 28FB4 80038FB4 4A0B020C */  jal        SetMISSILE__Fii
    /* 28FB8 80038FB8 21282002 */   addu      $a1, $s1, $zero
    /* 28FBC 80038FBC 1800BF8F */  lw         $ra, 0x18($sp)
    /* 28FC0 80038FC0 1400B18F */  lw         $s1, 0x14($sp)
    /* 28FC4 80038FC4 1000B08F */  lw         $s0, 0x10($sp)
    /* 28FC8 80038FC8 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 28FCC 80038FCC 0800E003 */  jr         $ra
    /* 28FD0 80038FD0 00000000 */   nop
endlabel AllSolid__Fii
