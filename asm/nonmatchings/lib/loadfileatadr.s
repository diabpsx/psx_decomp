.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching loadfileatadr, 0x20

glabel loadfileatadr
    /* 199A0 800299A0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 199A4 800299A4 1000BFAF */  sw         $ra, 0x10($sp)
    /* 199A8 800299A8 1FA6000C */  jal        loadfileatadra
    /* 199AC 800299AC 01000624 */   addiu     $a2, $zero, 0x1
    /* 199B0 800299B0 1000BF8F */  lw         $ra, 0x10($sp)
    /* 199B4 800299B4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 199B8 800299B8 0800E003 */  jr         $ra
    /* 199BC 800299BC 00000000 */   nop
endlabel loadfileatadr
