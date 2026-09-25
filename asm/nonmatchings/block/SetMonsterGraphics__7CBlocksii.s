.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetMonsterGraphics__7CBlocksii, 0xC8

glabel SetMonsterGraphics__7CBlocksii
    /* 7D898 8008D898 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 7D89C 8008D89C 1800B2AF */  sw         $s2, 0x18($sp)
    /* 7D8A0 8008D8A0 21908000 */  addu       $s2, $a0, $zero
    /* 7D8A4 8008D8A4 1400B1AF */  sw         $s1, 0x14($sp)
    /* 7D8A8 8008D8A8 2188C000 */  addu       $s1, $a2, $zero
    /* 7D8AC 8008D8AC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 7D8B0 8008D8B0 FFFFB024 */  addiu      $s0, $a1, -0x1
    /* 7D8B4 8008D8B4 07000006 */  bltz       $s0, .L8008D8D4
    /* 7D8B8 8008D8B8 1C00BFAF */   sw        $ra, 0x1C($sp)
    /* 7D8BC 8008D8BC 1280023C */  lui        $v0, %hi(NumOfMonsterListLevels)
    /* 7D8C0 8008D8C0 94AA428C */  lw         $v0, %lo(NumOfMonsterListLevels)($v0)
    /* 7D8C4 8008D8C4 00000000 */  nop
    /* 7D8C8 8008D8C8 2A100202 */  slt        $v0, $s0, $v0
    /* 7D8CC 8008D8CC 07004014 */  bnez       $v0, .L8008D8EC
    /* 7D8D0 8008D8D0 C0181000 */   sll       $v1, $s0, 3
  .L8008D8D4:
    /* 7D8D4 8008D8D4 21200000 */  addu       $a0, $zero, $zero
    /* 7D8D8 8008D8D8 1180053C */  lui        $a1, %hi(D_8011054C)
    /* 7D8DC 8008D8DC 4C05A524 */  addiu      $a1, $a1, %lo(D_8011054C)
    /* 7D8E0 8008D8E0 A583000C */  jal        DBG_Error
    /* 7D8E4 8008D8E4 DB010624 */   addiu     $a2, $zero, 0x1DB
    /* 7D8E8 8008D8E8 C0181000 */  sll        $v1, $s0, 3
  .L8008D8EC:
    /* 7D8EC 8008D8EC 0B80023C */  lui        $v0, %hi(AllLevels)
    /* 7D8F0 8008D8F0 58754224 */  addiu      $v0, $v0, %lo(AllLevels)
    /* 7D8F4 8008D8F4 06002006 */  bltz       $s1, .L8008D910
    /* 7D8F8 8008D8F8 21806200 */   addu      $s0, $v1, $v0
    /* 7D8FC 8008D8FC 0000028E */  lw         $v0, 0x0($s0)
    /* 7D900 8008D900 00000000 */  nop
    /* 7D904 8008D904 2A105100 */  slt        $v0, $v0, $s1
    /* 7D908 8008D908 06004010 */  beqz       $v0, .L8008D924
    /* 7D90C 8008D90C 00000000 */   nop
  .L8008D910:
    /* 7D910 8008D910 21200000 */  addu       $a0, $zero, $zero
    /* 7D914 8008D914 1180053C */  lui        $a1, %hi(D_8011054C)
    /* 7D918 8008D918 4C05A524 */  addiu      $a1, $a1, %lo(D_8011054C)
    /* 7D91C 8008D91C A583000C */  jal        DBG_Error
    /* 7D920 8008D920 DD010624 */   addiu     $a2, $zero, 0x1DD
  .L8008D924:
    /* 7D924 8008D924 0400108E */  lw         $s0, 0x4($s0)
    /* 7D928 8008D928 00111100 */  sll        $v0, $s1, 4
    /* 7D92C 8008D92C 21800202 */  addu       $s0, $s0, $v0
    /* 7D930 8008D930 02000496 */  lhu        $a0, 0x2($s0)
    /* 7D934 8008D934 044F020C */  jal        GM_UseTexData__Fi
    /* 7D938 8008D938 840044AE */   sw        $a0, 0x84($s2)
    /* 7D93C 8008D93C 700042AE */  sw         $v0, 0x70($s2)
    /* 7D940 8008D940 780050AE */  sw         $s0, 0x78($s2)
    /* 7D944 8008D944 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 7D948 8008D948 1800B28F */  lw         $s2, 0x18($sp)
    /* 7D94C 8008D94C 1400B18F */  lw         $s1, 0x14($sp)
    /* 7D950 8008D950 1000B08F */  lw         $s0, 0x10($sp)
    /* 7D954 8008D954 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 7D958 8008D958 0800E003 */  jr         $ra
    /* 7D95C 8008D95C 00000000 */   nop
endlabel SetMonsterGraphics__7CBlocksii
