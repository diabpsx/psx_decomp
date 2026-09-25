.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ForceTarget__11SpellTargetiii, 0x154

glabel ForceTarget__11SpellTargetiii
    /* 9FD14 800AFD14 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 9FD18 800AFD18 1000B0AF */  sw         $s0, 0x10($sp)
    /* 9FD1C 800AFD1C 21808000 */  addu       $s0, $a0, $zero
    /* 9FD20 800AFD20 1400B1AF */  sw         $s1, 0x14($sp)
    /* 9FD24 800AFD24 2188A000 */  addu       $s1, $a1, $zero
    /* 9FD28 800AFD28 1800B2AF */  sw         $s2, 0x18($sp)
    /* 9FD2C 800AFD2C 2190C000 */  addu       $s2, $a2, $zero
    /* 9FD30 800AFD30 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 9FD34 800AFD34 2198E000 */  addu       $s3, $a3, $zero
    /* 9FD38 800AFD38 1280033C */  lui        $v1, %hi(myplr)
    /* 9FD3C 800AFD3C 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 9FD40 800AFD40 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 9FD44 800AFD44 40006210 */  beq        $v1, $v0, .L800AFE48
    /* 9FD48 800AFD48 2000BFAF */   sw        $ra, 0x20($sp)
    /* 9FD4C 800AFD4C 40100300 */  sll        $v0, $v1, 1
    /* 9FD50 800AFD50 21104300 */  addu       $v0, $v0, $v1
    /* 9FD54 800AFD54 80100200 */  sll        $v0, $v0, 2
    /* 9FD58 800AFD58 21104300 */  addu       $v0, $v0, $v1
    /* 9FD5C 800AFD5C 00110200 */  sll        $v0, $v0, 4
    /* 9FD60 800AFD60 23104300 */  subu       $v0, $v0, $v1
    /* 9FD64 800AFD64 80100200 */  sll        $v0, $v0, 2
    /* 9FD68 800AFD68 21104300 */  addu       $v0, $v0, $v1
    /* 9FD6C 800AFD6C C0100200 */  sll        $v0, $v0, 3
    /* 9FD70 800AFD70 1C0003AE */  sw         $v1, 0x1C($s0)
    /* 9FD74 800AFD74 0E80033C */  lui        $v1, %hi(plr)
    /* 9FD78 800AFD78 38A56324 */  addiu      $v1, $v1, %lo(plr)
    /* 9FD7C 800AFD7C 21104300 */  addu       $v0, $v0, $v1
    /* 9FD80 800AFD80 0600201A */  blez       $s1, .L800AFD9C
    /* 9FD84 800AFD84 180002AE */   sw        $v0, 0x18($s0)
    /* 9FD88 800AFD88 535A050C */  jal        func_8015694C
    /* 9FD8C 800AFD8C 21202002 */   addu      $a0, $s1, $zero
    /* 9FD90 800AFD90 FF004230 */  andi       $v0, $v0, 0xFF
    /* 9FD94 800AFD94 2C004014 */  bnez       $v0, .L800AFE48
    /* 9FD98 800AFD98 00000000 */   nop
  .L800AFD9C:
    /* 9FD9C 800AFD9C 1800028E */  lw         $v0, 0x18($s0)
    /* 9FDA0 800AFDA0 00000000 */  nop
    /* 9FDA4 800AFDA4 6400448C */  lw         $a0, 0x64($v0)
    /* 9FDA8 800AFDA8 3CBC020C */  jal        IsAutoTarget__Fi
    /* 9FDAC 800AFDAC 00000000 */   nop
    /* 9FDB0 800AFDB0 01004238 */  xori       $v0, $v0, 0x1
    /* 9FDB4 800AFDB4 24004014 */  bnez       $v0, .L800AFE48
    /* 9FDB8 800AFDB8 00000000 */   nop
    /* 9FDBC 800AFDBC 1800028E */  lw         $v0, 0x18($s0)
    /* 9FDC0 800AFDC0 00000000 */  nop
    /* 9FDC4 800AFDC4 68004380 */  lb         $v1, 0x68($v0)
    /* 9FDC8 800AFDC8 04000224 */  addiu      $v0, $zero, 0x4
    /* 9FDCC 800AFDCC 1E006210 */  beq        $v1, $v0, .L800AFE48
    /* 9FDD0 800AFDD0 00000000 */   nop
    /* 9FDD4 800AFDD4 0400028E */  lw         $v0, 0x4($s0)
    /* 9FDD8 800AFDD8 00000000 */  nop
    /* 9FDDC 800AFDDC 1A004014 */  bnez       $v0, .L800AFE48
    /* 9FDE0 800AFDE0 01003126 */   addiu     $s1, $s1, 0x1
    /* 9FDE4 800AFDE4 00000292 */  lbu        $v0, 0x0($s0)
    /* 9FDE8 800AFDE8 00000000 */  nop
    /* 9FDEC 800AFDEC 04002212 */  beq        $s1, $v0, .L800AFE00
    /* 9FDF0 800AFDF0 01000224 */   addiu     $v0, $zero, 0x1
    /* 9FDF4 800AFDF4 140002AE */  sw         $v0, 0x14($s0)
    /* 9FDF8 800AFDF8 A3BC020C */  jal        ClearTrails__11SpellTarget
    /* 9FDFC 800AFDFC 21200002 */   addu      $a0, $s0, $zero
  .L800AFE00:
    /* 9FE00 800AFE00 00000292 */  lbu        $v0, 0x0($s0)
    /* 9FE04 800AFE04 00000000 */  nop
    /* 9FE08 800AFE08 0B004014 */  bnez       $v0, .L800AFE38
    /* 9FE0C 800AFE0C C0101200 */   sll       $v0, $s2, 3
    /* 9FE10 800AFE10 1800028E */  lw         $v0, 0x18($s0)
    /* 9FE14 800AFE14 1800038E */  lw         $v1, 0x18($s0)
    /* 9FE18 800AFE18 2800428C */  lw         $v0, 0x28($v0)
    /* 9FE1C 800AFE1C 00000000 */  nop
    /* 9FE20 800AFE20 080002A6 */  sh         $v0, 0x8($s0)
    /* 9FE24 800AFE24 2C00638C */  lw         $v1, 0x2C($v1)
    /* 9FE28 800AFE28 01000224 */  addiu      $v0, $zero, 0x1
    /* 9FE2C 800AFE2C 140002AE */  sw         $v0, 0x14($s0)
    /* 9FE30 800AFE30 0A0003A6 */  sh         $v1, 0xA($s0)
    /* 9FE34 800AFE34 C0101200 */  sll        $v0, $s2, 3
  .L800AFE38:
    /* 9FE38 800AFE38 0C0002A6 */  sh         $v0, 0xC($s0)
    /* 9FE3C 800AFE3C C0101300 */  sll        $v0, $s3, 3
    /* 9FE40 800AFE40 0E0002A6 */  sh         $v0, 0xE($s0)
    /* 9FE44 800AFE44 000011A2 */  sb         $s1, 0x0($s0)
  .L800AFE48:
    /* 9FE48 800AFE48 2000BF8F */  lw         $ra, 0x20($sp)
    /* 9FE4C 800AFE4C 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 9FE50 800AFE50 1800B28F */  lw         $s2, 0x18($sp)
    /* 9FE54 800AFE54 1400B18F */  lw         $s1, 0x14($sp)
    /* 9FE58 800AFE58 1000B08F */  lw         $s0, 0x10($sp)
    /* 9FE5C 800AFE5C 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 9FE60 800AFE60 0800E003 */  jr         $ra
    /* 9FE64 800AFE64 00000000 */   nop
endlabel ForceTarget__11SpellTargetiii
