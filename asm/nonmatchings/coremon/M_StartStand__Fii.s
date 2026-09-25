.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching M_StartStand__Fii, 0x164

glabel M_StartStand__Fii
    /* 6FE70 8007FE70 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 6FE74 8007FE74 1000B0AF */  sw         $s0, 0x10($sp)
    /* 6FE78 8007FE78 21808000 */  addu       $s0, $a0, $zero
    /* 6FE7C 8007FE7C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 6FE80 8007FE80 1800BFAF */  sw         $ra, 0x18($sp)
    /* 6FE84 8007FE84 F4FD010C */  jal        ClearMVars__Fi
    /* 6FE88 8007FE88 2188A000 */   addu      $s1, $a1, $zero
    /* 6FE8C 8007FE8C 40101000 */  sll        $v0, $s0, 1
    /* 6FE90 8007FE90 21105000 */  addu       $v0, $v0, $s0
    /* 6FE94 8007FE94 80100200 */  sll        $v0, $v0, 2
    /* 6FE98 8007FE98 21105000 */  addu       $v0, $v0, $s0
    /* 6FE9C 8007FE9C C0100200 */  sll        $v0, $v0, 3
    /* 6FEA0 8007FEA0 1080013C */  lui        $at, %hi(monster + 0x60)
    /* 6FEA4 8007FEA4 21082200 */  addu       $at, $at, $v0
    /* 6FEA8 8007FEA8 F453258C */  lw         $a1, %lo(monster + 0x60)($at)
    /* 6FEAC 8007FEAC 00000000 */  nop
    /* 6FEB0 8007FEB0 1200A390 */  lbu        $v1, 0x12($a1)
    /* 6FEB4 8007FEB4 6D000224 */  addiu      $v0, $zero, 0x6D
    /* 6FEB8 8007FEB8 05006214 */  bne        $v1, $v0, .L8007FED0
    /* 6FEBC 8007FEBC 21200002 */   addu      $a0, $s0, $zero
    /* 6FEC0 8007FEC0 0600A524 */  addiu      $a1, $a1, 0x6
    /* 6FEC4 8007FEC4 21302002 */  addu       $a2, $s1, $zero
    /* 6FEC8 8007FEC8 B7FF0108 */  j          .L8007FEDC
    /* 6FECC 8007FECC 01000724 */   addiu     $a3, $zero, 0x1
  .L8007FED0:
    /* 6FED0 8007FED0 0400A524 */  addiu      $a1, $a1, 0x4
    /* 6FED4 8007FED4 21302002 */  addu       $a2, $s1, $zero
    /* 6FED8 8007FED8 21380000 */  addu       $a3, $zero, $zero
  .L8007FEDC:
    /* 6FEDC 8007FEDC 3FFD010C */  jal        NewMonsterAnim__FiR10AnimStructii
    /* 6FEE0 8007FEE0 00000000 */   nop
    /* 6FEE4 8007FEE4 40101000 */  sll        $v0, $s0, 1
    /* 6FEE8 8007FEE8 21105000 */  addu       $v0, $v0, $s0
    /* 6FEEC 8007FEEC 80100200 */  sll        $v0, $v0, 2
    /* 6FEF0 8007FEF0 21105000 */  addu       $v0, $v0, $s0
    /* 6FEF4 8007FEF4 C0100200 */  sll        $v0, $v0, 3
    /* 6FEF8 8007FEF8 1080033C */  lui        $v1, %hi(monster)
    /* 6FEFC 8007FEFC 94536324 */  addiu      $v1, $v1, %lo(monster)
    /* 6FF00 8007FF00 21184300 */  addu       $v1, $v0, $v1
    /* 6FF04 8007FF04 1080013C */  lui        $at, %hi(monster + 0x33)
    /* 6FF08 8007FF08 21082200 */  addu       $at, $at, $v0
    /* 6FF0C 8007FF0C C7532490 */  lbu        $a0, %lo(monster + 0x33)($at)
    /* 6FF10 8007FF10 34006580 */  lb         $a1, 0x34($v1)
    /* 6FF14 8007FF14 35006380 */  lb         $v1, 0x35($v1)
    /* 6FF18 8007FF18 1080013C */  lui        $at, %hi(monster + 0x1A)
    /* 6FF1C 8007FF1C 21082200 */  addu       $at, $at, $v0
    /* 6FF20 8007FF20 AE5320A4 */  sh         $zero, %lo(monster + 0x1A)($at)
    /* 6FF24 8007FF24 1080013C */  lui        $at, %hi(monster + 0x33)
    /* 6FF28 8007FF28 21082200 */  addu       $at, $at, $v0
    /* 6FF2C 8007FF2C C75320A0 */  sb         $zero, %lo(monster + 0x33)($at)
    /* 6FF30 8007FF30 1080013C */  lui        $at, %hi(monster + 0x3A)
    /* 6FF34 8007FF34 21082200 */  addu       $at, $at, $v0
    /* 6FF38 8007FF38 CE5320A0 */  sb         $zero, %lo(monster + 0x3A)($at)
    /* 6FF3C 8007FF3C 1080013C */  lui        $at, %hi(monster + 0x3B)
    /* 6FF40 8007FF40 21082200 */  addu       $at, $at, $v0
    /* 6FF44 8007FF44 CF5320A0 */  sb         $zero, %lo(monster + 0x3B)($at)
    /* 6FF48 8007FF48 1080013C */  lui        $at, %hi(monster + 0x3C)
    /* 6FF4C 8007FF4C 21082200 */  addu       $at, $at, $v0
    /* 6FF50 8007FF50 D05331A0 */  sb         $s1, %lo(monster + 0x3C)($at)
    /* 6FF54 8007FF54 00260400 */  sll        $a0, $a0, 24
    /* 6FF58 8007FF58 03260400 */  sra        $a0, $a0, 24
    /* 6FF5C 8007FF5C 1080013C */  lui        $at, %hi(monster + 0x18)
    /* 6FF60 8007FF60 21082200 */  addu       $at, $at, $v0
    /* 6FF64 8007FF64 AC5324A4 */  sh         $a0, %lo(monster + 0x18)($at)
    /* 6FF68 8007FF68 1080013C */  lui        $at, %hi(monster + 0x36)
    /* 6FF6C 8007FF6C 21082200 */  addu       $at, $at, $v0
    /* 6FF70 8007FF70 CA5325A0 */  sb         $a1, %lo(monster + 0x36)($at)
    /* 6FF74 8007FF74 1080013C */  lui        $at, %hi(monster + 0x37)
    /* 6FF78 8007FF78 21082200 */  addu       $at, $at, $v0
    /* 6FF7C 8007FF7C CB5323A0 */  sb         $v1, %lo(monster + 0x37)($at)
    /* 6FF80 8007FF80 1080013C */  lui        $at, %hi(monster + 0x38)
    /* 6FF84 8007FF84 21082200 */  addu       $at, $at, $v0
    /* 6FF88 8007FF88 CC5325A0 */  sb         $a1, %lo(monster + 0x38)($at)
    /* 6FF8C 8007FF8C 1080013C */  lui        $at, %hi(monster + 0x39)
    /* 6FF90 8007FF90 21082200 */  addu       $at, $at, $v0
    /* 6FF94 8007FF94 CD5323A0 */  sb         $v1, %lo(monster + 0x39)($at)
    /* 6FF98 8007FF98 1080023C */  lui        $v0, %hi(monster + 0x60)
    /* 6FF9C 8007FF9C F453428C */  lw         $v0, %lo(monster + 0x60)($v0)
    /* 6FFA0 8007FFA0 00000000 */  nop
    /* 6FFA4 8007FFA4 12004390 */  lbu        $v1, 0x12($v0)
    /* 6FFA8 8007FFA8 6D000224 */  addiu      $v0, $zero, 0x6D
    /* 6FFAC 8007FFAC 03006210 */  beq        $v1, $v0, .L8007FFBC
    /* 6FFB0 8007FFB0 00000000 */   nop
    /* 6FFB4 8007FFB4 6EFD010C */  jal        M_Enemy__Fi
    /* 6FFB8 8007FFB8 21200002 */   addu      $a0, $s0, $zero
  .L8007FFBC:
    /* 6FFBC 8007FFBC 1800BF8F */  lw         $ra, 0x18($sp)
    /* 6FFC0 8007FFC0 1400B18F */  lw         $s1, 0x14($sp)
    /* 6FFC4 8007FFC4 1000B08F */  lw         $s0, 0x10($sp)
    /* 6FFC8 8007FFC8 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 6FFCC 8007FFCC 0800E003 */  jr         $ra
    /* 6FFD0 8007FFD0 00000000 */   nop
endlabel M_StartStand__Fii
