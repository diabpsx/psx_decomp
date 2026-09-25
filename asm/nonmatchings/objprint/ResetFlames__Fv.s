.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ResetFlames__Fv, 0xC8

glabel ResetFlames__Fv
    /* 6DD08 8007DD08 C814828F */  lw         $v0, %gp_rel(MissDat + 0x20)($gp)
    /* 6DD0C 8007DD0C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 6DD10 8007DD10 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 6DD14 8007DD14 1800B2AF */  sw         $s2, 0x18($sp)
    /* 6DD18 8007DD18 1400B1AF */  sw         $s1, 0x14($sp)
    /* 6DD1C 8007DD1C 23004010 */  beqz       $v0, .L8007DDAC
    /* 6DD20 8007DD20 1000B0AF */   sw        $s0, 0x10($sp)
    /* 6DD24 8007DD24 21880000 */  addu       $s1, $zero, $zero
    /* 6DD28 8007DD28 CCCC123C */  lui        $s2, (0xCCCCCCCD >> 16)
    /* 6DD2C 8007DD2C CDCC5236 */  ori        $s2, $s2, (0xCCCCCCCD & 0xFFFF)
    /* 6DD30 8007DD30 21800000 */  addu       $s0, $zero, $zero
  .L8007DD34:
    /* 6DD34 8007DD34 3D83000C */  jal        GU_GetRnd
    /* 6DD38 8007DD38 01003126 */   addiu     $s1, $s1, 0x1
    /* 6DD3C 8007DD3C 19005200 */  multu      $v0, $s2
    /* 6DD40 8007DD40 10280000 */  mfhi       $a1
    /* 6DD44 8007DD44 82200500 */  srl        $a0, $a1, 2
    /* 6DD48 8007DD48 80180400 */  sll        $v1, $a0, 2
    /* 6DD4C 8007DD4C 21186400 */  addu       $v1, $v1, $a0
    /* 6DD50 8007DD50 23104300 */  subu       $v0, $v0, $v1
    /* 6DD54 8007DD54 02004224 */  addiu      $v0, $v0, 0x2
    /* 6DD58 8007DD58 1380013C */  lui        $at, %hi(D_8012FD20)
    /* 6DD5C 8007DD5C 21083000 */  addu       $at, $at, $s0
    /* 6DD60 8007DD60 20FD22A4 */  sh         $v0, %lo(D_8012FD20)($at)
    /* 6DD64 8007DD64 3D83000C */  jal        GU_GetRnd
    /* 6DD68 8007DD68 00000000 */   nop
    /* 6DD6C 8007DD6C 0F004230 */  andi       $v0, $v0, 0xF
    /* 6DD70 8007DD70 00120200 */  sll        $v0, $v0, 8
    /* 6DD74 8007DD74 1380013C */  lui        $at, %hi(D_8012FD22)
    /* 6DD78 8007DD78 21083000 */  addu       $at, $at, $s0
    /* 6DD7C 8007DD7C 22FD22A4 */  sh         $v0, %lo(D_8012FD22)($at)
    /* 6DD80 8007DD80 3D83000C */  jal        GU_GetRnd
    /* 6DD84 8007DD84 00000000 */   nop
    /* 6DD88 8007DD88 7F004230 */  andi       $v0, $v0, 0x7F
    /* 6DD8C 8007DD8C 20004224 */  addiu      $v0, $v0, 0x20
    /* 6DD90 8007DD90 1380013C */  lui        $at, %hi(D_8012FD24)
    /* 6DD94 8007DD94 21083000 */  addu       $at, $at, $s0
    /* 6DD98 8007DD98 24FD22A4 */  sh         $v0, %lo(D_8012FD24)($at)
    /* 6DD9C 8007DD9C 1000222A */  slti       $v0, $s1, 0x10
    /* 6DDA0 8007DDA0 E4FF4014 */  bnez       $v0, .L8007DD34
    /* 6DDA4 8007DDA4 06001026 */   addiu     $s0, $s0, 0x6
    /* 6DDA8 8007DDA8 C81480AF */  sw         $zero, %gp_rel(MissDat + 0x20)($gp)
  .L8007DDAC:
    /* 6DDAC 8007DDAC 01000224 */  addiu      $v0, $zero, 0x1
    /* 6DDB0 8007DDB0 CC1482AF */  sw         $v0, %gp_rel(MissDat + 0x24)($gp)
    /* 6DDB4 8007DDB4 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 6DDB8 8007DDB8 1800B28F */  lw         $s2, 0x18($sp)
    /* 6DDBC 8007DDBC 1400B18F */  lw         $s1, 0x14($sp)
    /* 6DDC0 8007DDC0 1000B08F */  lw         $s0, 0x10($sp)
    /* 6DDC4 8007DDC4 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 6DDC8 8007DDC8 0800E003 */  jr         $ra
    /* 6DDCC 8007DDCC 00000000 */   nop
endlabel ResetFlames__Fv
