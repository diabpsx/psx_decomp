.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

/* Handwritten function */
nonmatching decrunch, 0x214

glabel decrunch
    /* B00 80010B00 FCFFBFAF */  sw         $ra, -0x4($sp)
    /* B04 80010B04 FCFFBD27 */  addiu      $sp, $sp, -0x4
    /* B08 80010B08 21488000 */  addu       $t1, $a0, $zero
    /* B0C 80010B0C 2140A000 */  addu       $t0, $a1, $zero
    /* B10 80010B10 21400601 */  addu       $t0, $t0, $a2
    /* B14 80010B14 FCFF0821 */  addi       $t0, $t0, -0x4 /* handwritten instruction */
    /* B18 80010B18 00000A8D */  lw         $t2, 0x0($t0)
    /* B1C 80010B1C 00000000 */  nop
    /* B20 80010B20 21504901 */  addu       $t2, $t2, $t1
    /* B24 80010B24 FCFF0821 */  addi       $t0, $t0, -0x4 /* handwritten instruction */
    /* B28 80010B28 0000058D */  lw         $a1, 0x0($t0)
    /* B2C 80010B2C 00000000 */  nop
    /* B30 80010B30 FCFF0821 */  addi       $t0, $t0, -0x4 /* handwritten instruction */
    /* B34 80010B34 0000188D */  lw         $t8, 0x0($t0)
    /* B38 80010B38 00000000 */  nop
    /* B3C 80010B3C FCFF0821 */  addi       $t0, $t0, -0x4 /* handwritten instruction */
    /* B40 80010B40 00001A8D */  lw         $k0, 0x0($t0) /* handwritten instruction */
    /* B44 80010B44 00000000 */  nop
    /* B48 80010B48 2628B800 */  xor        $a1, $a1, $t8
  .L80010B4C:
    /* B4C 80010B4C C0371800 */  sll        $a2, $t8, 31
    /* B50 80010B50 42C01800 */  srl        $t8, $t8, 1
    /* B54 80010B54 0500C104 */  bgez       $a2, .L80010B6C
    /* B58 80010B58 00000000 */   nop
    /* B5C 80010B5C 05000013 */  beqz       $t8, .L80010B74
    /* B60 80010B60 00000000 */   nop
    /* B64 80010B64 18430008 */  j          .L80010C60
    /* B68 80010B68 00000000 */   nop
  .L80010B6C:
    /* B6C 80010B6C 05000017 */  bnez       $t8, .L80010B84
    /* B70 80010B70 00000000 */   nop
  .L80010B74:
    /* B74 80010B74 4543000C */  jal        func_80010D14
    /* B78 80010B78 00000000 */   nop
    /* B7C 80010B7C 3800C004 */  bltz       $a2, .L80010C60
    /* B80 80010B80 00000000 */   nop
  .L80010B84:
    /* B84 80010B84 08001924 */  addiu      $t9, $zero, 0x8
    /* B88 80010B88 01000324 */  addiu      $v1, $zero, 0x1
    /* B8C 80010B8C C0371800 */  sll        $a2, $t8, 31
    /* B90 80010B90 42C01800 */  srl        $t8, $t8, 1
    /* B94 80010B94 0500C104 */  bgez       $a2, .L80010BAC
    /* B98 80010B98 00000000 */   nop
    /* B9C 80010B9C 05000013 */  beqz       $t8, .L80010BB4
    /* BA0 80010BA0 00000000 */   nop
    /* BA4 80010BA4 2D430008 */  j          .L80010CB4
    /* BA8 80010BA8 00000000 */   nop
  .L80010BAC:
    /* BAC 80010BAC 05000017 */  bnez       $t8, .L80010BC4
    /* BB0 80010BB0 00000000 */   nop
  .L80010BB4:
    /* BB4 80010BB4 4543000C */  jal        func_80010D14
    /* BB8 80010BB8 00000000 */   nop
    /* BBC 80010BBC 3D00C004 */  bltz       $a2, .L80010CB4
    /* BC0 80010BC0 00000000 */   nop
  .L80010BC4:
    /* BC4 80010BC4 03001924 */  addiu      $t9, $zero, 0x3
    /* BC8 80010BC8 21200000 */  addu       $a0, $zero, $zero
  .L80010BCC:
    /* BCC 80010BCC 5243000C */  jal        func_80010D48
    /* BD0 80010BD0 00000000 */   nop
    /* BD4 80010BD4 21184000 */  addu       $v1, $v0, $zero
    /* BD8 80010BD8 21186400 */  addu       $v1, $v1, $a0
    /* BDC 80010BDC 01006320 */  addi       $v1, $v1, 0x1 /* handwritten instruction */
  .L80010BE0:
    /* BE0 80010BE0 08001924 */  addiu      $t9, $zero, 0x8
  .L80010BE4:
    /* BE4 80010BE4 C0371800 */  sll        $a2, $t8, 31
    /* BE8 80010BE8 42C01800 */  srl        $t8, $t8, 1
    /* BEC 80010BEC 0500C004 */  bltz       $a2, .L80010C04
    /* BF0 80010BF0 00000000 */   nop
    /* BF4 80010BF4 07000013 */  beqz       $t8, .L80010C14
    /* BF8 80010BF8 00000000 */   nop
    /* BFC 80010BFC 07430008 */  j          .L80010C1C
    /* C00 80010C00 00000000 */   nop
  .L80010C04:
    /* C04 80010C04 03000013 */  beqz       $t8, .L80010C14
    /* C08 80010C08 00000000 */   nop
    /* C0C 80010C0C 07430008 */  j          .L80010C1C
    /* C10 80010C10 00000000 */   nop
  .L80010C14:
    /* C14 80010C14 4543000C */  jal        func_80010D14
    /* C18 80010C18 00000000 */   nop
  .L80010C1C:
    /* C1C 80010C1C 2A30C000 */  slt        $a2, $a2, $zero
    /* C20 80010C20 40100200 */  sll        $v0, $v0, 1
    /* C24 80010C24 25104600 */  or         $v0, $v0, $a2
    /* C28 80010C28 FFFF3923 */  addi       $t9, $t9, -0x1 /* handwritten instruction */
    /* C2C 80010C2C EDFF2017 */  bnez       $t9, .L80010BE4
    /* C30 80010C30 00000000 */   nop
    /* C34 80010C34 FFFF4A21 */  addi       $t2, $t2, -0x1 /* handwritten instruction */
    /* C38 80010C38 000042A1 */  sb         $v0, 0x0($t2)
    /* C3C 80010C3C FFFF6320 */  addi       $v1, $v1, -0x1 /* handwritten instruction */
    /* C40 80010C40 E7FF6014 */  bnez       $v1, .L80010BE0
    /* C44 80010C44 00000000 */   nop
    /* C48 80010C48 39430008 */  j          .L80010CE4
    /* C4C 80010C4C 00000000 */   nop
  .L80010C50:
    /* C50 80010C50 08001924 */  addiu      $t9, $zero, 0x8
    /* C54 80010C54 08000424 */  addiu      $a0, $zero, 0x8
    /* C58 80010C58 F3420008 */  j          .L80010BCC
    /* C5C 80010C5C 00000000 */   nop
  .L80010C60:
    /* C60 80010C60 02001924 */  addiu      $t9, $zero, 0x2
    /* C64 80010C64 5243000C */  jal        func_80010D48
    /* C68 80010C68 00000000 */   nop
    /* C6C 80010C6C 02004128 */  slti       $at, $v0, 0x2
    /* C70 80010C70 0B002014 */  bnez       $at, .L80010CA0
    /* C74 80010C74 00000000 */   nop
    /* C78 80010C78 03000124 */  addiu      $at, $zero, 0x3
    /* C7C 80010C7C F4FF4110 */  beq        $v0, $at, .L80010C50
    /* C80 80010C80 00000000 */   nop
    /* C84 80010C84 08001924 */  addiu      $t9, $zero, 0x8
    /* C88 80010C88 5243000C */  jal        func_80010D48
    /* C8C 80010C8C 00000000 */   nop
    /* C90 80010C90 21184000 */  addu       $v1, $v0, $zero
    /* C94 80010C94 0C001924 */  addiu      $t9, $zero, 0xC
    /* C98 80010C98 2D430008 */  j          .L80010CB4
    /* C9C 80010C9C 00000000 */   nop
  .L80010CA0:
    /* CA0 80010CA0 09001924 */  addiu      $t9, $zero, 0x9
    /* CA4 80010CA4 00000000 */  nop
    /* CA8 80010CA8 20C82203 */  add        $t9, $t9, $v0 /* handwritten instruction */
    /* CAC 80010CAC 02004220 */  addi       $v0, $v0, 0x2 /* handwritten instruction */
    /* CB0 80010CB0 21184000 */  addu       $v1, $v0, $zero
  .L80010CB4:
    /* CB4 80010CB4 5243000C */  jal        func_80010D48
    /* CB8 80010CB8 00000000 */   nop
    /* CBC 80010CBC 21304201 */  addu       $a2, $t2, $v0
    /* CC0 80010CC0 01006320 */  addi       $v1, $v1, 0x1 /* handwritten instruction */
  .L80010CC4:
    /* CC4 80010CC4 FFFFC620 */  addi       $a2, $a2, -0x1 /* handwritten instruction */
    /* CC8 80010CC8 FFFF4A21 */  addi       $t2, $t2, -0x1 /* handwritten instruction */
    /* CCC 80010CCC 0000D980 */  lb         $t9, 0x0($a2)
    /* CD0 80010CD0 00000000 */  nop
    /* CD4 80010CD4 000059A1 */  sb         $t9, 0x0($t2)
    /* CD8 80010CD8 FFFF6320 */  addi       $v1, $v1, -0x1 /* handwritten instruction */
    /* CDC 80010CDC F9FF6014 */  bnez       $v1, .L80010CC4
    /* CE0 80010CE0 00000000 */   nop
  .L80010CE4:
    /* CE4 80010CE4 2A082A01 */  slt        $at, $t1, $t2
    /* CE8 80010CE8 98FF2014 */  bnez       $at, .L80010B4C
    /* CEC 80010CEC 00000000 */   nop
    /* CF0 80010CF0 21100000 */  addu       $v0, $zero, $zero
    /* CF4 80010CF4 0200A010 */  beqz       $a1, .L80010D00
    /* CF8 80010CF8 00000000 */   nop
    /* CFC 80010CFC FFFF0224 */  addiu      $v0, $zero, -0x1
  .L80010D00:
    /* D00 80010D00 0000BF8F */  lw         $ra, 0x0($sp)
    /* D04 80010D04 00000000 */  nop
    /* D08 80010D08 0400BD27 */  addiu      $sp, $sp, 0x4
    /* D0C 80010D0C 0800E003 */  jr         $ra
    /* D10 80010D10 00000000 */   nop
endlabel decrunch
