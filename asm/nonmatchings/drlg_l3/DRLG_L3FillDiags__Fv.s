.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_L3FillDiags__Fv, 0x12C

glabel DRLG_L3FillDiags__Fv
    /* FA2C 80149624 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* FA30 80149628 2800B6AF */  sw         $s6, 0x28($sp)
    /* FA34 8014962C 21B00000 */  addu       $s6, $zero, $zero
    /* FA38 80149630 0E80053C */  lui        $a1, %hi(dungeon)
    /* FA3C 80149634 C440A524 */  addiu      $a1, $a1, %lo(dungeon)
    /* FA40 80149638 3000BEAF */  sw         $fp, 0x30($sp)
    /* FA44 8014963C 6000BE24 */  addiu      $fp, $a1, 0x60
    /* FA48 80149640 2C00B7AF */  sw         $s7, 0x2C($sp)
    /* FA4C 80149644 01001724 */  addiu      $s7, $zero, 0x1
    /* FA50 80149648 3400BFAF */  sw         $ra, 0x34($sp)
    /* FA54 8014964C 2400B5AF */  sw         $s5, 0x24($sp)
    /* FA58 80149650 2000B4AF */  sw         $s4, 0x20($sp)
    /* FA5C 80149654 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* FA60 80149658 1800B2AF */  sw         $s2, 0x18($sp)
    /* FA64 8014965C 1400B1AF */  sw         $s1, 0x14($sp)
    /* FA68 80149660 1000B0AF */  sw         $s0, 0x10($sp)
    /* FA6C 80149664 40A81600 */  sll        $s5, $s6, 1
  .L80149668:
    /* FA70 80149668 0E80143C */  lui        $s4, %hi(dungeon)
    /* FA74 8014966C C4409426 */  addiu      $s4, $s4, %lo(dungeon)
    /* FA78 80149670 2198C003 */  addu       $s3, $fp, $zero
  .L80149674:
    /* FA7C 80149674 2190B402 */  addu       $s2, $s5, $s4
    /* FA80 80149678 2188B302 */  addu       $s1, $s5, $s3
    /* FA84 8014967C 00004396 */  lhu        $v1, 0x0($s2)
    /* FA88 80149680 00002296 */  lhu        $v0, 0x0($s1)
    /* FA8C 80149684 C0800300 */  sll        $s0, $v1, 3
    /* FA90 80149688 80100200 */  sll        $v0, $v0, 2
    /* FA94 8014968C 21800202 */  addu       $s0, $s0, $v0
    /* FA98 80149690 02004396 */  lhu        $v1, 0x2($s2)
    /* FA9C 80149694 02002296 */  lhu        $v0, 0x2($s1)
    /* FAA0 80149698 40180300 */  sll        $v1, $v1, 1
    /* FAA4 8014969C 21800302 */  addu       $s0, $s0, $v1
    /* FAA8 801496A0 21800202 */  addu       $s0, $s0, $v0
    /* FAAC 801496A4 06000224 */  addiu      $v0, $zero, 0x6
    /* FAB0 801496A8 09000216 */  bne        $s0, $v0, .L801496D0
    /* FAB4 801496AC 09000224 */   addiu     $v0, $zero, 0x9
    /* FAB8 801496B0 C9F6000C */  jal        ENG_random__Fl
    /* FABC 801496B4 02000424 */   addiu     $a0, $zero, 0x2
    /* FAC0 801496B8 03004014 */  bnez       $v0, .L801496C8
    /* FAC4 801496BC 00000000 */   nop
    /* FAC8 801496C0 B3250508 */  j          .L801496CC
    /* FACC 801496C4 000057A6 */   sh        $s7, 0x0($s2)
  .L801496C8:
    /* FAD0 801496C8 020037A6 */  sh         $s7, 0x2($s1)
  .L801496CC:
    /* FAD4 801496CC 09000224 */  addiu      $v0, $zero, 0x9
  .L801496D0:
    /* FAD8 801496D0 09000216 */  bne        $s0, $v0, .L801496F8
    /* FADC 801496D4 00000000 */   nop
    /* FAE0 801496D8 C9F6000C */  jal        ENG_random__Fl
    /* FAE4 801496DC 02000424 */   addiu     $a0, $zero, 0x2
    /* FAE8 801496E0 04004014 */  bnez       $v0, .L801496F4
    /* FAEC 801496E4 2110B402 */   addu      $v0, $s5, $s4
    /* FAF0 801496E8 2110B302 */  addu       $v0, $s5, $s3
    /* FAF4 801496EC BE250508 */  j          .L801496F8
    /* FAF8 801496F0 000057A4 */   sh        $s7, 0x0($v0)
  .L801496F4:
    /* FAFC 801496F4 020057A4 */  sh         $s7, 0x2($v0)
  .L801496F8:
    /* FB00 801496F8 60007326 */  addiu      $s3, $s3, 0x60
    /* FB04 801496FC A00EC227 */  addiu      $v0, $fp, 0xEA0
    /* FB08 80149700 2A106202 */  slt        $v0, $s3, $v0
    /* FB0C 80149704 DBFF4014 */  bnez       $v0, .L80149674
    /* FB10 80149708 60009426 */   addiu     $s4, $s4, 0x60
    /* FB14 8014970C 0100D626 */  addiu      $s6, $s6, 0x1
    /* FB18 80149710 2700C22A */  slti       $v0, $s6, 0x27
    /* FB1C 80149714 D4FF4014 */  bnez       $v0, .L80149668
    /* FB20 80149718 40A81600 */   sll       $s5, $s6, 1
    /* FB24 8014971C 3400BF8F */  lw         $ra, 0x34($sp)
    /* FB28 80149720 3000BE8F */  lw         $fp, 0x30($sp)
    /* FB2C 80149724 2C00B78F */  lw         $s7, 0x2C($sp)
    /* FB30 80149728 2800B68F */  lw         $s6, 0x28($sp)
    /* FB34 8014972C 2400B58F */  lw         $s5, 0x24($sp)
    /* FB38 80149730 2000B48F */  lw         $s4, 0x20($sp)
    /* FB3C 80149734 1C00B38F */  lw         $s3, 0x1C($sp)
    /* FB40 80149738 1800B28F */  lw         $s2, 0x18($sp)
    /* FB44 8014973C 1400B18F */  lw         $s1, 0x14($sp)
    /* FB48 80149740 1000B08F */  lw         $s0, 0x10($sp)
    /* FB4C 80149744 3800BD27 */  addiu      $sp, $sp, 0x38
    /* FB50 80149748 0800E003 */  jr         $ra
    /* FB54 8014974C 00000000 */   nop
endlabel DRLG_L3FillDiags__Fv
