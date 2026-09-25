.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CheckSide__7GamePadi, 0x40

glabel CheckSide__7GamePadi
    /* 693B8 800793B8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 693BC 800793BC 1000BFAF */  sw         $ra, 0x10($sp)
    /* 693C0 800793C0 FFFFA524 */  addiu      $a1, $a1, -0x1
    /* 693C4 800793C4 0700A530 */  andi       $a1, $a1, 0x7
    /* 693C8 800793C8 FFFFA524 */  addiu      $a1, $a1, -0x1
    /* 693CC 800793CC A0E4010C */  jal        CheckDirs__7GamePadi
    /* 693D0 800793D0 0700A530 */   andi      $a1, $a1, 0x7
    /* 693D4 800793D4 21204000 */  addu       $a0, $v0, $zero
    /* 693D8 800793D8 FFFF0324 */  addiu      $v1, $zero, -0x1
    /* 693DC 800793DC 02008310 */  beq        $a0, $v1, .L800793E8
    /* 693E0 800793E0 01000224 */   addiu     $v0, $zero, 0x1
    /* 693E4 800793E4 02000224 */  addiu      $v0, $zero, 0x2
  .L800793E8:
    /* 693E8 800793E8 1000BF8F */  lw         $ra, 0x10($sp)
    /* 693EC 800793EC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 693F0 800793F0 0800E003 */  jr         $ra
    /* 693F4 800793F4 00000000 */   nop
endlabel CheckSide__7GamePadi
