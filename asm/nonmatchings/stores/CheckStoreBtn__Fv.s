.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CheckStoreBtn__Fv, 0xEC

glabel CheckStoreBtn__Fv
    /* 64228 80074228 1280023C */  lui        $v0, %hi(CDWAIT)
    /* 6422C 8007422C ECAD428C */  lw         $v0, %lo(CDWAIT)($v0)
    /* 64230 80074230 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 64234 80074234 1400BFAF */  sw         $ra, 0x14($sp)
    /* 64238 80074238 31004014 */  bnez       $v0, .L80074300
    /* 6423C 8007423C 1000B0AF */   sw        $s0, 0x10($sp)
    /* 64240 80074240 1280023C */  lui        $v0, %hi(qtextflag)
    /* 64244 80074244 60B94290 */  lbu        $v0, %lo(qtextflag)($v0)
    /* 64248 80074248 00000000 */  nop
    /* 6424C 8007424C 2C004014 */  bnez       $v0, .L80074300
    /* 64250 80074250 00000000 */   nop
    /* 64254 80074254 1280043C */  lui        $a0, %hi(options_pad)
    /* 64258 80074258 50B2848C */  lw         $a0, %lo(options_pad)($a0)
    /* 6425C 8007425C FD25020C */  jal        PAD_GetPad__FiUc
    /* 64260 80074260 21280000 */   addu      $a1, $zero, $zero
    /* 64264 80074264 21804000 */  addu       $s0, $v0, $zero
    /* 64268 80074268 DED0010C */  jal        GetDown__C4CPad_80074378
    /* 6426C 8007426C 21200002 */   addu      $a0, $s0, $zero
    /* 64270 80074270 01004230 */  andi       $v0, $v0, 0x1
    /* 64274 80074274 03004010 */  beqz       $v0, .L80074284
    /* 64278 80074278 00000000 */   nop
    /* 6427C 8007427C 96C0010C */  jal        STextUp__Fv
    /* 64280 80074280 00000000 */   nop
  .L80074284:
    /* 64284 80074284 DED0010C */  jal        GetDown__C4CPad_80074378
    /* 64288 80074288 21200002 */   addu      $a0, $s0, $zero
    /* 6428C 8007428C 02004230 */  andi       $v0, $v0, 0x2
    /* 64290 80074290 03004010 */  beqz       $v0, .L800742A0
    /* 64294 80074294 00000000 */   nop
    /* 64298 80074298 F7C0010C */  jal        STextDown__Fv
    /* 6429C 8007429C 00000000 */   nop
  .L800742A0:
    /* 642A0 800742A0 DED0010C */  jal        GetDown__C4CPad_80074378
    /* 642A4 800742A4 21200002 */   addu      $a0, $s0, $zero
    /* 642A8 800742A8 40004230 */  andi       $v0, $v0, 0x40
    /* 642AC 800742AC 07004010 */  beqz       $v0, .L800742CC
    /* 642B0 800742B0 FFFF0224 */   addiu     $v0, $zero, -0x1
    /* 642B4 800742B4 0421838F */  lw         $v1, %gp_rel(D_8011C884)($gp)
    /* 642B8 800742B8 00000000 */  nop
    /* 642BC 800742BC 03006210 */  beq        $v1, $v0, .L800742CC
    /* 642C0 800742C0 00000000 */   nop
    /* 642C4 800742C4 19D0010C */  jal        STextEnter__Fv
    /* 642C8 800742C8 00000000 */   nop
  .L800742CC:
    /* 642CC 800742CC DED0010C */  jal        GetDown__C4CPad_80074378
    /* 642D0 800742D0 21200002 */   addu      $a0, $s0, $zero
    /* 642D4 800742D4 00014230 */  andi       $v0, $v0, 0x100
    /* 642D8 800742D8 03004010 */  beqz       $v0, .L800742E8
    /* 642DC 800742DC 00000000 */   nop
    /* 642E0 800742E0 2DC0010C */  jal        STextESC__Fv
    /* 642E4 800742E4 00000000 */   nop
  .L800742E8:
    /* 642E8 800742E8 60138283 */  lb         $v0, %gp_rel(stextflag)($gp)
    /* 642EC 800742EC 00000000 */  nop
    /* 642F0 800742F0 03004014 */  bnez       $v0, .L80074300
    /* 642F4 800742F4 FFFF0224 */   addiu     $v0, $zero, -0x1
    /* 642F8 800742F8 1280013C */  lui        $at, %hi(options_pad)
    /* 642FC 800742FC 50B222AC */  sw         $v0, %lo(options_pad)($at)
  .L80074300:
    /* 64300 80074300 1400BF8F */  lw         $ra, 0x14($sp)
    /* 64304 80074304 1000B08F */  lw         $s0, 0x10($sp)
    /* 64308 80074308 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 6430C 8007430C 0800E003 */  jr         $ra
    /* 64310 80074310 00000000 */   nop
endlabel CheckStoreBtn__Fv
