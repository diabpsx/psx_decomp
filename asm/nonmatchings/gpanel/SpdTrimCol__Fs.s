.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SpdTrimCol__Fs, 0x38

glabel SpdTrimCol__Fs
    /* 87AE8 80097AE8 21188000 */  addu       $v1, $a0, $zero
    /* 87AEC 80097AEC 00240400 */  sll        $a0, $a0, 16
    /* 87AF0 80097AF0 03008104 */  bgez       $a0, .L80097B00
    /* 87AF4 80097AF4 00140300 */   sll       $v0, $v1, 16
    /* 87AF8 80097AF8 21180000 */  addu       $v1, $zero, $zero
    /* 87AFC 80097AFC 00140300 */  sll        $v0, $v1, 16
  .L80097B00:
    /* 87B00 80097B00 03140200 */  sra        $v0, $v0, 16
    /* 87B04 80097B04 00014228 */  slti       $v0, $v0, 0x100
    /* 87B08 80097B08 02004014 */  bnez       $v0, .L80097B14
    /* 87B0C 80097B0C 00000000 */   nop
    /* 87B10 80097B10 FF000324 */  addiu      $v1, $zero, 0xFF
  .L80097B14:
    /* 87B14 80097B14 00140300 */  sll        $v0, $v1, 16
    /* 87B18 80097B18 0800E003 */  jr         $ra
    /* 87B1C 80097B1C 03140200 */   sra       $v0, $v0, 16
endlabel SpdTrimCol__Fs
