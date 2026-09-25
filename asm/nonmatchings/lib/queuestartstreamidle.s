.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching queuestartstreamidle, 0x30

glabel queuestartstreamidle
    /* 1D534 8002D534 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 1D538 8002D538 01000224 */  addiu      $v0, $zero, 0x1
    /* 1D53C 8002D53C 13000624 */  addiu      $a2, $zero, 0x13
    /* 1D540 8002D540 21380000 */  addu       $a3, $zero, $zero
    /* 1D544 8002D544 1800BFAF */  sw         $ra, 0x18($sp)
    /* 1D548 8002D548 1000A0AF */  sw         $zero, 0x10($sp)
    /* 1D54C 8002D54C 5EB4000C */  jal        streamcommanda
    /* 1D550 8002D550 1400A2AF */   sw        $v0, 0x14($sp)
    /* 1D554 8002D554 1800BF8F */  lw         $ra, 0x18($sp)
    /* 1D558 8002D558 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 1D55C 8002D55C 0800E003 */  jr         $ra
    /* 1D560 8002D560 00000000 */   nop
endlabel queuestartstreamidle
