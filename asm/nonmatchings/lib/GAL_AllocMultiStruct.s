.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GAL_AllocMultiStruct, 0x50

glabel GAL_AllocMultiStruct
    /* 12830 80022830 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 12834 80022834 1000B0AF */  sw         $s0, 0x10($sp)
    /* 12838 80022838 2180A000 */  addu       $s0, $a1, $zero
    /* 1283C 8002283C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 12840 80022840 2188C000 */  addu       $s1, $a2, $zero
    /* 12844 80022844 FFFF053C */  lui        $a1, (0xFFFF7FFF >> 16)
    /* 12848 80022848 FF7FA534 */  ori        $a1, $a1, (0xFFFF7FFF & 0xFFFF)
    /* 1284C 8002284C 1800BFAF */  sw         $ra, 0x18($sp)
    /* 12850 80022850 208A000C */  jal        GAL_ProcessMultiStruct
    /* 12854 80022854 24280502 */   and       $a1, $s0, $a1
    /* 12858 80022858 21204000 */  addu       $a0, $v0, $zero
    /* 1285C 8002285C 21280002 */  addu       $a1, $s0, $zero
    /* 12860 80022860 7785000C */  jal        GAL_Alloc
    /* 12864 80022864 21302002 */   addu      $a2, $s1, $zero
    /* 12868 80022868 1800BF8F */  lw         $ra, 0x18($sp)
    /* 1286C 8002286C 1400B18F */  lw         $s1, 0x14($sp)
    /* 12870 80022870 1000B08F */  lw         $s0, 0x10($sp)
    /* 12874 80022874 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 12878 80022878 0800E003 */  jr         $ra
    /* 1287C 8002287C 00000000 */   nop
endlabel GAL_AllocMultiStruct
