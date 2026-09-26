.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MAI_Diablo__Fi, 0x2C

glabel MAI_Diablo__Fi
    /* 18BB0 801527A8 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 18BB4 801527AC 43000524 */  addiu      $a1, $zero, 0x43
    /* 18BB8 801527B0 21300000 */  addu       $a2, $zero, $zero
    /* 18BBC 801527B4 28000724 */  addiu      $a3, $zero, 0x28
    /* 18BC0 801527B8 1800BFAF */  sw         $ra, 0x18($sp)
    /* 18BC4 801527BC 8C48050C */  jal        MAI_RoundRanged__FiiUciUc
    /* 18BC8 801527C0 1000A0AF */   sw        $zero, 0x10($sp)
    /* 18BCC 801527C4 1800BF8F */  lw         $ra, 0x18($sp)
    /* 18BD0 801527C8 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 18BD4 801527CC 0800E003 */  jr         $ra
    /* 18BD8 801527D0 00000000 */   nop
endlabel MAI_Diablo__Fi
