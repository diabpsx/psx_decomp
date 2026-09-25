.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching set_buttons__Fii, 0x178

glabel set_buttons__Fii
    /* 8C960 8009C960 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 8C964 8009C964 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 8C968 8009C968 21988000 */  addu       $s3, $a0, $zero
    /* 8C96C 8009C96C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 8C970 8009C970 2188A000 */  addu       $s1, $a1, $zero
    /* 8C974 8009C974 00211300 */  sll        $a0, $s3, 4
    /* 8C978 8009C978 0D80023C */  lui        $v0, %hi(txt_actions + 0x44)
    /* 8C97C 8009C97C 50C4428C */  lw         $v0, %lo(txt_actions + 0x44)($v0)
    /* 8C980 8009C980 0D80033C */  lui        $v1, %hi(txt_actions)
    /* 8C984 8009C984 0CC46324 */  addiu      $v1, $v1, %lo(txt_actions)
    /* 8C988 8009C988 1000B0AF */  sw         $s0, 0x10($sp)
    /* 8C98C 8009C98C 21808300 */  addu       $s0, $a0, $v1
    /* 8C990 8009C990 2000BFAF */  sw         $ra, 0x20($sp)
    /* 8C994 8009C994 24182202 */  and        $v1, $s1, $v0
    /* 8C998 8009C998 27100200 */  nor        $v0, $zero, $v0
    /* 8C99C 8009C99C 24102202 */  and        $v0, $s1, $v0
    /* 8C9A0 8009C9A0 04004010 */  beqz       $v0, .L8009C9B4
    /* 8C9A4 8009C9A4 1800B2AF */   sw        $s2, 0x18($sp)
    /* 8C9A8 8009C9A8 0400128E */  lw         $s2, 0x4($s0)
    /* 8C9AC 8009C9AC 6E720208 */  j          .L8009C9B8
    /* 8C9B0 8009C9B0 00000000 */   nop
  .L8009C9B4:
    /* 8C9B4 8009C9B4 0C00128E */  lw         $s2, 0xC($s0)
  .L8009C9B8:
    /* 8C9B8 8009C9B8 05007114 */  bne        $v1, $s1, .L8009C9D0
    /* 8C9BC 8009C9BC C6000224 */   addiu     $v0, $zero, 0xC6
    /* 8C9C0 8009C9C0 0000038E */  lw         $v1, 0x0($s0)
    /* 8C9C4 8009C9C4 00000000 */  nop
    /* 8C9C8 8009C9C8 3B006214 */  bne        $v1, $v0, .L8009CAB8
    /* 8C9CC 8009C9CC 21100000 */   addu      $v0, $zero, $zero
  .L8009C9D0:
    /* 8C9D0 8009C9D0 4A1F8283 */  lb         $v0, %gp_rel(D_8011C6CA)($gp)
    /* 8C9D4 8009C9D4 00000000 */  nop
    /* 8C9D8 8009C9D8 19004014 */  bnez       $v0, .L8009CA40
    /* 8C9DC 8009C9DC 01000224 */   addiu     $v0, $zero, 0x1
    /* 8C9E0 8009C9E0 0400028E */  lw         $v0, 0x4($s0)
    /* 8C9E4 8009C9E4 00000000 */  nop
    /* 8C9E8 8009C9E8 03005114 */  bne        $v0, $s1, .L8009C9F8
    /* 8C9EC 8009C9EC 00000000 */   nop
    /* 8C9F0 8009C9F0 AD720208 */  j          .L8009CAB4
    /* 8C9F4 8009C9F4 040000AE */   sw        $zero, 0x4($s0)
  .L8009C9F8:
    /* 8C9F8 8009C9F8 3672020C */  jal        remove_padval__Fi
    /* 8C9FC 8009C9FC 21202002 */   addu      $a0, $s1, $zero
    /* 8CA00 8009CA00 21204000 */  addu       $a0, $v0, $zero
    /* 8CA04 8009CA04 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 8CA08 8009CA08 05008210 */  beq        $a0, $v0, .L8009CA20
    /* 8CA0C 8009CA0C 040011AE */   sw        $s1, 0x4($s0)
    /* 8CA10 8009CA10 00110400 */  sll        $v0, $a0, 4
    /* 8CA14 8009CA14 0D80013C */  lui        $at, %hi(txt_actions + 0x4)
    /* 8CA18 8009CA18 21082200 */  addu       $at, $at, $v0
    /* 8CA1C 8009CA1C 10C432AC */  sw         $s2, %lo(txt_actions + 0x4)($at)
  .L8009CA20:
    /* 8CA20 8009CA20 04000224 */  addiu      $v0, $zero, 0x4
    /* 8CA24 8009CA24 1B006216 */  bne        $s3, $v0, .L8009CA94
    /* 8CA28 8009CA28 0C0000AE */   sw        $zero, 0xC($s0)
    /* 8CA2C 8009CA2C 21202002 */  addu       $a0, $s1, $zero
    /* 8CA30 8009CA30 4672020C */  jal        remove_comboval__Fib
    /* 8CA34 8009CA34 21280000 */   addu      $a1, $zero, $zero
    /* 8CA38 8009CA38 A5720208 */  j          .L8009CA94
    /* 8CA3C 8009CA3C 00000000 */   nop
  .L8009CA40:
    /* 8CA40 8009CA40 0C00038E */  lw         $v1, 0xC($s0)
    /* 8CA44 8009CA44 EC0882AF */  sw         $v0, %gp_rel(D_8011B06C)($gp)
    /* 8CA48 8009CA48 03007114 */  bne        $v1, $s1, .L8009CA58
    /* 8CA4C 8009CA4C 21202002 */   addu      $a0, $s1, $zero
    /* 8CA50 8009CA50 AE720208 */  j          .L8009CAB8
    /* 8CA54 8009CA54 0C0000AE */   sw        $zero, 0xC($s0)
  .L8009CA58:
    /* 8CA58 8009CA58 4672020C */  jal        remove_comboval__Fib
    /* 8CA5C 8009CA5C 21280000 */   addu      $a1, $zero, $zero
    /* 8CA60 8009CA60 0D80033C */  lui        $v1, %hi(txt_actions + 0x44)
    /* 8CA64 8009CA64 50C4638C */  lw         $v1, %lo(txt_actions + 0x44)($v1)
    /* 8CA68 8009CA68 00000000 */  nop
    /* 8CA6C 8009CA6C 02002312 */  beq        $s1, $v1, .L8009CA78
    /* 8CA70 8009CA70 21204000 */   addu      $a0, $v0, $zero
    /* 8CA74 8009CA74 0C0011AE */  sw         $s1, 0xC($s0)
  .L8009CA78:
    /* 8CA78 8009CA78 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 8CA7C 8009CA7C 05008210 */  beq        $a0, $v0, .L8009CA94
    /* 8CA80 8009CA80 040000AE */   sw        $zero, 0x4($s0)
    /* 8CA84 8009CA84 00110400 */  sll        $v0, $a0, 4
    /* 8CA88 8009CA88 0D80013C */  lui        $at, %hi(txt_actions + 0xC)
    /* 8CA8C 8009CA8C 21082200 */  addu       $at, $at, $v0
    /* 8CA90 8009CA90 18C432AC */  sw         $s2, %lo(txt_actions + 0xC)($at)
  .L8009CA94:
    /* 8CA94 8009CA94 0D80023C */  lui        $v0, %hi(txt_actions + 0x44)
    /* 8CA98 8009CA98 50C4428C */  lw         $v0, %lo(txt_actions + 0x44)($v0)
    /* 8CA9C 8009CA9C 00000000 */  nop
    /* 8CAA0 8009CAA0 05004014 */  bnez       $v0, .L8009CAB8
    /* 8CAA4 8009CAA4 01000224 */   addiu     $v0, $zero, 0x1
    /* 8CAA8 8009CAA8 21200000 */  addu       $a0, $zero, $zero
    /* 8CAAC 8009CAAC 4672020C */  jal        remove_comboval__Fib
    /* 8CAB0 8009CAB0 01000524 */   addiu     $a1, $zero, 0x1
  .L8009CAB4:
    /* 8CAB4 8009CAB4 01000224 */  addiu      $v0, $zero, 0x1
  .L8009CAB8:
    /* 8CAB8 8009CAB8 2000BF8F */  lw         $ra, 0x20($sp)
    /* 8CABC 8009CABC 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 8CAC0 8009CAC0 1800B28F */  lw         $s2, 0x18($sp)
    /* 8CAC4 8009CAC4 1400B18F */  lw         $s1, 0x14($sp)
    /* 8CAC8 8009CAC8 1000B08F */  lw         $s0, 0x10($sp)
    /* 8CACC 8009CACC 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 8CAD0 8009CAD0 0800E003 */  jr         $ra
    /* 8CAD4 8009CAD4 00000000 */   nop
endlabel set_buttons__Fii
