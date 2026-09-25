.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitDialog__Fv, 0x138

glabel InitDialog__Fv
    /* 7BB24 8008BB24 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 7BB28 8008BB28 1000B0AF */  sw         $s0, 0x10($sp)
    /* 7BB2C 8008BB2C 21800000 */  addu       $s0, $zero, $zero
    /* 7BB30 8008BB30 2000BFAF */  sw         $ra, 0x20($sp)
    /* 7BB34 8008BB34 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 7BB38 8008BB38 1800B2AF */  sw         $s2, 0x18($sp)
    /* 7BB3C 8008BB3C 1400B1AF */  sw         $s1, 0x14($sp)
  .L8008BB40:
    /* 7BB40 8008BB40 3D83000C */  jal        GU_GetRnd
    /* 7BB44 8008BB44 01001026 */   addiu     $s0, $s0, 0x1
    /* 7BB48 8008BB48 0600022A */  slti       $v0, $s0, 0x6
    /* 7BB4C 8008BB4C FCFF4014 */  bnez       $v0, .L8008BB40
    /* 7BB50 8008BB50 21900000 */   addu      $s2, $zero, $zero
    /* 7BB54 8008BB54 AAAA133C */  lui        $s3, (0xAAAAAAAB >> 16)
    /* 7BB58 8008BB58 ABAA7336 */  ori        $s3, $s3, (0xAAAAAAAB & 0xFFFF)
  .L8008BB5C:
    /* 7BB5C 8008BB5C 0800422A */  slti       $v0, $s2, 0x8
    /* 7BB60 8008BB60 15004010 */  beqz       $v0, .L8008BBB8
    /* 7BB64 8008BB64 21800000 */   addu      $s0, $zero, $zero
    /* 7BB68 8008BB68 21880000 */  addu       $s1, $zero, $zero
  .L8008BB6C:
    /* 7BB6C 8008BB6C 3D83000C */  jal        GU_GetRnd
    /* 7BB70 8008BB70 00000000 */   nop
    /* 7BB74 8008BB74 19005300 */  multu      $v0, $s3
    /* 7BB78 8008BB78 10280000 */  mfhi       $a1
    /* 7BB7C 8008BB7C 42200500 */  srl        $a0, $a1, 1
    /* 7BB80 8008BB80 40180400 */  sll        $v1, $a0, 1
    /* 7BB84 8008BB84 21186400 */  addu       $v1, $v1, $a0
    /* 7BB88 8008BB88 02004314 */  bne        $v0, $v1, .L8008BB94
    /* 7BB8C 8008BB8C 00000000 */   nop
    /* 7BB90 8008BB90 01001036 */  ori        $s0, $s0, 0x1
  .L8008BB94:
    /* 7BB94 8008BB94 01003126 */  addiu      $s1, $s1, 0x1
    /* 7BB98 8008BB98 0800222A */  slti       $v0, $s1, 0x8
    /* 7BB9C 8008BB9C F3FF4014 */  bnez       $v0, .L8008BB6C
    /* 7BBA0 8008BBA0 40801000 */   sll       $s0, $s0, 1
    /* 7BBA4 8008BBA4 1280013C */  lui        $at, %hi(D_8011C654)
    /* 7BBA8 8008BBA8 21083200 */  addu       $at, $at, $s2
    /* 7BBAC 8008BBAC 54C630A0 */  sb         $s0, %lo(D_8011C654)($at)
    /* 7BBB0 8008BBB0 D72E0208 */  j          .L8008BB5C
    /* 7BBB4 8008BBB4 01005226 */   addiu     $s2, $s2, 0x1
  .L8008BBB8:
    /* 7BBB8 8008BBB8 21900000 */  addu       $s2, $zero, $zero
    /* 7BBBC 8008BBBC 0C80023C */  lui        $v0, %hi(Cxy)
    /* 7BBC0 8008BBC0 108B4224 */  addiu      $v0, $v0, %lo(Cxy)
    /* 7BBC4 8008BBC4 04005124 */  addiu      $s1, $v0, 0x4
    /* 7BBC8 8008BBC8 21804000 */  addu       $s0, $v0, $zero
  .L8008BBCC:
    /* 7BBCC 8008BBCC 3D83000C */  jal        GU_GetRnd
    /* 7BBD0 8008BBD0 01005226 */   addiu     $s2, $s2, 0x1
    /* 7BBD4 8008BBD4 9224033C */  lui        $v1, (0x24924929 >> 16)
    /* 7BBD8 8008BBD8 29496334 */  ori        $v1, $v1, (0x24924929 & 0xFFFF)
    /* 7BBDC 8008BBDC 42210200 */  srl        $a0, $v0, 5
    /* 7BBE0 8008BBE0 19008300 */  multu      $a0, $v1
    /* 7BBE4 8008BBE4 10200000 */  mfhi       $a0
    /* 7BBE8 8008BBE8 C0180400 */  sll        $v1, $a0, 3
    /* 7BBEC 8008BBEC 23186400 */  subu       $v1, $v1, $a0
    /* 7BBF0 8008BBF0 40190300 */  sll        $v1, $v1, 5
    /* 7BBF4 8008BBF4 23104300 */  subu       $v0, $v0, $v1
    /* 7BBF8 8008BBF8 10004224 */  addiu      $v0, $v0, 0x10
    /* 7BBFC 8008BBFC 3D83000C */  jal        GU_GetRnd
    /* 7BC00 8008BC00 000002AE */   sw        $v0, 0x0($s0)
    /* 7BC04 8008BC04 E338033C */  lui        $v1, (0x38E38E39 >> 16)
    /* 7BC08 8008BC08 398E6334 */  ori        $v1, $v1, (0x38E38E39 & 0xFFFF)
    /* 7BC0C 8008BC0C 19004300 */  multu      $v0, $v1
    /* 7BC10 8008BC10 08001026 */  addiu      $s0, $s0, 0x8
    /* 7BC14 8008BC14 10180000 */  mfhi       $v1
    /* 7BC18 8008BC18 42210300 */  srl        $a0, $v1, 5
    /* 7BC1C 8008BC1C C0180400 */  sll        $v1, $a0, 3
    /* 7BC20 8008BC20 21186400 */  addu       $v1, $v1, $a0
    /* 7BC24 8008BC24 00190300 */  sll        $v1, $v1, 4
    /* 7BC28 8008BC28 23104300 */  subu       $v0, $v0, $v1
    /* 7BC2C 8008BC2C 000022AE */  sw         $v0, 0x0($s1)
    /* 7BC30 8008BC30 0E00422A */  slti       $v0, $s2, 0xE
    /* 7BC34 8008BC34 E5FF4014 */  bnez       $v0, .L8008BBCC
    /* 7BC38 8008BC38 08003126 */   addiu     $s1, $s1, 0x8
    /* 7BC3C 8008BC3C 2000BF8F */  lw         $ra, 0x20($sp)
    /* 7BC40 8008BC40 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 7BC44 8008BC44 1800B28F */  lw         $s2, 0x18($sp)
    /* 7BC48 8008BC48 1400B18F */  lw         $s1, 0x14($sp)
    /* 7BC4C 8008BC4C 1000B08F */  lw         $s0, 0x10($sp)
    /* 7BC50 8008BC50 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 7BC54 8008BC54 0800E003 */  jr         $ra
    /* 7BC58 8008BC58 00000000 */   nop
endlabel InitDialog__Fv
