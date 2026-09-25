.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching doparticlejump__Fv, 0x194

glabel doparticlejump__Fv
    /* 8F2AC 8009F2AC C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 8F2B0 8009F2B0 3000BFAF */  sw         $ra, 0x30($sp)
    /* 8F2B4 8009F2B4 2C00B5AF */  sw         $s5, 0x2C($sp)
    /* 8F2B8 8009F2B8 2800B4AF */  sw         $s4, 0x28($sp)
    /* 8F2BC 8009F2BC 2400B3AF */  sw         $s3, 0x24($sp)
    /* 8F2C0 8009F2C0 2000B2AF */  sw         $s2, 0x20($sp)
    /* 8F2C4 8009F2C4 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 8F2C8 8009F2C8 7B46020C */  jal        BL_GetCurrentBlocks__Fv
    /* 8F2CC 8009F2CC 1800B0AF */   sw        $s0, 0x18($sp)
    /* 8F2D0 8009F2D0 21A84000 */  addu       $s5, $v0, $zero
    /* 8F2D4 8009F2D4 2120A002 */  addu       $a0, $s5, $zero
    /* 8F2D8 8009F2D8 1000A527 */  addiu      $a1, $sp, 0x10
    /* 8F2DC 8009F2DC A138020C */  jal        GetXY__7CBlocksPiT1
    /* 8F2E0 8009F2E0 1400A627 */   addiu     $a2, $sp, 0x14
    /* 8F2E4 8009F2E4 5C1F828F */  lw         $v0, %gp_rel(D_8011C6DC)($gp)
    /* 8F2E8 8009F2E8 6210083C */  lui        $t0, (0x10624DD3 >> 16)
    /* 8F2EC 8009F2EC 40280200 */  sll        $a1, $v0, 1
    /* 8F2F0 8009F2F0 2128A200 */  addu       $a1, $a1, $v0
    /* 8F2F4 8009F2F4 80280500 */  sll        $a1, $a1, 2
    /* 8F2F8 8009F2F8 2128A200 */  addu       $a1, $a1, $v0
    /* 8F2FC 8009F2FC C0280500 */  sll        $a1, $a1, 3
    /* 8F300 8009F300 1080013C */  lui        $at, %hi(monster + 0x3A)
    /* 8F304 8009F304 21082500 */  addu       $at, $at, $a1
    /* 8F308 8009F308 CE532280 */  lb         $v0, %lo(monster + 0x3A)($at)
    /* 8F30C 8009F30C D34D0835 */  ori        $t0, $t0, (0x10624DD3 & 0xFFFF)
    /* 8F310 8009F310 80180200 */  sll        $v1, $v0, 2
    /* 8F314 8009F314 21186200 */  addu       $v1, $v1, $v0
    /* 8F318 8009F318 C0180300 */  sll        $v1, $v1, 3
    /* 8F31C 8009F31C 23186200 */  subu       $v1, $v1, $v0
    /* 8F320 8009F320 00190300 */  sll        $v1, $v1, 4
    /* 8F324 8009F324 21186200 */  addu       $v1, $v1, $v0
    /* 8F328 8009F328 18006800 */  mult       $v1, $t0
    /* 8F32C 8009F32C 2120A002 */  addu       $a0, $s5, $zero
    /* 8F330 8009F330 1080013C */  lui        $at, %hi(monster + 0x3B)
    /* 8F334 8009F334 21082500 */  addu       $at, $at, $a1
    /* 8F338 8009F338 CF532680 */  lb         $a2, %lo(monster + 0x3B)($at)
    /* 8F33C 8009F33C 1080013C */  lui        $at, %hi(monster + 0x34)
    /* 8F340 8009F340 21082500 */  addu       $at, $at, $a1
    /* 8F344 8009F344 C8532780 */  lb         $a3, %lo(monster + 0x34)($at)
    /* 8F348 8009F348 80100600 */  sll        $v0, $a2, 2
    /* 8F34C 8009F34C 21104600 */  addu       $v0, $v0, $a2
    /* 8F350 8009F350 C0100200 */  sll        $v0, $v0, 3
    /* 8F354 8009F354 23104600 */  subu       $v0, $v0, $a2
    /* 8F358 8009F358 00110200 */  sll        $v0, $v0, 4
    /* 8F35C 8009F35C 21104600 */  addu       $v0, $v0, $a2
    /* 8F360 8009F360 10480000 */  mfhi       $t1
    /* 8F364 8009F364 80900700 */  sll        $s2, $a3, 2
    /* 8F368 8009F368 21904702 */  addu       $s2, $s2, $a3
    /* 8F36C 8009F36C 18004800 */  mult       $v0, $t0
    /* 8F370 8009F370 80901200 */  sll        $s2, $s2, 2
    /* 8F374 8009F374 1080013C */  lui        $at, %hi(monster + 0x35)
    /* 8F378 8009F378 21082500 */  addu       $at, $at, $a1
    /* 8F37C 8009F37C C9532680 */  lb         $a2, %lo(monster + 0x35)($at)
    /* 8F380 8009F380 21284002 */  addu       $a1, $s2, $zero
    /* 8F384 8009F384 C31F0300 */  sra        $v1, $v1, 31
    /* 8F388 8009F388 80880600 */  sll        $s1, $a2, 2
    /* 8F38C 8009F38C 21882602 */  addu       $s1, $s1, $a2
    /* 8F390 8009F390 80881100 */  sll        $s1, $s1, 2
    /* 8F394 8009F394 21302002 */  addu       $a2, $s1, $zero
    /* 8F398 8009F398 83990900 */  sra        $s3, $t1, 6
    /* 8F39C 8009F39C 23986302 */  subu       $s3, $s3, $v1
    /* 8F3A0 8009F3A0 C3170200 */  sra        $v0, $v0, 31
    /* 8F3A4 8009F3A4 10400000 */  mfhi       $t0
    /* 8F3A8 8009F3A8 83A10800 */  sra        $s4, $t0, 6
    /* 8F3AC 8009F3AC 7446020C */  jal        WorldToScrX__7CBlocksii
    /* 8F3B0 8009F3B0 23A08202 */   subu      $s4, $s4, $v0
    /* 8F3B4 8009F3B4 2120A002 */  addu       $a0, $s5, $zero
    /* 8F3B8 8009F3B8 1200A587 */  lh         $a1, 0x12($sp)
    /* 8F3BC 8009F3BC 1600A687 */  lh         $a2, 0x16($sp)
    /* 8F3C0 8009F3C0 7446020C */  jal        WorldToScrX__7CBlocksii
    /* 8F3C4 8009F3C4 21804000 */   addu      $s0, $v0, $zero
    /* 8F3C8 8009F3C8 2120A002 */  addu       $a0, $s5, $zero
    /* 8F3CC 8009F3CC 21284002 */  addu       $a1, $s2, $zero
    /* 8F3D0 8009F3D0 21302002 */  addu       $a2, $s1, $zero
    /* 8F3D4 8009F3D4 21801302 */  addu       $s0, $s0, $s3
    /* 8F3D8 8009F3D8 23800202 */  subu       $s0, $s0, $v0
    /* 8F3DC 8009F3DC 7646020C */  jal        WorldToScrY__7CBlocksii
    /* 8F3E0 8009F3E0 9CFF1126 */   addiu     $s1, $s0, -0x64
    /* 8F3E4 8009F3E4 2120A002 */  addu       $a0, $s5, $zero
    /* 8F3E8 8009F3E8 1200A587 */  lh         $a1, 0x12($sp)
    /* 8F3EC 8009F3EC 1600A687 */  lh         $a2, 0x16($sp)
    /* 8F3F0 8009F3F0 7646020C */  jal        WorldToScrY__7CBlocksii
    /* 8F3F4 8009F3F4 21804000 */   addu      $s0, $v0, $zero
    /* 8F3F8 8009F3F8 21801402 */  addu       $s0, $s0, $s4
    /* 8F3FC 8009F3FC 23800202 */  subu       $s0, $s0, $v0
    /* 8F400 8009F400 7009828F */  lw         $v0, %gp_rel(D_8011B0F0)($gp)
    /* 8F404 8009F404 00000000 */  nop
    /* 8F408 8009F408 03004010 */  beqz       $v0, .L8009F418
    /* 8F40C 8009F40C 9CFF0526 */   addiu     $a1, $s0, -0x64
    /* 8F410 8009F410 377C020C */  jal        particlejump__Fii
    /* 8F414 8009F414 21202002 */   addu      $a0, $s1, $zero
  .L8009F418:
    /* 8F418 8009F418 3000BF8F */  lw         $ra, 0x30($sp)
    /* 8F41C 8009F41C 2C00B58F */  lw         $s5, 0x2C($sp)
    /* 8F420 8009F420 2800B48F */  lw         $s4, 0x28($sp)
    /* 8F424 8009F424 2400B38F */  lw         $s3, 0x24($sp)
    /* 8F428 8009F428 2000B28F */  lw         $s2, 0x20($sp)
    /* 8F42C 8009F42C 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 8F430 8009F430 1800B08F */  lw         $s0, 0x18($sp)
    /* 8F434 8009F434 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 8F438 8009F438 0800E003 */  jr         $ra
    /* 8F43C 8009F43C 00000000 */   nop
endlabel doparticlejump__Fv
