.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching pad_func_Quick_Spell__Fi, 0x174

glabel pad_func_Quick_Spell__Fi
    /* 92618 800A2618 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 9261C 800A261C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 92620 800A2620 21808000 */  addu       $s0, $a0, $zero
    /* 92624 800A2624 40101000 */  sll        $v0, $s0, 1
    /* 92628 800A2628 21105000 */  addu       $v0, $v0, $s0
    /* 9262C 800A262C 80100200 */  sll        $v0, $v0, 2
    /* 92630 800A2630 21105000 */  addu       $v0, $v0, $s0
    /* 92634 800A2634 00110200 */  sll        $v0, $v0, 4
    /* 92638 800A2638 23105000 */  subu       $v0, $v0, $s0
    /* 9263C 800A263C 80100200 */  sll        $v0, $v0, 2
    /* 92640 800A2640 21105000 */  addu       $v0, $v0, $s0
    /* 92644 800A2644 C0100200 */  sll        $v0, $v0, 3
    /* 92648 800A2648 0E80033C */  lui        $v1, %hi(plr)
    /* 9264C 800A264C 38A56324 */  addiu      $v1, $v1, %lo(plr)
    /* 92650 800A2650 1400B1AF */  sw         $s1, 0x14($sp)
    /* 92654 800A2654 21884300 */  addu       $s1, $v0, $v1
    /* 92658 800A2658 2800BFAF */  sw         $ra, 0x28($sp)
    /* 9265C 800A265C 2400B5AF */  sw         $s5, 0x24($sp)
    /* 92660 800A2660 2000B4AF */  sw         $s4, 0x20($sp)
    /* 92664 800A2664 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 92668 800A2668 1800B2AF */  sw         $s2, 0x18($sp)
    /* 9266C 800A266C 1280013C */  lui        $at, %hi(QSpell)
    /* 92670 800A2670 21083000 */  addu       $at, $at, $s0
    /* 92674 800A2674 20B13280 */  lb         $s2, %lo(QSpell)($at)
    /* 92678 800A2678 1280013C */  lui        $at, %hi(_spltotype)
    /* 9267C 800A267C 21083000 */  addu       $at, $at, $s0
    /* 92680 800A2680 24B13480 */  lb         $s4, %lo(_spltotype)($at)
    /* 92684 800A2684 6400358E */  lw         $s5, 0x64($s1)
    /* 92688 800A2688 68003392 */  lbu        $s3, 0x68($s1)
    /* 9268C 800A268C A4BF020C */  jal        GetSpellTarget__Fi
    /* 92690 800A2690 00000000 */   nop
    /* 92694 800A2694 C890020C */  jal        Active__11SpellTarget_800a4320
    /* 92698 800A2698 21204000 */   addu      $a0, $v0, $zero
    /* 9269C 800A269C 05004010 */  beqz       $v0, .L800A26B4
    /* 926A0 800A26A0 03000224 */   addiu     $v0, $zero, 0x3
    /* 926A4 800A26A4 C6F5000C */  jal        PlaySFX__Fi
    /* 926A8 800A26A8 D3030424 */   addiu     $a0, $zero, 0x3D3
    /* 926AC 800A26AC D9890208 */  j          .L800A2764
    /* 926B0 800A26B0 00000000 */   nop
  .L800A26B4:
    /* 926B4 800A26B4 1280013C */  lui        $at, %hi(_spltotype)
    /* 926B8 800A26B8 21083000 */  addu       $at, $at, $s0
    /* 926BC 800A26BC 24B12380 */  lb         $v1, %lo(_spltotype)($at)
    /* 926C0 800A26C0 00000000 */  nop
    /* 926C4 800A26C4 1D006214 */  bne        $v1, $v0, .L800A273C
    /* 926C8 800A26C8 21200002 */   addu      $a0, $s0, $zero
    /* 926CC 800A26CC B019228E */  lw         $v0, 0x19B0($s1)
    /* 926D0 800A26D0 B419238E */  lw         $v1, 0x19B4($s1)
    /* 926D4 800A26D4 FFFF4426 */  addiu      $a0, $s2, -0x1
    /* 926D8 800A26D8 80360400 */  sll        $a2, $a0, 26
    /* 926DC 800A26DC 0400C104 */  bgez       $a2, .L800A26F0
    /* 926E0 800A26E0 00000000 */   nop
    /* 926E4 800A26E4 06408300 */  srlv       $t0, $v1, $a0
    /* 926E8 800A26E8 07000104 */  bgez       $zero, .L800A2708
    /* 926EC 800A26EC 21480000 */   addu      $t1, $zero, $zero
  .L800A26F0:
    /* 926F0 800A26F0 0400C010 */  beqz       $a2, .L800A2704
    /* 926F4 800A26F4 06408200 */   srlv      $t0, $v0, $a0
    /* 926F8 800A26F8 23300400 */  negu       $a2, $a0
    /* 926FC 800A26FC 0430C300 */  sllv       $a2, $v1, $a2
    /* 92700 800A2700 25400601 */  or         $t0, $t0, $a2
  .L800A2704:
    /* 92704 800A2704 06488300 */  srlv       $t1, $v1, $a0
  .L800A2708:
    /* 92708 800A2708 21200001 */  addu       $a0, $t0, $zero
    /* 9270C 800A270C 21282001 */  addu       $a1, $t1, $zero
    /* 92710 800A2710 00000324 */  addiu      $v1, $zero, 0x0
    /* 92714 800A2714 01000224 */  addiu      $v0, $zero, 0x1
    /* 92718 800A2718 2428A300 */  and        $a1, $a1, $v1
    /* 9271C 800A271C 24208200 */  and        $a0, $a0, $v0
    /* 92720 800A2720 05008014 */  bnez       $a0, .L800A2738
    /* 92724 800A2724 00000000 */   nop
    /* 92728 800A2728 0300A014 */  bnez       $a1, .L800A2738
    /* 9272C 800A272C 00000000 */   nop
    /* 92730 800A2730 FFFF1224 */  addiu      $s2, $zero, -0x1
    /* 92734 800A2734 04001424 */  addiu      $s4, $zero, 0x4
  .L800A2738:
    /* 92738 800A2738 21200002 */  addu       $a0, $s0, $zero
  .L800A273C:
    /* 9273C 800A273C 00361300 */  sll        $a2, $s3, 24
    /* 92740 800A2740 2128A002 */  addu       $a1, $s5, $zero
    /* 92744 800A2744 03360600 */  sra        $a2, $a2, 24
    /* 92748 800A2748 640032AE */  sw         $s2, 0x64($s1)
    /* 9274C 800A274C 7782020C */  jal        SetQSpell__Fiii
    /* 92750 800A2750 680034A2 */   sb        $s4, 0x68($s1)
    /* 92754 800A2754 C6F5000C */  jal        PlaySFX__Fi
    /* 92758 800A2758 32000424 */   addiu     $a0, $zero, 0x32
    /* 9275C 800A275C 4CFC000C */  jal        CalcPlrScrolls__Fi
    /* 92760 800A2760 21200002 */   addu      $a0, $s0, $zero
  .L800A2764:
    /* 92764 800A2764 2800BF8F */  lw         $ra, 0x28($sp)
    /* 92768 800A2768 2400B58F */  lw         $s5, 0x24($sp)
    /* 9276C 800A276C 2000B48F */  lw         $s4, 0x20($sp)
    /* 92770 800A2770 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 92774 800A2774 1800B28F */  lw         $s2, 0x18($sp)
    /* 92778 800A2778 1400B18F */  lw         $s1, 0x14($sp)
    /* 9277C 800A277C 1000B08F */  lw         $s0, 0x10($sp)
    /* 92780 800A2780 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 92784 800A2784 0800E003 */  jr         $ra
    /* 92788 800A2788 00000000 */   nop
endlabel pad_func_Quick_Spell__Fi
