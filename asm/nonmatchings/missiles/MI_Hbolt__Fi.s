.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MI_Hbolt__Fi, 0x32C

glabel MI_Hbolt__Fi
    /* F96C 80149564 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* F970 80149568 2C00B1AF */  sw         $s1, 0x2C($sp)
    /* F974 8014956C 21888000 */  addu       $s1, $a0, $zero
    /* F978 80149570 80101100 */  sll        $v0, $s1, 2
    /* F97C 80149574 21105100 */  addu       $v0, $v0, $s1
    /* F980 80149578 80100200 */  sll        $v0, $v0, 2
    /* F984 8014957C 23105100 */  subu       $v0, $v0, $s1
    /* F988 80149580 2800B0AF */  sw         $s0, 0x28($sp)
    /* F98C 80149584 80800200 */  sll        $s0, $v0, 2
    /* F990 80149588 3000BFAF */  sw         $ra, 0x30($sp)
    /* F994 8014958C 1080013C */  lui        $at, %hi(missile + 0x18)
    /* F998 80149590 21083000 */  addu       $at, $at, $s0
    /* F99C 80149594 702C2294 */  lhu        $v0, %lo(missile + 0x18)($at)
    /* F9A0 80149598 1080013C */  lui        $at, %hi(missile + 0x37)
    /* F9A4 8014959C 21083000 */  addu       $at, $at, $s0
    /* F9A8 801495A0 8F2C2390 */  lbu        $v1, %lo(missile + 0x37)($at)
    /* F9AC 801495A4 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* F9B0 801495A8 1080013C */  lui        $at, %hi(missile + 0x18)
    /* F9B4 801495AC 21083000 */  addu       $at, $at, $s0
    /* F9B8 801495B0 702C22A4 */  sh         $v0, %lo(missile + 0x18)($at)
    /* F9BC 801495B4 1C000224 */  addiu      $v0, $zero, 0x1C
    /* F9C0 801495B8 94006210 */  beq        $v1, $v0, .L8014980C
    /* F9C4 801495BC 00000000 */   nop
    /* F9C8 801495C0 1080013C */  lui        $at, %hi(missile + 0x8)
    /* F9CC 801495C4 21083000 */  addu       $at, $at, $s0
    /* F9D0 801495C8 602C228C */  lw         $v0, %lo(missile + 0x8)($at)
    /* F9D4 801495CC 1080013C */  lui        $at, %hi(missile)
    /* F9D8 801495D0 21083000 */  addu       $at, $at, $s0
    /* F9DC 801495D4 582C258C */  lw         $a1, %lo(missile)($at)
    /* F9E0 801495D8 1080013C */  lui        $at, %hi(missile + 0xC)
    /* F9E4 801495DC 21083000 */  addu       $at, $at, $s0
    /* F9E8 801495E0 642C238C */  lw         $v1, %lo(missile + 0xC)($at)
    /* F9EC 801495E4 1080013C */  lui        $at, %hi(missile + 0x4)
    /* F9F0 801495E8 21083000 */  addu       $at, $at, $s0
    /* F9F4 801495EC 5C2C268C */  lw         $a2, %lo(missile + 0x4)($at)
    /* F9F8 801495F0 21104500 */  addu       $v0, $v0, $a1
    /* F9FC 801495F4 21186600 */  addu       $v1, $v1, $a2
    /* FA00 801495F8 1080013C */  lui        $at, %hi(missile + 0x8)
    /* FA04 801495FC 21083000 */  addu       $at, $at, $s0
    /* FA08 80149600 602C22AC */  sw         $v0, %lo(missile + 0x8)($at)
    /* FA0C 80149604 1080013C */  lui        $at, %hi(missile + 0xC)
    /* FA10 80149608 21083000 */  addu       $at, $at, $s0
    /* FA14 8014960C 642C23AC */  sw         $v1, %lo(missile + 0xC)($at)
    /* FA18 80149610 68EB040C */  jal        GetMissilePos__Fi
    /* FA1C 80149614 00000000 */   nop
    /* FA20 80149618 1080013C */  lui        $at, %hi(missile + 0x31)
    /* FA24 8014961C 21083000 */  addu       $at, $at, $s0
    /* FA28 80149620 892C2780 */  lb         $a3, %lo(missile + 0x31)($at)
    /* FA2C 80149624 1080013C */  lui        $at, %hi(missile + 0x35)
    /* FA30 80149628 21083000 */  addu       $at, $at, $s0
    /* FA34 8014962C 8D2C2280 */  lb         $v0, %lo(missile + 0x35)($at)
    /* FA38 80149630 1080013C */  lui        $at, %hi(missile + 0x10)
    /* FA3C 80149634 21083000 */  addu       $at, $at, $s0
    /* FA40 80149638 682C258C */  lw         $a1, %lo(missile + 0x10)($at)
    /* FA44 8014963C 0A00E214 */  bne        $a3, $v0, .L80149668
    /* FA48 80149640 21202002 */   addu      $a0, $s1, $zero
    /* FA4C 80149644 1080013C */  lui        $at, %hi(missile + 0x32)
    /* FA50 80149648 21083000 */  addu       $at, $at, $s0
    /* FA54 8014964C 8A2C2380 */  lb         $v1, %lo(missile + 0x32)($at)
    /* FA58 80149650 1080013C */  lui        $at, %hi(missile + 0x36)
    /* FA5C 80149654 21083000 */  addu       $at, $at, $s0
    /* FA60 80149658 8E2C2280 */  lb         $v0, %lo(missile + 0x36)($at)
    /* FA64 8014965C 00000000 */  nop
    /* FA68 80149660 0D006210 */  beq        $v1, $v0, .L80149698
    /* FA6C 80149664 80101100 */   sll       $v0, $s1, 2
  .L80149668:
    /* FA70 80149668 2130A000 */  addu       $a2, $a1, $zero
    /* FA74 8014966C 1000A7AF */  sw         $a3, 0x10($sp)
    /* FA78 80149670 21380000 */  addu       $a3, $zero, $zero
    /* FA7C 80149674 1080013C */  lui        $at, %hi(missile + 0x32)
    /* FA80 80149678 21083000 */  addu       $at, $at, $s0
    /* FA84 8014967C 8A2C2380 */  lb         $v1, %lo(missile + 0x32)($at)
    /* FA88 80149680 01000224 */  addiu      $v0, $zero, 0x1
    /* FA8C 80149684 1800A0AF */  sw         $zero, 0x18($sp)
    /* FA90 80149688 1C00A2AF */  sw         $v0, 0x1C($sp)
    /* FA94 8014968C 62F3040C */  jal        CheckMissileCol__FiiiUciiUcb
    /* FA98 80149690 1400A3AF */   sw        $v1, 0x14($sp)
    /* FA9C 80149694 80101100 */  sll        $v0, $s1, 2
  .L80149698:
    /* FAA0 80149698 21105100 */  addu       $v0, $v0, $s1
    /* FAA4 8014969C 80100200 */  sll        $v0, $v0, 2
    /* FAA8 801496A0 23105100 */  subu       $v0, $v0, $s1
    /* FAAC 801496A4 80800200 */  sll        $s0, $v0, 2
    /* FAB0 801496A8 1080013C */  lui        $at, %hi(missile + 0x18)
    /* FAB4 801496AC 21083000 */  addu       $at, $at, $s0
    /* FAB8 801496B0 702C2294 */  lhu        $v0, %lo(missile + 0x18)($at)
    /* FABC 801496B4 00000000 */  nop
    /* FAC0 801496B8 29004014 */  bnez       $v0, .L80149760
    /* FAC4 801496BC 00000000 */   nop
    /* FAC8 801496C0 1080013C */  lui        $at, %hi(missile + 0x8)
    /* FACC 801496C4 21083000 */  addu       $at, $at, $s0
    /* FAD0 801496C8 602C228C */  lw         $v0, %lo(missile + 0x8)($at)
    /* FAD4 801496CC 1080013C */  lui        $at, %hi(missile)
    /* FAD8 801496D0 21083000 */  addu       $at, $at, $s0
    /* FADC 801496D4 582C258C */  lw         $a1, %lo(missile)($at)
    /* FAE0 801496D8 1080013C */  lui        $at, %hi(missile + 0xC)
    /* FAE4 801496DC 21083000 */  addu       $at, $at, $s0
    /* FAE8 801496E0 642C238C */  lw         $v1, %lo(missile + 0xC)($at)
    /* FAEC 801496E4 1080013C */  lui        $at, %hi(missile + 0x4)
    /* FAF0 801496E8 21083000 */  addu       $at, $at, $s0
    /* FAF4 801496EC 5C2C268C */  lw         $a2, %lo(missile + 0x4)($at)
    /* FAF8 801496F0 23104500 */  subu       $v0, $v0, $a1
    /* FAFC 801496F4 23186600 */  subu       $v1, $v1, $a2
    /* FB00 801496F8 1080013C */  lui        $at, %hi(missile + 0x8)
    /* FB04 801496FC 21083000 */  addu       $at, $at, $s0
    /* FB08 80149700 602C22AC */  sw         $v0, %lo(missile + 0x8)($at)
    /* FB0C 80149704 1080013C */  lui        $at, %hi(missile + 0xC)
    /* FB10 80149708 21083000 */  addu       $at, $at, $s0
    /* FB14 8014970C 642C23AC */  sw         $v1, %lo(missile + 0xC)($at)
    /* FB18 80149710 68EB040C */  jal        GetMissilePos__Fi
    /* FB1C 80149714 21202002 */   addu      $a0, $s1, $zero
    /* FB20 80149718 21202002 */  addu       $a0, $s1, $zero
    /* FB24 8014971C 1080013C */  lui        $at, %hi(missile + 0x3F)
    /* FB28 80149720 21083000 */  addu       $at, $at, $s0
    /* FB2C 80149724 972C20A0 */  sb         $zero, %lo(missile + 0x3F)($at)
    /* FB30 80149728 D3F4040C */  jal        SetMissAnim__Fii
    /* FB34 8014972C 1C000524 */   addiu     $a1, $zero, 0x1C
    /* FB38 80149730 1080013C */  lui        $at, %hi(missile + 0x42)
    /* FB3C 80149734 21083000 */  addu       $at, $at, $s0
    /* FB40 80149738 9A2C2290 */  lbu        $v0, %lo(missile + 0x42)($at)
    /* FB44 8014973C 00000000 */  nop
    /* FB48 80149740 00160200 */  sll        $v0, $v0, 24
    /* FB4C 80149744 03160200 */  sra        $v0, $v0, 24
    /* FB50 80149748 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* FB54 8014974C 1080013C */  lui        $at, %hi(missile + 0x18)
    /* FB58 80149750 21083000 */  addu       $at, $at, $s0
    /* FB5C 80149754 702C22A4 */  sh         $v0, %lo(missile + 0x18)($at)
    /* FB60 80149758 1C260508 */  j          .L80149870
    /* FB64 8014975C 00000000 */   nop
  .L80149760:
    /* FB68 80149760 1080013C */  lui        $at, %hi(missile + 0x31)
    /* FB6C 80149764 21083000 */  addu       $at, $at, $s0
    /* FB70 80149768 892C2290 */  lbu        $v0, %lo(missile + 0x31)($at)
    /* FB74 8014976C 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* FB78 80149770 21083000 */  addu       $at, $at, $s0
    /* FB7C 80149774 762C2384 */  lh         $v1, %lo(missile + 0x1E)($at)
    /* FB80 80149778 00160200 */  sll        $v0, $v0, 24
    /* FB84 8014977C 032E0200 */  sra        $a1, $v0, 24
    /* FB88 80149780 03160200 */  sra        $v0, $v0, 24
    /* FB8C 80149784 0A004314 */  bne        $v0, $v1, .L801497B0
    /* FB90 80149788 00000000 */   nop
    /* FB94 8014978C 1080013C */  lui        $at, %hi(missile + 0x32)
    /* FB98 80149790 21083000 */  addu       $at, $at, $s0
    /* FB9C 80149794 8A2C2380 */  lb         $v1, %lo(missile + 0x32)($at)
    /* FBA0 80149798 1080013C */  lui        $at, %hi(missile + 0x20)
    /* FBA4 8014979C 21083000 */  addu       $at, $at, $s0
    /* FBA8 801497A0 782C2284 */  lh         $v0, %lo(missile + 0x20)($at)
    /* FBAC 801497A4 00000000 */  nop
    /* FBB0 801497A8 31006210 */  beq        $v1, $v0, .L80149870
    /* FBB4 801497AC 00000000 */   nop
  .L801497B0:
    /* FBB8 801497B0 1080013C */  lui        $at, %hi(missile + 0x3E)
    /* FBBC 801497B4 21083000 */  addu       $at, $at, $s0
    /* FBC0 801497B8 962C2480 */  lb         $a0, %lo(missile + 0x3E)($at)
    /* FBC4 801497BC 1080013C */  lui        $at, %hi(missile + 0x32)
    /* FBC8 801497C0 21083000 */  addu       $at, $at, $s0
    /* FBCC 801497C4 8A2C2290 */  lbu        $v0, %lo(missile + 0x32)($at)
    /* FBD0 801497C8 42000724 */  addiu      $a3, $zero, 0x42
    /* FBD4 801497CC 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* FBD8 801497D0 21083000 */  addu       $at, $at, $s0
    /* FBDC 801497D4 762C25A4 */  sh         $a1, %lo(missile + 0x1E)($at)
    /* FBE0 801497D8 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* FBE4 801497DC 21083000 */  addu       $at, $at, $s0
    /* FBE8 801497E0 762C2584 */  lh         $a1, %lo(missile + 0x1E)($at)
    /* FBEC 801497E4 00160200 */  sll        $v0, $v0, 24
    /* FBF0 801497E8 03160200 */  sra        $v0, $v0, 24
    /* FBF4 801497EC 00340200 */  sll        $a2, $v0, 16
    /* FBF8 801497F0 1080013C */  lui        $at, %hi(missile + 0x20)
    /* FBFC 801497F4 21083000 */  addu       $at, $at, $s0
    /* FC00 801497F8 782C22A4 */  sh         $v0, %lo(missile + 0x20)($at)
    /* FC04 801497FC F834010C */  jal        ChangeLight__Fiiii
    /* FC08 80149800 03340600 */   sra       $a2, $a2, 16
    /* FC0C 80149804 1C260508 */  j          .L80149870
    /* FC10 80149808 00000000 */   nop
  .L8014980C:
    /* FC14 8014980C 1080013C */  lui        $at, %hi(missile + 0x3E)
    /* FC18 80149810 21083000 */  addu       $at, $at, $s0
    /* FC1C 80149814 962C2480 */  lb         $a0, %lo(missile + 0x3E)($at)
    /* FC20 80149818 1080013C */  lui        $at, %hi(missile + 0x31)
    /* FC24 8014981C 21083000 */  addu       $at, $at, $s0
    /* FC28 80149820 892C2580 */  lb         $a1, %lo(missile + 0x31)($at)
    /* FC2C 80149824 1080013C */  lui        $at, %hi(missile + 0x32)
    /* FC30 80149828 21083000 */  addu       $at, $at, $s0
    /* FC34 8014982C 8A2C2680 */  lb         $a2, %lo(missile + 0x32)($at)
    /* FC38 80149830 F834010C */  jal        ChangeLight__Fiiii
    /* FC3C 80149834 62030724 */   addiu     $a3, $zero, 0x362
    /* FC40 80149838 1080013C */  lui        $at, %hi(missile + 0x18)
    /* FC44 8014983C 21083000 */  addu       $at, $at, $s0
    /* FC48 80149840 702C2294 */  lhu        $v0, %lo(missile + 0x18)($at)
    /* FC4C 80149844 00000000 */  nop
    /* FC50 80149848 09004014 */  bnez       $v0, .L80149870
    /* FC54 8014984C 01000224 */   addiu     $v0, $zero, 0x1
    /* FC58 80149850 1080013C */  lui        $at, %hi(missile + 0x3E)
    /* FC5C 80149854 21083000 */  addu       $at, $at, $s0
    /* FC60 80149858 962C2480 */  lb         $a0, %lo(missile + 0x3E)($at)
    /* FC64 8014985C 1080013C */  lui        $at, %hi(missile + 0x38)
    /* FC68 80149860 21083000 */  addu       $at, $at, $s0
    /* FC6C 80149864 902C22A0 */  sb         $v0, %lo(missile + 0x38)($at)
    /* FC70 80149868 D034010C */  jal        AddUnLight__Fi
    /* FC74 8014986C 00000000 */   nop
  .L80149870:
    /* FC78 80149870 D1EA040C */  jal        PutMissile__Fi
    /* FC7C 80149874 21202002 */   addu      $a0, $s1, $zero
    /* FC80 80149878 3000BF8F */  lw         $ra, 0x30($sp)
    /* FC84 8014987C 2C00B18F */  lw         $s1, 0x2C($sp)
    /* FC88 80149880 2800B08F */  lw         $s0, 0x28($sp)
    /* FC8C 80149884 3800BD27 */  addiu      $sp, $sp, 0x38
    /* FC90 80149888 0800E003 */  jr         $ra
    /* FC94 8014988C 00000000 */   nop
endlabel MI_Hbolt__Fi
