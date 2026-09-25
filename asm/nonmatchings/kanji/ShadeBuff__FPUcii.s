.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ShadeBuff__FPUcii, 0x1A8

glabel ShadeBuff__FPUcii
    /* 9D88C 800AD88C 21380000 */  addu       $a3, $zero, $zero
    /* 9D890 800AD890 07000924 */  addiu      $t1, $zero, 0x7
  .L800AD894:
    /* 9D894 800AD894 0C00E228 */  slti       $v0, $a3, 0xC
    /* 9D898 800AD898 64004010 */  beqz       $v0, .L800ADA2C
    /* 9D89C 800AD89C 21180000 */   addu      $v1, $zero, $zero
    /* 9D8A0 800AD8A0 0B00E828 */  slti       $t0, $a3, 0xB
  .L800AD8A4:
    /* 9D8A4 800AD8A4 00008280 */  lb         $v0, 0x0($a0)
    /* 9D8A8 800AD8A8 00000000 */  nop
    /* 9D8AC 800AD8AC 59004514 */  bne        $v0, $a1, .L800ADA14
    /* 9D8B0 800AD8B0 00000000 */   nop
    /* 9D8B4 800AD8B4 0A00A914 */  bne        $a1, $t1, .L800AD8E0
    /* 9D8B8 800AD8B8 00000000 */   nop
    /* 9D8BC 800AD8BC 09006010 */  beqz       $v1, .L800AD8E4
    /* 9D8C0 800AD8C0 0B006228 */   slti      $v0, $v1, 0xB
    /* 9D8C4 800AD8C4 FFFF8424 */  addiu      $a0, $a0, -0x1
    /* 9D8C8 800AD8C8 00008290 */  lbu        $v0, 0x0($a0)
    /* 9D8CC 800AD8CC 00000000 */  nop
    /* 9D8D0 800AD8D0 02004014 */  bnez       $v0, .L800AD8DC
    /* 9D8D4 800AD8D4 00000000 */   nop
    /* 9D8D8 800AD8D8 000086A0 */  sb         $a2, 0x0($a0)
  .L800AD8DC:
    /* 9D8DC 800AD8DC 01008424 */  addiu      $a0, $a0, 0x1
  .L800AD8E0:
    /* 9D8E0 800AD8E0 0B006228 */  slti       $v0, $v1, 0xB
  .L800AD8E4:
    /* 9D8E4 800AD8E4 08004010 */  beqz       $v0, .L800AD908
    /* 9D8E8 800AD8E8 00000000 */   nop
    /* 9D8EC 800AD8EC 01008424 */  addiu      $a0, $a0, 0x1
    /* 9D8F0 800AD8F0 00008290 */  lbu        $v0, 0x0($a0)
    /* 9D8F4 800AD8F4 00000000 */  nop
    /* 9D8F8 800AD8F8 02004014 */  bnez       $v0, .L800AD904
    /* 9D8FC 800AD8FC 00000000 */   nop
    /* 9D900 800AD900 000086A0 */  sb         $a2, 0x0($a0)
  .L800AD904:
    /* 9D904 800AD904 FFFF8424 */  addiu      $a0, $a0, -0x1
  .L800AD908:
    /* 9D908 800AD908 0A00A914 */  bne        $a1, $t1, .L800AD934
    /* 9D90C 800AD90C 00000000 */   nop
    /* 9D910 800AD910 0800E010 */  beqz       $a3, .L800AD934
    /* 9D914 800AD914 00000000 */   nop
    /* 9D918 800AD918 F4FF8424 */  addiu      $a0, $a0, -0xC
    /* 9D91C 800AD91C 00008290 */  lbu        $v0, 0x0($a0)
    /* 9D920 800AD920 00000000 */  nop
    /* 9D924 800AD924 02004014 */  bnez       $v0, .L800AD930
    /* 9D928 800AD928 00000000 */   nop
    /* 9D92C 800AD92C 000086A0 */  sb         $a2, 0x0($a0)
  .L800AD930:
    /* 9D930 800AD930 0C008424 */  addiu      $a0, $a0, 0xC
  .L800AD934:
    /* 9D934 800AD934 08000011 */  beqz       $t0, .L800AD958
    /* 9D938 800AD938 00000000 */   nop
    /* 9D93C 800AD93C 0C008424 */  addiu      $a0, $a0, 0xC
    /* 9D940 800AD940 00008290 */  lbu        $v0, 0x0($a0)
    /* 9D944 800AD944 00000000 */  nop
    /* 9D948 800AD948 02004014 */  bnez       $v0, .L800AD954
    /* 9D94C 800AD94C 00000000 */   nop
    /* 9D950 800AD950 000086A0 */  sb         $a2, 0x0($a0)
  .L800AD954:
    /* 9D954 800AD954 F4FF8424 */  addiu      $a0, $a0, -0xC
  .L800AD958:
    /* 9D958 800AD958 1700A914 */  bne        $a1, $t1, .L800AD9B8
    /* 9D95C 800AD95C 0B006228 */   slti      $v0, $v1, 0xB
    /* 9D960 800AD960 15006010 */  beqz       $v1, .L800AD9B8
    /* 9D964 800AD964 00000000 */   nop
    /* 9D968 800AD968 1300E010 */  beqz       $a3, .L800AD9B8
    /* 9D96C 800AD96C 00000000 */   nop
    /* 9D970 800AD970 F3FF8424 */  addiu      $a0, $a0, -0xD
    /* 9D974 800AD974 00008290 */  lbu        $v0, 0x0($a0)
    /* 9D978 800AD978 00000000 */  nop
    /* 9D97C 800AD97C 02004014 */  bnez       $v0, .L800AD988
    /* 9D980 800AD980 0B006228 */   slti      $v0, $v1, 0xB
    /* 9D984 800AD984 000086A0 */  sb         $a2, 0x0($a0)
  .L800AD988:
    /* 9D988 800AD988 09004010 */  beqz       $v0, .L800AD9B0
    /* 9D98C 800AD98C 00000000 */   nop
    /* 9D990 800AD990 02008424 */  addiu      $a0, $a0, 0x2
    /* 9D994 800AD994 00008290 */  lbu        $v0, 0x0($a0)
    /* 9D998 800AD998 00000000 */  nop
    /* 9D99C 800AD99C 02004014 */  bnez       $v0, .L800AD9A8
    /* 9D9A0 800AD9A0 00000000 */   nop
    /* 9D9A4 800AD9A4 000086A0 */  sb         $a2, 0x0($a0)
  .L800AD9A8:
    /* 9D9A8 800AD9A8 6DB60208 */  j          .L800AD9B4
    /* 9D9AC 800AD9AC 0B008424 */   addiu     $a0, $a0, 0xB
  .L800AD9B0:
    /* 9D9B0 800AD9B0 0D008424 */  addiu      $a0, $a0, 0xD
  .L800AD9B4:
    /* 9D9B4 800AD9B4 0B006228 */  slti       $v0, $v1, 0xB
  .L800AD9B8:
    /* 9D9B8 800AD9B8 16004010 */  beqz       $v0, .L800ADA14
    /* 9D9BC 800AD9BC 00000000 */   nop
    /* 9D9C0 800AD9C0 14000011 */  beqz       $t0, .L800ADA14
    /* 9D9C4 800AD9C4 00000000 */   nop
    /* 9D9C8 800AD9C8 0D008424 */  addiu      $a0, $a0, 0xD
    /* 9D9CC 800AD9CC 00008290 */  lbu        $v0, 0x0($a0)
    /* 9D9D0 800AD9D0 00000000 */  nop
    /* 9D9D4 800AD9D4 02004014 */  bnez       $v0, .L800AD9E0
    /* 9D9D8 800AD9D8 00000000 */   nop
    /* 9D9DC 800AD9DC 000086A0 */  sb         $a2, 0x0($a0)
  .L800AD9E0:
    /* 9D9E0 800AD9E0 0B00A914 */  bne        $a1, $t1, .L800ADA10
    /* 9D9E4 800AD9E4 00000000 */   nop
    /* 9D9E8 800AD9E8 09006010 */  beqz       $v1, .L800ADA10
    /* 9D9EC 800AD9EC 00000000 */   nop
    /* 9D9F0 800AD9F0 FEFF8424 */  addiu      $a0, $a0, -0x2
    /* 9D9F4 800AD9F4 00008290 */  lbu        $v0, 0x0($a0)
    /* 9D9F8 800AD9F8 00000000 */  nop
    /* 9D9FC 800AD9FC 02004014 */  bnez       $v0, .L800ADA08
    /* 9DA00 800ADA00 00000000 */   nop
    /* 9DA04 800ADA04 000086A0 */  sb         $a2, 0x0($a0)
  .L800ADA08:
    /* 9DA08 800ADA08 85B60208 */  j          .L800ADA14
    /* 9DA0C 800ADA0C F5FF8424 */   addiu     $a0, $a0, -0xB
  .L800ADA10:
    /* 9DA10 800ADA10 F3FF8424 */  addiu      $a0, $a0, -0xD
  .L800ADA14:
    /* 9DA14 800ADA14 01006324 */  addiu      $v1, $v1, 0x1
    /* 9DA18 800ADA18 0C006228 */  slti       $v0, $v1, 0xC
    /* 9DA1C 800ADA1C A1FF4014 */  bnez       $v0, .L800AD8A4
    /* 9DA20 800ADA20 01008424 */   addiu     $a0, $a0, 0x1
    /* 9DA24 800ADA24 25B60208 */  j          .L800AD894
    /* 9DA28 800ADA28 0100E724 */   addiu     $a3, $a3, 0x1
  .L800ADA2C:
    /* 9DA2C 800ADA2C 0800E003 */  jr         $ra
    /* 9DA30 800ADA30 00000000 */   nop
endlabel ShadeBuff__FPUcii
