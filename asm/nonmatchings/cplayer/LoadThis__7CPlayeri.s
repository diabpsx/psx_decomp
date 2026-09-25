.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching LoadThis__7CPlayeri, 0x70

glabel LoadThis__7CPlayeri
    /* 864DC 800964DC E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 864E0 800964E0 1000B0AF */  sw         $s0, 0x10($sp)
    /* 864E4 800964E4 21808000 */  addu       $s0, $a0, $zero
    /* 864E8 800964E8 1400B1AF */  sw         $s1, 0x14($sp)
    /* 864EC 800964EC 2188A000 */  addu       $s1, $a1, $zero
    /* 864F0 800964F0 1800BFAF */  sw         $ra, 0x18($sp)
    /* 864F4 800964F4 5050020C */  jal        GetFileInfo__7TextDati
    /* 864F8 800964F8 21202002 */   addu      $a0, $s1, $zero
    /* 864FC 800964FC 21200002 */  addu       $a0, $s0, $zero
    /* 86500 80096500 21284000 */  addu       $a1, $v0, $zero
    /* 86504 80096504 0B5A020C */  jal        SetFileInfo__7TextDatPC13CTextFileInfoi_8009682c
    /* 86508 80096508 FFFF0624 */   addiu     $a2, $zero, -0x1
    /* 8650C 8009650C A14E020C */  jal        DumpData__7TextDat
    /* 86510 80096510 21200002 */   addu      $a0, $s0, $zero
    /* 86514 80096514 C859020C */  jal        GetDatMaxSize__7CPlayer
    /* 86518 80096518 21200002 */   addu      $a0, $s0, $zero
    /* 8651C 8009651C 21200002 */  addu       $a0, $s0, $zero
    /* 86520 80096520 21300000 */  addu       $a2, $zero, $zero
    /* 86524 80096524 7000058E */  lw         $a1, 0x70($s0)
    /* 86528 80096528 CC47020C */  jal        Use__7TextDatlbi
    /* 8652C 8009652C 21384000 */   addu      $a3, $v0, $zero
    /* 86530 80096530 800011AE */  sw         $s1, 0x80($s0)
    /* 86534 80096534 1800BF8F */  lw         $ra, 0x18($sp)
    /* 86538 80096538 1400B18F */  lw         $s1, 0x14($sp)
    /* 8653C 8009653C 1000B08F */  lw         $s0, 0x10($sp)
    /* 86540 80096540 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 86544 80096544 0800E003 */  jr         $ra
    /* 86548 80096548 00000000 */   nop
endlabel LoadThis__7CPlayeri
