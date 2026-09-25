.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PrintOBJ_BARRELEX__FP12ObjectStructiiP7TextDati, 0x158

glabel PrintOBJ_BARRELEX__FP12ObjectStructiiP7TextDati
    /* 6E5B8 8007E5B8 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 6E5BC 8007E5BC 2000B0AF */  sw         $s0, 0x20($sp)
    /* 6E5C0 8007E5C0 21808000 */  addu       $s0, $a0, $zero
    /* 6E5C4 8007E5C4 2400B1AF */  sw         $s1, 0x24($sp)
    /* 6E5C8 8007E5C8 2188A000 */  addu       $s1, $a1, $zero
    /* 6E5CC 8007E5CC 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 6E5D0 8007E5D0 2198C000 */  addu       $s3, $a2, $zero
    /* 6E5D4 8007E5D4 2800B2AF */  sw         $s2, 0x28($sp)
    /* 6E5D8 8007E5D8 3400BFAF */  sw         $ra, 0x34($sp)
    /* 6E5DC 8007E5DC 3000B4AF */  sw         $s4, 0x30($sp)
    /* 6E5E0 8007E5E0 25000292 */  lbu        $v0, 0x25($s0)
    /* 6E5E4 8007E5E4 4800B48F */  lw         $s4, 0x48($sp)
    /* 6E5E8 8007E5E8 03004010 */  beqz       $v0, .L8007E5F8
    /* 6E5EC 8007E5EC 2190E000 */   addu      $s2, $a3, $zero
    /* 6E5F0 8007E5F0 4C52010C */  jal        DrawObjExpl__FP12ObjectStructiii
    /* 6E5F4 8007E5F4 21388002 */   addu      $a3, $s4, $zero
  .L8007E5F8:
    /* 6E5F8 8007E5F8 21204002 */  addu       $a0, $s2, $zero
    /* 6E5FC 8007E5FC 09000524 */  addiu      $a1, $zero, 0x9
    /* 6E600 8007E600 21000282 */  lb         $v0, 0x21($s0)
    /* 6E604 8007E604 21300000 */  addu       $a2, $zero, $zero
    /* 6E608 8007E608 7DFB010C */  jal        GetNumOfFrames__7TextDatii_8007edf4
    /* 6E60C 8007E60C FEFF5024 */   addiu     $s0, $v0, -0x2
    /* 6E610 8007E610 2A105000 */  slt        $v0, $v0, $s0
    /* 6E614 8007E614 33004014 */  bnez       $v0, .L8007E6E4
    /* 6E618 8007E618 21204002 */   addu      $a0, $s2, $zero
    /* 6E61C 8007E61C 09000524 */  addiu      $a1, $zero, 0x9
    /* 6E620 8007E620 21300000 */  addu       $a2, $zero, $zero
    /* 6E624 8007E624 21380000 */  addu       $a3, $zero, $zero
    /* 6E628 8007E628 A64F020C */  jal        GetFrNum__7TextDatiiii
    /* 6E62C 8007E62C 1000B0AF */   sw        $s0, 0x10($sp)
    /* 6E630 8007E630 21204002 */  addu       $a0, $s2, $zero
    /* 6E634 8007E634 21804000 */  addu       $s0, $v0, $zero
    /* 6E638 8007E638 21280002 */  addu       $a1, $s0, $zero
    /* 6E63C 8007E63C 21302002 */  addu       $a2, $s1, $zero
    /* 6E640 8007E640 21386002 */  addu       $a3, $s3, $zero
    /* 6E644 8007E644 1000A0AF */  sw         $zero, 0x10($sp)
    /* 6E648 8007E648 1400B4AF */  sw         $s4, 0x14($sp)
    /* 6E64C 8007E64C 064D020C */  jal        PrintFt4__7TextDatiiiiii
    /* 6E650 8007E650 1800A0AF */   sw        $zero, 0x18($sp)
    /* 6E654 8007E654 21884000 */  addu       $s1, $v0, $zero
    /* 6E658 8007E658 21204002 */  addu       $a0, $s2, $zero
    /* 6E65C 8007E65C 07002292 */  lbu        $v0, 0x7($s1)
    /* 6E660 8007E660 21280002 */  addu       $a1, $s0, $zero
    /* 6E664 8007E664 FE004230 */  andi       $v0, $v0, 0xFE
    /* 6E668 8007E668 92FB010C */  jal        GetFr__7TextDati_8007ee48
    /* 6E66C 8007E66C 070022A2 */   sb        $v0, 0x7($s1)
    /* 6E670 8007E670 0400428C */  lw         $v0, 0x4($v0)
    /* 6E674 8007E674 0001033C */  lui        $v1, (0x1000000 >> 16)
    /* 6E678 8007E678 24104300 */  and        $v0, $v0, $v1
    /* 6E67C 8007E67C 1B004010 */  beqz       $v0, .L8007E6EC
    /* 6E680 8007E680 21102002 */   addu      $v0, $s1, $zero
    /* 6E684 8007E684 45FB010C */  jal        PRIM_GetCopy__FP8POLY_FT4
    /* 6E688 8007E688 21202002 */   addu      $a0, $s1, $zero
    /* 6E68C 8007E68C 21804000 */  addu       $s0, $v0, $zero
    /* 6E690 8007E690 4C46020C */  jal        ShadScaleSkew__7CBlocksP8POLY_FT4
    /* 6E694 8007E694 21200002 */   addu      $a0, $s0, $zero
    /* 6E698 8007E698 FF00053C */  lui        $a1, (0xFFFFFF >> 16)
    /* 6E69C 8007E69C FFFFA534 */  ori        $a1, $a1, (0xFFFFFF & 0xFFFF)
    /* 6E6A0 8007E6A0 80201400 */  sll        $a0, $s4, 2
    /* 6E6A4 8007E6A4 00FF063C */  lui        $a2, (0xFF000000 >> 16)
    /* 6E6A8 8007E6A8 1280023C */  lui        $v0, %hi(ThisOt)
    /* 6E6AC 8007E6AC B4AA428C */  lw         $v0, %lo(ThisOt)($v0)
    /* 6E6B0 8007E6B0 0000038E */  lw         $v1, 0x0($s0)
    /* 6E6B4 8007E6B4 21208200 */  addu       $a0, $a0, $v0
    /* 6E6B8 8007E6B8 0000828C */  lw         $v0, 0x0($a0)
    /* 6E6BC 8007E6BC 24186600 */  and        $v1, $v1, $a2
    /* 6E6C0 8007E6C0 24104500 */  and        $v0, $v0, $a1
    /* 6E6C4 8007E6C4 25186200 */  or         $v1, $v1, $v0
    /* 6E6C8 8007E6C8 000003AE */  sw         $v1, 0x0($s0)
    /* 6E6CC 8007E6CC 0000828C */  lw         $v0, 0x0($a0)
    /* 6E6D0 8007E6D0 24800502 */  and        $s0, $s0, $a1
    /* 6E6D4 8007E6D4 24104600 */  and        $v0, $v0, $a2
    /* 6E6D8 8007E6D8 25105000 */  or         $v0, $v0, $s0
    /* 6E6DC 8007E6DC BAF90108 */  j          .L8007E6E8
    /* 6E6E0 8007E6E0 000082AC */   sw        $v0, 0x0($a0)
  .L8007E6E4:
    /* 6E6E4 8007E6E4 21880000 */  addu       $s1, $zero, $zero
  .L8007E6E8:
    /* 6E6E8 8007E6E8 21102002 */  addu       $v0, $s1, $zero
  .L8007E6EC:
    /* 6E6EC 8007E6EC 3400BF8F */  lw         $ra, 0x34($sp)
    /* 6E6F0 8007E6F0 3000B48F */  lw         $s4, 0x30($sp)
    /* 6E6F4 8007E6F4 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 6E6F8 8007E6F8 2800B28F */  lw         $s2, 0x28($sp)
    /* 6E6FC 8007E6FC 2400B18F */  lw         $s1, 0x24($sp)
    /* 6E700 8007E700 2000B08F */  lw         $s0, 0x20($sp)
    /* 6E704 8007E704 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 6E708 8007E708 0800E003 */  jr         $ra
    /* 6E70C 8007E70C 00000000 */   nop
endlabel PrintOBJ_BARRELEX__FP12ObjectStructiiP7TextDati
