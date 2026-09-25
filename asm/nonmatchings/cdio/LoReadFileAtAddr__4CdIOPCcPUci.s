.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching LoReadFileAtAddr__4CdIOPCcPUci, 0x9C

glabel LoReadFileAtAddr__4CdIOPCcPUci
    /* 76D00 80086D00 1280023C */  lui        $v0, %hi(CDWAIT)
    /* 76D04 80086D04 ECAD428C */  lw         $v0, %lo(CDWAIT)($v0)
    /* 76D08 80086D08 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 76D0C 80086D0C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 76D10 80086D10 2180A000 */  addu       $s0, $a1, $zero
    /* 76D14 80086D14 1800B2AF */  sw         $s2, 0x18($sp)
    /* 76D18 80086D18 2190C000 */  addu       $s2, $a2, $zero
    /* 76D1C 80086D1C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 76D20 80086D20 21880000 */  addu       $s1, $zero, $zero
    /* 76D24 80086D24 08004010 */  beqz       $v0, .L80086D48
    /* 76D28 80086D28 1C00BFAF */   sw        $ra, 0x1C($sp)
    /* 76D2C 80086D2C 9291020C */  jal        IsGameLoading__Fv
    /* 76D30 80086D30 00000000 */   nop
    /* 76D34 80086D34 04004014 */  bnez       $v0, .L80086D48
    /* 76D38 80086D38 21200002 */   addu      $a0, $s0, $zero
    /* 76D3C 80086D3C FE1E020C */  jal        BL_FileExists__FPcc
    /* 76D40 80086D40 21280000 */   addu      $a1, $zero, $zero
    /* 76D44 80086D44 2B880200 */  sltu       $s1, $zero, $v0
  .L80086D48:
    /* 76D48 80086D48 0A002012 */  beqz       $s1, .L80086D74
    /* 76D4C 80086D4C 21200002 */   addu      $a0, $s0, $zero
    /* 76D50 80086D50 21284002 */  addu       $a1, $s2, $zero
    /* 76D54 80086D54 2120020C */  jal        BL_AsyncLoadFileAtAddr__FPcPUcc
    /* 76D58 80086D58 21300000 */   addu      $a2, $zero, $zero
    /* 76D5C 80086D5C 08004010 */  beqz       $v0, .L80086D80
    /* 76D60 80086D60 21100000 */   addu      $v0, $zero, $zero
    /* 76D64 80086D64 8A1F020C */  jal        BL_WaitForAsyncFinish__Fv
    /* 76D68 80086D68 00000000 */   nop
    /* 76D6C 80086D6C 601B0208 */  j          .L80086D80
    /* 76D70 80086D70 01000224 */   addiu     $v0, $zero, 0x1
  .L80086D74:
    /* 76D74 80086D74 21284002 */  addu       $a1, $s2, $zero
    /* 76D78 80086D78 2D1F020C */  jal        BL_LoadFileAtAddr__FPcPUcc
    /* 76D7C 80086D7C 01000624 */   addiu     $a2, $zero, 0x1
  .L80086D80:
    /* 76D80 80086D80 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 76D84 80086D84 1800B28F */  lw         $s2, 0x18($sp)
    /* 76D88 80086D88 1400B18F */  lw         $s1, 0x14($sp)
    /* 76D8C 80086D8C 1000B08F */  lw         $s0, 0x10($sp)
    /* 76D90 80086D90 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 76D94 80086D94 0800E003 */  jr         $ra
    /* 76D98 80086D98 00000000 */   nop
endlabel LoReadFileAtAddr__4CdIOPCcPUci
