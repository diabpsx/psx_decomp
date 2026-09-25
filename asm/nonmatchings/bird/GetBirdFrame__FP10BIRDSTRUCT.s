.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetBirdFrame__FP10BIRDSTRUCT, 0x98

glabel GetBirdFrame__FP10BIRDSTRUCT
    /* 9C97C 800AC97C 12008580 */  lb         $a1, 0x12($a0)
    /* 9C980 800AC980 0C008380 */  lb         $v1, 0xC($a0)
    /* 9C984 800AC984 0300A010 */  beqz       $a1, .L800AC994
    /* 9C988 800AC988 04000224 */   addiu     $v0, $zero, 0x4
    /* 9C98C 800AC98C 1500A214 */  bne        $a1, $v0, .L800AC9E4
    /* 9C990 800AC990 03000224 */   addiu     $v0, $zero, 0x3
  .L800AC994:
    /* 9C994 800AC994 0800622C */  sltiu      $v0, $v1, 0x8
    /* 9C998 800AC998 0B004010 */  beqz       $v0, .L800AC9C8
    /* 9C99C 800AC99C 00000000 */   nop
    /* 9C9A0 800AC9A0 80100300 */  sll        $v0, $v1, 2
    /* 9C9A4 800AC9A4 1180013C */  lui        $at, %hi(jtbl_80110E10)
    /* 9C9A8 800AC9A8 21082200 */  addu       $at, $at, $v0
    /* 9C9AC 800AC9AC 100E228C */  lw         $v0, %lo(jtbl_80110E10)($at)
    /* 9C9B0 800AC9B0 00000000 */  nop
    /* 9C9B4 800AC9B4 08004000 */  jr         $v0
    /* 9C9B8 800AC9B8 00000000 */   nop
  jlabel .L800AC9BC
    /* 9C9BC 800AC9BC 72B20208 */  j          .L800AC9C8
    /* 9C9C0 800AC9C0 21180000 */   addu      $v1, $zero, $zero
  jlabel .L800AC9C4
    /* 9C9C4 800AC9C4 01000324 */  addiu      $v1, $zero, 0x1
  .L800AC9C8:
    /* 9C9C8 800AC9C8 11008290 */  lbu        $v0, 0x11($a0)
    /* 9C9CC 800AC9CC 40180300 */  sll        $v1, $v1, 1
    /* 9C9D0 800AC9D0 00160200 */  sll        $v0, $v0, 24
    /* 9C9D4 800AC9D4 C3160200 */  sra        $v0, $v0, 27
    /* 9C9D8 800AC9D8 21186200 */  addu       $v1, $v1, $v0
    /* 9C9DC 800AC9DC 83B20208 */  j          .L800ACA0C
    /* 9C9E0 800AC9E0 10006224 */   addiu     $v0, $v1, 0x10
  .L800AC9E4:
    /* 9C9E4 800AC9E4 0300A214 */  bne        $a1, $v0, .L800AC9F4
    /* 9C9E8 800AC9E8 40180300 */   sll       $v1, $v1, 1
    /* 9C9EC 800AC9EC 82B20208 */  j          .L800ACA08
    /* 9C9F0 800AC9F0 01006324 */   addiu     $v1, $v1, 0x1
  .L800AC9F4:
    /* 9C9F4 800AC9F4 11008290 */  lbu        $v0, 0x11($a0)
    /* 9C9F8 800AC9F8 00000000 */  nop
    /* 9C9FC 800AC9FC 00160200 */  sll        $v0, $v0, 24
    /* 9CA00 800ACA00 C3160200 */  sra        $v0, $v0, 27
    /* 9CA04 800ACA04 21186200 */  addu       $v1, $v1, $v0
  .L800ACA08:
    /* 9CA08 800ACA08 21106000 */  addu       $v0, $v1, $zero
  .L800ACA0C:
    /* 9CA0C 800ACA0C 0800E003 */  jr         $ra
    /* 9CA10 800ACA10 00000000 */   nop
endlabel GetBirdFrame__FP10BIRDSTRUCT
