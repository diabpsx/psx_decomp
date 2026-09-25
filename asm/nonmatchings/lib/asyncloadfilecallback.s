.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching asyncloadfilecallback, 0x134

glabel asyncloadfilecallback
    /* 13AF8 80023AF8 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 13AFC 80023AFC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 13B00 80023B00 1380103C */  lui        $s0, %hi(D_8013504C)
    /* 13B04 80023B04 4C501026 */  addiu      $s0, $s0, %lo(D_8013504C)
    /* 13B08 80023B08 2400BFAF */  sw         $ra, 0x24($sp)
    /* 13B0C 80023B0C 2000B4AF */  sw         $s4, 0x20($sp)
    /* 13B10 80023B10 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 13B14 80023B14 1800B2AF */  sw         $s2, 0x18($sp)
    /* 13B18 80023B18 1400B1AF */  sw         $s1, 0x14($sp)
    /* 13B1C 80023B1C 0000028E */  lw         $v0, 0x0($s0)
    /* 13B20 80023B20 21908000 */  addu       $s2, $a0, $zero
    /* 13B24 80023B24 2198A000 */  addu       $s3, $a1, $zero
    /* 13B28 80023B28 03004014 */  bnez       $v0, .L80023B38
    /* 13B2C 80023B2C 21A0C000 */   addu      $s4, $a2, $zero
    /* 13B30 80023B30 028F0008 */  j          .L80023C08
    /* 13B34 80023B34 FFFF0224 */   addiu     $v0, $zero, -0x1
  .L80023B38:
    /* 13B38 80023B38 5294000C */  jal        getasyncblock
    /* 13B3C 80023B3C 00000000 */   nop
    /* 13B40 80023B40 21884000 */  addu       $s1, $v0, $zero
    /* 13B44 80023B44 40181100 */  sll        $v1, $s1, 1
    /* 13B48 80023B48 21187100 */  addu       $v1, $v1, $s1
    /* 13B4C 80023B4C 0000108E */  lw         $s0, 0x0($s0)
    /* 13B50 80023B50 00110300 */  sll        $v0, $v1, 4
    /* 13B54 80023B54 23104300 */  subu       $v0, $v0, $v1
    /* 13B58 80023B58 80100200 */  sll        $v0, $v0, 2
    /* 13B5C 80023B5C 21284002 */  addu       $a1, $s2, $zero
    /* 13B60 80023B60 8F000624 */  addiu      $a2, $zero, 0x8F
    /* 13B64 80023B64 21800202 */  addu       $s0, $s0, $v0
    /* 13B68 80023B68 8367000C */  jal        strncpy
    /* 13B6C 80023B6C 21200002 */   addu      $a0, $s0, $zero
    /* 13B70 80023B70 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 13B74 80023B74 AC0002AE */  sw         $v0, 0xAC($s0)
    /* 13B78 80023B78 02000224 */  addiu      $v0, $zero, 0x2
    /* 13B7C 80023B7C 9C0013AE */  sw         $s3, 0x9C($s0)
    /* 13B80 80023B80 940000AE */  sw         $zero, 0x94($s0)
    /* 13B84 80023B84 A80000AE */  sw         $zero, 0xA8($s0)
    /* 13B88 80023B88 980002AE */  sw         $v0, 0x98($s0)
    /* 13B8C 80023B8C B00014AE */  sw         $s4, 0xB0($s0)
    /* 13B90 80023B90 1380023C */  lui        $v0, %hi(D_80135058)
    /* 13B94 80023B94 5850428C */  lw         $v0, %lo(D_80135058)($v0)
    /* 13B98 80023B98 00000000 */  nop
    /* 13B9C 80023B9C 13004004 */  bltz       $v0, .L80023BEC
    /* 13BA0 80023BA0 40180200 */   sll       $v1, $v0, 1
    /* 13BA4 80023BA4 1380043C */  lui        $a0, %hi(D_8013504C)
    /* 13BA8 80023BA8 4C50848C */  lw         $a0, %lo(D_8013504C)($a0)
    /* 13BAC 80023BAC 21186200 */  addu       $v1, $v1, $v0
    /* 13BB0 80023BB0 00110300 */  sll        $v0, $v1, 4
    /* 13BB4 80023BB4 23104300 */  subu       $v0, $v0, $v1
    /* 13BB8 80023BB8 80100200 */  sll        $v0, $v0, 2
    /* 13BBC 80023BBC 21104400 */  addu       $v0, $v0, $a0
    /* 13BC0 80023BC0 AC0051AC */  sw         $s1, 0xAC($v0)
    /* 13BC4 80023BC4 1380023C */  lui        $v0, %hi(D_80135054)
    /* 13BC8 80023BC8 5450428C */  lw         $v0, %lo(D_80135054)($v0)
    /* 13BCC 80023BCC 1380013C */  lui        $at, %hi(D_80135058)
    /* 13BD0 80023BD0 585031AC */  sw         $s1, %lo(D_80135058)($at)
    /* 13BD4 80023BD4 0C004104 */  bgez       $v0, .L80023C08
    /* 13BD8 80023BD8 21102002 */   addu      $v0, $s1, $zero
    /* 13BDC 80023BDC 1380013C */  lui        $at, %hi(D_80135054)
    /* 13BE0 80023BE0 545031AC */  sw         $s1, %lo(D_80135054)($at)
    /* 13BE4 80023BE4 028F0008 */  j          .L80023C08
    /* 13BE8 80023BE8 00000000 */   nop
  .L80023BEC:
    /* 13BEC 80023BEC 1380013C */  lui        $at, %hi(D_80135054)
    /* 13BF0 80023BF0 545031AC */  sw         $s1, %lo(D_80135054)($at)
    /* 13BF4 80023BF4 1380013C */  lui        $at, %hi(D_80135058)
    /* 13BF8 80023BF8 585031AC */  sw         $s1, %lo(D_80135058)($at)
    /* 13BFC 80023BFC 1380013C */  lui        $at, %hi(D_80135050)
    /* 13C00 80023C00 505031AC */  sw         $s1, %lo(D_80135050)($at)
    /* 13C04 80023C04 21102002 */  addu       $v0, $s1, $zero
  .L80023C08:
    /* 13C08 80023C08 2400BF8F */  lw         $ra, 0x24($sp)
    /* 13C0C 80023C0C 2000B48F */  lw         $s4, 0x20($sp)
    /* 13C10 80023C10 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 13C14 80023C14 1800B28F */  lw         $s2, 0x18($sp)
    /* 13C18 80023C18 1400B18F */  lw         $s1, 0x14($sp)
    /* 13C1C 80023C1C 1000B08F */  lw         $s0, 0x10($sp)
    /* 13C20 80023C20 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 13C24 80023C24 0800E003 */  jr         $ra
    /* 13C28 80023C28 00000000 */   nop
endlabel asyncloadfilecallback
