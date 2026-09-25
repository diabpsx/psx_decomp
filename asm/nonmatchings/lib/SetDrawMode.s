.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetDrawMode, 0x54

glabel SetDrawMode
    /* 4888 80014888 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 488C 8001488C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 4890 80014890 21808000 */  addu       $s0, $a0, $zero
    /* 4894 80014894 2120A000 */  addu       $a0, $a1, $zero
    /* 4898 80014898 02000224 */  addiu      $v0, $zero, 0x2
    /* 489C 8001489C 2128C000 */  addu       $a1, $a2, $zero
    /* 48A0 800148A0 1400B1AF */  sw         $s1, 0x14($sp)
    /* 48A4 800148A4 3000B18F */  lw         $s1, 0x30($sp)
    /* 48A8 800148A8 FFFFE630 */  andi       $a2, $a3, 0xFFFF
    /* 48AC 800148AC 1800BFAF */  sw         $ra, 0x18($sp)
    /* 48B0 800148B0 5153000C */  jal        func_80014D44
    /* 48B4 800148B4 030002A2 */   sb        $v0, 0x3($s0)
    /* 48B8 800148B8 040002AE */  sw         $v0, 0x4($s0)
    /* 48BC 800148BC AC53000C */  jal        func_80014EB0
    /* 48C0 800148C0 21202002 */   addu      $a0, $s1, $zero
    /* 48C4 800148C4 080002AE */  sw         $v0, 0x8($s0)
    /* 48C8 800148C8 1800BF8F */  lw         $ra, 0x18($sp)
    /* 48CC 800148CC 1400B18F */  lw         $s1, 0x14($sp)
    /* 48D0 800148D0 1000B08F */  lw         $s0, 0x10($sp)
    /* 48D4 800148D4 0800E003 */  jr         $ra
    /* 48D8 800148D8 2000BD27 */   addiu     $sp, $sp, 0x20
endlabel SetDrawMode
