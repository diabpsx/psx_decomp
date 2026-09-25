.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddObject__Fiii, 0x110

glabel AddObject__Fiii
    /* 43AF8 80053AF8 4C12888F */  lw         $t0, %gp_rel(numobjects)($gp)
    /* 43AFC 80053AFC D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 43B00 80053B00 1800B2AF */  sw         $s2, 0x18($sp)
    /* 43B04 80053B04 21908000 */  addu       $s2, $a0, $zero
    /* 43B08 80053B08 1400B1AF */  sw         $s1, 0x14($sp)
    /* 43B0C 80053B0C 2188A000 */  addu       $s1, $a1, $zero
    /* 43B10 80053B10 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 43B14 80053B14 2198C000 */  addu       $s3, $a2, $zero
    /* 43B18 80053B18 2000BFAF */  sw         $ra, 0x20($sp)
    /* 43B1C 80053B1C 7F000229 */  slti       $v0, $t0, 0x7F
    /* 43B20 80053B20 31004010 */  beqz       $v0, .L80053BE8
    /* 43B24 80053B24 1000B0AF */   sw        $s0, 0x10($sp)
    /* 43B28 80053B28 C0101300 */  sll        $v0, $s3, 3
    /* 43B2C 80053B2C C0181100 */  sll        $v1, $s1, 3
    /* 43B30 80053B30 23187100 */  subu       $v1, $v1, $s1
    /* 43B34 80053B34 C0190300 */  sll        $v1, $v1, 7
    /* 43B38 80053B38 21484300 */  addu       $t1, $v0, $v1
    /* 43B3C 80053B3C 0E80013C */  lui        $at, %hi(dung_map + 0x3)
    /* 43B40 80053B40 21082900 */  addu       $at, $at, $t1
    /* 43B44 80053B44 2B7A2280 */  lb         $v0, %lo(dung_map + 0x3)($at)
    /* 43B48 80053B48 00000000 */  nop
    /* 43B4C 80053B4C 26004014 */  bnez       $v0, .L80053BE8
    /* 43B50 80053B50 21384002 */   addu      $a3, $s2, $zero
    /* 43B54 80053B54 0E80033C */  lui        $v1, %hi(objectavail)
    /* 43B58 80053B58 A0A26324 */  addiu      $v1, $v1, %lo(objectavail)
    /* 43B5C 80053B5C 7E006224 */  addiu      $v0, $v1, 0x7E
    /* 43B60 80053B60 23104800 */  subu       $v0, $v0, $t0
    /* 43B64 80053B64 00007080 */  lb         $s0, 0x0($v1)
    /* 43B68 80053B68 00004290 */  lbu        $v0, 0x0($v0)
    /* 43B6C 80053B6C 00000000 */  nop
    /* 43B70 80053B70 000062A0 */  sb         $v0, 0x0($v1)
    /* 43B74 80053B74 40101000 */  sll        $v0, $s0, 1
    /* 43B78 80053B78 21105000 */  addu       $v0, $v0, $s0
    /* 43B7C 80053B7C 80100200 */  sll        $v0, $v0, 2
    /* 43B80 80053B80 23105000 */  subu       $v0, $v0, $s0
    /* 43B84 80053B84 80100200 */  sll        $v0, $v0, 2
    /* 43B88 80053B88 FFFF0324 */  addiu      $v1, $zero, -0x1
    /* 43B8C 80053B8C 0E80013C */  lui        $at, %hi(object)
    /* 43B90 80053B90 21082200 */  addu       $at, $at, $v0
    /* 43B94 80053B94 4C8C23A4 */  sh         $v1, %lo(object)($at)
    /* 43B98 80053B98 01000226 */  addiu      $v0, $s0, 0x1
    /* 43B9C 80053B9C 0E80013C */  lui        $at, %hi(objectactive)
    /* 43BA0 80053BA0 21082800 */  addu       $at, $at, $t0
    /* 43BA4 80053BA4 20A230A0 */  sb         $s0, %lo(objectactive)($at)
    /* 43BA8 80053BA8 0E80013C */  lui        $at, %hi(dung_map + 0x3)
    /* 43BAC 80053BAC 21082900 */  addu       $at, $at, $t1
    /* 43BB0 80053BB0 2B7A22A0 */  sb         $v0, %lo(dung_map + 0x3)($at)
    /* 43BB4 80053BB4 FC4D010C */  jal        SetupObject__Fiiii
    /* 43BB8 80053BB8 21200002 */   addu      $a0, $s0, $zero
    /* 43BBC 80053BBC 53000224 */  addiu      $v0, $zero, 0x53
    /* 43BC0 80053BC0 05004212 */  beq        $s2, $v0, .L80053BD8
    /* 43BC4 80053BC4 21204002 */   addu      $a0, $s2, $zero
    /* 43BC8 80053BC8 21282002 */  addu       $a1, $s1, $zero
    /* 43BCC 80053BCC 21306002 */  addu       $a2, $s3, $zero
    /* 43BD0 80053BD0 1D67050C */  jal        func_80159C74
    /* 43BD4 80053BD4 21380002 */   addu      $a3, $s0, $zero
  .L80053BD8:
    /* 43BD8 80053BD8 4C12828F */  lw         $v0, %gp_rel(numobjects)($gp)
    /* 43BDC 80053BDC 00000000 */  nop
    /* 43BE0 80053BE0 01004224 */  addiu      $v0, $v0, 0x1
    /* 43BE4 80053BE4 4C1282AF */  sw         $v0, %gp_rel(numobjects)($gp)
  .L80053BE8:
    /* 43BE8 80053BE8 2000BF8F */  lw         $ra, 0x20($sp)
    /* 43BEC 80053BEC 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 43BF0 80053BF0 1800B28F */  lw         $s2, 0x18($sp)
    /* 43BF4 80053BF4 1400B18F */  lw         $s1, 0x14($sp)
    /* 43BF8 80053BF8 1000B08F */  lw         $s0, 0x10($sp)
    /* 43BFC 80053BFC 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 43C00 80053C00 0800E003 */  jr         $ra
    /* 43C04 80053C04 00000000 */   nop
endlabel AddObject__Fiii
