.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching loadfileatadrz, 0x20

glabel loadfileatadrz
    /* 199C0 800299C0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 199C4 800299C4 1000BFAF */  sw         $ra, 0x10($sp)
    /* 199C8 800299C8 1FA6000C */  jal        loadfileatadra
    /* 199CC 800299CC 21300000 */   addu      $a2, $zero, $zero
    /* 199D0 800299D0 1000BF8F */  lw         $ra, 0x10($sp)
    /* 199D4 800299D4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 199D8 800299D8 0800E003 */  jr         $ra
    /* 199DC 800299DC 00000000 */   nop
endlabel loadfileatadrz
