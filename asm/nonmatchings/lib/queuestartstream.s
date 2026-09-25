.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching queuestartstream, 0x30

glabel queuestartstream
    /* 1D430 8002D430 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 1D434 8002D434 01000224 */  addiu      $v0, $zero, 0x1
    /* 1D438 8002D438 11000624 */  addiu      $a2, $zero, 0x11
    /* 1D43C 8002D43C 21380000 */  addu       $a3, $zero, $zero
    /* 1D440 8002D440 1800BFAF */  sw         $ra, 0x18($sp)
    /* 1D444 8002D444 1000A0AF */  sw         $zero, 0x10($sp)
    /* 1D448 8002D448 5EB4000C */  jal        streamcommanda
    /* 1D44C 8002D44C 1400A2AF */   sw        $v0, 0x14($sp)
    /* 1D450 8002D450 1800BF8F */  lw         $ra, 0x18($sp)
    /* 1D454 8002D454 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 1D458 8002D458 0800E003 */  jr         $ra
    /* 1D45C 8002D45C 00000000 */   nop
endlabel queuestartstream
