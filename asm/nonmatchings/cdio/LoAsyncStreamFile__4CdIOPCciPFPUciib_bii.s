.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching LoAsyncStreamFile__4CdIOPCciPFPUciib_bii, 0x150

glabel LoAsyncStreamFile__4CdIOPCciPFPUciib_bii
    /* 7710C 8008710C D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 77110 80087110 1400B1AF */  sw         $s1, 0x14($sp)
    /* 77114 80087114 4400B18F */  lw         $s1, 0x44($sp)
    /* 77118 80087118 1000B0AF */  sw         $s0, 0x10($sp)
    /* 7711C 8008711C 2180A000 */  addu       $s0, $a1, $zero
    /* 77120 80087120 2000B4AF */  sw         $s4, 0x20($sp)
    /* 77124 80087124 21A0C000 */  addu       $s4, $a2, $zero
    /* 77128 80087128 2800B6AF */  sw         $s6, 0x28($sp)
    /* 7712C 8008712C 21B0E000 */  addu       $s6, $a3, $zero
    /* 77130 80087130 2C00BFAF */  sw         $ra, 0x2C($sp)
    /* 77134 80087134 2400B5AF */  sw         $s5, 0x24($sp)
    /* 77138 80087138 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 7713C 8008713C 871F020C */  jal        BL_AsyncLoadDone__Fv
    /* 77140 80087140 1800B2AF */   sw        $s2, 0x18($sp)
    /* 77144 80087144 01004238 */  xori       $v0, $v0, 0x1
    /* 77148 80087148 04004010 */  beqz       $v0, .L8008715C
    /* 7714C 8008714C 21200002 */   addu      $a0, $s0, $zero
    /* 77150 80087150 8A1F020C */  jal        BL_WaitForAsyncFinish__Fv
    /* 77154 80087154 00000000 */   nop
    /* 77158 80087158 21200002 */  addu       $a0, $s0, $zero
  .L8008715C:
    /* 7715C 8008715C FE1E020C */  jal        BL_FileExists__FPcc
    /* 77160 80087160 21280000 */   addu      $a1, $zero, $zero
    /* 77164 80087164 07004014 */  bnez       $v0, .L80087184
    /* 77168 80087168 21200002 */   addu      $a0, $s0, $zero
    /* 7716C 8008716C 21200000 */  addu       $a0, $zero, $zero
    /* 77170 80087170 1180053C */  lui        $a1, %hi(D_80110214)
    /* 77174 80087174 1402A524 */  addiu      $a1, $a1, %lo(D_80110214)
    /* 77178 80087178 A583000C */  jal        DBG_Error
    /* 7717C 8008717C 89010624 */   addiu     $a2, $zero, 0x189
    /* 77180 80087180 21200002 */  addu       $a0, $s0, $zero
  .L80087184:
    /* 77184 80087184 B41F020C */  jal        BL_LoadFileAsync__FPcc
    /* 77188 80087188 21280000 */   addu      $a1, $zero, $zero
    /* 7718C 8008718C 21984000 */  addu       $s3, $v0, $zero
    /* 77190 80087190 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 77194 80087194 05006216 */  bne        $s3, $v0, .L800871AC
    /* 77198 80087198 21200000 */   addu      $a0, $zero, $zero
    /* 7719C 8008719C 1180053C */  lui        $a1, %hi(D_80110214)
    /* 771A0 800871A0 1402A524 */  addiu      $a1, $a1, %lo(D_80110214)
    /* 771A4 800871A4 A583000C */  jal        DBG_Error
    /* 771A8 800871A8 8D010624 */   addiu     $a2, $zero, 0x18D
  .L800871AC:
    /* 771AC 800871AC 8A1F020C */  jal        BL_WaitForAsyncFinish__Fv
    /* 771B0 800871B0 21A82002 */   addu      $s5, $s1, $zero
    /* 771B4 800871B4 DD85000C */  jal        GAL_Lock
    /* 771B8 800871B8 21206002 */   addu      $a0, $s3, $zero
    /* 771BC 800871BC 21904000 */  addu       $s2, $v0, $zero
  .L800871C0:
    /* 771C0 800871C0 1000201A */  blez       $s1, .L80087204
    /* 771C4 800871C4 2A109102 */   slt       $v0, $s4, $s1
    /* 771C8 800871C8 02004010 */  beqz       $v0, .L800871D4
    /* 771CC 800871CC 21802002 */   addu      $s0, $s1, $zero
    /* 771D0 800871D0 21808002 */  addu       $s0, $s4, $zero
  .L800871D4:
    /* 771D4 800871D4 21204002 */  addu       $a0, $s2, $zero
    /* 771D8 800871D8 2328B102 */  subu       $a1, $s5, $s1
    /* 771DC 800871DC 21300002 */  addu       $a2, $s0, $zero
    /* 771E0 800871E0 09F8C002 */  jalr       $s6
    /* 771E4 800871E4 0100272E */   sltiu     $a3, $s1, 0x1
    /* 771E8 800871E8 23883002 */  subu       $s1, $s1, $s0
    /* 771EC 800871EC 0500201A */  blez       $s1, .L80087204
    /* 771F0 800871F0 21905002 */   addu      $s2, $s2, $s0
    /* 771F4 800871F4 EE80000C */  jal        TSK_Sleep
    /* 771F8 800871F8 01000424 */   addiu     $a0, $zero, 0x1
    /* 771FC 800871FC 701C0208 */  j          .L800871C0
    /* 77200 80087200 00000000 */   nop
  .L80087204:
    /* 77204 80087204 1886000C */  jal        GAL_Free
    /* 77208 80087208 21206002 */   addu      $a0, $s3, $zero
    /* 7720C 8008720C FF004230 */  andi       $v0, $v0, 0xFF
    /* 77210 80087210 07004014 */  bnez       $v0, .L80087230
    /* 77214 80087214 01000224 */   addiu     $v0, $zero, 0x1
    /* 77218 80087218 21200000 */  addu       $a0, $zero, $zero
    /* 7721C 8008721C 1180053C */  lui        $a1, %hi(D_80110214)
    /* 77220 80087220 1402A524 */  addiu      $a1, $a1, %lo(D_80110214)
    /* 77224 80087224 A583000C */  jal        DBG_Error
    /* 77228 80087228 A4010624 */   addiu     $a2, $zero, 0x1A4
    /* 7722C 8008722C 01000224 */  addiu      $v0, $zero, 0x1
  .L80087230:
    /* 77230 80087230 2C00BF8F */  lw         $ra, 0x2C($sp)
    /* 77234 80087234 2800B68F */  lw         $s6, 0x28($sp)
    /* 77238 80087238 2400B58F */  lw         $s5, 0x24($sp)
    /* 7723C 8008723C 2000B48F */  lw         $s4, 0x20($sp)
    /* 77240 80087240 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 77244 80087244 1800B28F */  lw         $s2, 0x18($sp)
    /* 77248 80087248 1400B18F */  lw         $s1, 0x14($sp)
    /* 7724C 8008724C 1000B08F */  lw         $s0, 0x10($sp)
    /* 77250 80087250 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 77254 80087254 0800E003 */  jr         $ra
    /* 77258 80087258 00000000 */   nop
endlabel LoAsyncStreamFile__4CdIOPCciPFPUciib_bii
