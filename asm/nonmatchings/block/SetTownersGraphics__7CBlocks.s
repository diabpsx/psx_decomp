.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetTownersGraphics__7CBlocks, 0x38

glabel SetTownersGraphics__7CBlocks
    /* 7D860 8008D860 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 7D864 8008D864 1000B0AF */  sw         $s0, 0x10($sp)
    /* 7D868 8008D868 21808000 */  addu       $s0, $a0, $zero
    /* 7D86C 8008D86C CD000224 */  addiu      $v0, $zero, 0xCD
    /* 7D870 8008D870 CD000424 */  addiu      $a0, $zero, 0xCD
    /* 7D874 8008D874 1400BFAF */  sw         $ra, 0x14($sp)
    /* 7D878 8008D878 044F020C */  jal        GM_UseTexData__Fi
    /* 7D87C 8008D87C 840002AE */   sw        $v0, 0x84($s0)
    /* 7D880 8008D880 700002AE */  sw         $v0, 0x70($s0)
    /* 7D884 8008D884 1400BF8F */  lw         $ra, 0x14($sp)
    /* 7D888 8008D888 1000B08F */  lw         $s0, 0x10($sp)
    /* 7D88C 8008D88C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 7D890 8008D890 0800E003 */  jr         $ra
    /* 7D894 8008D894 00000000 */   nop
endlabel SetTownersGraphics__7CBlocks
