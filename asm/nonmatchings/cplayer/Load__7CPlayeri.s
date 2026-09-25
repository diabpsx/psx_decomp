.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Load__7CPlayeri, 0x6C

glabel Load__7CPlayeri
    /* 85A3C 80095A3C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 85A40 80095A40 1000B0AF */  sw         $s0, 0x10($sp)
    /* 85A44 80095A44 21808000 */  addu       $s0, $a0, $zero
    /* 85A48 80095A48 1400B1AF */  sw         $s1, 0x14($sp)
    /* 85A4C 80095A4C 1800BFAF */  sw         $ra, 0x18($sp)
    /* 85A50 80095A50 A14E020C */  jal        DumpData__7TextDat
    /* 85A54 80095A54 2188A000 */   addu      $s1, $a1, $zero
    /* 85A58 80095A58 5050020C */  jal        GetFileInfo__7TextDati
    /* 85A5C 80095A5C 21202002 */   addu      $a0, $s1, $zero
    /* 85A60 80095A60 21200002 */  addu       $a0, $s0, $zero
    /* 85A64 80095A64 21284000 */  addu       $a1, $v0, $zero
    /* 85A68 80095A68 0B5A020C */  jal        SetFileInfo__7TextDatPC13CTextFileInfoi_8009682c
    /* 85A6C 80095A6C FFFF0624 */   addiu     $a2, $zero, -0x1
    /* 85A70 80095A70 C859020C */  jal        GetDatMaxSize__7CPlayer
    /* 85A74 80095A74 21200002 */   addu      $a0, $s0, $zero
    /* 85A78 80095A78 21200002 */  addu       $a0, $s0, $zero
    /* 85A7C 80095A7C 21300000 */  addu       $a2, $zero, $zero
    /* 85A80 80095A80 7000058E */  lw         $a1, 0x70($s0)
    /* 85A84 80095A84 CC47020C */  jal        Use__7TextDatlbi
    /* 85A88 80095A88 21384000 */   addu      $a3, $v0, $zero
    /* 85A8C 80095A8C 800011AE */  sw         $s1, 0x80($s0)
    /* 85A90 80095A90 1800BF8F */  lw         $ra, 0x18($sp)
    /* 85A94 80095A94 1400B18F */  lw         $s1, 0x14($sp)
    /* 85A98 80095A98 1000B08F */  lw         $s0, 0x10($sp)
    /* 85A9C 80095A9C 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 85AA0 80095AA0 0800E003 */  jr         $ra
    /* 85AA4 80095AA4 00000000 */   nop
endlabel Load__7CPlayeri
