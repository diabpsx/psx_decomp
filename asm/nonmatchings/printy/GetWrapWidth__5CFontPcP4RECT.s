.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetWrapWidth__5CFontPcP4RECT, 0x16C

glabel GetWrapWidth__5CFontPcP4RECT
    /* 7A938 8008A938 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 7A93C 8008A93C 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 7A940 8008A940 21888000 */  addu       $s1, $a0, $zero
    /* 7A944 8008A944 2C00BFAF */  sw         $ra, 0x2C($sp)
    /* 7A948 8008A948 2800B4AF */  sw         $s4, 0x28($sp)
    /* 7A94C 8008A94C 2400B3AF */  sw         $s3, 0x24($sp)
    /* 7A950 8008A950 2000B2AF */  sw         $s2, 0x20($sp)
    /* 7A954 8008A954 1800B0AF */  sw         $s0, 0x18($sp)
    /* 7A958 8008A958 0200C010 */  beqz       $a2, .L8008A964
    /* 7A95C 8008A95C 40011424 */   addiu     $s4, $zero, 0x140
    /* 7A960 8008A960 0400D484 */  lh         $s4, 0x4($a2)
  .L8008A964:
    /* 7A964 8008A964 2180A000 */  addu       $s0, $a1, $zero
    /* 7A968 8008A968 21980000 */  addu       $s3, $zero, $zero
    /* 7A96C 8008A96C 100220AE */  sw         $zero, 0x210($s1)
    /* 7A970 8008A970 21900000 */  addu       $s2, $zero, $zero
  .L8008A974:
    /* 7A974 8008A974 1002228E */  lw         $v0, 0x210($s1)
    /* 7A978 8008A978 00000000 */  nop
    /* 7A97C 8008A97C 2A105400 */  slt        $v0, $v0, $s4
    /* 7A980 8008A980 21004010 */  beqz       $v0, .L8008AA08
    /* 7A984 8008A984 00000000 */   nop
    /* 7A988 8008A988 00000382 */  lb         $v1, 0x0($s0)
    /* 7A98C 8008A98C 00000000 */  nop
    /* 7A990 8008A990 1D006010 */  beqz       $v1, .L8008AA08
    /* 7A994 8008A994 21286000 */   addu      $a1, $v1, $zero
    /* 7A998 8008A998 0A000224 */  addiu      $v0, $zero, 0xA
    /* 7A99C 8008A99C 1A006210 */  beq        $v1, $v0, .L8008AA08
    /* 7A9A0 8008A9A0 FF00A330 */   andi      $v1, $a1, 0xFF
    /* 7A9A4 8008A9A4 20000224 */  addiu      $v0, $zero, 0x20
    /* 7A9A8 8008A9A8 05006210 */  beq        $v1, $v0, .L8008A9C0
    /* 7A9AC 8008A9AC 2D000224 */   addiu     $v0, $zero, 0x2D
    /* 7A9B0 8008A9B0 03006210 */  beq        $v1, $v0, .L8008A9C0
    /* 7A9B4 8008A9B4 FF000224 */   addiu     $v0, $zero, 0xFF
    /* 7A9B8 8008A9B8 04006214 */  bne        $v1, $v0, .L8008A9CC
    /* 7A9BC 8008A9BC 8000A230 */   andi      $v0, $a1, 0x80
  .L8008A9C0:
    /* 7A9C0 8008A9C0 21980002 */  addu       $s3, $s0, $zero
    /* 7A9C4 8008A9C4 1002328E */  lw         $s2, 0x210($s1)
    /* 7A9C8 8008A9C8 8000A230 */  andi       $v0, $a1, 0x80
  .L8008A9CC:
    /* 7A9CC 8008A9CC 05004010 */  beqz       $v0, .L8008A9E4
    /* 7A9D0 8008A9D0 0C000324 */   addiu     $v1, $zero, 0xC
    /* 7A9D4 8008A9D4 21980002 */  addu       $s3, $s0, $zero
    /* 7A9D8 8008A9D8 1002328E */  lw         $s2, 0x210($s1)
    /* 7A9DC 8008A9DC 7D2A0208 */  j          .L8008A9F4
    /* 7A9E0 8008A9E0 01001026 */   addiu     $s0, $s0, 0x1
  .L8008A9E4:
    /* 7A9E4 8008A9E4 21202002 */  addu       $a0, $s1, $zero
    /* 7A9E8 8008A9E8 EB2A020C */  jal        GetCharWidth__5CFontUc
    /* 7A9EC 8008A9EC FF00A530 */   andi      $a1, $a1, 0xFF
    /* 7A9F0 8008A9F0 21184000 */  addu       $v1, $v0, $zero
  .L8008A9F4:
    /* 7A9F4 8008A9F4 1002228E */  lw         $v0, 0x210($s1)
    /* 7A9F8 8008A9F8 01001026 */  addiu      $s0, $s0, 0x1
    /* 7A9FC 8008A9FC 21104300 */  addu       $v0, $v0, $v1
    /* 7AA00 8008AA00 5D2A0208 */  j          .L8008A974
    /* 7AA04 8008AA04 100222AE */   sw        $v0, 0x210($s1)
  .L8008AA08:
    /* 7AA08 8008AA08 00000582 */  lb         $a1, 0x0($s0)
    /* 7AA0C 8008AA0C 20000224 */  addiu      $v0, $zero, 0x20
    /* 7AA10 8008AA10 0A00A210 */  beq        $a1, $v0, .L8008AA3C
    /* 7AA14 8008AA14 2100A228 */   slti      $v0, $a1, 0x21
    /* 7AA18 8008AA18 05004010 */  beqz       $v0, .L8008AA30
    /* 7AA1C 8008AA1C 00000000 */   nop
    /* 7AA20 8008AA20 0600A010 */  beqz       $a1, .L8008AA3C
    /* 7AA24 8008AA24 0A000224 */   addiu     $v0, $zero, 0xA
    /* 7AA28 8008AA28 0400A210 */  beq        $a1, $v0, .L8008AA3C
    /* 7AA2C 8008AA2C 00000000 */   nop
  .L8008AA30:
    /* 7AA30 8008AA30 01008226 */  addiu      $v0, $s4, 0x1
    /* 7AA34 8008AA34 100222AE */  sw         $v0, 0x210($s1)
    /* 7AA38 8008AA38 01005226 */  addiu      $s2, $s2, 0x1
  .L8008AA3C:
    /* 7AA3C 8008AA3C 1002228E */  lw         $v0, 0x210($s1)
    /* 7AA40 8008AA40 00000000 */  nop
    /* 7AA44 8008AA44 2A108202 */  slt        $v0, $s4, $v0
    /* 7AA48 8008AA48 0C004010 */  beqz       $v0, .L8008AA7C
    /* 7AA4C 8008AA4C 00000000 */   nop
    /* 7AA50 8008AA50 0B006012 */  beqz       $s3, .L8008AA80
    /* 7AA54 8008AA54 21100000 */   addu      $v0, $zero, $zero
    /* 7AA58 8008AA58 07006016 */  bnez       $s3, .L8008AA78
    /* 7AA5C 8008AA5C 21200000 */   addu      $a0, $zero, $zero
    /* 7AA60 8008AA60 1180053C */  lui        $a1, %hi(D_801104C8)
    /* 7AA64 8008AA64 C804A524 */  addiu      $a1, $a1, %lo(D_801104C8)
    /* 7AA68 8008AA68 A583000C */  jal        DBG_Error
    /* 7AA6C 8008AA6C 99040624 */   addiu     $a2, $zero, 0x499
    /* 7AA70 8008AA70 9F2A0208 */  j          .L8008AA7C
    /* 7AA74 8008AA74 00000000 */   nop
  .L8008AA78:
    /* 7AA78 8008AA78 100232AE */  sw         $s2, 0x210($s1)
  .L8008AA7C:
    /* 7AA7C 8008AA7C 1002228E */  lw         $v0, 0x210($s1)
  .L8008AA80:
    /* 7AA80 8008AA80 2C00BF8F */  lw         $ra, 0x2C($sp)
    /* 7AA84 8008AA84 2800B48F */  lw         $s4, 0x28($sp)
    /* 7AA88 8008AA88 2400B38F */  lw         $s3, 0x24($sp)
    /* 7AA8C 8008AA8C 2000B28F */  lw         $s2, 0x20($sp)
    /* 7AA90 8008AA90 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 7AA94 8008AA94 1800B08F */  lw         $s0, 0x18($sp)
    /* 7AA98 8008AA98 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 7AA9C 8008AA9C 0800E003 */  jr         $ra
    /* 7AAA0 8008AAA0 00000000 */   nop
endlabel GetWrapWidth__5CFontPcP4RECT
