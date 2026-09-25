.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching queuestartstreamz, 0x2C

glabel queuestartstreamz
    /* 1D460 8002D460 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 1D464 8002D464 11000624 */  addiu      $a2, $zero, 0x11
    /* 1D468 8002D468 21380000 */  addu       $a3, $zero, $zero
    /* 1D46C 8002D46C 1800BFAF */  sw         $ra, 0x18($sp)
    /* 1D470 8002D470 1000A0AF */  sw         $zero, 0x10($sp)
    /* 1D474 8002D474 5EB4000C */  jal        streamcommanda
    /* 1D478 8002D478 1400A0AF */   sw        $zero, 0x14($sp)
    /* 1D47C 8002D47C 1800BF8F */  lw         $ra, 0x18($sp)
    /* 1D480 8002D480 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 1D484 8002D484 0800E003 */  jr         $ra
    /* 1D488 8002D488 00000000 */   nop
endlabel queuestartstreamz
