.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching queuestartstreamidlez, 0x2C

glabel queuestartstreamidlez
    /* 1D564 8002D564 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 1D568 8002D568 13000624 */  addiu      $a2, $zero, 0x13
    /* 1D56C 8002D56C 21380000 */  addu       $a3, $zero, $zero
    /* 1D570 8002D570 1800BFAF */  sw         $ra, 0x18($sp)
    /* 1D574 8002D574 1000A0AF */  sw         $zero, 0x10($sp)
    /* 1D578 8002D578 5EB4000C */  jal        streamcommanda
    /* 1D57C 8002D57C 1400A0AF */   sw        $zero, 0x14($sp)
    /* 1D580 8002D580 1800BF8F */  lw         $ra, 0x18($sp)
    /* 1D584 8002D584 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 1D588 8002D588 0800E003 */  jr         $ra
    /* 1D58C 8002D58C 00000000 */   nop
endlabel queuestartstreamidlez
