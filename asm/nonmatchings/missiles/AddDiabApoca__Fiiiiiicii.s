.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddDiabApoca__Fiiiiiicii, 0x144

glabel AddDiabApoca__Fiiiiiicii
    /* 8CC8 801428C0 B0FFBD27 */  addiu      $sp, $sp, -0x50
    /* 8CCC 801428C4 6800A38F */  lw         $v1, 0x68($sp)
    /* 8CD0 801428C8 1280023C */  lui        $v0, %hi(FePlayerNo)
    /* 8CD4 801428CC 78B3428C */  lw         $v0, %lo(FePlayerNo)($v0)
    /* 8CD8 801428D0 4800BEAF */  sw         $fp, 0x48($sp)
    /* 8CDC 801428D4 7000BE8F */  lw         $fp, 0x70($sp)
    /* 8CE0 801428D8 3800B4AF */  sw         $s4, 0x38($sp)
    /* 8CE4 801428DC 21A08000 */  addu       $s4, $a0, $zero
    /* 8CE8 801428E0 4000B6AF */  sw         $s6, 0x40($sp)
    /* 8CEC 801428E4 21B0A000 */  addu       $s6, $a1, $zero
    /* 8CF0 801428E8 4400B7AF */  sw         $s7, 0x44($sp)
    /* 8CF4 801428EC 21B8C000 */  addu       $s7, $a2, $zero
    /* 8CF8 801428F0 3400B3AF */  sw         $s3, 0x34($sp)
    /* 8CFC 801428F4 21980000 */  addu       $s3, $zero, $zero
    /* 8D00 801428F8 4C00BFAF */  sw         $ra, 0x4C($sp)
    /* 8D04 801428FC 3C00B5AF */  sw         $s5, 0x3C($sp)
    /* 8D08 80142900 3000B2AF */  sw         $s2, 0x30($sp)
    /* 8D0C 80142904 2C00B1AF */  sw         $s1, 0x2C($sp)
    /* 8D10 80142908 28004004 */  bltz       $v0, .L801429AC
    /* 8D14 8014290C 2800B0AF */   sw        $s0, 0x28($sp)
    /* 8D18 80142910 00160300 */  sll        $v0, $v1, 24
    /* 8D1C 80142914 03AE0200 */  sra        $s5, $v0, 24
    /* 8D20 80142918 0E80103C */  lui        $s0, %hi(plr + 0x32)
    /* 8D24 8014291C 6AA51026 */  addiu      $s0, $s0, %lo(plr + 0x32)
    /* 8D28 80142920 FEFF1126 */  addiu      $s1, $s0, -0x2
    /* 8D2C 80142924 21900000 */  addu       $s2, $zero, $zero
  .L80142928:
    /* 8D30 80142928 0E80013C */  lui        $at, %hi(plr + 0x1D)
    /* 8D34 8014292C 21083200 */  addu       $at, $at, $s2
    /* 8D38 80142930 55A52290 */  lbu        $v0, %lo(plr + 0x1D)($at)
    /* 8D3C 80142934 00000000 */  nop
    /* 8D40 80142938 14004010 */  beqz       $v0, .L8014298C
    /* 8D44 8014293C 2120C002 */   addu      $a0, $s6, $zero
    /* 8D48 80142940 00002686 */  lh         $a2, 0x0($s1)
    /* 8D4C 80142944 00000786 */  lh         $a3, 0x0($s0)
    /* 8D50 80142948 1E55050C */  jal        LineClear__Fiiii
    /* 8D54 8014294C 2128E002 */   addu      $a1, $s7, $zero
    /* 8D58 80142950 FF004230 */  andi       $v0, $v0, 0xFF
    /* 8D5C 80142954 0D004010 */  beqz       $v0, .L8014298C
    /* 8D60 80142958 42000224 */   addiu     $v0, $zero, 0x42
    /* 8D64 8014295C 00002486 */  lh         $a0, 0x0($s1)
    /* 8D68 80142960 00000586 */  lh         $a1, 0x0($s0)
    /* 8D6C 80142964 6C00A88F */  lw         $t0, 0x6C($sp)
    /* 8D70 80142968 1000A0AF */  sw         $zero, 0x10($sp)
    /* 8D74 8014296C 1400A2AF */  sw         $v0, 0x14($sp)
    /* 8D78 80142970 1800B5AF */  sw         $s5, 0x18($sp)
    /* 8D7C 80142974 2000BEAF */  sw         $fp, 0x20($sp)
    /* 8D80 80142978 2400A0AF */  sw         $zero, 0x24($sp)
    /* 8D84 8014297C 21308000 */  addu       $a2, $a0, $zero
    /* 8D88 80142980 2138A000 */  addu       $a3, $a1, $zero
    /* 8D8C 80142984 810A050C */  jal        AddMissile__Fiiiiiiciii
    /* 8D90 80142988 1C00A8AF */   sw        $t0, 0x1C($sp)
  .L8014298C:
    /* 8D94 8014298C E8191026 */  addiu      $s0, $s0, 0x19E8
    /* 8D98 80142990 E8193126 */  addiu      $s1, $s1, 0x19E8
    /* 8D9C 80142994 1280023C */  lui        $v0, %hi(FePlayerNo)
    /* 8DA0 80142998 78B3428C */  lw         $v0, %lo(FePlayerNo)($v0)
    /* 8DA4 8014299C 01007326 */  addiu      $s3, $s3, 0x1
    /* 8DA8 801429A0 2A105300 */  slt        $v0, $v0, $s3
    /* 8DAC 801429A4 E0FF4010 */  beqz       $v0, .L80142928
    /* 8DB0 801429A8 E8195226 */   addiu     $s2, $s2, 0x19E8
  .L801429AC:
    /* 8DB4 801429AC 80101400 */  sll        $v0, $s4, 2
    /* 8DB8 801429B0 21105400 */  addu       $v0, $v0, $s4
    /* 8DBC 801429B4 80100200 */  sll        $v0, $v0, 2
    /* 8DC0 801429B8 23105400 */  subu       $v0, $v0, $s4
    /* 8DC4 801429BC 80100200 */  sll        $v0, $v0, 2
    /* 8DC8 801429C0 01000324 */  addiu      $v1, $zero, 0x1
    /* 8DCC 801429C4 1080013C */  lui        $at, %hi(missile + 0x38)
    /* 8DD0 801429C8 21082200 */  addu       $at, $at, $v0
    /* 8DD4 801429CC 902C23A0 */  sb         $v1, %lo(missile + 0x38)($at)
    /* 8DD8 801429D0 4C00BF8F */  lw         $ra, 0x4C($sp)
    /* 8DDC 801429D4 4800BE8F */  lw         $fp, 0x48($sp)
    /* 8DE0 801429D8 4400B78F */  lw         $s7, 0x44($sp)
    /* 8DE4 801429DC 4000B68F */  lw         $s6, 0x40($sp)
    /* 8DE8 801429E0 3C00B58F */  lw         $s5, 0x3C($sp)
    /* 8DEC 801429E4 3800B48F */  lw         $s4, 0x38($sp)
    /* 8DF0 801429E8 3400B38F */  lw         $s3, 0x34($sp)
    /* 8DF4 801429EC 3000B28F */  lw         $s2, 0x30($sp)
    /* 8DF8 801429F0 2C00B18F */  lw         $s1, 0x2C($sp)
    /* 8DFC 801429F4 2800B08F */  lw         $s0, 0x28($sp)
    /* 8E00 801429F8 5000BD27 */  addiu      $sp, $sp, 0x50
    /* 8E04 801429FC 0800E003 */  jr         $ra
    /* 8E08 80142A00 00000000 */   nop
endlabel AddDiabApoca__Fiiiiiicii
