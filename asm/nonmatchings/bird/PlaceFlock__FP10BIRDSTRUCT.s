.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PlaceFlock__FP10BIRDSTRUCT, 0xE8

glabel PlaceFlock__FP10BIRDSTRUCT
    /* 9C58C 800AC58C D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 9C590 800AC590 1400B1AF */  sw         $s1, 0x14($sp)
    /* 9C594 800AC594 21888000 */  addu       $s1, $a0, $zero
    /* 9C598 800AC598 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 9C59C 800AC59C 21982002 */  addu       $s3, $s1, $zero
    /* 9C5A0 800AC5A0 18003126 */  addiu      $s1, $s1, 0x18
    /* 9C5A4 800AC5A4 1800B2AF */  sw         $s2, 0x18($sp)
    /* 9C5A8 800AC5A8 21900000 */  addu       $s2, $zero, $zero
    /* 9C5AC 800AC5AC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 9C5B0 800AC5B0 0E003026 */  addiu      $s0, $s1, 0xE
    /* 9C5B4 800AC5B4 2000BFAF */  sw         $ra, 0x20($sp)
  .L800AC5B8:
    /* 9C5B8 800AC5B8 14000424 */  addiu      $a0, $zero, 0x14
    /* 9C5BC 800AC5BC 000033AE */  sw         $s3, 0x0($s1)
    /* 9C5C0 800AC5C0 030000A2 */  sb         $zero, 0x3($s0)
    /* 9C5C4 800AC5C4 C9F6000C */  jal        ENG_random__Fl
    /* 9C5C8 800AC5C8 020000A2 */   sb        $zero, 0x2($s0)
    /* 9C5CC 800AC5CC 04006396 */  lhu        $v1, 0x4($s3)
    /* 9C5D0 800AC5D0 14000424 */  addiu      $a0, $zero, 0x14
    /* 9C5D4 800AC5D4 F6FF6324 */  addiu      $v1, $v1, -0xA
    /* 9C5D8 800AC5D8 21186200 */  addu       $v1, $v1, $v0
    /* 9C5DC 800AC5DC C9F6000C */  jal        ENG_random__Fl
    /* 9C5E0 800AC5E0 F6FF03A6 */   sh        $v1, -0xA($s0)
    /* 9C5E4 800AC5E4 21202002 */  addu       $a0, $s1, $zero
    /* 9C5E8 800AC5E8 06006696 */  lhu        $a2, 0x6($s3)
    /* 9C5EC 800AC5EC F6FF0586 */  lh         $a1, -0xA($s0)
    /* 9C5F0 800AC5F0 F6FFC624 */  addiu      $a2, $a2, -0xA
    /* 9C5F4 800AC5F4 2130C200 */  addu       $a2, $a2, $v0
    /* 9C5F8 800AC5F8 F8FF06A6 */  sh         $a2, -0x8($s0)
    /* 9C5FC 800AC5FC 00340600 */  sll        $a2, $a2, 16
    /* 9C600 800AC600 25AE020C */  jal        BirdWorld__FP10BIRDSTRUCTii
    /* 9C604 800AC604 03340600 */   sra       $a2, $a2, 16
    /* 9C608 800AC608 94AF020C */  jal        BIRD_StartPerch__FP10BIRDSTRUCT
    /* 9C60C 800AC60C 21202002 */   addu      $a0, $s1, $zero
    /* 9C610 800AC610 08000424 */  addiu      $a0, $zero, 0x8
    /* 9C614 800AC614 C9F6000C */  jal        ENG_random__Fl
    /* 9C618 800AC618 060000A2 */   sb        $zero, 0x6($s0)
    /* 9C61C 800AC61C 02000424 */  addiu      $a0, $zero, 0x2
    /* 9C620 800AC620 C9F6000C */  jal        ENG_random__Fl
    /* 9C624 800AC624 FEFF02A2 */   sb        $v0, -0x2($s0)
    /* 9C628 800AC628 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 9C62C 800AC62C 000002A2 */  sb         $v0, 0x0($s0)
    /* 9C630 800AC630 00160200 */  sll        $v0, $v0, 24
    /* 9C634 800AC634 02004014 */  bnez       $v0, .L800AC640
    /* 9C638 800AC638 01000224 */   addiu     $v0, $zero, 0x1
    /* 9C63C 800AC63C 000002A2 */  sb         $v0, 0x0($s0)
  .L800AC640:
    /* 9C640 800AC640 18001026 */  addiu      $s0, $s0, 0x18
    /* 9C644 800AC644 01005226 */  addiu      $s2, $s2, 0x1
    /* 9C648 800AC648 0300422A */  slti       $v0, $s2, 0x3
    /* 9C64C 800AC64C DAFF4014 */  bnez       $v0, .L800AC5B8
    /* 9C650 800AC650 18003126 */   addiu     $s1, $s1, 0x18
    /* 9C654 800AC654 2000BF8F */  lw         $ra, 0x20($sp)
    /* 9C658 800AC658 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 9C65C 800AC65C 1800B28F */  lw         $s2, 0x18($sp)
    /* 9C660 800AC660 1400B18F */  lw         $s1, 0x14($sp)
    /* 9C664 800AC664 1000B08F */  lw         $s0, 0x10($sp)
    /* 9C668 800AC668 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 9C66C 800AC66C 0800E003 */  jr         $ra
    /* 9C670 800AC670 00000000 */   nop
endlabel PlaceFlock__FP10BIRDSTRUCT
