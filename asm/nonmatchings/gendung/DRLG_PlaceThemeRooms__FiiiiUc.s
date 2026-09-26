.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_PlaceThemeRooms__FiiiiUc, 0x2A0

glabel DRLG_PlaceThemeRooms__FiiiiUc
    /* 21AC0 8015B6B8 A0FFBD27 */  addiu      $sp, $sp, -0x60
    /* 21AC4 8015B6BC 5000B6AF */  sw         $s6, 0x50($sp)
    /* 21AC8 8015B6C0 21B08000 */  addu       $s6, $a0, $zero
    /* 21ACC 8015B6C4 5400B7AF */  sw         $s7, 0x54($sp)
    /* 21AD0 8015B6C8 21B8A000 */  addu       $s7, $a1, $zero
    /* 21AD4 8015B6CC 5800BEAF */  sw         $fp, 0x58($sp)
    /* 21AD8 8015B6D0 21F0C000 */  addu       $fp, $a2, $zero
    /* 21ADC 8015B6D4 1480043C */  lui        $a0, %hi(themeLoc)
    /* 21AE0 8015B6D8 689C8424 */  addiu      $a0, $a0, %lo(themeLoc)
    /* 21AE4 8015B6DC 21280000 */  addu       $a1, $zero, $zero
    /* 21AE8 8015B6E0 7000A893 */  lbu        $t0, 0x70($sp)
    /* 21AEC 8015B6E4 14000624 */  addiu      $a2, $zero, 0x14
    /* 21AF0 8015B6E8 5C00BFAF */  sw         $ra, 0x5C($sp)
    /* 21AF4 8015B6EC 4C00B5AF */  sw         $s5, 0x4C($sp)
    /* 21AF8 8015B6F0 4800B4AF */  sw         $s4, 0x48($sp)
    /* 21AFC 8015B6F4 4400B3AF */  sw         $s3, 0x44($sp)
    /* 21B00 8015B6F8 4000B2AF */  sw         $s2, 0x40($sp)
    /* 21B04 8015B6FC 3C00B1AF */  sw         $s1, 0x3C($sp)
    /* 21B08 8015B700 3800B0AF */  sw         $s0, 0x38($sp)
    /* 21B0C 8015B704 2800A7AF */  sw         $a3, 0x28($sp)
    /* 21B10 8015B708 CC1980AF */  sw         $zero, %gp_rel(themeCount)($gp)
    /* 21B14 8015B70C E940000C */  jal        memset
    /* 21B18 8015B710 3000A8A3 */   sb        $t0, 0x30($sp)
    /* 21B1C 8015B714 21980000 */  addu       $s3, $zero, $zero
  .L8015B718:
    /* 21B20 8015B718 2800622A */  slti       $v0, $s3, 0x28
    /* 21B24 8015B71C 81004010 */  beqz       $v0, .L8015B924
    /* 21B28 8015B720 21900000 */   addu      $s2, $zero, $zero
    /* 21B2C 8015B724 01007526 */  addiu      $s5, $s3, 0x1
    /* 21B30 8015B728 14001424 */  addiu      $s4, $zero, 0x14
  .L8015B72C:
    /* 21B34 8015B72C 2800422A */  slti       $v0, $s2, 0x28
    /* 21B38 8015B730 7A004010 */  beqz       $v0, .L8015B91C
    /* 21B3C 8015B734 40101200 */   sll       $v0, $s2, 1
    /* 21B40 8015B738 0E80033C */  lui        $v1, %hi(dungeon)
    /* 21B44 8015B73C C4406324 */  addiu      $v1, $v1, %lo(dungeon)
    /* 21B48 8015B740 21105200 */  addu       $v0, $v0, $s2
    /* 21B4C 8015B744 40110200 */  sll        $v0, $v0, 5
    /* 21B50 8015B748 21104300 */  addu       $v0, $v0, $v1
    /* 21B54 8015B74C 40181300 */  sll        $v1, $s3, 1
    /* 21B58 8015B750 21186200 */  addu       $v1, $v1, $v0
    /* 21B5C 8015B754 00006294 */  lhu        $v0, 0x0($v1)
    /* 21B60 8015B758 00000000 */  nop
    /* 21B64 8015B75C 6C005E14 */  bne        $v0, $fp, .L8015B910
    /* 21B68 8015B760 00000000 */   nop
    /* 21B6C 8015B764 2800A48F */  lw         $a0, 0x28($sp)
    /* 21B70 8015B768 C9F6000C */  jal        ENG_random__Fl
    /* 21B74 8015B76C 00000000 */   nop
    /* 21B78 8015B770 67004014 */  bnez       $v0, .L8015B910
    /* 21B7C 8015B774 2120C003 */   addu      $a0, $fp, $zero
    /* 21B80 8015B778 21284002 */  addu       $a1, $s2, $zero
    /* 21B84 8015B77C 21306002 */  addu       $a2, $s3, $zero
    /* 21B88 8015B780 2138C002 */  addu       $a3, $s6, $zero
    /* 21B8C 8015B784 2000A227 */  addiu      $v0, $sp, 0x20
    /* 21B90 8015B788 1400A2AF */  sw         $v0, 0x14($sp)
    /* 21B94 8015B78C 2400A227 */  addiu      $v0, $sp, 0x24
    /* 21B98 8015B790 1000B7AF */  sw         $s7, 0x10($sp)
    /* 21B9C 8015B794 FB68050C */  jal        DRLG_WillThemeRoomFit__FiiiiiPiT5
    /* 21BA0 8015B798 1800A2AF */   sw        $v0, 0x18($sp)
    /* 21BA4 8015B79C FF004230 */  andi       $v0, $v0, 0xFF
    /* 21BA8 8015B7A0 5B004010 */  beqz       $v0, .L8015B910
    /* 21BAC 8015B7A4 00000000 */   nop
    /* 21BB0 8015B7A8 3000A893 */  lbu        $t0, 0x30($sp)
    /* 21BB4 8015B7AC 00000000 */  nop
    /* 21BB8 8015B7B0 22000011 */  beqz       $t0, .L8015B83C
    /* 21BBC 8015B7B4 FEFFD026 */   addiu     $s0, $s6, -0x2
    /* 21BC0 8015B7B8 2000A48F */  lw         $a0, 0x20($sp)
    /* 21BC4 8015B7BC 00000000 */  nop
    /* 21BC8 8015B7C0 23209000 */  subu       $a0, $a0, $s0
    /* 21BCC 8015B7C4 C9F6000C */  jal        ENG_random__Fl
    /* 21BD0 8015B7C8 01008424 */   addiu     $a0, $a0, 0x1
    /* 21BD4 8015B7CC C9F6000C */  jal        ENG_random__Fl
    /* 21BD8 8015B7D0 21204000 */   addu      $a0, $v0, $zero
    /* 21BDC 8015B7D4 21180202 */  addu       $v1, $s0, $v0
    /* 21BE0 8015B7D8 2A107000 */  slt        $v0, $v1, $s0
    /* 21BE4 8015B7DC 04004014 */  bnez       $v0, .L8015B7F0
    /* 21BE8 8015B7E0 FEFFF126 */   addiu     $s1, $s7, -0x2
    /* 21BEC 8015B7E4 2A102302 */  slt        $v0, $s1, $v1
    /* 21BF0 8015B7E8 03004010 */  beqz       $v0, .L8015B7F8
    /* 21BF4 8015B7EC 00000000 */   nop
  .L8015B7F0:
    /* 21BF8 8015B7F0 FF6D0508 */  j          .L8015B7FC
    /* 21BFC 8015B7F4 2000B0AF */   sw        $s0, 0x20($sp)
  .L8015B7F8:
    /* 21C00 8015B7F8 2000A3AF */  sw         $v1, 0x20($sp)
  .L8015B7FC:
    /* 21C04 8015B7FC 2400A48F */  lw         $a0, 0x24($sp)
    /* 21C08 8015B800 00000000 */  nop
    /* 21C0C 8015B804 23209000 */  subu       $a0, $a0, $s0
    /* 21C10 8015B808 C9F6000C */  jal        ENG_random__Fl
    /* 21C14 8015B80C 01008424 */   addiu     $a0, $a0, 0x1
    /* 21C18 8015B810 C9F6000C */  jal        ENG_random__Fl
    /* 21C1C 8015B814 21204000 */   addu      $a0, $v0, $zero
    /* 21C20 8015B818 21180202 */  addu       $v1, $s0, $v0
    /* 21C24 8015B81C 2A107000 */  slt        $v0, $v1, $s0
    /* 21C28 8015B820 03004014 */  bnez       $v0, .L8015B830
    /* 21C2C 8015B824 2A102302 */   slt       $v0, $s1, $v1
    /* 21C30 8015B828 03004010 */  beqz       $v0, .L8015B838
    /* 21C34 8015B82C 00000000 */   nop
  .L8015B830:
    /* 21C38 8015B830 0F6E0508 */  j          .L8015B83C
    /* 21C3C 8015B834 2400B0AF */   sw        $s0, 0x24($sp)
  .L8015B838:
    /* 21C40 8015B838 2400A3AF */  sw         $v1, 0x24($sp)
  .L8015B83C:
    /* 21C44 8015B83C 01004426 */  addiu      $a0, $s2, 0x1
    /* 21C48 8015B840 CC19828F */  lw         $v0, %gp_rel(themeCount)($gp)
    /* 21C4C 8015B844 2000A68F */  lw         $a2, 0x20($sp)
    /* 21C50 8015B848 2400A78F */  lw         $a3, 0x24($sp)
    /* 21C54 8015B84C 80180200 */  sll        $v1, $v0, 2
    /* 21C58 8015B850 21186200 */  addu       $v1, $v1, $v0
    /* 21C5C 8015B854 80180300 */  sll        $v1, $v1, 2
    /* 21C60 8015B858 1480013C */  lui        $at, %hi(themeLoc)
    /* 21C64 8015B85C 21082300 */  addu       $at, $at, $v1
    /* 21C68 8015B860 689C24AC */  sw         $a0, %lo(themeLoc)($at)
    /* 21C6C 8015B864 1480013C */  lui        $at, %hi(themeLoc + 0x4)
    /* 21C70 8015B868 21082300 */  addu       $at, $at, $v1
    /* 21C74 8015B86C 6C9C35AC */  sw         $s5, %lo(themeLoc + 0x4)($at)
    /* 21C78 8015B870 1480013C */  lui        $at, %hi(themeLoc + 0xC)
    /* 21C7C 8015B874 21082300 */  addu       $at, $at, $v1
    /* 21C80 8015B878 749C26AC */  sw         $a2, %lo(themeLoc + 0xC)($at)
    /* 21C84 8015B87C 1480013C */  lui        $at, %hi(themeLoc + 0x10)
    /* 21C88 8015B880 21082300 */  addu       $at, $at, $v1
    /* 21C8C 8015B884 789C27AC */  sw         $a3, %lo(themeLoc + 0x10)($at)
    /* 21C90 8015B888 8D198393 */  lbu        $v1, %gp_rel(leveltype)($gp)
    /* 21C94 8015B88C 03000224 */  addiu      $v0, $zero, 0x3
    /* 21C98 8015B890 0D006214 */  bne        $v1, $v0, .L8015B8C8
    /* 21C9C 8015B894 2128A002 */   addu      $a1, $s5, $zero
    /* 21CA0 8015B898 21208002 */  addu       $a0, $s4, $zero
    /* 21CA4 8015B89C 40281300 */  sll        $a1, $s3, 1
    /* 21CA8 8015B8A0 1400A524 */  addiu      $a1, $a1, 0x14
    /* 21CAC 8015B8A4 21304602 */  addu       $a2, $s2, $a2
    /* 21CB0 8015B8A8 40300600 */  sll        $a2, $a2, 1
    /* 21CB4 8015B8AC 0F00C624 */  addiu      $a2, $a2, 0xF
    /* 21CB8 8015B8B0 21386702 */  addu       $a3, $s3, $a3
    /* 21CBC 8015B8B4 40380700 */  sll        $a3, $a3, 1
    /* 21CC0 8015B8B8 3968050C */  jal        DRLG_RectTrans__Fiiii
    /* 21CC4 8015B8BC 0F00E724 */   addiu     $a3, $a3, 0xF
    /* 21CC8 8015B8C0 356E0508 */  j          .L8015B8D4
    /* 21CCC 8015B8C4 00000000 */   nop
  .L8015B8C8:
    /* 21CD0 8015B8C8 21304602 */  addu       $a2, $s2, $a2
    /* 21CD4 8015B8CC 375E010C */  jal        DRLG_MRectTrans__Fiiii
    /* 21CD8 8015B8D0 21386702 */   addu      $a3, $s3, $a3
  .L8015B8D4:
    /* 21CDC 8015B8D4 CC19848F */  lw         $a0, %gp_rel(themeCount)($gp)
    /* 21CE0 8015B8D8 C8198383 */  lb         $v1, %gp_rel(TransVal)($gp)
    /* 21CE4 8015B8DC 80100400 */  sll        $v0, $a0, 2
    /* 21CE8 8015B8E0 21104400 */  addu       $v0, $v0, $a0
    /* 21CEC 8015B8E4 80100200 */  sll        $v0, $v0, 2
    /* 21CF0 8015B8E8 FFFF6324 */  addiu      $v1, $v1, -0x1
    /* 21CF4 8015B8EC 1480013C */  lui        $at, %hi(themeLoc + 0x8)
    /* 21CF8 8015B8F0 21082200 */  addu       $at, $at, $v0
    /* 21CFC 8015B8F4 709C23AC */  sw         $v1, %lo(themeLoc + 0x8)($at)
    /* 21D00 8015B8F8 AD69050C */  jal        DRLG_CreateThemeRoom__Fi
    /* 21D04 8015B8FC 00000000 */   nop
    /* 21D08 8015B900 CC19828F */  lw         $v0, %gp_rel(themeCount)($gp)
    /* 21D0C 8015B904 00000000 */  nop
    /* 21D10 8015B908 01004224 */  addiu      $v0, $v0, 0x1
    /* 21D14 8015B90C CC1982AF */  sw         $v0, %gp_rel(themeCount)($gp)
  .L8015B910:
    /* 21D18 8015B910 02009426 */  addiu      $s4, $s4, 0x2
    /* 21D1C 8015B914 CB6D0508 */  j          .L8015B72C
    /* 21D20 8015B918 01005226 */   addiu     $s2, $s2, 0x1
  .L8015B91C:
    /* 21D24 8015B91C C66D0508 */  j          .L8015B718
    /* 21D28 8015B920 01007326 */   addiu     $s3, $s3, 0x1
  .L8015B924:
    /* 21D2C 8015B924 5C00BF8F */  lw         $ra, 0x5C($sp)
    /* 21D30 8015B928 5800BE8F */  lw         $fp, 0x58($sp)
    /* 21D34 8015B92C 5400B78F */  lw         $s7, 0x54($sp)
    /* 21D38 8015B930 5000B68F */  lw         $s6, 0x50($sp)
    /* 21D3C 8015B934 4C00B58F */  lw         $s5, 0x4C($sp)
    /* 21D40 8015B938 4800B48F */  lw         $s4, 0x48($sp)
    /* 21D44 8015B93C 4400B38F */  lw         $s3, 0x44($sp)
    /* 21D48 8015B940 4000B28F */  lw         $s2, 0x40($sp)
    /* 21D4C 8015B944 3C00B18F */  lw         $s1, 0x3C($sp)
    /* 21D50 8015B948 3800B08F */  lw         $s0, 0x38($sp)
    /* 21D54 8015B94C 6000BD27 */  addiu      $sp, $sp, 0x60
    /* 21D58 8015B950 0800E003 */  jr         $ra
    /* 21D5C 8015B954 00000000 */   nop
endlabel DRLG_PlaceThemeRooms__FiiiiUc
