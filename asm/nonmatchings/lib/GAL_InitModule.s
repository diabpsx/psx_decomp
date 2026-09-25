.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GAL_InitModule, 0xB8

glabel GAL_InitModule
    /* 11404 80021404 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 11408 80021408 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 1140C 8002140C 1800B2AF */  sw         $s2, 0x18($sp)
    /* 11410 80021410 1400B1AF */  sw         $s1, 0x14($sp)
    /* 11414 80021414 1000B0AF */  sw         $s0, 0x10($sp)
    /* 11418 80021418 1280013C */  lui        $at, %hi(D_8011C9CC)
    /* 1141C 8002141C CCC920AC */  sw         $zero, %lo(D_8011C9CC)($at)
    /* 11420 80021420 1280013C */  lui        $at, %hi(D_8011C9D0)
    /* 11424 80021424 D0C920AC */  sw         $zero, %lo(D_8011C9D0)($at)
    /* 11428 80021428 1280013C */  lui        $at, %hi(D_8011C9EC)
    /* 1142C 8002142C ECC920AC */  sw         $zero, %lo(D_8011C9EC)($at)
    /* 11430 80021430 FE8B000C */  jal        GAL_SetVerbosity
    /* 11434 80021434 21200000 */   addu      $a0, $zero, $zero
    /* 11438 80021438 E889000C */  jal        GAL_SetTimeStamp
    /* 1143C 8002143C 21200000 */   addu      $a0, $zero, $zero
    /* 11440 80021440 1280013C */  lui        $at, %hi(D_8011C9D4)
    /* 11444 80021444 D4C920AC */  sw         $zero, %lo(D_8011C9D4)($at)
    /* 11448 80021448 B584000C */  jal        GAL_SetErrorChecking
    /* 1144C 8002144C 21200000 */   addu      $a0, $zero, $zero
    /* 11450 80021450 21880000 */  addu       $s1, $zero, $zero
    /* 11454 80021454 1380123C */  lui        $s2, %hi(D_801325D0)
    /* 11458 80021458 D0255226 */  addiu      $s2, $s2, %lo(D_801325D0)
    /* 1145C 8002145C 21800000 */  addu       $s0, $zero, $zero
  .L80021460:
    /* 11460 80021460 1380013C */  lui        $at, %hi(D_801325D0)
    /* 11464 80021464 21083000 */  addu       $at, $at, $s0
    /* 11468 80021468 D02520AC */  sw         $zero, %lo(D_801325D0)($at)
    /* 1146C 8002146C 1380013C */  lui        $at, %hi(D_801325D4)
    /* 11470 80021470 21083000 */  addu       $at, $at, $s0
    /* 11474 80021474 D42520AC */  sw         $zero, %lo(D_801325D4)($at)
    /* 11478 80021478 1380013C */  lui        $at, %hi(D_801325E6)
    /* 1147C 8002147C 21083000 */  addu       $at, $at, $s0
    /* 11480 80021480 E62531A4 */  sh         $s1, %lo(D_801325E6)($at)
    /* 11484 80021484 4488000C */  jal        ReleaseMemHdrBlock
    /* 11488 80021488 21204002 */   addu      $a0, $s2, $zero
    /* 1148C 8002148C 1C005226 */  addiu      $s2, $s2, 0x1C
    /* 11490 80021490 01003126 */  addiu      $s1, $s1, 0x1
    /* 11494 80021494 C800222A */  slti       $v0, $s1, 0xC8
    /* 11498 80021498 F1FF4014 */  bnez       $v0, .L80021460
    /* 1149C 8002149C 1C001026 */   addiu     $s0, $s0, 0x1C
    /* 114A0 800214A0 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 114A4 800214A4 1800B28F */  lw         $s2, 0x18($sp)
    /* 114A8 800214A8 1400B18F */  lw         $s1, 0x14($sp)
    /* 114AC 800214AC 1000B08F */  lw         $s0, 0x10($sp)
    /* 114B0 800214B0 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 114B4 800214B4 0800E003 */  jr         $ra
    /* 114B8 800214B8 00000000 */   nop
endlabel GAL_InitModule
