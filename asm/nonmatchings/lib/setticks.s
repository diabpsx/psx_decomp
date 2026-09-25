.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching setticks, 0x30

glabel setticks
    /* 200B4 800300B4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 200B8 800300B8 1000B0AF */  sw         $s0, 0x10($sp)
    /* 200BC 800300BC 1400BFAF */  sw         $ra, 0x14($sp)
    /* 200C0 800300C0 08C0000C */  jal        gettick
    /* 200C4 800300C4 21808000 */   addu      $s0, $a0, $zero
    /* 200C8 800300C8 21105000 */  addu       $v0, $v0, $s0
    /* 200CC 800300CC 7C1E82AF */  sw         $v0, %gp_rel(tickset)($gp)
    /* 200D0 800300D0 1400BF8F */  lw         $ra, 0x14($sp)
    /* 200D4 800300D4 1000B08F */  lw         $s0, 0x10($sp)
    /* 200D8 800300D8 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 200DC 800300DC 0800E003 */  jr         $ra
    /* 200E0 800300E0 00000000 */   nop
endlabel setticks
