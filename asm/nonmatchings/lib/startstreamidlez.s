.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching startstreamidlez, 0x28

glabel startstreamidlez
    /* 1D50C 8002D50C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 1D510 8002D510 12000624 */  addiu      $a2, $zero, 0x12
    /* 1D514 8002D514 21380000 */  addu       $a3, $zero, $zero
    /* 1D518 8002D518 1800BFAF */  sw         $ra, 0x18($sp)
    /* 1D51C 8002D51C ABB4000C */  jal        purgestreamcommanda
    /* 1D520 8002D520 1000A0AF */   sw        $zero, 0x10($sp)
    /* 1D524 8002D524 1800BF8F */  lw         $ra, 0x18($sp)
    /* 1D528 8002D528 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 1D52C 8002D52C 0800E003 */  jr         $ra
    /* 1D530 8002D530 00000000 */   nop
endlabel startstreamidlez
