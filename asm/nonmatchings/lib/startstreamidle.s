.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching startstreamidle, 0x2C

glabel startstreamidle
    /* 1D4E0 8002D4E0 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 1D4E4 8002D4E4 01000224 */  addiu      $v0, $zero, 0x1
    /* 1D4E8 8002D4E8 12000624 */  addiu      $a2, $zero, 0x12
    /* 1D4EC 8002D4EC 21380000 */  addu       $a3, $zero, $zero
    /* 1D4F0 8002D4F0 1800BFAF */  sw         $ra, 0x18($sp)
    /* 1D4F4 8002D4F4 ABB4000C */  jal        purgestreamcommanda
    /* 1D4F8 8002D4F8 1000A2AF */   sw        $v0, 0x10($sp)
    /* 1D4FC 8002D4FC 1800BF8F */  lw         $ra, 0x18($sp)
    /* 1D500 8002D500 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 1D504 8002D504 0800E003 */  jr         $ra
    /* 1D508 8002D508 00000000 */   nop
endlabel startstreamidle
