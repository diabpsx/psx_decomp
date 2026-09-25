.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SPU_Init__Fv, 0x108

glabel SPU_Init__Fv
    /* 8A25C 8009A25C B8FFBD27 */  addiu      $sp, $sp, -0x48
    /* 8A260 8009A260 3800B0AF */  sw         $s0, 0x38($sp)
    /* 8A264 8009A264 02001024 */  addiu      $s0, $zero, 0x2
    /* 8A268 8009A268 3C00B1AF */  sw         $s1, 0x3C($sp)
    /* 8A26C 8009A26C 1280113C */  lui        $s1, %hi(D_8011CD9C)
    /* 8A270 8009A270 9CCD3126 */  addiu      $s1, $s1, %lo(D_8011CD9C)
    /* 8A274 8009A274 4000BFAF */  sw         $ra, 0x40($sp)
  .L8009A278:
    /* 8A278 8009A278 AE69020C */  jal        SND_StopSnd__Fi
    /* 8A27C 8009A27C 21200002 */   addu      $a0, $s0, $zero
    /* 8A280 8009A280 000020A6 */  sh         $zero, 0x0($s1)
    /* 8A284 8009A284 01001026 */  addiu      $s0, $s0, 0x1
    /* 8A288 8009A288 1800022A */  slti       $v0, $s0, 0x18
    /* 8A28C 8009A28C FAFF4014 */  bnez       $v0, .L8009A278
    /* 8A290 8009A290 02003126 */   addiu     $s1, $s1, 0x2
    /* 8A294 8009A294 F468020C */  jal        SND_ClearBank__Fv
    /* 8A298 8009A298 00000000 */   nop
    /* 8A29C 8009A29C 1280053C */  lui        $a1, %hi(D_8011CC68)
    /* 8A2A0 8009A2A0 68CCA524 */  addiu      $a1, $a1, %lo(D_8011CC68)
    /* 8A2A4 8009A2A4 D75C000C */  jal        SpuInitMalloc
    /* 8A2A8 8009A2A8 20000424 */   addiu     $a0, $zero, 0x20
    /* 8A2AC 8009A2AC C763000C */  jal        SpuSetTransferMode
    /* 8A2B0 8009A2B0 21200000 */   addu      $a0, $zero, $zero
    /* 8A2B4 8009A2B4 AF63000C */  jal        SpuSetTransferStartAddr
    /* 8A2B8 8009A2B8 21200000 */   addu      $a0, $zero, $zero
    /* 8A2BC 8009A2BC 5763000C */  jal        SpuWrite0
    /* 8A2C0 8009A2C0 0800043C */   lui       $a0, (0x80000 >> 16)
    /* 8A2C4 8009A2C4 D363000C */  jal        SpuIsTransferCompleted
    /* 8A2C8 8009A2C8 01000424 */   addiu     $a0, $zero, 0x1
    /* 8A2CC 8009A2CC 1000A427 */  addiu      $a0, $sp, 0x10
    /* 8A2D0 8009A2D0 03000224 */  addiu      $v0, $zero, 0x3
    /* 8A2D4 8009A2D4 1000A2AF */  sw         $v0, 0x10($sp)
    /* 8A2D8 8009A2D8 FF3F0224 */  addiu      $v0, $zero, 0x3FFF
    /* 8A2DC 8009A2DC 1400A2A7 */  sh         $v0, 0x14($sp)
    /* 8A2E0 8009A2E0 FF63000C */  jal        SpuSetCommonAttr
    /* 8A2E4 8009A2E4 1600A2A7 */   sh        $v0, 0x16($sp)
    /* 8A2E8 8009A2E8 1280103C */  lui        $s0, %hi(D_8011CD78)
    /* 8A2EC 8009A2EC 78CD1026 */  addiu      $s0, $s0, %lo(D_8011CD78)
    /* 8A2F0 8009A2F0 07000224 */  addiu      $v0, $zero, 0x7
    /* 8A2F4 8009A2F4 000002AE */  sw         $v0, 0x0($s0)
    /* 8A2F8 8009A2F8 05000224 */  addiu      $v0, $zero, 0x5
    /* 8A2FC 8009A2FC 1280013C */  lui        $at, %hi(D_8011CD7C)
    /* 8A300 8009A300 7CCD22AC */  sw         $v0, %lo(D_8011CD7C)($at)
    /* 8A304 8009A304 66060224 */  addiu      $v0, $zero, 0x666
    /* 8A308 8009A308 1280013C */  lui        $at, %hi(D_8011CD80)
    /* 8A30C 8009A30C 80CD22A4 */  sh         $v0, %lo(D_8011CD80)($at)
    /* 8A310 8009A310 1280013C */  lui        $at, %hi(D_8011CD82)
    /* 8A314 8009A314 82CD22A4 */  sh         $v0, %lo(D_8011CD82)($at)
    /* 8A318 8009A318 FB5E000C */  jal        SpuSetReverbModeParam
    /* 8A31C 8009A31C 21200002 */   addu      $a0, $s0, $zero
    /* 8A320 8009A320 835E000C */  jal        SpuSetReverb
    /* 8A324 8009A324 01000424 */   addiu     $a0, $zero, 0x1
    /* 8A328 8009A328 6761000C */  jal        SpuReserveReverbWorkArea
    /* 8A32C 8009A32C 01000424 */   addiu     $a0, $zero, 0x1
    /* 8A330 8009A330 21200000 */  addu       $a0, $zero, $zero
    /* 8A334 8009A334 9B61000C */  jal        SpuSetReverbVoice
    /* 8A338 8009A338 FFFF0524 */   addiu     $a1, $zero, -0x1
    /* 8A33C 8009A33C 21200002 */  addu       $a0, $s0, $zero
    /* 8A340 8009A340 06000224 */  addiu      $v0, $zero, 0x6
    /* 8A344 8009A344 7B61000C */  jal        SpuSetReverbDepth
    /* 8A348 8009A348 000082AC */   sw        $v0, 0x0($a0)
    /* 8A34C 8009A34C 4000BF8F */  lw         $ra, 0x40($sp)
    /* 8A350 8009A350 3C00B18F */  lw         $s1, 0x3C($sp)
    /* 8A354 8009A354 3800B08F */  lw         $s0, 0x38($sp)
    /* 8A358 8009A358 4800BD27 */  addiu      $sp, $sp, 0x48
    /* 8A35C 8009A35C 0800E003 */  jr         $ra
    /* 8A360 8009A360 00000000 */   nop
endlabel SPU_Init__Fv
