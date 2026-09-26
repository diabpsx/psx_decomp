.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawAutoMapHorzGrate__Fii, 0x98

glabel DrawAutoMapHorzGrate__Fii
    /* 28CAC 801628A4 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 28CB0 801628A8 1000B0AF */  sw         $s0, 0x10($sp)
    /* 28CB4 801628AC 21808000 */  addu       $s0, $a0, $zero
    /* 28CB8 801628B0 1400B1AF */  sw         $s1, 0x14($sp)
    /* 28CBC 801628B4 2188A000 */  addu       $s1, $a1, $zero
    /* 28CC0 801628B8 3A000424 */  addiu      $a0, $zero, 0x3A
    /* 28CC4 801628BC 38000524 */  addiu      $a1, $zero, 0x38
    /* 28CC8 801628C0 1800BFAF */  sw         $ra, 0x18($sp)
    /* 28CCC 801628C4 FA87050C */  jal        AMGetLine__FUcUcUc
    /* 28CD0 801628C8 2D000624 */   addiu     $a2, $zero, 0x2D
    /* 28CD4 801628CC E81B858F */  lw         $a1, %gp_rel(AutoMapScale)($gp)
    /* 28CD8 801628D0 00000000 */  nop
    /* 28CDC 801628D4 18000502 */  mult       $s0, $a1
    /* 28CE0 801628D8 12800000 */  mflo       $s0
    /* 28CE4 801628DC 00000000 */  nop
    /* 28CE8 801628E0 00000000 */  nop
    /* 28CEC 801628E4 18002502 */  mult       $s1, $a1
    /* 28CF0 801628E8 101C838F */  lw         $v1, %gp_rel(AMPlayerY)($gp)
    /* 28CF4 801628EC 12880000 */  mflo       $s1
    /* 28CF8 801628F0 21203002 */  addu       $a0, $s1, $s0
    /* 28CFC 801628F4 21208300 */  addu       $a0, $a0, $v1
    /* 28D00 801628F8 23801102 */  subu       $s0, $s0, $s1
    /* 28D04 801628FC 0C1C838F */  lw         $v1, %gp_rel(AMPlayerX)($gp)
    /* 28D08 80162900 40801000 */  sll        $s0, $s0, 1
    /* 28D0C 80162904 0A0044A4 */  sh         $a0, 0xA($v0)
    /* 28D10 80162908 21208500 */  addu       $a0, $a0, $a1
    /* 28D14 8016290C 0E0044A4 */  sh         $a0, 0xE($v0)
    /* 28D18 80162910 21800302 */  addu       $s0, $s0, $v1
    /* 28D1C 80162914 40180500 */  sll        $v1, $a1, 1
    /* 28D20 80162918 080050A4 */  sh         $s0, 0x8($v0)
    /* 28D24 8016291C 21800302 */  addu       $s0, $s0, $v1
    /* 28D28 80162920 0C0050A4 */  sh         $s0, 0xC($v0)
    /* 28D2C 80162924 1800BF8F */  lw         $ra, 0x18($sp)
    /* 28D30 80162928 1400B18F */  lw         $s1, 0x14($sp)
    /* 28D34 8016292C 1000B08F */  lw         $s0, 0x10($sp)
    /* 28D38 80162930 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 28D3C 80162934 0800E003 */  jr         $ra
    /* 28D40 80162938 00000000 */   nop
endlabel DrawAutoMapHorzGrate__Fii
