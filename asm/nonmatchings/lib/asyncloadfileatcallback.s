.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching asyncloadfileatcallback, 0x138

glabel asyncloadfileatcallback
    /* 13C4C 80023C4C D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 13C50 80023C50 1000B0AF */  sw         $s0, 0x10($sp)
    /* 13C54 80023C54 1380103C */  lui        $s0, %hi(D_8013504C)
    /* 13C58 80023C58 4C501026 */  addiu      $s0, $s0, %lo(D_8013504C)
    /* 13C5C 80023C5C 2400BFAF */  sw         $ra, 0x24($sp)
    /* 13C60 80023C60 2000B4AF */  sw         $s4, 0x20($sp)
    /* 13C64 80023C64 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 13C68 80023C68 1800B2AF */  sw         $s2, 0x18($sp)
    /* 13C6C 80023C6C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 13C70 80023C70 0000028E */  lw         $v0, 0x0($s0)
    /* 13C74 80023C74 21908000 */  addu       $s2, $a0, $zero
    /* 13C78 80023C78 2198A000 */  addu       $s3, $a1, $zero
    /* 13C7C 80023C7C 03004014 */  bnez       $v0, .L80023C8C
    /* 13C80 80023C80 21A0C000 */   addu      $s4, $a2, $zero
    /* 13C84 80023C84 588F0008 */  j          .L80023D60
    /* 13C88 80023C88 FFFF0224 */   addiu     $v0, $zero, -0x1
  .L80023C8C:
    /* 13C8C 80023C8C 5294000C */  jal        getasyncblock
    /* 13C90 80023C90 00000000 */   nop
    /* 13C94 80023C94 21884000 */  addu       $s1, $v0, $zero
    /* 13C98 80023C98 40181100 */  sll        $v1, $s1, 1
    /* 13C9C 80023C9C 21187100 */  addu       $v1, $v1, $s1
    /* 13CA0 80023CA0 0000108E */  lw         $s0, 0x0($s0)
    /* 13CA4 80023CA4 00110300 */  sll        $v0, $v1, 4
    /* 13CA8 80023CA8 23104300 */  subu       $v0, $v0, $v1
    /* 13CAC 80023CAC 80100200 */  sll        $v0, $v0, 2
    /* 13CB0 80023CB0 21284002 */  addu       $a1, $s2, $zero
    /* 13CB4 80023CB4 8F000624 */  addiu      $a2, $zero, 0x8F
    /* 13CB8 80023CB8 21800202 */  addu       $s0, $s0, $v0
    /* 13CBC 80023CBC 8367000C */  jal        strncpy
    /* 13CC0 80023CC0 21200002 */   addu      $a0, $s0, $zero
    /* 13CC4 80023CC4 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 13CC8 80023CC8 AC0002AE */  sw         $v0, 0xAC($s0)
    /* 13CCC 80023CCC 03000224 */  addiu      $v0, $zero, 0x3
    /* 13CD0 80023CD0 9C0000AE */  sw         $zero, 0x9C($s0)
    /* 13CD4 80023CD4 A40013AE */  sw         $s3, 0xA4($s0)
    /* 13CD8 80023CD8 940000AE */  sw         $zero, 0x94($s0)
    /* 13CDC 80023CDC A80000AE */  sw         $zero, 0xA8($s0)
    /* 13CE0 80023CE0 980002AE */  sw         $v0, 0x98($s0)
    /* 13CE4 80023CE4 B00014AE */  sw         $s4, 0xB0($s0)
    /* 13CE8 80023CE8 1380023C */  lui        $v0, %hi(D_80135058)
    /* 13CEC 80023CEC 5850428C */  lw         $v0, %lo(D_80135058)($v0)
    /* 13CF0 80023CF0 00000000 */  nop
    /* 13CF4 80023CF4 13004004 */  bltz       $v0, .L80023D44
    /* 13CF8 80023CF8 40180200 */   sll       $v1, $v0, 1
    /* 13CFC 80023CFC 1380043C */  lui        $a0, %hi(D_8013504C)
    /* 13D00 80023D00 4C50848C */  lw         $a0, %lo(D_8013504C)($a0)
    /* 13D04 80023D04 21186200 */  addu       $v1, $v1, $v0
    /* 13D08 80023D08 00110300 */  sll        $v0, $v1, 4
    /* 13D0C 80023D0C 23104300 */  subu       $v0, $v0, $v1
    /* 13D10 80023D10 80100200 */  sll        $v0, $v0, 2
    /* 13D14 80023D14 21104400 */  addu       $v0, $v0, $a0
    /* 13D18 80023D18 AC0051AC */  sw         $s1, 0xAC($v0)
    /* 13D1C 80023D1C 1380023C */  lui        $v0, %hi(D_80135054)
    /* 13D20 80023D20 5450428C */  lw         $v0, %lo(D_80135054)($v0)
    /* 13D24 80023D24 1380013C */  lui        $at, %hi(D_80135058)
    /* 13D28 80023D28 585031AC */  sw         $s1, %lo(D_80135058)($at)
    /* 13D2C 80023D2C 0C004104 */  bgez       $v0, .L80023D60
    /* 13D30 80023D30 21102002 */   addu      $v0, $s1, $zero
    /* 13D34 80023D34 1380013C */  lui        $at, %hi(D_80135054)
    /* 13D38 80023D38 545031AC */  sw         $s1, %lo(D_80135054)($at)
    /* 13D3C 80023D3C 588F0008 */  j          .L80023D60
    /* 13D40 80023D40 00000000 */   nop
  .L80023D44:
    /* 13D44 80023D44 1380013C */  lui        $at, %hi(D_80135054)
    /* 13D48 80023D48 545031AC */  sw         $s1, %lo(D_80135054)($at)
    /* 13D4C 80023D4C 1380013C */  lui        $at, %hi(D_80135058)
    /* 13D50 80023D50 585031AC */  sw         $s1, %lo(D_80135058)($at)
    /* 13D54 80023D54 1380013C */  lui        $at, %hi(D_80135050)
    /* 13D58 80023D58 505031AC */  sw         $s1, %lo(D_80135050)($at)
    /* 13D5C 80023D5C 21102002 */  addu       $v0, $s1, $zero
  .L80023D60:
    /* 13D60 80023D60 2400BF8F */  lw         $ra, 0x24($sp)
    /* 13D64 80023D64 2000B48F */  lw         $s4, 0x20($sp)
    /* 13D68 80023D68 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 13D6C 80023D6C 1800B28F */  lw         $s2, 0x18($sp)
    /* 13D70 80023D70 1400B18F */  lw         $s1, 0x14($sp)
    /* 13D74 80023D74 1000B08F */  lw         $s0, 0x10($sp)
    /* 13D78 80023D78 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 13D7C 80023D7C 0800E003 */  jr         $ra
    /* 13D80 80023D80 00000000 */   nop
endlabel asyncloadfileatcallback
