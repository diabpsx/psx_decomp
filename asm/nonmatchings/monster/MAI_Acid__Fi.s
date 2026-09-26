.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MAI_Acid__Fi, 0x30

glabel MAI_Acid__Fi
    /* 18B80 80152778 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 18B84 8015277C 01000224 */  addiu      $v0, $zero, 0x1
    /* 18B88 80152780 39000524 */  addiu      $a1, $zero, 0x39
    /* 18B8C 80152784 21300000 */  addu       $a2, $zero, $zero
    /* 18B90 80152788 04000724 */  addiu      $a3, $zero, 0x4
    /* 18B94 8015278C 1800BFAF */  sw         $ra, 0x18($sp)
    /* 18B98 80152790 8C48050C */  jal        MAI_RoundRanged__FiiUciUc
    /* 18B9C 80152794 1000A2AF */   sw        $v0, 0x10($sp)
    /* 18BA0 80152798 1800BF8F */  lw         $ra, 0x18($sp)
    /* 18BA4 8015279C 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 18BA8 801527A0 0800E003 */  jr         $ra
    /* 18BAC 801527A4 00000000 */   nop
endlabel MAI_Acid__Fi
