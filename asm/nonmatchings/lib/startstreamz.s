.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching startstreamz, 0x28

glabel startstreamz
    /* 1D408 8002D408 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 1D40C 8002D40C 01000624 */  addiu      $a2, $zero, 0x1
    /* 1D410 8002D410 21380000 */  addu       $a3, $zero, $zero
    /* 1D414 8002D414 1800BFAF */  sw         $ra, 0x18($sp)
    /* 1D418 8002D418 ABB4000C */  jal        purgestreamcommanda
    /* 1D41C 8002D41C 1000A0AF */   sw        $zero, 0x10($sp)
    /* 1D420 8002D420 1800BF8F */  lw         $ra, 0x18($sp)
    /* 1D424 8002D424 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 1D428 8002D428 0800E003 */  jr         $ra
    /* 1D42C 8002D42C 00000000 */   nop
endlabel startstreamz
