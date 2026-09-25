.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PM_DoGotHit__FP12PlayerStruct, 0x90

glabel PM_DoGotHit__FP12PlayerStruct
    /* 54428 80064428 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 5442C 8006442C 1800B0AF */  sw         $s0, 0x18($sp)
    /* 54430 80064430 21808000 */  addu       $s0, $a0, $zero
    /* 54434 80064434 2000BFAF */  sw         $ra, 0x20($sp)
    /* 54438 80064438 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 5443C 8006443C 64010386 */  lh         $v1, 0x164($s0)
    /* 54440 80064440 A401028E */  lw         $v0, 0x1A4($s0)
    /* 54444 80064444 00000000 */  nop
    /* 54448 80064448 0E006214 */  bne        $v1, $v0, .L80064484
    /* 5444C 8006444C 21206000 */   addu      $a0, $v1, $zero
    /* 54450 80064450 42000582 */  lb         $a1, 0x42($s0)
    /* 54454 80064454 8483010C */  jal        StartStand__FP12PlayerStructi
    /* 54458 80064458 21200002 */   addu      $a0, $s0, $zero
    /* 5445C 8006445C 8E7F010C */  jal        ClearPlrPVars__FP12PlayerStruct
    /* 54460 80064460 21200002 */   addu      $a0, $s0, $zero
    /* 54464 80064464 C9F6000C */  jal        ENG_random__Fl
    /* 54468 80064468 04000424 */   addiu     $a0, $zero, 0x4
    /* 5446C 8006446C 08004010 */  beqz       $v0, .L80064490
    /* 54470 80064470 01001124 */   addiu     $s1, $zero, 0x1
    /* 54474 80064474 C890010C */  jal        ArmorDur__FP12PlayerStruct
    /* 54478 80064478 21200002 */   addu      $a0, $s0, $zero
    /* 5447C 8006447C 24910108 */  j          .L80064490
    /* 54480 80064480 01001124 */   addiu     $s1, $zero, 0x1
  .L80064484:
    /* 54484 80064484 01008224 */  addiu      $v0, $a0, 0x1
    /* 54488 80064488 640102A6 */  sh         $v0, 0x164($s0)
    /* 5448C 8006448C 21880000 */  addu       $s1, $zero, $zero
  .L80064490:
    /* 54490 80064490 5B000482 */  lb         $a0, 0x5B($s0)
    /* 54494 80064494 0335010C */  jal        ChangeLightColour__Fii
    /* 54498 80064498 F0230524 */   addiu     $a1, $zero, 0x23F0
    /* 5449C 8006449C 21102002 */  addu       $v0, $s1, $zero
    /* 544A0 800644A0 2000BF8F */  lw         $ra, 0x20($sp)
    /* 544A4 800644A4 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 544A8 800644A8 1800B08F */  lw         $s0, 0x18($sp)
    /* 544AC 800644AC 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 544B0 800644B0 0800E003 */  jr         $ra
    /* 544B4 800644B4 00000000 */   nop
endlabel PM_DoGotHit__FP12PlayerStruct
