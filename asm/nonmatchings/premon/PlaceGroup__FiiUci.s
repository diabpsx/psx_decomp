.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PlaceGroup__FiiUci, 0x5F4

glabel PlaceGroup__FiiUci
    /* 26AB4 801606AC 78FFBD27 */  addiu      $sp, $sp, -0x88
    /* 26AB8 801606B0 6C00B3AF */  sw         $s3, 0x6C($sp)
    /* 26ABC 801606B4 21980000 */  addu       $s3, $zero, $zero
    /* 26AC0 801606B8 0100C830 */  andi       $t0, $a2, 0x1
    /* 26AC4 801606BC 2800A7AF */  sw         $a3, 0x28($sp)
    /* 26AC8 801606C0 40100700 */  sll        $v0, $a3, 1
    /* 26ACC 801606C4 21104700 */  addu       $v0, $v0, $a3
    /* 26AD0 801606C8 80100200 */  sll        $v0, $v0, 2
    /* 26AD4 801606CC 21104700 */  addu       $v0, $v0, $a3
    /* 26AD8 801606D0 C0100200 */  sll        $v0, $v0, 3
    /* 26ADC 801606D4 2000A6A3 */  sb         $a2, 0x20($sp)
    /* 26AE0 801606D8 0200C630 */  andi       $a2, $a2, 0x2
    /* 26AE4 801606DC 8400BFAF */  sw         $ra, 0x84($sp)
    /* 26AE8 801606E0 8000BEAF */  sw         $fp, 0x80($sp)
    /* 26AEC 801606E4 7C00B7AF */  sw         $s7, 0x7C($sp)
    /* 26AF0 801606E8 7800B6AF */  sw         $s6, 0x78($sp)
    /* 26AF4 801606EC 7400B5AF */  sw         $s5, 0x74($sp)
    /* 26AF8 801606F0 7000B4AF */  sw         $s4, 0x70($sp)
    /* 26AFC 801606F4 6800B2AF */  sw         $s2, 0x68($sp)
    /* 26B00 801606F8 6400B1AF */  sw         $s1, 0x64($sp)
    /* 26B04 801606FC 6000B0AF */  sw         $s0, 0x60($sp)
    /* 26B08 80160700 1000A4AF */  sw         $a0, 0x10($sp)
    /* 26B0C 80160704 1800A5AF */  sw         $a1, 0x18($sp)
    /* 26B10 80160708 3000A0AF */  sw         $zero, 0x30($sp)
    /* 26B14 8016070C 3800A8AF */  sw         $t0, 0x38($sp)
    /* 26B18 80160710 4000A2AF */  sw         $v0, 0x40($sp)
    /* 26B1C 80160714 5000A6AF */  sw         $a2, 0x50($sp)
  .L80160718:
    /* 26B20 80160718 38006012 */  beqz       $s3, .L801607FC
    /* 26B24 8016071C 00000000 */   nop
  .L80160720:
    /* 26B28 80160720 1280023C */  lui        $v0, %hi(nummonsters)
    /* 26B2C 80160724 CCC2428C */  lw         $v0, %lo(nummonsters)($v0)
    /* 26B30 80160728 00000000 */  nop
    /* 26B34 8016072C FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 26B38 80160730 40180200 */  sll        $v1, $v0, 1
    /* 26B3C 80160734 21186200 */  addu       $v1, $v1, $v0
    /* 26B40 80160738 80180300 */  sll        $v1, $v1, 2
    /* 26B44 8016073C 21186200 */  addu       $v1, $v1, $v0
    /* 26B48 80160740 C0180300 */  sll        $v1, $v1, 3
    /* 26B4C 80160744 1280013C */  lui        $at, %hi(nummonsters)
    /* 26B50 80160748 CCC222AC */  sw         $v0, %lo(nummonsters)($at)
    /* 26B54 8016074C 1080013C */  lui        $at, %hi(monster + 0x34)
    /* 26B58 80160750 21082300 */  addu       $at, $at, $v1
    /* 26B5C 80160754 C8532290 */  lbu        $v0, %lo(monster + 0x34)($at)
    /* 26B60 80160758 00000000 */  nop
    /* 26B64 8016075C 6000422C */  sltiu      $v0, $v0, 0x60
    /* 26B68 80160760 08004010 */  beqz       $v0, .L80160784
    /* 26B6C 80160764 FFFF7326 */   addiu     $s3, $s3, -0x1
    /* 26B70 80160768 1080013C */  lui        $at, %hi(monster + 0x35)
    /* 26B74 8016076C 21082300 */  addu       $at, $at, $v1
    /* 26B78 80160770 C9532290 */  lbu        $v0, %lo(monster + 0x35)($at)
    /* 26B7C 80160774 00000000 */  nop
    /* 26B80 80160778 6000422C */  sltiu      $v0, $v0, 0x60
    /* 26B84 8016077C 07004014 */  bnez       $v0, .L8016079C
    /* 26B88 80160780 00000000 */   nop
  .L80160784:
    /* 26B8C 80160784 1280043C */  lui        $a0, %hi(D_80119CD4)
    /* 26B90 80160788 D49C8424 */  addiu      $a0, $a0, %lo(D_80119CD4)
    /* 26B94 8016078C 1280053C */  lui        $a1, %hi(D_80119D0C)
    /* 26B98 80160790 0C9DA524 */  addiu      $a1, $a1, %lo(D_80119D0C)
    /* 26B9C 80160794 9B83000C */  jal        DBG_SendMessage
    /* 26BA0 80160798 F1020624 */   addiu     $a2, $zero, 0x2F1
  .L8016079C:
    /* 26BA4 8016079C 1280033C */  lui        $v1, %hi(nummonsters)
    /* 26BA8 801607A0 CCC2638C */  lw         $v1, %lo(nummonsters)($v1)
    /* 26BAC 801607A4 00000000 */  nop
    /* 26BB0 801607A8 40100300 */  sll        $v0, $v1, 1
    /* 26BB4 801607AC 21104300 */  addu       $v0, $v0, $v1
    /* 26BB8 801607B0 80100200 */  sll        $v0, $v0, 2
    /* 26BBC 801607B4 21104300 */  addu       $v0, $v0, $v1
    /* 26BC0 801607B8 C0100200 */  sll        $v0, $v0, 3
    /* 26BC4 801607BC 1080013C */  lui        $at, %hi(monster + 0x35)
    /* 26BC8 801607C0 21082200 */  addu       $at, $at, $v0
    /* 26BCC 801607C4 C9532380 */  lb         $v1, %lo(monster + 0x35)($at)
    /* 26BD0 801607C8 1080013C */  lui        $at, %hi(monster + 0x34)
    /* 26BD4 801607CC 21082200 */  addu       $at, $at, $v0
    /* 26BD8 801607D0 C8532480 */  lb         $a0, %lo(monster + 0x34)($at)
    /* 26BDC 801607D4 C0180300 */  sll        $v1, $v1, 3
    /* 26BE0 801607D8 C0100400 */  sll        $v0, $a0, 3
    /* 26BE4 801607DC 23104400 */  subu       $v0, $v0, $a0
    /* 26BE8 801607E0 C0110200 */  sll        $v0, $v0, 7
    /* 26BEC 801607E4 21186200 */  addu       $v1, $v1, $v0
    /* 26BF0 801607E8 0E80013C */  lui        $at, %hi(dung_map)
    /* 26BF4 801607EC 21082300 */  addu       $at, $at, $v1
    /* 26BF8 801607F0 287A20A4 */  sh         $zero, %lo(dung_map)($at)
    /* 26BFC 801607F4 CAFF6016 */  bnez       $s3, .L80160720
    /* 26C00 801607F8 00000000 */   nop
  .L801607FC:
    /* 26C04 801607FC 3800A88F */  lw         $t0, 0x38($sp)
    /* 26C08 80160800 00000000 */  nop
    /* 26C0C 80160804 15000011 */  beqz       $t0, .L8016085C
    /* 26C10 80160808 00000000 */   nop
    /* 26C14 8016080C C9F6000C */  jal        ENG_random__Fl
    /* 26C18 80160810 08000424 */   addiu     $a0, $zero, 0x8
    /* 26C1C 80160814 4000A88F */  lw         $t0, 0x40($sp)
    /* 26C20 80160818 1280013C */  lui        $at, %hi(offset_x)
    /* 26C24 8016081C 21082200 */  addu       $at, $at, $v0
    /* 26C28 80160820 A8C22380 */  lb         $v1, %lo(offset_x)($at)
    /* 26C2C 80160824 1080013C */  lui        $at, %hi(monster + 0x34)
    /* 26C30 80160828 21082800 */  addu       $at, $at, $t0
    /* 26C34 8016082C C8532480 */  lb         $a0, %lo(monster + 0x34)($at)
    /* 26C38 80160830 1280013C */  lui        $at, %hi(offset_y)
    /* 26C3C 80160834 21082200 */  addu       $at, $at, $v0
    /* 26C40 80160838 B0C22280 */  lb         $v0, %lo(offset_y)($at)
    /* 26C44 8016083C 21808300 */  addu       $s0, $a0, $v1
    /* 26C48 80160840 1080013C */  lui        $at, %hi(monster + 0x35)
    /* 26C4C 80160844 21082800 */  addu       $at, $at, $t0
    /* 26C50 80160848 C9532380 */  lb         $v1, %lo(monster + 0x35)($at)
    /* 26C54 8016084C 21A80002 */  addu       $s5, $s0, $zero
    /* 26C58 80160850 21906200 */  addu       $s2, $v1, $v0
    /* 26C5C 80160854 25820508 */  j          .L80160894
    /* 26C60 80160858 21B84002 */   addu      $s7, $s2, $zero
  .L8016085C:
    /* 26C64 8016085C C9F6000C */  jal        ENG_random__Fl
    /* 26C68 80160860 60000424 */   addiu     $a0, $zero, 0x60
    /* 26C6C 80160864 21804000 */  addu       $s0, $v0, $zero
    /* 26C70 80160868 21A80002 */  addu       $s5, $s0, $zero
    /* 26C74 8016086C C9F6000C */  jal        ENG_random__Fl
    /* 26C78 80160870 60000424 */   addiu     $a0, $zero, 0x60
    /* 26C7C 80160874 21904000 */  addu       $s2, $v0, $zero
    /* 26C80 80160878 21B84002 */  addu       $s7, $s2, $zero
    /* 26C84 8016087C 21200002 */  addu       $a0, $s0, $zero
    /* 26C88 80160880 D77D050C */  jal        MonstPlace__Fii
    /* 26C8C 80160884 21284002 */   addu      $a1, $s2, $zero
    /* 26C90 80160888 FF004230 */  andi       $v0, $v0, 0xFF
    /* 26C94 8016088C F3FF4010 */  beqz       $v0, .L8016085C
    /* 26C98 80160890 00000000 */   nop
  .L80160894:
    /* 26C9C 80160894 1280043C */  lui        $a0, %hi(nummonsters)
    /* 26CA0 80160898 CCC2848C */  lw         $a0, %lo(nummonsters)($a0)
    /* 26CA4 8016089C 1800A88F */  lw         $t0, 0x18($sp)
    /* 26CA8 801608A0 1280033C */  lui        $v1, %hi(totalmonsters)
    /* 26CAC 801608A4 D4C26390 */  lbu        $v1, %lo(totalmonsters)($v1)
    /* 26CB0 801608A8 21108800 */  addu       $v0, $a0, $t0
    /* 26CB4 801608AC 2A106200 */  slt        $v0, $v1, $v0
    /* 26CB8 801608B0 04004010 */  beqz       $v0, .L801608C4
    /* 26CBC 801608B4 21B00000 */   addu      $s6, $zero, $zero
    /* 26CC0 801608B8 23186400 */  subu       $v1, $v1, $a0
    /* 26CC4 801608BC 1800A3AF */  sw         $v1, 0x18($sp)
    /* 26CC8 801608C0 1800A88F */  lw         $t0, 0x18($sp)
  .L801608C4:
    /* 26CCC 801608C4 00000000 */  nop
    /* 26CD0 801608C8 CE000019 */  blez       $t0, .L80160C04
    /* 26CD4 801608CC 21A00000 */   addu      $s4, $zero, $zero
    /* 26CD8 801608D0 C0401700 */  sll        $t0, $s7, 3
    /* 26CDC 801608D4 5000BE93 */  lbu        $fp, 0x50($sp)
    /* 26CE0 801608D8 4800A8AF */  sw         $t0, 0x48($sp)
    /* 26CE4 801608DC 6400C22A */  slti       $v0, $s6, 0x64
  .L801608E0:
    /* 26CE8 801608E0 C8004010 */  beqz       $v0, .L80160C04
    /* 26CEC 801608E4 21880000 */   addu      $s1, $zero, $zero
    /* 26CF0 801608E8 21200002 */  addu       $a0, $s0, $zero
    /* 26CF4 801608EC D77D050C */  jal        MonstPlace__Fii
    /* 26CF8 801608F0 21284002 */   addu      $a1, $s2, $zero
    /* 26CFC 801608F4 FF004230 */  andi       $v0, $v0, 0xFF
    /* 26D00 801608F8 20004010 */  beqz       $v0, .L8016097C
    /* 26D04 801608FC C0181200 */   sll       $v1, $s2, 3
    /* 26D08 80160900 C0101000 */  sll        $v0, $s0, 3
    /* 26D0C 80160904 23105000 */  subu       $v0, $v0, $s0
    /* 26D10 80160908 C0110200 */  sll        $v0, $v0, 7
    /* 26D14 8016090C 21186200 */  addu       $v1, $v1, $v0
    /* 26D18 80160910 C0101500 */  sll        $v0, $s5, 3
    /* 26D1C 80160914 23105500 */  subu       $v0, $v0, $s5
    /* 26D20 80160918 C0110200 */  sll        $v0, $v0, 7
    /* 26D24 8016091C 4800A88F */  lw         $t0, 0x48($sp)
    /* 26D28 80160920 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 26D2C 80160924 21082300 */  addu       $at, $at, $v1
    /* 26D30 80160928 2F7A2380 */  lb         $v1, %lo(dung_map + 0x7)($at)
    /* 26D34 8016092C 21100201 */  addu       $v0, $t0, $v0
    /* 26D38 80160930 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 26D3C 80160934 21082200 */  addu       $at, $at, $v0
    /* 26D40 80160938 2F7A2280 */  lb         $v0, %lo(dung_map + 0x7)($at)
    /* 26D44 8016093C 00000000 */  nop
    /* 26D48 80160940 0E006214 */  bne        $v1, $v0, .L8016097C
    /* 26D4C 80160944 00000000 */   nop
    /* 26D50 80160948 0B00C013 */  beqz       $fp, .L80160978
    /* 26D54 8016094C 00000000 */   nop
    /* 26D58 80160950 6D41000C */  jal        abs
    /* 26D5C 80160954 23201502 */   subu      $a0, $s0, $s5
    /* 26D60 80160958 04004228 */  slti       $v0, $v0, 0x4
    /* 26D64 8016095C 07004010 */  beqz       $v0, .L8016097C
    /* 26D68 80160960 00000000 */   nop
    /* 26D6C 80160964 6D41000C */  jal        abs
    /* 26D70 80160968 23205702 */   subu      $a0, $s2, $s7
    /* 26D74 8016096C 04004228 */  slti       $v0, $v0, 0x4
    /* 26D78 80160970 02004010 */  beqz       $v0, .L8016097C
    /* 26D7C 80160974 00000000 */   nop
  .L80160978:
    /* 26D80 80160978 01001124 */  addiu      $s1, $zero, 0x1
  .L8016097C:
    /* 26D84 8016097C 90002012 */  beqz       $s1, .L80160BC0
    /* 26D88 80160980 21300002 */   addu      $a2, $s0, $zero
    /* 26D8C 80160984 1280043C */  lui        $a0, %hi(nummonsters)
    /* 26D90 80160988 CCC2848C */  lw         $a0, %lo(nummonsters)($a0)
    /* 26D94 8016098C 1000A58F */  lw         $a1, 0x10($sp)
    /* 26D98 80160990 407E050C */  jal        PlaceMonster__Fiiii
    /* 26D9C 80160994 21384002 */   addu      $a3, $s2, $zero
    /* 26DA0 80160998 3800A88F */  lw         $t0, 0x38($sp)
    /* 26DA4 8016099C 00000000 */  nop
    /* 26DA8 801609A0 7E000011 */  beqz       $t0, .L80160B9C
    /* 26DAC 801609A4 00000000 */   nop
    /* 26DB0 801609A8 1280033C */  lui        $v1, %hi(nummonsters)
    /* 26DB4 801609AC CCC2638C */  lw         $v1, %lo(nummonsters)($v1)
    /* 26DB8 801609B0 00000000 */  nop
    /* 26DBC 801609B4 40100300 */  sll        $v0, $v1, 1
    /* 26DC0 801609B8 21104300 */  addu       $v0, $v0, $v1
    /* 26DC4 801609BC 80100200 */  sll        $v0, $v0, 2
    /* 26DC8 801609C0 21104300 */  addu       $v0, $v0, $v1
    /* 26DCC 801609C4 C0100200 */  sll        $v0, $v0, 3
    /* 26DD0 801609C8 1080013C */  lui        $at, %hi(monster + 0x14)
    /* 26DD4 801609CC 21082200 */  addu       $at, $at, $v0
    /* 26DD8 801609D0 A853238C */  lw         $v1, %lo(monster + 0x14)($at)
    /* 26DDC 801609D4 00000000 */  nop
    /* 26DE0 801609D8 40180300 */  sll        $v1, $v1, 1
    /* 26DE4 801609DC 1080013C */  lui        $at, %hi(monster + 0x14)
    /* 26DE8 801609E0 21082200 */  addu       $at, $at, $v0
    /* 26DEC 801609E4 A85323AC */  sw         $v1, %lo(monster + 0x14)($at)
    /* 26DF0 801609E8 1080013C */  lui        $at, %hi(monster + 0x10)
    /* 26DF4 801609EC 21082200 */  addu       $at, $at, $v0
    /* 26DF8 801609F0 A45323AC */  sw         $v1, %lo(monster + 0x10)($at)
    /* 26DFC 801609F4 4000A88F */  lw         $t0, 0x40($sp)
    /* 26E00 801609F8 1080013C */  lui        $at, %hi(monster + 0x4D)
    /* 26E04 801609FC 21082800 */  addu       $at, $at, $t0
    /* 26E08 80160A00 E1532390 */  lbu        $v1, %lo(monster + 0x4D)($at)
    /* 26E0C 80160A04 1080013C */  lui        $at, %hi(monster + 0x4D)
    /* 26E10 80160A08 21082200 */  addu       $at, $at, $v0
    /* 26E14 80160A0C E15323A0 */  sb         $v1, %lo(monster + 0x4D)($at)
    /* 26E18 80160A10 2700C013 */  beqz       $fp, .L80160AB0
    /* 26E1C 80160A14 00000000 */   nop
    /* 26E20 80160A18 1280033C */  lui        $v1, %hi(nummonsters)
    /* 26E24 80160A1C CCC2638C */  lw         $v1, %lo(nummonsters)($v1)
    /* 26E28 80160A20 00000000 */  nop
    /* 26E2C 80160A24 40100300 */  sll        $v0, $v1, 1
    /* 26E30 80160A28 21104300 */  addu       $v0, $v0, $v1
    /* 26E34 80160A2C 80100200 */  sll        $v0, $v0, 2
    /* 26E38 80160A30 21104300 */  addu       $v0, $v0, $v1
    /* 26E3C 80160A34 C0100200 */  sll        $v0, $v0, 3
    /* 26E40 80160A38 2800A893 */  lbu        $t0, 0x28($sp)
    /* 26E44 80160A3C 1080013C */  lui        $at, %hi(monster + 0x56)
    /* 26E48 80160A40 21082200 */  addu       $at, $at, $v0
    /* 26E4C 80160A44 EA5328A0 */  sb         $t0, %lo(monster + 0x56)($at)
    /* 26E50 80160A48 1280033C */  lui        $v1, %hi(nummonsters)
    /* 26E54 80160A4C CCC2638C */  lw         $v1, %lo(nummonsters)($v1)
    /* 26E58 80160A50 00000000 */  nop
    /* 26E5C 80160A54 40100300 */  sll        $v0, $v1, 1
    /* 26E60 80160A58 21104300 */  addu       $v0, $v0, $v1
    /* 26E64 80160A5C 80100200 */  sll        $v0, $v0, 2
    /* 26E68 80160A60 21104300 */  addu       $v0, $v0, $v1
    /* 26E6C 80160A64 C0100200 */  sll        $v0, $v0, 3
    /* 26E70 80160A68 01000324 */  addiu      $v1, $zero, 0x1
    /* 26E74 80160A6C 1080013C */  lui        $at, %hi(monster + 0x57)
    /* 26E78 80160A70 21082200 */  addu       $at, $at, $v0
    /* 26E7C 80160A74 EB5323A0 */  sb         $v1, %lo(monster + 0x57)($at)
    /* 26E80 80160A78 1280033C */  lui        $v1, %hi(nummonsters)
    /* 26E84 80160A7C CCC2638C */  lw         $v1, %lo(nummonsters)($v1)
    /* 26E88 80160A80 4000A88F */  lw         $t0, 0x40($sp)
    /* 26E8C 80160A84 40100300 */  sll        $v0, $v1, 1
    /* 26E90 80160A88 21104300 */  addu       $v0, $v0, $v1
    /* 26E94 80160A8C 80100200 */  sll        $v0, $v0, 2
    /* 26E98 80160A90 21104300 */  addu       $v0, $v0, $v1
    /* 26E9C 80160A94 1080013C */  lui        $at, %hi(monster + 0x4C)
    /* 26EA0 80160A98 21082800 */  addu       $at, $at, $t0
    /* 26EA4 80160A9C E0532390 */  lbu        $v1, %lo(monster + 0x4C)($at)
    /* 26EA8 80160AA0 C0100200 */  sll        $v0, $v0, 3
    /* 26EAC 80160AA4 1080013C */  lui        $at, %hi(monster + 0x4C)
    /* 26EB0 80160AA8 21082200 */  addu       $at, $at, $v0
    /* 26EB4 80160AAC E05323A0 */  sb         $v1, %lo(monster + 0x4C)($at)
  .L80160AB0:
    /* 26EB8 80160AB0 1280033C */  lui        $v1, %hi(nummonsters)
    /* 26EBC 80160AB4 CCC2638C */  lw         $v1, %lo(nummonsters)($v1)
    /* 26EC0 80160AB8 00000000 */  nop
    /* 26EC4 80160ABC 40100300 */  sll        $v0, $v1, 1
    /* 26EC8 80160AC0 21104300 */  addu       $v0, $v0, $v1
    /* 26ECC 80160AC4 80100200 */  sll        $v0, $v0, 2
    /* 26ED0 80160AC8 21104300 */  addu       $v0, $v0, $v1
    /* 26ED4 80160ACC C0200200 */  sll        $a0, $v0, 3
    /* 26ED8 80160AD0 1080013C */  lui        $at, %hi(monster + 0x4C)
    /* 26EDC 80160AD4 21082400 */  addu       $at, $at, $a0
    /* 26EE0 80160AD8 E0532390 */  lbu        $v1, %lo(monster + 0x4C)($at)
    /* 26EE4 80160ADC 0C000224 */  addiu      $v0, $zero, 0xC
    /* 26EE8 80160AE0 2E006210 */  beq        $v1, $v0, .L80160B9C
    /* 26EEC 80160AE4 00000000 */   nop
    /* 26EF0 80160AE8 1080013C */  lui        $at, %hi(monster + 0x5A)
    /* 26EF4 80160AEC 21082400 */  addu       $at, $at, $a0
    /* 26EF8 80160AF0 EE5320A0 */  sb         $zero, %lo(monster + 0x5A)($at)
    /* 26EFC 80160AF4 1280033C */  lui        $v1, %hi(nummonsters)
    /* 26F00 80160AF8 CCC2638C */  lw         $v1, %lo(nummonsters)($v1)
    /* 26F04 80160AFC 00000000 */  nop
    /* 26F08 80160B00 40100300 */  sll        $v0, $v1, 1
    /* 26F0C 80160B04 21104300 */  addu       $v0, $v0, $v1
    /* 26F10 80160B08 80100200 */  sll        $v0, $v0, 2
    /* 26F14 80160B0C 21104300 */  addu       $v0, $v0, $v1
    /* 26F18 80160B10 C0100200 */  sll        $v0, $v0, 3
    /* 26F1C 80160B14 1080013C */  lui        $at, %hi(monster + 0x40)
    /* 26F20 80160B18 21082200 */  addu       $at, $at, $v0
    /* 26F24 80160B1C D4532480 */  lb         $a0, %lo(monster + 0x40)($at)
    /* 26F28 80160B20 C9F6000C */  jal        ENG_random__Fl
    /* 26F2C 80160B24 FFFF8424 */   addiu     $a0, $a0, -0x1
    /* 26F30 80160B28 1280043C */  lui        $a0, %hi(nummonsters)
    /* 26F34 80160B2C CCC2848C */  lw         $a0, %lo(nummonsters)($a0)
    /* 26F38 80160B30 01004224 */  addiu      $v0, $v0, 0x1
    /* 26F3C 80160B34 40180400 */  sll        $v1, $a0, 1
    /* 26F40 80160B38 21186400 */  addu       $v1, $v1, $a0
    /* 26F44 80160B3C 80180300 */  sll        $v1, $v1, 2
    /* 26F48 80160B40 21186400 */  addu       $v1, $v1, $a0
    /* 26F4C 80160B44 C0180300 */  sll        $v1, $v1, 3
    /* 26F50 80160B48 1080013C */  lui        $at, %hi(monster + 0x41)
    /* 26F54 80160B4C 21082300 */  addu       $at, $at, $v1
    /* 26F58 80160B50 D55322A0 */  sb         $v0, %lo(monster + 0x41)($at)
    /* 26F5C 80160B54 1280033C */  lui        $v1, %hi(nummonsters)
    /* 26F60 80160B58 CCC2638C */  lw         $v1, %lo(nummonsters)($v1)
    /* 26F64 80160B5C 00000000 */  nop
    /* 26F68 80160B60 40100300 */  sll        $v0, $v1, 1
    /* 26F6C 80160B64 21104300 */  addu       $v0, $v0, $v1
    /* 26F70 80160B68 80100200 */  sll        $v0, $v0, 2
    /* 26F74 80160B6C 21104300 */  addu       $v0, $v0, $v1
    /* 26F78 80160B70 C0100200 */  sll        $v0, $v0, 3
    /* 26F7C 80160B74 1080013C */  lui        $at, %hi(monster + 0x2C)
    /* 26F80 80160B78 21082200 */  addu       $at, $at, $v0
    /* 26F84 80160B7C C0532394 */  lhu        $v1, %lo(monster + 0x2C)($at)
    /* 26F88 80160B80 1080013C */  lui        $at, %hi(monster + 0x33)
    /* 26F8C 80160B84 21082200 */  addu       $at, $at, $v0
    /* 26F90 80160B88 C75320A0 */  sb         $zero, %lo(monster + 0x33)($at)
    /* 26F94 80160B8C FBFF6330 */  andi       $v1, $v1, 0xFFFB
    /* 26F98 80160B90 1080013C */  lui        $at, %hi(monster + 0x2C)
    /* 26F9C 80160B94 21082200 */  addu       $at, $at, $v0
    /* 26FA0 80160B98 C05323A4 */  sh         $v1, %lo(monster + 0x2C)($at)
  .L80160B9C:
    /* 26FA4 80160B9C 01007326 */  addiu      $s3, $s3, 0x1
    /* 26FA8 80160BA0 1280023C */  lui        $v0, %hi(nummonsters)
    /* 26FAC 80160BA4 CCC2428C */  lw         $v0, %lo(nummonsters)($v0)
    /* 26FB0 80160BA8 00000000 */  nop
    /* 26FB4 80160BAC 01004224 */  addiu      $v0, $v0, 0x1
    /* 26FB8 80160BB0 1280013C */  lui        $at, %hi(nummonsters)
    /* 26FBC 80160BB4 CCC222AC */  sw         $v0, %lo(nummonsters)($at)
    /* 26FC0 80160BB8 F1820508 */  j          .L80160BC4
    /* 26FC4 80160BBC 01009426 */   addiu     $s4, $s4, 0x1
  .L80160BC0:
    /* 26FC8 80160BC0 0100D626 */  addiu      $s6, $s6, 0x1
  .L80160BC4:
    /* 26FCC 80160BC4 C9F6000C */  jal        ENG_random__Fl
    /* 26FD0 80160BC8 08000424 */   addiu     $a0, $zero, 0x8
    /* 26FD4 80160BCC 1280013C */  lui        $at, %hi(offset_x)
    /* 26FD8 80160BD0 21082200 */  addu       $at, $at, $v0
    /* 26FDC 80160BD4 A8C22280 */  lb         $v0, %lo(offset_x)($at)
    /* 26FE0 80160BD8 08000424 */  addiu      $a0, $zero, 0x8
    /* 26FE4 80160BDC C9F6000C */  jal        ENG_random__Fl
    /* 26FE8 80160BE0 21800202 */   addu      $s0, $s0, $v0
    /* 26FEC 80160BE4 1280013C */  lui        $at, %hi(offset_x)
    /* 26FF0 80160BE8 21082200 */  addu       $at, $at, $v0
    /* 26FF4 80160BEC A8C22280 */  lb         $v0, %lo(offset_x)($at)
    /* 26FF8 80160BF0 1800A88F */  lw         $t0, 0x18($sp)
    /* 26FFC 80160BF4 21904202 */  addu       $s2, $s2, $v0
    /* 27000 80160BF8 2A108802 */  slt        $v0, $s4, $t0
    /* 27004 80160BFC 38FF4014 */  bnez       $v0, .L801608E0
    /* 27008 80160C00 6400C22A */   slti      $v0, $s6, 0x64
  .L80160C04:
    /* 2700C 80160C04 1800A88F */  lw         $t0, 0x18($sp)
    /* 27010 80160C08 00000000 */  nop
    /* 27014 80160C0C 2A106802 */  slt        $v0, $s3, $t0
    /* 27018 80160C10 07004010 */  beqz       $v0, .L80160C30
    /* 2701C 80160C14 00000000 */   nop
    /* 27020 80160C18 3000A88F */  lw         $t0, 0x30($sp)
    /* 27024 80160C1C 00000000 */  nop
    /* 27028 80160C20 01000825 */  addiu      $t0, $t0, 0x1
    /* 2702C 80160C24 0A000229 */  slti       $v0, $t0, 0xA
    /* 27030 80160C28 BBFE4014 */  bnez       $v0, .L80160718
    /* 27034 80160C2C 3000A8AF */   sw        $t0, 0x30($sp)
  .L80160C30:
    /* 27038 80160C30 2000A893 */  lbu        $t0, 0x20($sp)
    /* 2703C 80160C34 00000000 */  nop
    /* 27040 80160C38 02000231 */  andi       $v0, $t0, 0x2
    /* 27044 80160C3C 0B004010 */  beqz       $v0, .L80160C6C
    /* 27048 80160C40 00000000 */   nop
    /* 2704C 80160C44 2800A88F */  lw         $t0, 0x28($sp)
    /* 27050 80160C48 00000000 */  nop
    /* 27054 80160C4C 40100800 */  sll        $v0, $t0, 1
    /* 27058 80160C50 21104800 */  addu       $v0, $v0, $t0
    /* 2705C 80160C54 80100200 */  sll        $v0, $v0, 2
    /* 27060 80160C58 21104800 */  addu       $v0, $v0, $t0
    /* 27064 80160C5C C0100200 */  sll        $v0, $v0, 3
    /* 27068 80160C60 1080013C */  lui        $at, %hi(monster + 0x58)
    /* 2706C 80160C64 21082200 */  addu       $at, $at, $v0
    /* 27070 80160C68 EC5333A0 */  sb         $s3, %lo(monster + 0x58)($at)
  .L80160C6C:
    /* 27074 80160C6C 8400BF8F */  lw         $ra, 0x84($sp)
    /* 27078 80160C70 8000BE8F */  lw         $fp, 0x80($sp)
    /* 2707C 80160C74 7C00B78F */  lw         $s7, 0x7C($sp)
    /* 27080 80160C78 7800B68F */  lw         $s6, 0x78($sp)
    /* 27084 80160C7C 7400B58F */  lw         $s5, 0x74($sp)
    /* 27088 80160C80 7000B48F */  lw         $s4, 0x70($sp)
    /* 2708C 80160C84 6C00B38F */  lw         $s3, 0x6C($sp)
    /* 27090 80160C88 6800B28F */  lw         $s2, 0x68($sp)
    /* 27094 80160C8C 6400B18F */  lw         $s1, 0x64($sp)
    /* 27098 80160C90 6000B08F */  lw         $s0, 0x60($sp)
    /* 2709C 80160C94 8800BD27 */  addiu      $sp, $sp, 0x88
    /* 270A0 80160C98 0800E003 */  jr         $ra
    /* 270A4 80160C9C 00000000 */   nop
endlabel PlaceGroup__FiiUci
