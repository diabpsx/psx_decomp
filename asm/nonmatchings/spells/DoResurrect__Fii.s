.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DoResurrect__Fii, 0x268

glabel DoResurrect__Fii
    /* 67850 80077850 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 67854 80077854 3000B2AF */  sw         $s2, 0x30($sp)
    /* 67858 80077858 21908000 */  addu       $s2, $a0, $zero
    /* 6785C 8007785C 2C00B1AF */  sw         $s1, 0x2C($sp)
    /* 67860 80077860 2188A000 */  addu       $s1, $a1, $zero
    /* 67864 80077864 01000424 */  addiu      $a0, $zero, 0x1
    /* 67868 80077868 40101100 */  sll        $v0, $s1, 1
    /* 6786C 8007786C 21105100 */  addu       $v0, $v0, $s1
    /* 67870 80077870 80100200 */  sll        $v0, $v0, 2
    /* 67874 80077874 21105100 */  addu       $v0, $v0, $s1
    /* 67878 80077878 00110200 */  sll        $v0, $v0, 4
    /* 6787C 8007787C 23105100 */  subu       $v0, $v0, $s1
    /* 67880 80077880 80100200 */  sll        $v0, $v0, 2
    /* 67884 80077884 21105100 */  addu       $v0, $v0, $s1
    /* 67888 80077888 C0100200 */  sll        $v0, $v0, 3
    /* 6788C 8007788C 0E80033C */  lui        $v1, %hi(plr)
    /* 67890 80077890 38A56324 */  addiu      $v1, $v1, %lo(plr)
    /* 67894 80077894 2800B0AF */  sw         $s0, 0x28($sp)
    /* 67898 80077898 21804300 */  addu       $s0, $v0, $v1
    /* 6789C 8007789C 3800BFAF */  sw         $ra, 0x38($sp)
    /* 678A0 800778A0 01DE000C */  jal        NewCursor__Fi
    /* 678A4 800778A4 3400B3AF */   sw        $s3, 0x34($sp)
    /* 678A8 800778A8 00161100 */  sll        $v0, $s1, 24
    /* 678AC 800778AC 03160200 */  sra        $v0, $v0, 24
    /* 678B0 800778B0 FFFF1324 */  addiu      $s3, $zero, -0x1
    /* 678B4 800778B4 78005310 */  beq        $v0, $s3, .L80077A98
    /* 678B8 800778B8 00000000 */   nop
    /* 678BC 800778BC 1280023C */  lui        $v0, %hi(myplr)
    /* 678C0 800778C0 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 678C4 800778C4 00000000 */  nop
    /* 678C8 800778C8 0A002216 */  bne        $s1, $v0, .L800778F4
    /* 678CC 800778CC 00000000 */   nop
    /* 678D0 800778D0 1280013C */  lui        $at, %hi(deathflag)
    /* 678D4 800778D4 0CBA20A0 */  sb         $zero, %lo(deathflag)($at)
    /* 678D8 800778D8 F409020C */  jal        gamemenu_off__Fv
    /* 678DC 800778DC 00000000 */   nop
    /* 678E0 800778E0 01000224 */  addiu      $v0, $zero, 0x1
    /* 678E4 800778E4 1280013C */  lui        $at, %hi(drawhpflag)
    /* 678E8 800778E8 BEB622A0 */  sb         $v0, %lo(drawhpflag)($at)
    /* 678EC 800778EC 1280013C */  lui        $at, %hi(drawmanaflag)
    /* 678F0 800778F0 BFB622A0 */  sb         $v0, %lo(drawmanaflag)($at)
  .L800778F4:
    /* 678F4 800778F4 D4000292 */  lbu        $v0, 0xD4($s0)
    /* 678F8 800778F8 1280013C */  lui        $at, %hi(light_rad)
    /* 678FC 800778FC 0DBA22A0 */  sb         $v0, %lo(light_rad)($at)
    /* 67900 80077900 959C010C */  jal        ClrPlrPath__Fi
    /* 67904 80077904 21202002 */   addu      $a0, $s1, $zero
    /* 67908 80077908 06002426 */  addiu      $a0, $s1, 0x6
    /* 6790C 8007790C 21280000 */  addu       $a1, $zero, $zero
    /* 67910 80077910 21300000 */  addu       $a2, $zero, $zero
    /* 67914 80077914 01000224 */  addiu      $v0, $zero, 0x1
    /* 67918 80077918 1D0002A2 */  sb         $v0, 0x1D($s0)
    /* 6791C 8007791C 02000224 */  addiu      $v0, $zero, 0x2
    /* 67920 80077920 1280013C */  lui        $at, %hi(gbActivePlayers)
    /* 67924 80077924 A3B922A0 */  sb         $v0, %lo(gbActivePlayers)($at)
    /* 67928 80077928 53EB010C */  jal        PostGamePad__Fiiii
    /* 6792C 8007792C 21380000 */   addu      $a3, $zero, $zero
    /* 67930 80077930 21202002 */  addu       $a0, $s1, $zero
    /* 67934 80077934 80020524 */  addiu      $a1, $zero, 0x280
    /* 67938 80077938 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 6793C 8007793C 1E0002A2 */  sb         $v0, 0x1E($s0)
    /* 67940 80077940 3C9B010C */  jal        SetPlayerHitPoints__Fii
    /* 67944 80077944 D30000A2 */   sb        $zero, 0xD3($s0)
    /* 67948 80077948 21202002 */  addu       $a0, $s1, $zero
    /* 6794C 8007794C 2001068E */  lw         $a2, 0x120($s0)
    /* 67950 80077950 1801028E */  lw         $v0, 0x118($s0)
    /* 67954 80077954 3401078E */  lw         $a3, 0x134($s0)
    /* 67958 80077958 2C01038E */  lw         $v1, 0x12C($s0)
    /* 6795C 8007795C 01000524 */  addiu      $a1, $zero, 0x1
    /* 67960 80077960 300100AE */  sw         $zero, 0x130($s0)
    /* 67964 80077964 2330C200 */  subu       $a2, $a2, $v0
    /* 67968 80077968 1C01028E */  lw         $v0, 0x11C($s0)
    /* 6796C 8007796C 23186700 */  subu       $v1, $v1, $a3
    /* 67970 80077970 280103AE */  sw         $v1, 0x128($s0)
    /* 67974 80077974 23104600 */  subu       $v0, $v0, $a2
    /* 67978 80077978 C6FE000C */  jal        CalcPlrInv__FiUc
    /* 6797C 8007797C 140102AE */   sw        $v0, 0x114($s0)
    /* 67980 80077980 42000582 */  lb         $a1, 0x42($s0)
    /* 67984 80077984 1280023C */  lui        $v0, %hi(currlevel)
    /* 67988 80077988 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 6798C 8007798C 21202002 */  addu       $a0, $s1, $zero
    /* 67990 80077990 299B010C */  jal        StartStand__Fii
    /* 67994 80077994 240002AE */   sw        $v0, 0x24($s0)
    /* 67998 80077998 21202002 */  addu       $a0, $s1, $zero
    /* 6799C 8007799C 40101200 */  sll        $v0, $s2, 1
    /* 679A0 800779A0 21105200 */  addu       $v0, $v0, $s2
    /* 679A4 800779A4 80100200 */  sll        $v0, $v0, 2
    /* 679A8 800779A8 21105200 */  addu       $v0, $v0, $s2
    /* 679AC 800779AC 00110200 */  sll        $v0, $v0, 4
    /* 679B0 800779B0 23105200 */  subu       $v0, $v0, $s2
    /* 679B4 800779B4 80100200 */  sll        $v0, $v0, 2
    /* 679B8 800779B8 21105200 */  addu       $v0, $v0, $s2
    /* 679BC 800779BC C0100200 */  sll        $v0, $v0, 3
    /* 679C0 800779C0 0E80013C */  lui        $at, %hi(plr + 0x30)
    /* 679C4 800779C4 21082200 */  addu       $at, $at, $v0
    /* 679C8 800779C8 68A52584 */  lh         $a1, %lo(plr + 0x30)($at)
    /* 679CC 800779CC 0E80013C */  lui        $at, %hi(plr + 0x32)
    /* 679D0 800779D0 21082200 */  addu       $at, $at, $v0
    /* 679D4 800779D4 6AA52684 */  lh         $a2, %lo(plr + 0x32)($at)
    /* 679D8 800779D8 2090020C */  jal        PlacePlayer__FiiiUc
    /* 679DC 800779DC 21380000 */   addu      $a3, $zero, $zero
    /* 679E0 800779E0 5B000482 */  lb         $a0, 0x5B($s0)
    /* 679E4 800779E4 00000000 */  nop
    /* 679E8 800779E8 09009314 */  bne        $a0, $s3, .L80077A10
    /* 679EC 800779EC 00000000 */   nop
    /* 679F0 800779F0 30000486 */  lh         $a0, 0x30($s0)
    /* 679F4 800779F4 1280063C */  lui        $a2, %hi(light_rad)
    /* 679F8 800779F8 0DBAC680 */  lb         $a2, %lo(light_rad)($a2)
    /* 679FC 800779FC 32000586 */  lh         $a1, 0x32($s0)
    /* 67A00 80077A00 BA34010C */  jal        AddLight__Fiii
    /* 67A04 80077A04 F023C624 */   addiu     $a2, $a2, 0x23F0
    /* 67A08 80077A08 88DE0108 */  j          .L80077A20
    /* 67A0C 80077A0C 5B0002A2 */   sb        $v0, 0x5B($s0)
  .L80077A10:
    /* 67A10 80077A10 30000586 */  lh         $a1, 0x30($s0)
    /* 67A14 80077A14 32000686 */  lh         $a2, 0x32($s0)
    /* 67A18 80077A18 E134010C */  jal        ChangeLightXY__Fiii
    /* 67A1C 80077A1C 00000000 */   nop
  .L80077A20:
    /* 67A20 80077A20 5C000482 */  lb         $a0, 0x5C($s0)
    /* 67A24 80077A24 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 67A28 80077A28 07008214 */  bne        $a0, $v0, .L80077A48
    /* 67A2C 80077A2C 0A000624 */   addiu     $a2, $zero, 0xA
    /* 67A30 80077A30 30000486 */  lh         $a0, 0x30($s0)
    /* 67A34 80077A34 32000586 */  lh         $a1, 0x32($s0)
    /* 67A38 80077A38 6A35010C */  jal        AddVision__FiiiUc
    /* 67A3C 80077A3C FF002732 */   andi      $a3, $s1, 0xFF
    /* 67A40 80077A40 96DE0108 */  j          .L80077A58
    /* 67A44 80077A44 5C0002A2 */   sb        $v0, 0x5C($s0)
  .L80077A48:
    /* 67A48 80077A48 30000586 */  lh         $a1, 0x30($s0)
    /* 67A4C 80077A4C 32000686 */  lh         $a2, 0x32($s0)
    /* 67A50 80077A50 B435010C */  jal        ChangeVisionXY__Fiii
    /* 67A54 80077A54 00000000 */   nop
  .L80077A58:
    /* 67A58 80077A58 30000486 */  lh         $a0, 0x30($s0)
    /* 67A5C 80077A5C 32000586 */  lh         $a1, 0x32($s0)
    /* 67A60 80077A60 3E000224 */  addiu      $v0, $zero, 0x3E
    /* 67A64 80077A64 1000A0AF */  sw         $zero, 0x10($sp)
    /* 67A68 80077A68 1400A2AF */  sw         $v0, 0x14($sp)
    /* 67A6C 80077A6C 1800A0AF */  sw         $zero, 0x18($sp)
    /* 67A70 80077A70 1C00B2AF */  sw         $s2, 0x1C($sp)
    /* 67A74 80077A74 2000A0AF */  sw         $zero, 0x20($sp)
    /* 67A78 80077A78 2400A0AF */  sw         $zero, 0x24($sp)
    /* 67A7C 80077A7C 21308000 */  addu       $a2, $a0, $zero
    /* 67A80 80077A80 810A050C */  jal        func_80142A04
    /* 67A84 80077A84 2138A000 */   addu      $a3, $a1, $zero
    /* 67A88 80077A88 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 67A8C 80077A8C 1280013C */  lui        $at, %hi(_pcursplr)
    /* 67A90 80077A90 21083200 */  addu       $at, $at, $s2
    /* 67A94 80077A94 6CB722A0 */  sb         $v0, %lo(_pcursplr)($at)
  .L80077A98:
    /* 67A98 80077A98 3800BF8F */  lw         $ra, 0x38($sp)
    /* 67A9C 80077A9C 3400B38F */  lw         $s3, 0x34($sp)
    /* 67AA0 80077AA0 3000B28F */  lw         $s2, 0x30($sp)
    /* 67AA4 80077AA4 2C00B18F */  lw         $s1, 0x2C($sp)
    /* 67AA8 80077AA8 2800B08F */  lw         $s0, 0x28($sp)
    /* 67AAC 80077AAC 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 67AB0 80077AB0 0800E003 */  jr         $ra
    /* 67AB4 80077AB4 00000000 */   nop
endlabel DoResurrect__Fii
