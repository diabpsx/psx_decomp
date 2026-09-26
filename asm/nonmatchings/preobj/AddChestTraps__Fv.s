.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddChestTraps__Fv, 0x13C

glabel AddChestTraps__Fv
    /* 1EF3C 80158B34 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 1EF40 80158B38 2400B3AF */  sw         $s3, 0x24($sp)
    /* 1EF44 80158B3C 21980000 */  addu       $s3, $zero, $zero
    /* 1EF48 80158B40 2800BFAF */  sw         $ra, 0x28($sp)
    /* 1EF4C 80158B44 2000B2AF */  sw         $s2, 0x20($sp)
    /* 1EF50 80158B48 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 1EF54 80158B4C 1800B0AF */  sw         $s0, 0x18($sp)
    /* 1EF58 80158B50 21900000 */  addu       $s2, $zero, $zero
  .L80158B54:
    /* 1EF5C 80158B54 C0881300 */  sll        $s1, $s3, 3
  .L80158B58:
    /* 1EF60 80158B58 0E80013C */  lui        $at, %hi(dung_map + 0x3)
    /* 1EF64 80158B5C 21083100 */  addu       $at, $at, $s1
    /* 1EF68 80158B60 2B7A2280 */  lb         $v0, %lo(dung_map + 0x3)($at)
    /* 1EF6C 80158B64 00000000 */  nop
    /* 1EF70 80158B68 31004018 */  blez       $v0, .L80158C30
    /* 1EF74 80158B6C 21184000 */   addu      $v1, $v0, $zero
    /* 1EF78 80158B70 FFFF6224 */  addiu      $v0, $v1, -0x1
    /* 1EF7C 80158B74 00160200 */  sll        $v0, $v0, 24
    /* 1EF80 80158B78 03160200 */  sra        $v0, $v0, 24
    /* 1EF84 80158B7C 40180200 */  sll        $v1, $v0, 1
    /* 1EF88 80158B80 21186200 */  addu       $v1, $v1, $v0
    /* 1EF8C 80158B84 80180300 */  sll        $v1, $v1, 2
    /* 1EF90 80158B88 23186200 */  subu       $v1, $v1, $v0
    /* 1EF94 80158B8C 80800300 */  sll        $s0, $v1, 2
    /* 1EF98 80158B90 0E80013C */  lui        $at, %hi(object + 0x1E)
    /* 1EF9C 80158B94 21083000 */  addu       $at, $at, $s0
    /* 1EFA0 80158B98 6A8C2290 */  lbu        $v0, %lo(object + 0x1E)($at)
    /* 1EFA4 80158B9C 00000000 */  nop
    /* 1EFA8 80158BA0 FBFF4224 */  addiu      $v0, $v0, -0x5
    /* 1EFAC 80158BA4 0300422C */  sltiu      $v0, $v0, 0x3
    /* 1EFB0 80158BA8 21004010 */  beqz       $v0, .L80158C30
    /* 1EFB4 80158BAC 00000000 */   nop
    /* 1EFB8 80158BB0 0E80013C */  lui        $at, %hi(object + 0x2A)
    /* 1EFBC 80158BB4 21083000 */  addu       $at, $at, $s0
    /* 1EFC0 80158BB8 768C2290 */  lbu        $v0, %lo(object + 0x2A)($at)
    /* 1EFC4 80158BBC 00000000 */  nop
    /* 1EFC8 80158BC0 1B004014 */  bnez       $v0, .L80158C30
    /* 1EFCC 80158BC4 00000000 */   nop
    /* 1EFD0 80158BC8 C9F6000C */  jal        ENG_random__Fl
    /* 1EFD4 80158BCC 64000424 */   addiu     $a0, $zero, 0x64
    /* 1EFD8 80158BD0 0A004228 */  slti       $v0, $v0, 0xA
    /* 1EFDC 80158BD4 16004010 */  beqz       $v0, .L80158C30
    /* 1EFE0 80158BD8 01000224 */   addiu     $v0, $zero, 0x1
    /* 1EFE4 80158BDC 0E80013C */  lui        $at, %hi(object + 0x1E)
    /* 1EFE8 80158BE0 21083000 */  addu       $at, $at, $s0
    /* 1EFEC 80158BE4 6A8C2390 */  lbu        $v1, %lo(object + 0x1E)($at)
    /* 1EFF0 80158BE8 0E80013C */  lui        $at, %hi(object + 0x2A)
    /* 1EFF4 80158BEC 21083000 */  addu       $at, $at, $s0
    /* 1EFF8 80158BF0 768C22A0 */  sb         $v0, %lo(object + 0x2A)($at)
    /* 1EFFC 80158BF4 3F006324 */  addiu      $v1, $v1, 0x3F
    /* 1F000 80158BF8 0E80013C */  lui        $at, %hi(object + 0x1E)
    /* 1F004 80158BFC 21083000 */  addu       $at, $at, $s0
    /* 1F008 80158C00 6A8C23A0 */  sb         $v1, %lo(object + 0x1E)($at)
    /* 1F00C 80158C04 1280033C */  lui        $v1, %hi(leveltype)
    /* 1F010 80158C08 0DC16390 */  lbu        $v1, %lo(leveltype)($v1)
    /* 1F014 80158C0C 02000224 */  addiu      $v0, $zero, 0x2
    /* 1F018 80158C10 02006214 */  bne        $v1, $v0, .L80158C1C
    /* 1F01C 80158C14 03000424 */   addiu     $a0, $zero, 0x3
    /* 1F020 80158C18 02000424 */  addiu      $a0, $zero, 0x2
  .L80158C1C:
    /* 1F024 80158C1C C9F6000C */  jal        ENG_random__Fl
    /* 1F028 80158C20 00000000 */   nop
    /* 1F02C 80158C24 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 1F030 80158C28 21083000 */  addu       $at, $at, $s0
    /* 1F034 80158C2C 608C22A4 */  sh         $v0, %lo(object + 0x14)($at)
  .L80158C30:
    /* 1F038 80158C30 01005226 */  addiu      $s2, $s2, 0x1
    /* 1F03C 80158C34 6000422A */  slti       $v0, $s2, 0x60
    /* 1F040 80158C38 C7FF4014 */  bnez       $v0, .L80158B58
    /* 1F044 80158C3C 80033126 */   addiu     $s1, $s1, 0x380
    /* 1F048 80158C40 01007326 */  addiu      $s3, $s3, 0x1
    /* 1F04C 80158C44 6000622A */  slti       $v0, $s3, 0x60
    /* 1F050 80158C48 C2FF4014 */  bnez       $v0, .L80158B54
    /* 1F054 80158C4C 21900000 */   addu      $s2, $zero, $zero
    /* 1F058 80158C50 2800BF8F */  lw         $ra, 0x28($sp)
    /* 1F05C 80158C54 2400B38F */  lw         $s3, 0x24($sp)
    /* 1F060 80158C58 2000B28F */  lw         $s2, 0x20($sp)
    /* 1F064 80158C5C 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 1F068 80158C60 1800B08F */  lw         $s0, 0x18($sp)
    /* 1F06C 80158C64 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 1F070 80158C68 0800E003 */  jr         $ra
    /* 1F074 80158C6C 00000000 */   nop
endlabel AddChestTraps__Fv
