.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetDropShadowG4__FUcUcUcUcUcUcUcUcUcUcUcUc, 0x138

glabel GetDropShadowG4__FUcUcUcUcUcUcUcUcUcUcUcUc
    /* 7B748 8008B748 B0FFBD27 */  addiu      $sp, $sp, -0x50
    /* 7B74C 8008B74C 3800B4AF */  sw         $s4, 0x38($sp)
    /* 7B750 8008B750 6000B493 */  lbu        $s4, 0x60($sp)
    /* 7B754 8008B754 3C00B5AF */  sw         $s5, 0x3C($sp)
    /* 7B758 8008B758 6400B593 */  lbu        $s5, 0x64($sp)
    /* 7B75C 8008B75C 4000B6AF */  sw         $s6, 0x40($sp)
    /* 7B760 8008B760 6800B693 */  lbu        $s6, 0x68($sp)
    /* 7B764 8008B764 4400B7AF */  sw         $s7, 0x44($sp)
    /* 7B768 8008B768 6C00B793 */  lbu        $s7, 0x6C($sp)
    /* 7B76C 8008B76C 4800BEAF */  sw         $fp, 0x48($sp)
    /* 7B770 8008B770 7000BE93 */  lbu        $fp, 0x70($sp)
    /* 7B774 8008B774 7400A893 */  lbu        $t0, 0x74($sp)
    /* 7B778 8008B778 2800B0AF */  sw         $s0, 0x28($sp)
    /* 7B77C 8008B77C 21808000 */  addu       $s0, $a0, $zero
    /* 7B780 8008B780 2C00B1AF */  sw         $s1, 0x2C($sp)
    /* 7B784 8008B784 2188A000 */  addu       $s1, $a1, $zero
    /* 7B788 8008B788 3000B2AF */  sw         $s2, 0x30($sp)
    /* 7B78C 8008B78C 1000A8A3 */  sb         $t0, 0x10($sp)
    /* 7B790 8008B790 7800A893 */  lbu        $t0, 0x78($sp)
    /* 7B794 8008B794 2190C000 */  addu       $s2, $a2, $zero
    /* 7B798 8008B798 3400B3AF */  sw         $s3, 0x34($sp)
    /* 7B79C 8008B79C 1800A8A3 */  sb         $t0, 0x18($sp)
    /* 7B7A0 8008B7A0 7C00A893 */  lbu        $t0, 0x7C($sp)
    /* 7B7A4 8008B7A4 2198E000 */  addu       $s3, $a3, $zero
    /* 7B7A8 8008B7A8 4C00BFAF */  sw         $ra, 0x4C($sp)
    /* 7B7AC 8008B7AC 9B0F020C */  jal        PRIM_GetNextPolyG4__Fv
    /* 7B7B0 8008B7B0 2000A8A3 */   sb        $t0, 0x20($sp)
    /* 7B7B4 8008B7B4 08000324 */  addiu      $v1, $zero, 0x8
    /* 7B7B8 8008B7B8 030043A0 */  sb         $v1, 0x3($v0)
    /* 7B7BC 8008B7BC 0000448C */  lw         $a0, 0x0($v0)
    /* 7B7C0 8008B7C0 3A000324 */  addiu      $v1, $zero, 0x3A
    /* 7B7C4 8008B7C4 070043A0 */  sb         $v1, 0x7($v0)
    /* 7B7C8 8008B7C8 040050A0 */  sb         $s0, 0x4($v0)
    /* 7B7CC 8008B7CC 050051A0 */  sb         $s1, 0x5($v0)
    /* 7B7D0 8008B7D0 060052A0 */  sb         $s2, 0x6($v0)
    /* 7B7D4 8008B7D4 0C0053A0 */  sb         $s3, 0xC($v0)
    /* 7B7D8 8008B7D8 0D0054A0 */  sb         $s4, 0xD($v0)
    /* 7B7DC 8008B7DC 0E0055A0 */  sb         $s5, 0xE($v0)
    /* 7B7E0 8008B7E0 140056A0 */  sb         $s6, 0x14($v0)
    /* 7B7E4 8008B7E4 150057A0 */  sb         $s7, 0x15($v0)
    /* 7B7E8 8008B7E8 16005EA0 */  sb         $fp, 0x16($v0)
    /* 7B7EC 8008B7EC 1000A893 */  lbu        $t0, 0x10($sp)
    /* 7B7F0 8008B7F0 FF00073C */  lui        $a3, (0xFFFFFF >> 16)
    /* 7B7F4 8008B7F4 1C0048A0 */  sb         $t0, 0x1C($v0)
    /* 7B7F8 8008B7F8 1800A893 */  lbu        $t0, 0x18($sp)
    /* 7B7FC 8008B7FC FFFFE734 */  ori        $a3, $a3, (0xFFFFFF & 0xFFFF)
    /* 7B800 8008B800 1D0048A0 */  sb         $t0, 0x1D($v0)
    /* 7B804 8008B804 2000A893 */  lbu        $t0, 0x20($sp)
    /* 7B808 8008B808 00FF063C */  lui        $a2, (0xFF000000 >> 16)
    /* 7B80C 8008B80C 1E0048A0 */  sb         $t0, 0x1E($v0)
    /* 7B810 8008B810 F404858F */  lw         $a1, %gp_rel(MY_DialogOTpos)($gp)
    /* 7B814 8008B814 1280033C */  lui        $v1, %hi(ThisOt)
    /* 7B818 8008B818 B4AA638C */  lw         $v1, %lo(ThisOt)($v1)
    /* 7B81C 8008B81C 80280500 */  sll        $a1, $a1, 2
    /* 7B820 8008B820 2128A300 */  addu       $a1, $a1, $v1
    /* 7B824 8008B824 0000A38C */  lw         $v1, 0x0($a1)
    /* 7B828 8008B828 24208600 */  and        $a0, $a0, $a2
    /* 7B82C 8008B82C 24186700 */  and        $v1, $v1, $a3
    /* 7B830 8008B830 25208300 */  or         $a0, $a0, $v1
    /* 7B834 8008B834 000044AC */  sw         $a0, 0x0($v0)
    /* 7B838 8008B838 0000A38C */  lw         $v1, 0x0($a1)
    /* 7B83C 8008B83C 24204700 */  and        $a0, $v0, $a3
    /* 7B840 8008B840 24186600 */  and        $v1, $v1, $a2
    /* 7B844 8008B844 25186400 */  or         $v1, $v1, $a0
    /* 7B848 8008B848 0000A3AC */  sw         $v1, 0x0($a1)
    /* 7B84C 8008B84C 4C00BF8F */  lw         $ra, 0x4C($sp)
    /* 7B850 8008B850 4800BE8F */  lw         $fp, 0x48($sp)
    /* 7B854 8008B854 4400B78F */  lw         $s7, 0x44($sp)
    /* 7B858 8008B858 4000B68F */  lw         $s6, 0x40($sp)
    /* 7B85C 8008B85C 3C00B58F */  lw         $s5, 0x3C($sp)
    /* 7B860 8008B860 3800B48F */  lw         $s4, 0x38($sp)
    /* 7B864 8008B864 3400B38F */  lw         $s3, 0x34($sp)
    /* 7B868 8008B868 3000B28F */  lw         $s2, 0x30($sp)
    /* 7B86C 8008B86C 2C00B18F */  lw         $s1, 0x2C($sp)
    /* 7B870 8008B870 2800B08F */  lw         $s0, 0x28($sp)
    /* 7B874 8008B874 5000BD27 */  addiu      $sp, $sp, 0x50
    /* 7B878 8008B878 0800E003 */  jr         $ra
    /* 7B87C 8008B87C 00000000 */   nop
endlabel GetDropShadowG4__FUcUcUcUcUcUcUcUcUcUcUcUc
