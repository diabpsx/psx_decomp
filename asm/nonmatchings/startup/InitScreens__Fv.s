.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitScreens__Fv, 0xF0

glabel InitScreens__Fv
    /* A03E0 800B03E0 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* A03E4 800B03E4 21200000 */  addu       $a0, $zero, $zero
    /* A03E8 800B03E8 2400BFAF */  sw         $ra, 0x24($sp)
    /* A03EC 800B03EC 2000B2AF */  sw         $s2, 0x20($sp)
    /* A03F0 800B03F0 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* A03F4 800B03F4 BF4D000C */  jal        ResetGraph
    /* A03F8 800B03F8 1800B0AF */   sw        $s0, 0x18($sp)
    /* A03FC 800B03FC 1C4E000C */  jal        SetGraphDebug
    /* A0400 800B0400 21200000 */   addu      $a0, $zero, $zero
    /* A0404 800B0404 657F000C */  jal        InitGeom
    /* A0408 800B0408 F0001124 */   addiu     $s1, $zero, 0xF0
    /* A040C 800B040C 1280103C */  lui        $s0, %hi(D_8011CAE0)
    /* A0410 800B0410 E0CA1026 */  addiu      $s0, $s0, %lo(D_8011CAE0)
    /* A0414 800B0414 21200002 */  addu       $a0, $s0, $zero
    /* A0418 800B0418 21280000 */  addu       $a1, $zero, $zero
    /* A041C 800B041C 21300000 */  addu       $a2, $zero, $zero
    /* A0420 800B0420 40010724 */  addiu      $a3, $zero, 0x140
    /* A0424 800B0424 CB4B000C */  jal        SetDefDrawEnv
    /* A0428 800B0428 1000B1AF */   sw        $s1, 0x10($sp)
    /* A042C 800B042C 5C000426 */  addiu      $a0, $s0, 0x5C
    /* A0430 800B0430 40010524 */  addiu      $a1, $zero, 0x140
    /* A0434 800B0434 21300000 */  addu       $a2, $zero, $zero
    /* A0438 800B0438 40010724 */  addiu      $a3, $zero, 0x140
    /* A043C 800B043C F84B000C */  jal        SetDefDispEnv
    /* A0440 800B0440 1000B1AF */   sw        $s1, 0x10($sp)
    /* A0444 800B0444 70001226 */  addiu      $s2, $s0, 0x70
    /* A0448 800B0448 21204002 */  addu       $a0, $s2, $zero
    /* A044C 800B044C 40010524 */  addiu      $a1, $zero, 0x140
    /* A0450 800B0450 21300000 */  addu       $a2, $zero, $zero
    /* A0454 800B0454 40010724 */  addiu      $a3, $zero, 0x140
    /* A0458 800B0458 CB4B000C */  jal        SetDefDrawEnv
    /* A045C 800B045C 1000B1AF */   sw        $s1, 0x10($sp)
    /* A0460 800B0460 CC000426 */  addiu      $a0, $s0, 0xCC
    /* A0464 800B0464 21280000 */  addu       $a1, $zero, $zero
    /* A0468 800B0468 21300000 */  addu       $a2, $zero, $zero
    /* A046C 800B046C 40010724 */  addiu      $a3, $zero, 0x140
    /* A0470 800B0470 F84B000C */  jal        SetDefDispEnv
    /* A0474 800B0474 1000B1AF */   sw        $s1, 0x10($sp)
    /* A0478 800B0478 1C000426 */  addiu      $a0, $s0, 0x1C
    /* A047C 800B047C 01000224 */  addiu      $v0, $zero, 0x1
    /* A0480 800B0480 1280013C */  lui        $at, %hi(D_8011CAF8)
    /* A0484 800B0484 F8CA20A0 */  sb         $zero, %lo(D_8011CAF8)($at)
    /* A0488 800B0488 1280013C */  lui        $at, %hi(D_8011CB68)
    /* A048C 800B048C 68CB20A0 */  sb         $zero, %lo(D_8011CB68)($at)
    /* A0490 800B0490 1280013C */  lui        $at, %hi(D_8011CAF6)
    /* A0494 800B0494 F6CA22A0 */  sb         $v0, %lo(D_8011CAF6)($at)
    /* A0498 800B0498 1280013C */  lui        $at, %hi(D_8011CB66)
    /* A049C 800B049C 66CB22A0 */  sb         $v0, %lo(D_8011CB66)($at)
    /* A04A0 800B04A0 3752000C */  jal        SetDrawEnv
    /* A04A4 800B04A4 21280002 */   addu      $a1, $s0, $zero
    /* A04A8 800B04A8 8C000426 */  addiu      $a0, $s0, 0x8C
    /* A04AC 800B04AC 3752000C */  jal        SetDrawEnv
    /* A04B0 800B04B0 21284002 */   addu      $a1, $s2, $zero
    /* A04B4 800B04B4 2400BF8F */  lw         $ra, 0x24($sp)
    /* A04B8 800B04B8 2000B28F */  lw         $s2, 0x20($sp)
    /* A04BC 800B04BC 1C00B18F */  lw         $s1, 0x1C($sp)
    /* A04C0 800B04C0 1800B08F */  lw         $s0, 0x18($sp)
    /* A04C4 800B04C4 2800BD27 */  addiu      $sp, $sp, 0x28
    /* A04C8 800B04C8 0800E003 */  jr         $ra
    /* A04CC 800B04CC 00000000 */   nop
endlabel InitScreens__Fv
