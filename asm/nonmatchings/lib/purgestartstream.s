.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching purgestartstream, 0x2C

glabel purgestartstream
    /* 1D48C 8002D48C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 1D490 8002D490 01000224 */  addiu      $v0, $zero, 0x1
    /* 1D494 8002D494 0D000624 */  addiu      $a2, $zero, 0xD
    /* 1D498 8002D498 21380000 */  addu       $a3, $zero, $zero
    /* 1D49C 8002D49C 1800BFAF */  sw         $ra, 0x18($sp)
    /* 1D4A0 8002D4A0 ABB4000C */  jal        purgestreamcommanda
    /* 1D4A4 8002D4A4 1000A2AF */   sw        $v0, 0x10($sp)
    /* 1D4A8 8002D4A8 1800BF8F */  lw         $ra, 0x18($sp)
    /* 1D4AC 8002D4AC 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 1D4B0 8002D4B0 0800E003 */  jr         $ra
    /* 1D4B4 8002D4B4 00000000 */   nop
endlabel purgestartstream
