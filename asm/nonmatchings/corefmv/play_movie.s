.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching play_movie, 0xC8

glabel play_movie
    /* 9D128 800AD128 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 9D12C 800AD12C 1800B2AF */  sw         $s2, 0x18($sp)
    /* 9D130 800AD130 21908000 */  addu       $s2, $a0, $zero
    /* 9D134 800AD134 1280033C */  lui        $v1, %hi(FileSYS)
    /* 9D138 800AD138 ECAA638C */  lw         $v1, %lo(FileSYS)($v1)
    /* 9D13C 800AD13C 01000224 */  addiu      $v0, $zero, 0x1
    /* 9D140 800AD140 2000BFAF */  sw         $ra, 0x20($sp)
    /* 9D144 800AD144 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 9D148 800AD148 1400B1AF */  sw         $s1, 0x14($sp)
    /* 9D14C 800AD14C 20006210 */  beq        $v1, $v0, .L800AD1D0
    /* 9D150 800AD150 1000B0AF */   sw        $s0, 0x10($sp)
    /* 9D154 800AD154 0D80103C */  lui        $s0, %hi(FmvTab)
    /* 9D158 800AD158 F4D41026 */  addiu      $s0, $s0, %lo(FmvTab)
    /* 9D15C 800AD15C 21880000 */  addu       $s1, $zero, $zero
    /* 9D160 800AD160 60001326 */  addiu      $s3, $s0, 0x60
  .L800AD164:
    /* 9D164 800AD164 0000058E */  lw         $a1, 0x0($s0)
    /* 9D168 800AD168 7F67000C */  jal        strcmp
    /* 9D16C 800AD16C 21204002 */   addu      $a0, $s2, $zero
    /* 9D170 800AD170 13004014 */  bnez       $v0, .L800AD1C0
    /* 9D174 800AD174 00000000 */   nop
    /* 9D178 800AD178 0000048E */  lw         $a0, 0x0($s0)
    /* 9D17C 800AD17C 01A4000C */  jal        fileexists
    /* 9D180 800AD180 00000000 */   nop
    /* 9D184 800AD184 0A004010 */  beqz       $v0, .L800AD1B0
    /* 9D188 800AD188 00000000 */   nop
    /* 9D18C 800AD18C 0000048E */  lw         $a0, 0x0($s0)
    /* 9D190 800AD190 0D80013C */  lui        $at, %hi(FmvTab + 0x4)
    /* 9D194 800AD194 21083100 */  addu       $at, $at, $s1
    /* 9D198 800AD198 F8D42594 */  lhu        $a1, %lo(FmvTab + 0x4)($at)
    /* 9D19C 800AD19C 0D80013C */  lui        $at, %hi(FmvTab + 0x6)
    /* 9D1A0 800AD1A0 21083100 */  addu       $at, $at, $s1
    /* 9D1A4 800AD1A4 FAD42694 */  lhu        $a2, %lo(FmvTab + 0x6)($at)
    /* 9D1A8 800AD1A8 D6B3020C */  jal        PlayFMV__FPcii
    /* 9D1AC 800AD1AC 00000000 */   nop
  .L800AD1B0:
    /* 9D1B0 800AD1B0 2F6B020C */  jal        SCR_DumpClut__Fv
    /* 9D1B4 800AD1B4 00000000 */   nop
    /* 9D1B8 800AD1B8 74B40208 */  j          .L800AD1D0
    /* 9D1BC 800AD1BC 00000000 */   nop
  .L800AD1C0:
    /* 9D1C0 800AD1C0 08001026 */  addiu      $s0, $s0, 0x8
    /* 9D1C4 800AD1C4 2A101302 */  slt        $v0, $s0, $s3
    /* 9D1C8 800AD1C8 E6FF4014 */  bnez       $v0, .L800AD164
    /* 9D1CC 800AD1CC 08003126 */   addiu     $s1, $s1, 0x8
  .L800AD1D0:
    /* 9D1D0 800AD1D0 2000BF8F */  lw         $ra, 0x20($sp)
    /* 9D1D4 800AD1D4 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 9D1D8 800AD1D8 1800B28F */  lw         $s2, 0x18($sp)
    /* 9D1DC 800AD1DC 1400B18F */  lw         $s1, 0x14($sp)
    /* 9D1E0 800AD1E0 1000B08F */  lw         $s0, 0x10($sp)
    /* 9D1E4 800AD1E4 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 9D1E8 800AD1E8 0800E003 */  jr         $ra
    /* 9D1EC 800AD1EC 00000000 */   nop
endlabel play_movie
