.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching asyncloadsegment, 0x20

glabel asyncloadsegment
    /* 140D8 800240D8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 140DC 800240DC 1000BFAF */  sw         $ra, 0x10($sp)
    /* 140E0 800240E0 E28F000C */  jal        asyncloadsegmentcallback
    /* 140E4 800240E4 21380000 */   addu      $a3, $zero, $zero
    /* 140E8 800240E8 1000BF8F */  lw         $ra, 0x10($sp)
    /* 140EC 800240EC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 140F0 800240F0 0800E003 */  jr         $ra
    /* 140F4 800240F4 00000000 */   nop
endlabel asyncloadsegment
