.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DDXlseek, 0x74

glabel DDXlseek
    /* 1365C 8002365C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 13660 80023660 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 13664 80023664 1800B2AF */  sw         $s2, 0x18($sp)
    /* 13668 80023668 1400B1AF */  sw         $s1, 0x14($sp)
    /* 1366C 8002366C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 13670 80023670 21808000 */  addu       $s0, $a0, $zero
    /* 13674 80023674 2188A000 */  addu       $s1, $a1, $zero
    /* 13678 80023678 2190C000 */  addu       $s2, $a2, $zero
    /* 1367C 8002367C 9B8C000C */  jal        SwapByte
    /* 13680 80023680 FE000434 */   ori       $a0, $zero, 0xFE
    /* 13684 80023684 9B8C000C */  jal        SwapByte
    /* 13688 80023688 73000434 */   ori       $a0, $zero, 0x73
    /* 1368C 8002368C AF8C000C */  jal        PutLong
    /* 13690 80023690 21200002 */   addu      $a0, $s0, $zero
    /* 13694 80023694 AF8C000C */  jal        PutLong
    /* 13698 80023698 21202002 */   addu      $a0, $s1, $zero
    /* 1369C 8002369C AF8C000C */  jal        PutLong
    /* 136A0 800236A0 21204002 */   addu      $a0, $s2, $zero
    /* 136A4 800236A4 9B8C000C */  jal        SwapByte
    /* 136A8 800236A8 21200000 */   addu      $a0, $zero, $zero
    /* 136AC 800236AC C28C000C */  jal        GetLong
    /* 136B0 800236B0 00000000 */   nop
    /* 136B4 800236B4 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 136B8 800236B8 1800B28F */  lw         $s2, 0x18($sp)
    /* 136BC 800236BC 1400B18F */  lw         $s1, 0x14($sp)
    /* 136C0 800236C0 1000B08F */  lw         $s0, 0x10($sp)
    /* 136C4 800236C4 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 136C8 800236C8 0800E003 */  jr         $ra
    /* 136CC 800236CC 00000000 */   nop
endlabel DDXlseek
