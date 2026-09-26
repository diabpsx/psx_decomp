.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddAcid__Fiiiiiicii, 0x114

glabel AddAcid__Fiiiiiicii
    /* 67E4 801403DC C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 67E8 801403E0 1800B0AF */  sw         $s0, 0x18($sp)
    /* 67EC 801403E4 21808000 */  addu       $s0, $a0, $zero
    /* 67F0 801403E8 2800B4AF */  sw         $s4, 0x28($sp)
    /* 67F4 801403EC 21A0A000 */  addu       $s4, $a1, $zero
    /* 67F8 801403F0 2C00B5AF */  sw         $s5, 0x2C($sp)
    /* 67FC 801403F4 21A8C000 */  addu       $s5, $a2, $zero
    /* 6800 801403F8 2400B3AF */  sw         $s3, 0x24($sp)
    /* 6804 801403FC 2198E000 */  addu       $s3, $a3, $zero
    /* 6808 80140400 2000B2AF */  sw         $s2, 0x20($sp)
    /* 680C 80140404 4800B28F */  lw         $s2, 0x48($sp)
    /* 6810 80140408 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 6814 8014040C 5400B18F */  lw         $s1, 0x54($sp)
    /* 6818 80140410 10000224 */  addiu      $v0, $zero, 0x10
    /* 681C 80140414 3000BFAF */  sw         $ra, 0x30($sp)
    /* 6820 80140418 1400A2AF */  sw         $v0, 0x14($sp)
    /* 6824 8014041C 62EA040C */  jal        GetMissileVel__Fiiiiii
    /* 6828 80140420 1000B2AF */   sw        $s2, 0x10($sp)
    /* 682C 80140424 21208002 */  addu       $a0, $s4, $zero
    /* 6830 80140428 2128A002 */  addu       $a1, $s5, $zero
    /* 6834 8014042C 21306002 */  addu       $a2, $s3, $zero
    /* 6838 80140430 2CE9040C */  jal        GetDirection8__Fiiii
    /* 683C 80140434 21384002 */   addu      $a3, $s2, $zero
    /* 6840 80140438 21200002 */  addu       $a0, $s0, $zero
    /* 6844 8014043C 09F5040C */  jal        SetMissDir__Fii
    /* 6848 80140440 21284000 */   addu      $a1, $v0, $zero
    /* 684C 80140444 21200002 */  addu       $a0, $s0, $zero
    /* 6850 80140448 80180400 */  sll        $v1, $a0, 2
    /* 6854 8014044C 21186400 */  addu       $v1, $v1, $a0
    /* 6858 80140450 80180300 */  sll        $v1, $v1, 2
    /* 685C 80140454 23186400 */  subu       $v1, $v1, $a0
    /* 6860 80140458 80180300 */  sll        $v1, $v1, 2
    /* 6864 8014045C 40101100 */  sll        $v0, $s1, 1
    /* 6868 80140460 21105100 */  addu       $v0, $v0, $s1
    /* 686C 80140464 80100200 */  sll        $v0, $v0, 2
    /* 6870 80140468 21105100 */  addu       $v0, $v0, $s1
    /* 6874 8014046C C0100200 */  sll        $v0, $v0, 3
    /* 6878 80140470 1080013C */  lui        $at, %hi(monster + 0x4D)
    /* 687C 80140474 21082200 */  addu       $at, $at, $v0
    /* 6880 80140478 E1532590 */  lbu        $a1, %lo(monster + 0x4D)($at)
    /* 6884 8014047C FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 6888 80140480 1080013C */  lui        $at, %hi(missile + 0x3E)
    /* 688C 80140484 21082300 */  addu       $at, $at, $v1
    /* 6890 80140488 962C22A0 */  sb         $v0, %lo(missile + 0x3E)($at)
    /* 6894 8014048C 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* 6898 80140490 21082300 */  addu       $at, $at, $v1
    /* 689C 80140494 762C34A4 */  sh         $s4, %lo(missile + 0x1E)($at)
    /* 68A0 80140498 1080013C */  lui        $at, %hi(missile + 0x20)
    /* 68A4 8014049C 21082300 */  addu       $at, $at, $v1
    /* 68A8 801404A0 782C35A4 */  sh         $s5, %lo(missile + 0x20)($at)
    /* 68AC 801404A4 0100A524 */  addiu      $a1, $a1, 0x1
    /* 68B0 801404A8 80100500 */  sll        $v0, $a1, 2
    /* 68B4 801404AC 21104500 */  addu       $v0, $v0, $a1
    /* 68B8 801404B0 0F004224 */  addiu      $v0, $v0, 0xF
    /* 68BC 801404B4 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 68C0 801404B8 21082300 */  addu       $at, $at, $v1
    /* 68C4 801404BC 702C22A4 */  sh         $v0, %lo(missile + 0x18)($at)
    /* 68C8 801404C0 D1EA040C */  jal        PutMissile__Fi
    /* 68CC 801404C4 00000000 */   nop
    /* 68D0 801404C8 3000BF8F */  lw         $ra, 0x30($sp)
    /* 68D4 801404CC 2C00B58F */  lw         $s5, 0x2C($sp)
    /* 68D8 801404D0 2800B48F */  lw         $s4, 0x28($sp)
    /* 68DC 801404D4 2400B38F */  lw         $s3, 0x24($sp)
    /* 68E0 801404D8 2000B28F */  lw         $s2, 0x20($sp)
    /* 68E4 801404DC 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 68E8 801404E0 1800B08F */  lw         $s0, 0x18($sp)
    /* 68EC 801404E4 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 68F0 801404E8 0800E003 */  jr         $ra
    /* 68F4 801404EC 00000000 */   nop
endlabel AddAcid__Fiiiiiicii
