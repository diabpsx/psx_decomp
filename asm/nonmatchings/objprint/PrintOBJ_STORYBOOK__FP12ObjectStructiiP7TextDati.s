.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PrintOBJ_STORYBOOK__FP12ObjectStructiiP7TextDati, 0x188

glabel PrintOBJ_STORYBOOK__FP12ObjectStructiiP7TextDati
    /* 6EA80 8007EA80 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 6EA84 8007EA84 21408000 */  addu       $t0, $a0, $zero
    /* 6EA88 8007EA88 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 6EA8C 8007EA8C 2198A000 */  addu       $s3, $a1, $zero
    /* 6EA90 8007EA90 3000B4AF */  sw         $s4, 0x30($sp)
    /* 6EA94 8007EA94 21A0C000 */  addu       $s4, $a2, $zero
    /* 6EA98 8007EA98 2800B2AF */  sw         $s2, 0x28($sp)
    /* 6EA9C 8007EA9C 2190E000 */  addu       $s2, $a3, $zero
    /* 6EAA0 8007EAA0 21204002 */  addu       $a0, $s2, $zero
    /* 6EAA4 8007EAA4 21300000 */  addu       $a2, $zero, $zero
    /* 6EAA8 8007EAA8 3800BFAF */  sw         $ra, 0x38($sp)
    /* 6EAAC 8007EAAC 3400B5AF */  sw         $s5, 0x34($sp)
    /* 6EAB0 8007EAB0 2400B1AF */  sw         $s1, 0x24($sp)
    /* 6EAB4 8007EAB4 2000B0AF */  sw         $s0, 0x20($sp)
    /* 6EAB8 8007EAB8 1E000381 */  lb         $v1, 0x1E($t0)
    /* 6EABC 8007EABC 5000B58F */  lw         $s5, 0x50($sp)
    /* 6EAC0 8007EAC0 C0100300 */  sll        $v0, $v1, 3
    /* 6EAC4 8007EAC4 21104300 */  addu       $v0, $v0, $v1
    /* 6EAC8 8007EAC8 40100200 */  sll        $v0, $v0, 1
    /* 6EACC 8007EACC 0E80013C */  lui        $at, %hi(AllObjects + 0x1)
    /* 6EAD0 8007EAD0 21082200 */  addu       $at, $at, $v0
    /* 6EAD4 8007EAD4 B1842280 */  lb         $v0, %lo(AllObjects + 0x1)($at)
    /* 6EAD8 8007EAD8 21000381 */  lb         $v1, 0x21($t0)
    /* 6EADC 8007EADC 80100200 */  sll        $v0, $v0, 2
    /* 6EAE0 8007EAE0 1180013C */  lui        $at, %hi(ObjMasterLoadList)
    /* 6EAE4 8007EAE4 21082200 */  addu       $at, $at, $v0
    /* 6EAE8 8007EAE8 F0693184 */  lh         $s1, %lo(ObjMasterLoadList)($at)
    /* 6EAEC 8007EAEC FFFF7024 */  addiu      $s0, $v1, -0x1
    /* 6EAF0 8007EAF0 7DFB010C */  jal        GetNumOfFrames__7TextDatii_8007edf4
    /* 6EAF4 8007EAF4 21282002 */   addu      $a1, $s1, $zero
    /* 6EAF8 8007EAF8 2A105000 */  slt        $v0, $v0, $s0
    /* 6EAFC 8007EAFC 05004010 */  beqz       $v0, .L8007EB14
    /* 6EB00 8007EB00 21204002 */   addu      $a0, $s2, $zero
    /* 6EB04 8007EB04 21282002 */  addu       $a1, $s1, $zero
    /* 6EB08 8007EB08 7DFB010C */  jal        GetNumOfFrames__7TextDatii_8007edf4
    /* 6EB0C 8007EB0C 21300000 */   addu      $a2, $zero, $zero
    /* 6EB10 8007EB10 23800202 */  subu       $s0, $s0, $v0
  .L8007EB14:
    /* 6EB14 8007EB14 21204002 */  addu       $a0, $s2, $zero
    /* 6EB18 8007EB18 21282002 */  addu       $a1, $s1, $zero
    /* 6EB1C 8007EB1C 21300000 */  addu       $a2, $zero, $zero
    /* 6EB20 8007EB20 21380000 */  addu       $a3, $zero, $zero
    /* 6EB24 8007EB24 A64F020C */  jal        GetFrNum__7TextDatiiii
    /* 6EB28 8007EB28 1000B0AF */   sw        $s0, 0x10($sp)
    /* 6EB2C 8007EB2C 21204002 */  addu       $a0, $s2, $zero
    /* 6EB30 8007EB30 21804000 */  addu       $s0, $v0, $zero
    /* 6EB34 8007EB34 21280002 */  addu       $a1, $s0, $zero
    /* 6EB38 8007EB38 21306002 */  addu       $a2, $s3, $zero
    /* 6EB3C 8007EB3C 21388002 */  addu       $a3, $s4, $zero
    /* 6EB40 8007EB40 1000A0AF */  sw         $zero, 0x10($sp)
    /* 6EB44 8007EB44 1400B5AF */  sw         $s5, 0x14($sp)
    /* 6EB48 8007EB48 064D020C */  jal        PrintFt4__7TextDatiiiiii
    /* 6EB4C 8007EB4C 1800A0AF */   sw        $zero, 0x18($sp)
    /* 6EB50 8007EB50 21204002 */  addu       $a0, $s2, $zero
    /* 6EB54 8007EB54 21884000 */  addu       $s1, $v0, $zero
    /* 6EB58 8007EB58 07002292 */  lbu        $v0, 0x7($s1)
    /* 6EB5C 8007EB5C 21280002 */  addu       $a1, $s0, $zero
    /* 6EB60 8007EB60 FE004230 */  andi       $v0, $v0, 0xFE
    /* 6EB64 8007EB64 92FB010C */  jal        GetFr__7TextDati_8007ee48
    /* 6EB68 8007EB68 070022A2 */   sb        $v0, 0x7($s1)
    /* 6EB6C 8007EB6C 0400428C */  lw         $v0, 0x4($v0)
    /* 6EB70 8007EB70 0001033C */  lui        $v1, (0x1000000 >> 16)
    /* 6EB74 8007EB74 24104300 */  and        $v0, $v0, $v1
    /* 6EB78 8007EB78 19004010 */  beqz       $v0, .L8007EBE0
    /* 6EB7C 8007EB7C 21102002 */   addu      $v0, $s1, $zero
    /* 6EB80 8007EB80 45FB010C */  jal        PRIM_GetCopy__FP8POLY_FT4
    /* 6EB84 8007EB84 21202002 */   addu      $a0, $s1, $zero
    /* 6EB88 8007EB88 21804000 */  addu       $s0, $v0, $zero
    /* 6EB8C 8007EB8C 4C46020C */  jal        ShadScaleSkew__7CBlocksP8POLY_FT4
    /* 6EB90 8007EB90 21200002 */   addu      $a0, $s0, $zero
    /* 6EB94 8007EB94 FF00053C */  lui        $a1, (0xFFFFFF >> 16)
    /* 6EB98 8007EB98 FFFFA534 */  ori        $a1, $a1, (0xFFFFFF & 0xFFFF)
    /* 6EB9C 8007EB9C 80201500 */  sll        $a0, $s5, 2
    /* 6EBA0 8007EBA0 00FF063C */  lui        $a2, (0xFF000000 >> 16)
    /* 6EBA4 8007EBA4 1280023C */  lui        $v0, %hi(ThisOt)
    /* 6EBA8 8007EBA8 B4AA428C */  lw         $v0, %lo(ThisOt)($v0)
    /* 6EBAC 8007EBAC 0000038E */  lw         $v1, 0x0($s0)
    /* 6EBB0 8007EBB0 21208200 */  addu       $a0, $a0, $v0
    /* 6EBB4 8007EBB4 0000828C */  lw         $v0, 0x0($a0)
    /* 6EBB8 8007EBB8 24186600 */  and        $v1, $v1, $a2
    /* 6EBBC 8007EBBC 24104500 */  and        $v0, $v0, $a1
    /* 6EBC0 8007EBC0 25186200 */  or         $v1, $v1, $v0
    /* 6EBC4 8007EBC4 000003AE */  sw         $v1, 0x0($s0)
    /* 6EBC8 8007EBC8 0000828C */  lw         $v0, 0x0($a0)
    /* 6EBCC 8007EBCC 24800502 */  and        $s0, $s0, $a1
    /* 6EBD0 8007EBD0 24104600 */  and        $v0, $v0, $a2
    /* 6EBD4 8007EBD4 25105000 */  or         $v0, $v0, $s0
    /* 6EBD8 8007EBD8 000082AC */  sw         $v0, 0x0($a0)
    /* 6EBDC 8007EBDC 21102002 */  addu       $v0, $s1, $zero
  .L8007EBE0:
    /* 6EBE0 8007EBE0 3800BF8F */  lw         $ra, 0x38($sp)
    /* 6EBE4 8007EBE4 3400B58F */  lw         $s5, 0x34($sp)
    /* 6EBE8 8007EBE8 3000B48F */  lw         $s4, 0x30($sp)
    /* 6EBEC 8007EBEC 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 6EBF0 8007EBF0 2800B28F */  lw         $s2, 0x28($sp)
    /* 6EBF4 8007EBF4 2400B18F */  lw         $s1, 0x24($sp)
    /* 6EBF8 8007EBF8 2000B08F */  lw         $s0, 0x20($sp)
    /* 6EBFC 8007EBFC 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 6EC00 8007EC00 0800E003 */  jr         $ra
    /* 6EC04 8007EC04 00000000 */   nop
endlabel PrintOBJ_STORYBOOK__FP12ObjectStructiiP7TextDati
