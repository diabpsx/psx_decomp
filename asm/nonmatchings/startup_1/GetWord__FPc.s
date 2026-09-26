.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetWord__FPc, 0x1AC

glabel GetWord__FPc
    /* A0AEC 800B0AEC D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* A0AF0 800B0AF0 2400B3AF */  sw         $s3, 0x24($sp)
    /* A0AF4 800B0AF4 21988000 */  addu       $s3, $a0, $zero
    /* A0AF8 800B0AF8 03006426 */  addiu      $a0, $s3, 0x3
    /* A0AFC 800B0AFC 2800BFAF */  sw         $ra, 0x28($sp)
    /* A0B00 800B0B00 2000B2AF */  sw         $s2, 0x20($sp)
    /* A0B04 800B0B04 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* A0B08 800B0B08 BD09020C */  jal        CharPair2Num__FPc
    /* A0B0C 800B0B0C 1800B0AF */   sw        $s0, 0x18($sp)
    /* A0B10 800B0B10 941682AF */  sw         $v0, %gp_rel(Year)($gp)
    /* A0B14 800B0B14 BD09020C */  jal        CharPair2Num__FPc
    /* A0B18 800B0B18 05006426 */   addiu     $a0, $s3, 0x5
    /* A0B1C 800B0B1C 21880000 */  addu       $s1, $zero, $zero
    /* A0B20 800B0B20 981682AF */  sw         $v0, %gp_rel(Day)($gp)
    /* A0B24 800B0B24 00006282 */  lb         $v0, 0x0($s3)
    /* A0B28 800B0B28 01006382 */  lb         $v1, 0x1($s3)
    /* A0B2C 800B0B2C 02006482 */  lb         $a0, 0x2($s3)
    /* A0B30 800B0B30 1000A2A3 */  sb         $v0, 0x10($sp)
    /* A0B34 800B0B34 1100A3A3 */  sb         $v1, 0x11($sp)
    /* A0B38 800B0B38 1200A4A3 */  sb         $a0, 0x12($sp)
    /* A0B3C 800B0B3C 21900000 */  addu       $s2, $zero, $zero
    /* A0B40 800B0B40 21800000 */  addu       $s0, $zero, $zero
    /* A0B44 800B0B44 1300A0A3 */  sb         $zero, 0x13($sp)
  .L800B0B48:
    /* A0B48 800B0B48 0B80013C */  lui        $at, %hi(MonDays)
    /* A0B4C 800B0B4C 21083000 */  addu       $at, $at, $s0
    /* A0B50 800B0B50 B809248C */  lw         $a0, %lo(MonDays)($at)
    /* A0B54 800B0B54 7F67000C */  jal        strcmp
    /* A0B58 800B0B58 1000A527 */   addiu     $a1, $sp, 0x10
    /* A0B5C 800B0B5C 03004014 */  bnez       $v0, .L800B0B6C
    /* A0B60 800B0B60 00000000 */   nop
    /* A0B64 800B0B64 E0C20208 */  j          .L800B0B80
    /* A0B68 800B0B68 01001224 */   addiu     $s2, $zero, 0x1
  .L800B0B6C:
    /* A0B6C 800B0B6C 0B80013C */  lui        $at, %hi(MonDays + 0x4)
    /* A0B70 800B0B70 21083000 */  addu       $at, $at, $s0
    /* A0B74 800B0B74 BC09228C */  lw         $v0, %lo(MonDays + 0x4)($at)
    /* A0B78 800B0B78 00000000 */  nop
    /* A0B7C 800B0B7C 21882202 */  addu       $s1, $s1, $v0
  .L800B0B80:
    /* A0B80 800B0B80 08001026 */  addiu      $s0, $s0, 0x8
    /* A0B84 800B0B84 6000022A */  slti       $v0, $s0, 0x60
    /* A0B88 800B0B88 03004010 */  beqz       $v0, .L800B0B98
    /* A0B8C 800B0B8C 00000000 */   nop
    /* A0B90 800B0B90 EDFF4012 */  beqz       $s2, .L800B0B48
    /* A0B94 800B0B94 00000000 */   nop
  .L800B0B98:
    /* A0B98 800B0B98 06004016 */  bnez       $s2, .L800B0BB4
    /* A0B9C 800B0B9C 00000000 */   nop
    /* A0BA0 800B0BA0 21200000 */  addu       $a0, $zero, $zero
    /* A0BA4 800B0BA4 1280053C */  lui        $a1, %hi(D_8011947C)
    /* A0BA8 800B0BA8 7C94A524 */  addiu      $a1, $a1, %lo(D_8011947C)
    /* A0BAC 800B0BAC A583000C */  jal        DBG_Error
    /* A0BB0 800B0BB0 45010624 */   addiu     $a2, $zero, 0x145
  .L800B0BB4:
    /* A0BB4 800B0BB4 08006426 */  addiu      $a0, $s3, 0x8
    /* A0BB8 800B0BB8 9816828F */  lw         $v0, %gp_rel(Day)($gp)
    /* A0BBC 800B0BBC 9416838F */  lw         $v1, %gp_rel(Year)($gp)
    /* A0BC0 800B0BC0 21882202 */  addu       $s1, $s1, $v0
    /* A0BC4 800B0BC4 C0100300 */  sll        $v0, $v1, 3
    /* A0BC8 800B0BC8 21104300 */  addu       $v0, $v0, $v1
    /* A0BCC 800B0BCC C0100200 */  sll        $v0, $v0, 3
    /* A0BD0 800B0BD0 21104300 */  addu       $v0, $v0, $v1
    /* A0BD4 800B0BD4 80180200 */  sll        $v1, $v0, 2
    /* A0BD8 800B0BD8 21104300 */  addu       $v0, $v0, $v1
    /* A0BDC 800B0BDC 21882202 */  addu       $s1, $s1, $v0
    /* A0BE0 800B0BE0 40101100 */  sll        $v0, $s1, 1
    /* A0BE4 800B0BE4 21105100 */  addu       $v0, $v0, $s1
    /* A0BE8 800B0BE8 00810200 */  sll        $s0, $v0, 4
    /* A0BEC 800B0BEC 23800202 */  subu       $s0, $s0, $v0
    /* A0BF0 800B0BF0 BD09020C */  jal        CharPair2Num__FPc
    /* A0BF4 800B0BF4 40811000 */   sll       $s0, $s0, 5
    /* A0BF8 800B0BF8 00190200 */  sll        $v1, $v0, 4
    /* A0BFC 800B0BFC 23186200 */  subu       $v1, $v1, $v0
    /* A0C00 800B0C00 80180300 */  sll        $v1, $v1, 2
    /* A0C04 800B0C04 21800302 */  addu       $s0, $s0, $v1
    /* A0C08 800B0C08 BD09020C */  jal        CharPair2Num__FPc
    /* A0C0C 800B0C0C 0A006426 */   addiu     $a0, $s3, 0xA
    /* A0C10 800B0C10 21800202 */  addu       $s0, $s0, $v0
    /* A0C14 800B0C14 0BB6023C */  lui        $v0, (0xB60B60B7 >> 16)
    /* A0C18 800B0C18 B7604234 */  ori        $v0, $v0, (0xB60B60B7 & 0xFFFF)
    /* A0C1C 800B0C1C 18000202 */  mult       $s0, $v0
    /* A0C20 800B0C20 B622023C */  lui        $v0, (0x22B63CBF >> 16)
    /* A0C24 800B0C24 BF3C4234 */  ori        $v0, $v0, (0x22B63CBF & 0xFFFF)
    /* A0C28 800B0C28 10380000 */  mfhi       $a3
    /* A0C2C 800B0C2C 2118F000 */  addu       $v1, $a3, $s0
    /* A0C30 800B0C30 031A0300 */  sra        $v1, $v1, 8
    /* A0C34 800B0C34 C3871000 */  sra        $s0, $s0, 31
    /* A0C38 800B0C38 23187000 */  subu       $v1, $v1, $s0
    /* A0C3C 800B0C3C 18006200 */  mult       $v1, $v0
    /* A0C40 800B0C40 C3170300 */  sra        $v0, $v1, 31
    /* A0C44 800B0C44 10380000 */  mfhi       $a3
    /* A0C48 800B0C48 03210700 */  sra        $a0, $a3, 4
    /* A0C4C 800B0C4C 23208200 */  subu       $a0, $a0, $v0
    /* A0C50 800B0C50 00110400 */  sll        $v0, $a0, 4
    /* A0C54 800B0C54 23104400 */  subu       $v0, $v0, $a0
    /* A0C58 800B0C58 80100200 */  sll        $v0, $v0, 2
    /* A0C5C 800B0C5C 23104400 */  subu       $v0, $v0, $a0
    /* A0C60 800B0C60 40100200 */  sll        $v0, $v0, 1
    /* A0C64 800B0C64 23186200 */  subu       $v1, $v1, $v0
    /* A0C68 800B0C68 80180300 */  sll        $v1, $v1, 2
    /* A0C6C 800B0C6C 0B80013C */  lui        $at, %hi(Words)
    /* A0C70 800B0C70 21082300 */  addu       $at, $at, $v1
    /* A0C74 800B0C74 E007228C */  lw         $v0, %lo(Words)($at)
    /* A0C78 800B0C78 2800BF8F */  lw         $ra, 0x28($sp)
    /* A0C7C 800B0C7C 2400B38F */  lw         $s3, 0x24($sp)
    /* A0C80 800B0C80 2000B28F */  lw         $s2, 0x20($sp)
    /* A0C84 800B0C84 1C00B18F */  lw         $s1, 0x1C($sp)
    /* A0C88 800B0C88 1800B08F */  lw         $s0, 0x18($sp)
    /* A0C8C 800B0C8C 3000BD27 */  addiu      $sp, $sp, 0x30
    /* A0C90 800B0C90 0800E003 */  jr         $ra
    /* A0C94 800B0C94 00000000 */   nop
endlabel GetWord__FPc
