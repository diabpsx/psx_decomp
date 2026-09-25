.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CD_set_test_parmnum, 0xE4

glabel CD_set_test_parmnum
    /* CAB8 8001CAB8 0B80013C */  lui        $at, %hi(D_800B61A0)
    /* CABC 8001CABC 0800E003 */  jr         $ra
    /* CAC0 8001CAC0 A06124AC */   sw        $a0, %lo(D_800B61A0)($at)
  alabel D_8001CAC4
    /* CAC4 8001CAC4 0B80023C */  lui        $v0, %hi(D_800B61BC)
    /* CAC8 8001CAC8 BC61428C */  lw         $v0, %lo(D_800B61BC)($v0)
    /* CACC 8001CACC D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* CAD0 8001CAD0 1400B1AF */  sw         $s1, 0x14($sp)
    /* CAD4 8001CAD4 0B80113C */  lui        $s1, %hi(D_800B61D5)
    /* CAD8 8001CAD8 D5613126 */  addiu      $s1, $s1, %lo(D_800B61D5)
    /* CADC 8001CADC 2000BFAF */  sw         $ra, 0x20($sp)
    /* CAE0 8001CAE0 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* CAE4 8001CAE4 1800B2AF */  sw         $s2, 0x18($sp)
    /* CAE8 8001CAE8 1000B0AF */  sw         $s0, 0x10($sp)
    /* CAEC 8001CAEC 00004290 */  lbu        $v0, 0x0($v0)
    /* CAF0 8001CAF0 FFFF3326 */  addiu      $s3, $s1, -0x1
    /* CAF4 8001CAF4 03005230 */  andi       $s2, $v0, 0x3
  .L8001CAF8:
    /* CAF8 8001CAF8 0F6D000C */  jal        func_8001B43C
    /* CAFC 8001CAFC 00000000 */   nop
    /* CB00 8001CB00 21804000 */  addu       $s0, $v0, $zero
    /* CB04 8001CB04 1A000012 */  beqz       $s0, .L8001CB70
    /* CB08 8001CB08 04000232 */   andi      $v0, $s0, 0x4
    /* CB0C 8001CB0C 0B004010 */  beqz       $v0, .L8001CB3C
    /* CB10 8001CB10 02000232 */   andi      $v0, $s0, 0x2
    /* CB14 8001CB14 0B80023C */  lui        $v0, %hi(CD_cbready)
    /* CB18 8001CB18 F85E428C */  lw         $v0, %lo(CD_cbready)($v0)
    /* CB1C 8001CB1C 00000000 */  nop
    /* CB20 8001CB20 05004010 */  beqz       $v0, .L8001CB38
    /* CB24 8001CB24 00000000 */   nop
    /* CB28 8001CB28 00002492 */  lbu        $a0, 0x0($s1)
    /* CB2C 8001CB2C 1380053C */  lui        $a1, %hi(D_80130148)
    /* CB30 8001CB30 09F84000 */  jalr       $v0
    /* CB34 8001CB34 4801A524 */   addiu     $a1, $a1, %lo(D_80130148)
  .L8001CB38:
    /* CB38 8001CB38 02000232 */  andi       $v0, $s0, 0x2
  .L8001CB3C:
    /* CB3C 8001CB3C EEFF4010 */  beqz       $v0, .L8001CAF8
    /* CB40 8001CB40 00000000 */   nop
    /* CB44 8001CB44 0B80023C */  lui        $v0, %hi(CD_cbsync)
    /* CB48 8001CB48 F45E428C */  lw         $v0, %lo(CD_cbsync)($v0)
    /* CB4C 8001CB4C 00000000 */  nop
    /* CB50 8001CB50 E9FF4010 */  beqz       $v0, .L8001CAF8
    /* CB54 8001CB54 00000000 */   nop
    /* CB58 8001CB58 00006492 */  lbu        $a0, 0x0($s3)
    /* CB5C 8001CB5C 1380053C */  lui        $a1, %hi(D_80130140)
    /* CB60 8001CB60 09F84000 */  jalr       $v0
    /* CB64 8001CB64 4001A524 */   addiu     $a1, $a1, %lo(D_80130140)
    /* CB68 8001CB68 BE720008 */  j          .L8001CAF8
    /* CB6C 8001CB6C 00000000 */   nop
  .L8001CB70:
    /* CB70 8001CB70 0B80023C */  lui        $v0, %hi(D_800B61BC)
    /* CB74 8001CB74 BC61428C */  lw         $v0, %lo(D_800B61BC)($v0)
    /* CB78 8001CB78 00000000 */  nop
    /* CB7C 8001CB7C 000052A0 */  sb         $s2, 0x0($v0)
    /* CB80 8001CB80 2000BF8F */  lw         $ra, 0x20($sp)
    /* CB84 8001CB84 1C00B38F */  lw         $s3, 0x1C($sp)
    /* CB88 8001CB88 1800B28F */  lw         $s2, 0x18($sp)
    /* CB8C 8001CB8C 1400B18F */  lw         $s1, 0x14($sp)
    /* CB90 8001CB90 1000B08F */  lw         $s0, 0x10($sp)
    /* CB94 8001CB94 0800E003 */  jr         $ra
    /* CB98 8001CB98 2800BD27 */   addiu     $sp, $sp, 0x28
endlabel CD_set_test_parmnum
