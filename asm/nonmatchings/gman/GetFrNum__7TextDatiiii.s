.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetFrNum__7TextDatiiii, 0x54

glabel GetFrNum__7TextDatiiii
    /* 83E98 80093E98 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 83E9C 80093E9C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 83EA0 80093EA0 3000B18F */  lw         $s1, 0x30($sp)
    /* 83EA4 80093EA4 1000B0AF */  sw         $s0, 0x10($sp)
    /* 83EA8 80093EA8 2180C000 */  addu       $s0, $a2, $zero
    /* 83EAC 80093EAC 1800B2AF */  sw         $s2, 0x18($sp)
    /* 83EB0 80093EB0 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 83EB4 80093EB4 C054020C */  jal        GetCreature__7TextDati_80095300
    /* 83EB8 80093EB8 2190E000 */   addu      $s2, $a3, $zero
    /* 83EBC 80093EBC 21204000 */  addu       $a0, $v0, $zero
    /* 83EC0 80093EC0 21280002 */  addu       $a1, $s0, $zero
    /* 83EC4 80093EC4 21304002 */  addu       $a2, $s2, $zero
    /* 83EC8 80093EC8 AA50020C */  jal        GetFrNum__C12CCreatureHdriii
    /* 83ECC 80093ECC 21382002 */   addu      $a3, $s1, $zero
    /* 83ED0 80093ED0 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 83ED4 80093ED4 1800B28F */  lw         $s2, 0x18($sp)
    /* 83ED8 80093ED8 1400B18F */  lw         $s1, 0x14($sp)
    /* 83EDC 80093EDC 1000B08F */  lw         $s0, 0x10($sp)
    /* 83EE0 80093EE0 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 83EE4 80093EE4 0800E003 */  jr         $ra
    /* 83EE8 80093EE8 00000000 */   nop
endlabel GetFrNum__7TextDatiiii
