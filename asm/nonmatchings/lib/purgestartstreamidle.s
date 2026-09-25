.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching purgestartstreamidle, 0x2C

glabel purgestartstreamidle
    /* 1D590 8002D590 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 1D594 8002D594 01000224 */  addiu      $v0, $zero, 0x1
    /* 1D598 8002D598 14000624 */  addiu      $a2, $zero, 0x14
    /* 1D59C 8002D59C 21380000 */  addu       $a3, $zero, $zero
    /* 1D5A0 8002D5A0 1800BFAF */  sw         $ra, 0x18($sp)
    /* 1D5A4 8002D5A4 ABB4000C */  jal        purgestreamcommanda
    /* 1D5A8 8002D5A8 1000A2AF */   sw        $v0, 0x10($sp)
    /* 1D5AC 8002D5AC 1800BF8F */  lw         $ra, 0x18($sp)
    /* 1D5B0 8002D5B0 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 1D5B4 8002D5B4 0800E003 */  jr         $ra
    /* 1D5B8 8002D5B8 00000000 */   nop
endlabel purgestartstreamidle
