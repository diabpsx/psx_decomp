.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching STR_SoundCommand__FP6SFXHDRi, 0xEC

glabel STR_SoundCommand__FP6SFXHDRi
    /* 89388 80099388 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 8938C 8009938C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 89390 80099390 21808000 */  addu       $s0, $a0, $zero
    /* 89394 80099394 1400BFAF */  sw         $ra, 0x14($sp)
    /* 89398 80099398 03000382 */  lb         $v1, 0x3($s0)
    /* 8939C 8009939C 06000224 */  addiu      $v0, $zero, 0x6
    /* 893A0 800993A0 04006214 */  bne        $v1, $v0, .L800993B4
    /* 893A4 800993A4 00000000 */   nop
    /* 893A8 800993A8 0200A314 */  bne        $a1, $v1, .L800993B4
    /* 893AC 800993AC 00000000 */   nop
    /* 893B0 800993B0 01000524 */  addiu      $a1, $zero, 0x1
  .L800993B4:
    /* 893B4 800993B4 03000282 */  lb         $v0, 0x3($s0)
    /* 893B8 800993B8 03000324 */  addiu      $v1, $zero, 0x3
    /* 893BC 800993BC 03004310 */  beq        $v0, $v1, .L800993CC
    /* 893C0 800993C0 04000224 */   addiu     $v0, $zero, 0x4
    /* 893C4 800993C4 2600A210 */  beq        $a1, $v0, .L80099460
    /* 893C8 800993C8 00000000 */   nop
  .L800993CC:
    /* 893CC 800993CC 0500A314 */  bne        $a1, $v1, .L800993E4
    /* 893D0 800993D0 08000224 */   addiu     $v0, $zero, 0x8
    /* 893D4 800993D4 1400028E */  lw         $v0, 0x14($s0)
    /* 893D8 800993D8 00000000 */  nop
    /* 893DC 800993DC 180002AE */  sw         $v0, 0x18($s0)
    /* 893E0 800993E0 08000224 */  addiu      $v0, $zero, 0x8
  .L800993E4:
    /* 893E4 800993E4 1D00A214 */  bne        $a1, $v0, .L8009945C
    /* 893E8 800993E8 21200002 */   addu      $a0, $s0, $zero
    /* 893EC 800993EC 0464020C */  jal        STR_setvolume__FP6SFXHDR
    /* 893F0 800993F0 140000AE */   sw        $zero, 0x14($s0)
    /* 893F4 800993F4 0800048E */  lw         $a0, 0x8($s0)
    /* 893F8 800993F8 096B020C */  jal        AS_CloseStream__FP6STRHDRP6SFXHDR
    /* 893FC 800993FC 21280002 */   addu      $a1, $s0, $zero
    /* 89400 80099400 C764020C */  jal        STR_CloseStream__FP6SFXHDR
    /* 89404 80099404 21200002 */   addu      $a0, $s0, $zero
    /* 89408 80099408 0800048E */  lw         $a0, 0x8($s0)
    /* 8940C 8009940C 7320020C */  jal        BL_CloseStreamFile__FP6STRHDR
    /* 89410 80099410 00000000 */   nop
    /* 89414 80099414 0C000292 */  lbu        $v0, 0xC($s0)
    /* 89418 80099418 00000000 */  nop
    /* 8941C 8009941C 07004014 */  bnez       $v0, .L8009943C
    /* 89420 80099420 040000AE */   sw        $zero, 0x4($s0)
    /* 89424 80099424 1280013C */  lui        $at, %hi(sghStream)
    /* 89428 80099428 34B820AC */  sw         $zero, %lo(sghStream)($at)
    /* 8942C 8009942C 1280013C */  lui        $at, %hi(sgpStreamSFX)
    /* 89430 80099430 38B820AC */  sw         $zero, %lo(sgpStreamSFX)($at)
    /* 89434 80099434 11650208 */  j          .L80099444
    /* 89438 80099438 00000000 */   nop
  .L8009943C:
    /* 8943C 8009943C 1280013C */  lui        $at, %hi(sghMusic)
    /* 89440 80099440 B4BB20AC */  sw         $zero, %lo(sghMusic)($at)
  .L80099444:
    /* 89444 80099444 1280053C */  lui        $a1, %hi(D_8011ADE0)
    /* 89448 80099448 E0ADA524 */  addiu      $a1, $a1, %lo(D_8011ADE0)
    /* 8944C 8009944C 9767000C */  jal        sprintf
    /* 89450 80099450 74000426 */   addiu     $a0, $s0, 0x74
    /* 89454 80099454 18650208 */  j          .L80099460
    /* 89458 80099458 00000000 */   nop
  .L8009945C:
    /* 8945C 8009945C 030005A2 */  sb         $a1, 0x3($s0)
  .L80099460:
    /* 89460 80099460 1400BF8F */  lw         $ra, 0x14($sp)
    /* 89464 80099464 1000B08F */  lw         $s0, 0x10($sp)
    /* 89468 80099468 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 8946C 8009946C 0800E003 */  jr         $ra
    /* 89470 80099470 00000000 */   nop
endlabel STR_SoundCommand__FP6SFXHDRi
