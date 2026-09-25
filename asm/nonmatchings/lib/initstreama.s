.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching initstreama, 0xE4

glabel initstreama
    /* 1CDDC 8002CDDC 641D828F */  lw         $v0, %gp_rel(maxstreamblocks)($gp)
    /* 1CDE0 8002CDE0 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 1CDE4 8002CDE4 1400B1AF */  sw         $s1, 0x14($sp)
    /* 1CDE8 8002CDE8 21888000 */  addu       $s1, $a0, $zero
    /* 1CDEC 8002CDEC 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 1CDF0 8002CDF0 2198A000 */  addu       $s3, $a1, $zero
    /* 1CDF4 8002CDF4 1180043C */  lui        $a0, %hi(D_8010FB7C)
    /* 1CDF8 8002CDF8 7CFB8424 */  addiu      $a0, $a0, %lo(D_8010FB7C)
    /* 1CDFC 8002CDFC 1800B2AF */  sw         $s2, 0x18($sp)
    /* 1CE00 8002CE00 2190E000 */  addu       $s2, $a3, $zero
    /* 1CE04 8002CE04 2000BFAF */  sw         $ra, 0x20($sp)
    /* 1CE08 8002CE08 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1CE0C 8002CE0C 80280200 */  sll        $a1, $v0, 2
    /* 1CE10 8002CE10 2128A200 */  addu       $a1, $a1, $v0
    /* 1CE14 8002CE14 C0280500 */  sll        $a1, $a1, 3
    /* 1CE18 8002CE18 2328A200 */  subu       $a1, $a1, $v0
    /* 1CE1C 8002CE1C 80280500 */  sll        $a1, $a1, 2
    /* 1CE20 8002CE20 0F00A524 */  addiu      $a1, $a1, 0xF
    /* 1CE24 8002CE24 F0FFA530 */  andi       $a1, $a1, 0xFFF0
    /* 1CE28 8002CE28 A000A524 */  addiu      $a1, $a1, 0xA0
    /* 1CE2C 8002CE2C 8CA9000C */  jal        reservememadra
    /* 1CE30 8002CE30 21282502 */   addu      $a1, $s1, $a1
    /* 1CE34 8002CE34 641D838F */  lw         $v1, %gp_rel(maxstreamblocks)($gp)
    /* 1CE38 8002CE38 21804000 */  addu       $s0, $v0, $zero
    /* 1CE3C 8002CE3C 21200002 */  addu       $a0, $s0, $zero
    /* 1CE40 8002CE40 80280300 */  sll        $a1, $v1, 2
    /* 1CE44 8002CE44 2128A300 */  addu       $a1, $a1, $v1
    /* 1CE48 8002CE48 C0280500 */  sll        $a1, $a1, 3
    /* 1CE4C 8002CE4C 2328A300 */  subu       $a1, $a1, $v1
    /* 1CE50 8002CE50 80280500 */  sll        $a1, $a1, 2
    /* 1CE54 8002CE54 0F00A524 */  addiu      $a1, $a1, 0xF
    /* 1CE58 8002CE58 F0FFA530 */  andi       $a1, $a1, 0xFFF0
    /* 1CE5C 8002CE5C A000A524 */  addiu      $a1, $a1, 0xA0
    /* 1CE60 8002CE60 A0B1000C */  jal        blockclear
    /* 1CE64 8002CE64 21282502 */   addu      $a1, $s1, $a1
    /* 1CE68 8002CE68 641D828F */  lw         $v0, %gp_rel(maxstreamblocks)($gp)
    /* 1CE6C 8002CE6C 21200002 */  addu       $a0, $s0, $zero
    /* 1CE70 8002CE70 21306002 */  addu       $a2, $s3, $zero
    /* 1CE74 8002CE74 21384002 */  addu       $a3, $s2, $zero
    /* 1CE78 8002CE78 80280200 */  sll        $a1, $v0, 2
    /* 1CE7C 8002CE7C 2128A200 */  addu       $a1, $a1, $v0
    /* 1CE80 8002CE80 C0280500 */  sll        $a1, $a1, 3
    /* 1CE84 8002CE84 2328A200 */  subu       $a1, $a1, $v0
    /* 1CE88 8002CE88 80280500 */  sll        $a1, $a1, 2
    /* 1CE8C 8002CE8C 0F00A524 */  addiu      $a1, $a1, 0xF
    /* 1CE90 8002CE90 F0FFA530 */  andi       $a1, $a1, 0xFFF0
    /* 1CE94 8002CE94 A000A524 */  addiu      $a1, $a1, 0xA0
    /* 1CE98 8002CE98 05B3000C */  jal        initstreamstructa
    /* 1CE9C 8002CE9C 21282502 */   addu      $a1, $s1, $a1
    /* 1CEA0 8002CEA0 2000BF8F */  lw         $ra, 0x20($sp)
    /* 1CEA4 8002CEA4 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 1CEA8 8002CEA8 1800B28F */  lw         $s2, 0x18($sp)
    /* 1CEAC 8002CEAC 1400B18F */  lw         $s1, 0x14($sp)
    /* 1CEB0 8002CEB0 1000B08F */  lw         $s0, 0x10($sp)
    /* 1CEB4 8002CEB4 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 1CEB8 8002CEB8 0800E003 */  jr         $ra
    /* 1CEBC 8002CEBC 00000000 */   nop
endlabel initstreama
