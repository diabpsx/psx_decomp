.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Theme_MonstPit__Fi, 0x144

glabel Theme_MonstPit__Fi
    /* 23580 8015D178 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 23584 8015D17C 3800B6AF */  sw         $s6, 0x38($sp)
    /* 23588 8015D180 21B08000 */  addu       $s6, $a0, $zero
    /* 2358C 8015D184 3C00BFAF */  sw         $ra, 0x3C($sp)
    /* 23590 8015D188 3400B5AF */  sw         $s5, 0x34($sp)
    /* 23594 8015D18C 3000B4AF */  sw         $s4, 0x30($sp)
    /* 23598 8015D190 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 2359C 8015D194 2800B2AF */  sw         $s2, 0x28($sp)
    /* 235A0 8015D198 2400B1AF */  sw         $s1, 0x24($sp)
    /* 235A4 8015D19C 2000B0AF */  sw         $s0, 0x20($sp)
    /* 235A8 8015D1A0 1280053C */  lui        $a1, %hi(D_8011C16C)
    /* 235AC 8015D1A4 6CC1A524 */  addiu      $a1, $a1, %lo(D_8011C16C)
    /* 235B0 8015D1A8 0300A288 */  lwl        $v0, 0x3($a1)
    /* 235B4 8015D1AC 0000A298 */  lwr        $v0, 0x0($a1)
    /* 235B8 8015D1B0 00000000 */  nop
    /* 235BC 8015D1B4 1B00A2AB */  swl        $v0, 0x1B($sp)
    /* 235C0 8015D1B8 1800A2BB */  swr        $v0, 0x18($sp)
    /* 235C4 8015D1BC C9F6000C */  jal        ENG_random__Fl
    /* 235C8 8015D1C0 64000424 */   addiu     $a0, $zero, 0x64
    /* 235CC 8015D1C4 01005324 */  addiu      $s3, $v0, 0x1
    /* 235D0 8015D1C8 21800000 */  addu       $s0, $zero, $zero
    /* 235D4 8015D1CC 2000601A */  blez       $s3, .L8015D250
    /* 235D8 8015D1D0 21880000 */   addu      $s1, $zero, $zero
    /* 235DC 8015D1D4 C0A81600 */  sll        $s5, $s6, 3
    /* 235E0 8015D1D8 60001424 */  addiu      $s4, $zero, 0x60
    /* 235E4 8015D1DC 21900000 */  addu       $s2, $zero, $zero
  .L8015D1E0:
    /* 235E8 8015D1E0 C0101100 */  sll        $v0, $s1, 3
  .L8015D1E4:
    /* 235EC 8015D1E4 21105200 */  addu       $v0, $v0, $s2
    /* 235F0 8015D1E8 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 235F4 8015D1EC 21082200 */  addu       $at, $at, $v0
    /* 235F8 8015D1F0 2F7A2380 */  lb         $v1, %lo(dung_map + 0x7)($at)
    /* 235FC 8015D1F4 1080013C */  lui        $at, %hi(theme + 0x4)
    /* 23600 8015D1F8 21083500 */  addu       $at, $at, $s5
    /* 23604 8015D1FC 4C28228C */  lw         $v0, %lo(theme + 0x4)($at)
    /* 23608 8015D200 00000000 */  nop
    /* 2360C 8015D204 07006214 */  bne        $v1, $v0, .L8015D224
    /* 23610 8015D208 21200002 */   addu      $a0, $s0, $zero
    /* 23614 8015D20C 380B020C */  jal        GetSOLID__Fii
    /* 23618 8015D210 21282002 */   addu      $a1, $s1, $zero
    /* 2361C 8015D214 01004238 */  xori       $v0, $v0, 0x1
    /* 23620 8015D218 02004010 */  beqz       $v0, .L8015D224
    /* 23624 8015D21C 00000000 */   nop
    /* 23628 8015D220 FFFF7326 */  addiu      $s3, $s3, -0x1
  .L8015D224:
    /* 2362C 8015D224 0B00601A */  blez       $s3, .L8015D254
    /* 23630 8015D228 21200002 */   addu      $a0, $s0, $zero
    /* 23634 8015D22C 01001026 */  addiu      $s0, $s0, 0x1
    /* 23638 8015D230 EBFF1416 */  bne        $s0, $s4, .L8015D1E0
    /* 2363C 8015D234 80035226 */   addiu     $s2, $s2, 0x380
    /* 23640 8015D238 21900000 */  addu       $s2, $zero, $zero
    /* 23644 8015D23C 01003126 */  addiu      $s1, $s1, 0x1
    /* 23648 8015D240 13003412 */  beq        $s1, $s4, .L8015D290
    /* 2364C 8015D244 21800000 */   addu      $s0, $zero, $zero
    /* 23650 8015D248 79740508 */  j          .L8015D1E4
    /* 23654 8015D24C C0101100 */   sll       $v0, $s1, 3
  .L8015D250:
    /* 23658 8015D250 21200002 */  addu       $a0, $s0, $zero
  .L8015D254:
    /* 2365C 8015D254 21282002 */  addu       $a1, $s1, $zero
    /* 23660 8015D258 01000224 */  addiu      $v0, $zero, 0x1
    /* 23664 8015D25C 01000624 */  addiu      $a2, $zero, 0x1
    /* 23668 8015D260 21380000 */  addu       $a3, $zero, $zero
    /* 2366C 8015D264 F612010C */  jal        CreateRndItem__FiiUcUcUc
    /* 23670 8015D268 1000A2AF */   sw        $v0, 0x10($sp)
    /* 23674 8015D26C CF22010C */  jal        ItemNoFlippy__Fv
    /* 23678 8015D270 00000000 */   nop
    /* 2367C 8015D274 1280023C */  lui        $v0, %hi(leveltype)
    /* 23680 8015D278 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 23684 8015D27C 00000000 */  nop
    /* 23688 8015D280 2110A203 */  addu       $v0, $sp, $v0
    /* 2368C 8015D284 17004580 */  lb         $a1, 0x17($v0)
    /* 23690 8015D288 6C73050C */  jal        PlaceThemeMonsts__Fii
    /* 23694 8015D28C 2120C002 */   addu      $a0, $s6, $zero
  .L8015D290:
    /* 23698 8015D290 3C00BF8F */  lw         $ra, 0x3C($sp)
    /* 2369C 8015D294 3800B68F */  lw         $s6, 0x38($sp)
    /* 236A0 8015D298 3400B58F */  lw         $s5, 0x34($sp)
    /* 236A4 8015D29C 3000B48F */  lw         $s4, 0x30($sp)
    /* 236A8 8015D2A0 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 236AC 8015D2A4 2800B28F */  lw         $s2, 0x28($sp)
    /* 236B0 8015D2A8 2400B18F */  lw         $s1, 0x24($sp)
    /* 236B4 8015D2AC 2000B08F */  lw         $s0, 0x20($sp)
    /* 236B8 8015D2B0 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 236BC 8015D2B4 0800E003 */  jr         $ra
    /* 236C0 8015D2B8 00000000 */   nop
endlabel Theme_MonstPit__Fi
