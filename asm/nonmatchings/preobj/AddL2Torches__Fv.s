.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddL2Torches__Fv, 0x19C

glabel AddL2Torches__Fv
    /* 1EB18 80158710 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 1EB1C 80158714 1400B1AF */  sw         $s1, 0x14($sp)
    /* 1EB20 80158718 21880000 */  addu       $s1, $zero, $zero
    /* 1EB24 8015871C 2400B5AF */  sw         $s5, 0x24($sp)
    /* 1EB28 80158720 F8FF1524 */  addiu      $s5, $zero, -0x8
    /* 1EB2C 80158724 3000BFAF */  sw         $ra, 0x30($sp)
    /* 1EB30 80158728 2C00B7AF */  sw         $s7, 0x2C($sp)
    /* 1EB34 8015872C 2800B6AF */  sw         $s6, 0x28($sp)
    /* 1EB38 80158730 2000B4AF */  sw         $s4, 0x20($sp)
    /* 1EB3C 80158734 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 1EB40 80158738 1800B2AF */  sw         $s2, 0x18($sp)
    /* 1EB44 8015873C 1000B0AF */  sw         $s0, 0x10($sp)
  .L80158740:
    /* 1EB48 80158740 21800000 */  addu       $s0, $zero, $zero
    /* 1EB4C 80158744 C0B81100 */  sll        $s7, $s1, 3
    /* 1EB50 80158748 FFFF3626 */  addiu      $s6, $s1, -0x1
    /* 1EB54 8015874C 21A0A002 */  addu       $s4, $s5, $zero
    /* 1EB58 80158750 80FC1324 */  addiu      $s3, $zero, -0x380
  .L80158754:
    /* 1EB5C 80158754 21200002 */  addu       $a0, $s0, $zero
    /* 1EB60 80158758 B861050C */  jal        TorchLocOK__Fii
    /* 1EB64 8015875C 21282002 */   addu      $a1, $s1, $zero
    /* 1EB68 80158760 FF004230 */  andi       $v0, $v0, 0xFF
    /* 1EB6C 80158764 3C004010 */  beqz       $v0, .L80158858
    /* 1EB70 80158768 21200002 */   addu      $a0, $s0, $zero
    /* 1EB74 8015876C 910A020C */  jal        GetDPiece__Fii
    /* 1EB78 80158770 21282002 */   addu      $a1, $s1, $zero
    /* 1EB7C 80158774 00140200 */  sll        $v0, $v0, 16
    /* 1EB80 80158778 03940200 */  sra        $s2, $v0, 16
    /* 1EB84 8015877C 01000224 */  addiu      $v0, $zero, 0x1
    /* 1EB88 80158780 0A004216 */  bne        $s2, $v0, .L801587AC
    /* 1EB8C 80158784 05000224 */   addiu     $v0, $zero, 0x5
    /* 1EB90 80158788 C9F6000C */  jal        ENG_random__Fl
    /* 1EB94 8015878C 03000424 */   addiu     $a0, $zero, 0x3
    /* 1EB98 80158790 06004014 */  bnez       $v0, .L801587AC
    /* 1EB9C 80158794 05000224 */   addiu     $v0, $zero, 0x5
    /* 1EBA0 80158798 2E000424 */  addiu      $a0, $zero, 0x2E
    /* 1EBA4 8015879C 21280002 */  addu       $a1, $s0, $zero
    /* 1EBA8 801587A0 BE4E010C */  jal        AddObject__Fiii
    /* 1EBAC 801587A4 21302002 */   addu      $a2, $s1, $zero
    /* 1EBB0 801587A8 05000224 */  addiu      $v0, $zero, 0x5
  .L801587AC:
    /* 1EBB4 801587AC 0A004216 */  bne        $s2, $v0, .L801587D8
    /* 1EBB8 801587B0 25000224 */   addiu     $v0, $zero, 0x25
    /* 1EBBC 801587B4 C9F6000C */  jal        ENG_random__Fl
    /* 1EBC0 801587B8 03000424 */   addiu     $a0, $zero, 0x3
    /* 1EBC4 801587BC 06004014 */  bnez       $v0, .L801587D8
    /* 1EBC8 801587C0 25000224 */   addiu     $v0, $zero, 0x25
    /* 1EBCC 801587C4 2F000424 */  addiu      $a0, $zero, 0x2F
    /* 1EBD0 801587C8 21280002 */  addu       $a1, $s0, $zero
    /* 1EBD4 801587CC BE4E010C */  jal        AddObject__Fiii
    /* 1EBD8 801587D0 21302002 */   addu      $a2, $s1, $zero
    /* 1EBDC 801587D4 25000224 */  addiu      $v0, $zero, 0x25
  .L801587D8:
    /* 1EBE0 801587D8 10004216 */  bne        $s2, $v0, .L8015881C
    /* 1EBE4 801587DC 29000224 */   addiu     $v0, $zero, 0x29
    /* 1EBE8 801587E0 C9F6000C */  jal        ENG_random__Fl
    /* 1EBEC 801587E4 0A000424 */   addiu     $a0, $zero, 0xA
    /* 1EBF0 801587E8 0C004014 */  bnez       $v0, .L8015881C
    /* 1EBF4 801587EC 29000224 */   addiu     $v0, $zero, 0x29
    /* 1EBF8 801587F0 2110F302 */  addu       $v0, $s7, $s3
    /* 1EBFC 801587F4 0E80013C */  lui        $at, %hi(dung_map + 0x3)
    /* 1EC00 801587F8 21082200 */  addu       $at, $at, $v0
    /* 1EC04 801587FC 2B7A2280 */  lb         $v0, %lo(dung_map + 0x3)($at)
    /* 1EC08 80158800 00000000 */  nop
    /* 1EC0C 80158804 04004014 */  bnez       $v0, .L80158818
    /* 1EC10 80158808 FFFF0526 */   addiu     $a1, $s0, -0x1
    /* 1EC14 8015880C 2C000424 */  addiu      $a0, $zero, 0x2C
    /* 1EC18 80158810 BE4E010C */  jal        AddObject__Fiii
    /* 1EC1C 80158814 21302002 */   addu      $a2, $s1, $zero
  .L80158818:
    /* 1EC20 80158818 29000224 */  addiu      $v0, $zero, 0x29
  .L8015881C:
    /* 1EC24 8015881C 0E004216 */  bne        $s2, $v0, .L80158858
    /* 1EC28 80158820 00000000 */   nop
    /* 1EC2C 80158824 C9F6000C */  jal        ENG_random__Fl
    /* 1EC30 80158828 0A000424 */   addiu     $a0, $zero, 0xA
    /* 1EC34 8015882C 0A004014 */  bnez       $v0, .L80158858
    /* 1EC38 80158830 00000000 */   nop
    /* 1EC3C 80158834 0E80013C */  lui        $at, %hi(dung_map + 0x3)
    /* 1EC40 80158838 21083400 */  addu       $at, $at, $s4
    /* 1EC44 8015883C 2B7A2280 */  lb         $v0, %lo(dung_map + 0x3)($at)
    /* 1EC48 80158840 00000000 */  nop
    /* 1EC4C 80158844 04004014 */  bnez       $v0, .L80158858
    /* 1EC50 80158848 2D000424 */   addiu     $a0, $zero, 0x2D
    /* 1EC54 8015884C 21280002 */  addu       $a1, $s0, $zero
    /* 1EC58 80158850 BE4E010C */  jal        AddObject__Fiii
    /* 1EC5C 80158854 2130C002 */   addu      $a2, $s6, $zero
  .L80158858:
    /* 1EC60 80158858 80039426 */  addiu      $s4, $s4, 0x380
    /* 1EC64 8015885C 01001026 */  addiu      $s0, $s0, 0x1
    /* 1EC68 80158860 6000022A */  slti       $v0, $s0, 0x60
    /* 1EC6C 80158864 BBFF4014 */  bnez       $v0, .L80158754
    /* 1EC70 80158868 80037326 */   addiu     $s3, $s3, 0x380
    /* 1EC74 8015886C 01003126 */  addiu      $s1, $s1, 0x1
    /* 1EC78 80158870 6000222A */  slti       $v0, $s1, 0x60
    /* 1EC7C 80158874 B2FF4014 */  bnez       $v0, .L80158740
    /* 1EC80 80158878 0800B526 */   addiu     $s5, $s5, 0x8
    /* 1EC84 8015887C 3000BF8F */  lw         $ra, 0x30($sp)
    /* 1EC88 80158880 2C00B78F */  lw         $s7, 0x2C($sp)
    /* 1EC8C 80158884 2800B68F */  lw         $s6, 0x28($sp)
    /* 1EC90 80158888 2400B58F */  lw         $s5, 0x24($sp)
    /* 1EC94 8015888C 2000B48F */  lw         $s4, 0x20($sp)
    /* 1EC98 80158890 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 1EC9C 80158894 1800B28F */  lw         $s2, 0x18($sp)
    /* 1ECA0 80158898 1400B18F */  lw         $s1, 0x14($sp)
    /* 1ECA4 8015889C 1000B08F */  lw         $s0, 0x10($sp)
    /* 1ECA8 801588A0 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 1ECAC 801588A4 0800E003 */  jr         $ra
    /* 1ECB0 801588A8 00000000 */   nop
endlabel AddL2Torches__Fv
