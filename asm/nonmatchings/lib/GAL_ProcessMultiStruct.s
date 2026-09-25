.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GAL_ProcessMultiStruct, 0xAC

glabel GAL_ProcessMultiStruct
    /* 12880 80022880 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 12884 80022884 2000B4AF */  sw         $s4, 0x20($sp)
    /* 12888 80022888 21A08000 */  addu       $s4, $a0, $zero
    /* 1288C 8002288C FFFF023C */  lui        $v0, (0xFFFF7FFF >> 16)
    /* 12890 80022890 FF7F4234 */  ori        $v0, $v0, (0xFFFF7FFF & 0xFFFF)
    /* 12894 80022894 1400B1AF */  sw         $s1, 0x14($sp)
    /* 12898 80022898 21880000 */  addu       $s1, $zero, $zero
    /* 1289C 8002289C 1800B2AF */  sw         $s2, 0x18($sp)
    /* 128A0 800228A0 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 128A4 800228A4 2498A200 */  and        $s3, $a1, $v0
    /* 128A8 800228A8 2800BFAF */  sw         $ra, 0x28($sp)
    /* 128AC 800228AC 2400B5AF */  sw         $s5, 0x24($sp)
    /* 128B0 800228B0 1000B0AF */  sw         $s0, 0x10($sp)
    /* 128B4 800228B4 0000838E */  lw         $v1, 0x0($s4)
    /* 128B8 800228B8 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 128BC 800228BC 0D006210 */  beq        $v1, $v0, .L800228F4
    /* 128C0 800228C0 21900000 */   addu      $s2, $zero, $zero
    /* 128C4 800228C4 FFFF1524 */  addiu      $s5, $zero, -0x1
    /* 128C8 800228C8 21808002 */  addu       $s0, $s4, $zero
  .L800228CC:
    /* 128CC 800228CC 0000048E */  lw         $a0, 0x0($s0)
    /* 128D0 800228D0 040011AE */  sw         $s1, 0x4($s0)
    /* 128D4 800228D4 08001026 */  addiu      $s0, $s0, 0x8
    /* 128D8 800228D8 01005226 */  addiu      $s2, $s2, 0x1
    /* 128DC 800228DC F889000C */  jal        GAL_AlignSizeToType
    /* 128E0 800228E0 21286002 */   addu      $a1, $s3, $zero
    /* 128E4 800228E4 0000038E */  lw         $v1, 0x0($s0)
    /* 128E8 800228E8 00000000 */  nop
    /* 128EC 800228EC F7FF7514 */  bne        $v1, $s5, .L800228CC
    /* 128F0 800228F0 21882202 */   addu      $s1, $s1, $v0
  .L800228F4:
    /* 128F4 800228F4 C0101200 */  sll        $v0, $s2, 3
    /* 128F8 800228F8 21105400 */  addu       $v0, $v0, $s4
    /* 128FC 800228FC 040051AC */  sw         $s1, 0x4($v0)
    /* 12900 80022900 21102002 */  addu       $v0, $s1, $zero
    /* 12904 80022904 2800BF8F */  lw         $ra, 0x28($sp)
    /* 12908 80022908 2400B58F */  lw         $s5, 0x24($sp)
    /* 1290C 8002290C 2000B48F */  lw         $s4, 0x20($sp)
    /* 12910 80022910 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 12914 80022914 1800B28F */  lw         $s2, 0x18($sp)
    /* 12918 80022918 1400B18F */  lw         $s1, 0x14($sp)
    /* 1291C 8002291C 1000B08F */  lw         $s0, 0x10($sp)
    /* 12920 80022920 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 12924 80022924 0800E003 */  jr         $ra
    /* 12928 80022928 00000000 */   nop
endlabel GAL_ProcessMultiStruct
