.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching LoadKanjiFont__FPc, 0xAC

glabel LoadKanjiFont__FPc
    /* 9D218 800AD218 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 9D21C 800AD21C 1800B2AF */  sw         $s2, 0x18($sp)
    /* 9D220 800AD220 21908000 */  addu       $s2, $a0, $zero
    /* 9D224 800AD224 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 9D228 800AD228 1400B1AF */  sw         $s1, 0x14($sp)
    /* 9D22C 800AD22C 1D11020C */  jal        SYSI_GetFs__Fv
    /* 9D230 800AD230 1000B0AF */   sw        $s0, 0x10($sp)
    /* 9D234 800AD234 01001024 */  addiu      $s0, $zero, 0x1
    /* 9D238 800AD238 1280013C */  lui        $at, %hi(CDWAIT)
    /* 9D23C 800AD23C ECAD30AC */  sw         $s0, %lo(CDWAIT)($at)
    /* 9D240 800AD240 D7F3000C */  jal        stream_stop__Fv
    /* 9D244 800AD244 21884000 */   addu      $s1, $v0, $zero
    /* 9D248 800AD248 1280023C */  lui        $v0, %hi(FileSYS)
    /* 9D24C 800AD24C ECAA428C */  lw         $v0, %lo(FileSYS)($v0)
    /* 9D250 800AD250 00000000 */  nop
    /* 9D254 800AD254 0F005010 */  beq        $v0, $s0, .L800AD294
    /* 9D258 800AD258 21202002 */   addu      $a0, $s1, $zero
    /* 9D25C 800AD25C 9291020C */  jal        IsGameLoading__Fv
    /* 9D260 800AD260 00000000 */   nop
    /* 9D264 800AD264 01004238 */  xori       $v0, $v0, 0x1
    /* 9D268 800AD268 09004010 */  beqz       $v0, .L800AD290
    /* 9D26C 800AD26C 21204002 */   addu      $a0, $s2, $zero
    /* 9D270 800AD270 1280053C */  lui        $a1, %hi(D_8011D398)
    /* 9D274 800AD274 98D3A524 */  addiu      $a1, $a1, %lo(D_8011D398)
    /* 9D278 800AD278 2D1F020C */  jal        BL_LoadFileAtAddr__FPcPUcc
    /* 9D27C 800AD27C 21300000 */   addu      $a2, $zero, $zero
    /* 9D280 800AD280 8A1F020C */  jal        BL_WaitForAsyncFinish__Fv
    /* 9D284 800AD284 00000000 */   nop
    /* 9D288 800AD288 AAB40208 */  j          .L800AD2A8
    /* 9D28C 800AD28C 00000000 */   nop
  .L800AD290:
    /* 9D290 800AD290 21202002 */  addu       $a0, $s1, $zero
  .L800AD294:
    /* 9D294 800AD294 21284002 */  addu       $a1, $s2, $zero
    /* 9D298 800AD298 1280063C */  lui        $a2, %hi(D_8011D398)
    /* 9D29C 800AD29C 98D3C624 */  addiu      $a2, $a2, %lo(D_8011D398)
    /* 9D2A0 800AD2A0 FD16020C */  jal        ReadAtAddr__6FileIOPCcPUci
    /* 9D2A4 800AD2A4 FFFF0724 */   addiu     $a3, $zero, -0x1
  .L800AD2A8:
    /* 9D2A8 800AD2A8 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 9D2AC 800AD2AC 1800B28F */  lw         $s2, 0x18($sp)
    /* 9D2B0 800AD2B0 1400B18F */  lw         $s1, 0x14($sp)
    /* 9D2B4 800AD2B4 1000B08F */  lw         $s0, 0x10($sp)
    /* 9D2B8 800AD2B8 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 9D2BC 800AD2BC 0800E003 */  jr         $ra
    /* 9D2C0 800AD2C0 00000000 */   nop
endlabel LoadKanjiFont__FPc
