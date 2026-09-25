.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawDialogBox__FiiP4RECTiiii, 0xE4

glabel DrawDialogBox__FiiP4RECTiiii
    /* 96960 800A6960 B8FFBD27 */  addiu      $sp, $sp, -0x48
    /* 96964 800A6964 3800B4AF */  sw         $s4, 0x38($sp)
    /* 96968 800A6968 5800B48F */  lw         $s4, 0x58($sp)
    /* 9696C 800A696C 3C00B5AF */  sw         $s5, 0x3C($sp)
    /* 96970 800A6970 5C00B58F */  lw         $s5, 0x5C($sp)
    /* 96974 800A6974 2800B0AF */  sw         $s0, 0x28($sp)
    /* 96978 800A6978 21808000 */  addu       $s0, $a0, $zero
    /* 9697C 800A697C 2C00B1AF */  sw         $s1, 0x2C($sp)
    /* 96980 800A6980 2188A000 */  addu       $s1, $a1, $zero
    /* 96984 800A6984 3000B2AF */  sw         $s2, 0x30($sp)
    /* 96988 800A6988 2190C000 */  addu       $s2, $a2, $zero
    /* 9698C 800A698C 3400B3AF */  sw         $s3, 0x34($sp)
    /* 96990 800A6990 2198E000 */  addu       $s3, $a3, $zero
    /* 96994 800A6994 4000B6AF */  sw         $s6, 0x40($sp)
    /* 96998 800A6998 6000B68F */  lw         $s6, 0x60($sp)
    /* 9699C 800A699C 4400BFAF */  sw         $ra, 0x44($sp)
    /* 969A0 800A69A0 83AD020C */  jal        __6Dialog_800ab60c
    /* 969A4 800A69A4 1800A427 */   addiu     $a0, $sp, 0x18
    /* 969A8 800A69A8 1800A427 */  addiu      $a0, $sp, 0x18
    /* 969AC 800A69AC 77AD020C */  jal        SetBorder__6Dialogi_800ab5dc
    /* 969B0 800A69B0 21280002 */   addu      $a1, $s0, $zero
    /* 969B4 800A69B4 1800A427 */  addiu      $a0, $sp, 0x18
    /* 969B8 800A69B8 75AD020C */  jal        SetBack__6Dialogi_800ab5d4
    /* 969BC 800A69BC 21282002 */   addu      $a1, $s1, $zero
    /* 969C0 800A69C0 1280053C */  lui        $a1, %hi(BORDERR)
    /* 969C4 800A69C4 F7ABA590 */  lbu        $a1, %lo(BORDERR)($a1)
    /* 969C8 800A69C8 1280063C */  lui        $a2, %hi(BORDERG)
    /* 969CC 800A69CC F8ABC690 */  lbu        $a2, %lo(BORDERG)($a2)
    /* 969D0 800A69D0 1280073C */  lui        $a3, %hi(BORDERB)
    /* 969D4 800A69D4 F9ABE790 */  lbu        $a3, %lo(BORDERB)($a3)
    /* 969D8 800A69D8 6DAD020C */  jal        SetRGB__6DialogUcUcUc_800ab5b4
    /* 969DC 800A69DC 1800A427 */   addiu     $a0, $sp, 0x18
    /* 969E0 800A69E0 1800A427 */  addiu      $a0, $sp, 0x18
    /* 969E4 800A69E4 21286002 */  addu       $a1, $s3, $zero
    /* 969E8 800A69E8 21308002 */  addu       $a2, $s4, $zero
    /* 969EC 800A69EC 2138A002 */  addu       $a3, $s5, $zero
    /* 969F0 800A69F0 B82F020C */  jal        Back__6Dialogiiii
    /* 969F4 800A69F4 1000B6AF */   sw        $s6, 0x10($sp)
    /* 969F8 800A69F8 05004012 */  beqz       $s2, .L800A6A10
    /* 969FC 800A69FC 1800A427 */   addiu     $a0, $sp, 0x18
    /* 96A00 800A6A00 000053A6 */  sh         $s3, 0x0($s2)
    /* 96A04 800A6A04 020054A6 */  sh         $s4, 0x2($s2)
    /* 96A08 800A6A08 040055A6 */  sh         $s5, 0x4($s2)
    /* 96A0C 800A6A0C 060056A6 */  sh         $s6, 0x6($s2)
  .L800A6A10:
    /* 96A10 800A6A10 79AD020C */  jal        ___6Dialog_800ab5e4
    /* 96A14 800A6A14 02000524 */   addiu     $a1, $zero, 0x2
    /* 96A18 800A6A18 4400BF8F */  lw         $ra, 0x44($sp)
    /* 96A1C 800A6A1C 4000B68F */  lw         $s6, 0x40($sp)
    /* 96A20 800A6A20 3C00B58F */  lw         $s5, 0x3C($sp)
    /* 96A24 800A6A24 3800B48F */  lw         $s4, 0x38($sp)
    /* 96A28 800A6A28 3400B38F */  lw         $s3, 0x34($sp)
    /* 96A2C 800A6A2C 3000B28F */  lw         $s2, 0x30($sp)
    /* 96A30 800A6A30 2C00B18F */  lw         $s1, 0x2C($sp)
    /* 96A34 800A6A34 2800B08F */  lw         $s0, 0x28($sp)
    /* 96A38 800A6A38 4800BD27 */  addiu      $sp, $sp, 0x48
    /* 96A3C 800A6A3C 0800E003 */  jr         $ra
    /* 96A40 800A6A40 00000000 */   nop
endlabel DrawDialogBox__FiiP4RECTiiii
