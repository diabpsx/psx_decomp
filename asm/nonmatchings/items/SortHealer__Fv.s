.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SortHealer__Fv, 0x190

glabel SortHealer__Fv
    /* 3B884 8004B884 1280033C */  lui        $v1, %hi(StorePlrNo)
    /* 3B888 8004B888 B4BA638C */  lw         $v1, %lo(StorePlrNo)($v1)
    /* 3B88C 8004B88C D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 3B890 8004B890 1400B1AF */  sw         $s1, 0x14($sp)
    /* 3B894 8004B894 2000BFAF */  sw         $ra, 0x20($sp)
    /* 3B898 8004B898 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 3B89C 8004B89C 1800B2AF */  sw         $s2, 0x18($sp)
    /* 3B8A0 8004B8A0 1000B0AF */  sw         $s0, 0x10($sp)
    /* 3B8A4 8004B8A4 00110300 */  sll        $v0, $v1, 4
    /* 3B8A8 8004B8A8 21104300 */  addu       $v0, $v0, $v1
    /* 3B8AC 8004B8AC C0100200 */  sll        $v0, $v0, 3
    /* 3B8B0 8004B8B0 23104300 */  subu       $v0, $v0, $v1
    /* 3B8B4 8004B8B4 00210200 */  sll        $a0, $v0, 4
    /* 3B8B8 8004B8B8 0E80013C */  lui        $at, %hi(_healitem + 0x170)
    /* 3B8BC 8004B8BC 21082400 */  addu       $at, $at, $a0
    /* 3B8C0 8004B8C0 400D2384 */  lh         $v1, %lo(_healitem + 0x170)($at)
    /* 3B8C4 8004B8C4 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 3B8C8 8004B8C8 13006210 */  beq        $v1, $v0, .L8004B918
    /* 3B8CC 8004B8CC 02001124 */   addiu     $s1, $zero, 0x2
    /* 3B8D0 8004B8D0 FFFF0524 */  addiu      $a1, $zero, -0x1
    /* 3B8D4 8004B8D4 01002326 */  addiu      $v1, $s1, 0x1
  .L8004B8D8:
    /* 3B8D8 8004B8D8 14006228 */  slti       $v0, $v1, 0x14
    /* 3B8DC 8004B8DC 0E004010 */  beqz       $v0, .L8004B918
    /* 3B8E0 8004B8E0 01006224 */   addiu     $v0, $v1, 0x1
    /* 3B8E4 8004B8E4 21886000 */  addu       $s1, $v1, $zero
    /* 3B8E8 8004B8E8 C0180200 */  sll        $v1, $v0, 3
    /* 3B8EC 8004B8EC 23186200 */  subu       $v1, $v1, $v0
    /* 3B8F0 8004B8F0 80180300 */  sll        $v1, $v1, 2
    /* 3B8F4 8004B8F4 23186200 */  subu       $v1, $v1, $v0
    /* 3B8F8 8004B8F8 80180300 */  sll        $v1, $v1, 2
    /* 3B8FC 8004B8FC 21186400 */  addu       $v1, $v1, $a0
    /* 3B900 8004B900 0E80013C */  lui        $at, %hi(_healitem + 0x2C)
    /* 3B904 8004B904 21082300 */  addu       $at, $at, $v1
    /* 3B908 8004B908 FC0B2284 */  lh         $v0, %lo(_healitem + 0x2C)($at)
    /* 3B90C 8004B90C 00000000 */  nop
    /* 3B910 8004B910 F1FF4514 */  bne        $v0, $a1, .L8004B8D8
    /* 3B914 8004B914 01002326 */   addiu     $v1, $s1, 0x1
  .L8004B918:
    /* 3B918 8004B918 0300222A */  slti       $v0, $s1, 0x3
    /* 3B91C 8004B91C 35004014 */  bnez       $v0, .L8004B9F4
    /* 3B920 8004B920 02000424 */   addiu     $a0, $zero, 0x2
    /* 3B924 8004B924 0E80123C */  lui        $s2, %hi(_healitem)
    /* 3B928 8004B928 D00B5226 */  addiu      $s2, $s2, %lo(_healitem)
    /* 3B92C 8004B92C 6C005326 */  addiu      $s3, $s2, 0x6C
  .L8004B930:
    /* 3B930 8004B930 2A109100 */  slt        $v0, $a0, $s1
    /* 3B934 8004B934 29004010 */  beqz       $v0, .L8004B9DC
    /* 3B938 8004B938 01000524 */   addiu     $a1, $zero, 0x1
    /* 3B93C 8004B93C C0100400 */  sll        $v0, $a0, 3
  .L8004B940:
    /* 3B940 8004B940 23104400 */  subu       $v0, $v0, $a0
    /* 3B944 8004B944 80100200 */  sll        $v0, $v0, 2
    /* 3B948 8004B948 23104400 */  subu       $v0, $v0, $a0
    /* 3B94C 8004B94C 80380200 */  sll        $a3, $v0, 2
    /* 3B950 8004B950 1280033C */  lui        $v1, %hi(StorePlrNo)
    /* 3B954 8004B954 B4BA638C */  lw         $v1, %lo(StorePlrNo)($v1)
    /* 3B958 8004B958 01009024 */  addiu      $s0, $a0, 0x1
    /* 3B95C 8004B95C 00110300 */  sll        $v0, $v1, 4
    /* 3B960 8004B960 21104300 */  addu       $v0, $v0, $v1
    /* 3B964 8004B964 C0100200 */  sll        $v0, $v0, 3
    /* 3B968 8004B968 23104300 */  subu       $v0, $v0, $v1
    /* 3B96C 8004B96C 00310200 */  sll        $a2, $v0, 4
    /* 3B970 8004B970 2118E600 */  addu       $v1, $a3, $a2
    /* 3B974 8004B974 C0101000 */  sll        $v0, $s0, 3
    /* 3B978 8004B978 23105000 */  subu       $v0, $v0, $s0
    /* 3B97C 8004B97C 80100200 */  sll        $v0, $v0, 2
    /* 3B980 8004B980 23105000 */  subu       $v0, $v0, $s0
    /* 3B984 8004B984 80100200 */  sll        $v0, $v0, 2
    /* 3B988 8004B988 21104600 */  addu       $v0, $v0, $a2
    /* 3B98C 8004B98C 0E80013C */  lui        $at, %hi(_healitem + 0x2E)
    /* 3B990 8004B990 21082300 */  addu       $at, $at, $v1
    /* 3B994 8004B994 FE0B2384 */  lh         $v1, %lo(_healitem + 0x2E)($at)
    /* 3B998 8004B998 0E80013C */  lui        $at, %hi(_healitem + 0x2E)
    /* 3B99C 8004B99C 21082200 */  addu       $at, $at, $v0
    /* 3B9A0 8004B9A0 FE0B2284 */  lh         $v0, %lo(_healitem + 0x2E)($at)
    /* 3B9A4 8004B9A4 00000000 */  nop
    /* 3B9A8 8004B9A8 2A104300 */  slt        $v0, $v0, $v1
    /* 3B9AC 8004B9AC 08004010 */  beqz       $v0, .L8004B9D0
    /* 3B9B0 8004B9B0 21200002 */   addu      $a0, $s0, $zero
    /* 3B9B4 8004B9B4 2120F200 */  addu       $a0, $a3, $s2
    /* 3B9B8 8004B9B8 2128D300 */  addu       $a1, $a2, $s3
    /* 3B9BC 8004B9BC 2120C400 */  addu       $a0, $a2, $a0
    /* 3B9C0 8004B9C0 6C26010C */  jal        BubbleSwapItem__FP10ItemStructT0
    /* 3B9C4 8004B9C4 2128A700 */   addu      $a1, $a1, $a3
    /* 3B9C8 8004B9C8 21280000 */  addu       $a1, $zero, $zero
    /* 3B9CC 8004B9CC 21200002 */  addu       $a0, $s0, $zero
  .L8004B9D0:
    /* 3B9D0 8004B9D0 2A109100 */  slt        $v0, $a0, $s1
    /* 3B9D4 8004B9D4 DAFF4014 */  bnez       $v0, .L8004B940
    /* 3B9D8 8004B9D8 C0100400 */   sll       $v0, $a0, 3
  .L8004B9DC:
    /* 3B9DC 8004B9DC FFFF3126 */  addiu      $s1, $s1, -0x1
    /* 3B9E0 8004B9E0 0300222A */  slti       $v0, $s1, 0x3
    /* 3B9E4 8004B9E4 03004014 */  bnez       $v0, .L8004B9F4
    /* 3B9E8 8004B9E8 FF00A230 */   andi      $v0, $a1, 0xFF
    /* 3B9EC 8004B9EC D0FF4010 */  beqz       $v0, .L8004B930
    /* 3B9F0 8004B9F0 02000424 */   addiu     $a0, $zero, 0x2
  .L8004B9F4:
    /* 3B9F4 8004B9F4 2000BF8F */  lw         $ra, 0x20($sp)
    /* 3B9F8 8004B9F8 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 3B9FC 8004B9FC 1800B28F */  lw         $s2, 0x18($sp)
    /* 3BA00 8004BA00 1400B18F */  lw         $s1, 0x14($sp)
    /* 3BA04 8004BA04 1000B08F */  lw         $s0, 0x10($sp)
    /* 3BA08 8004BA08 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 3BA0C 8004BA0C 0800E003 */  jr         $ra
    /* 3BA10 8004BA10 00000000 */   nop
endlabel SortHealer__Fv
