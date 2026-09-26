.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ClrAllMonsters__Fv, 0x138

glabel ClrAllMonsters__Fv
    /* 25F50 8015FB48 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 25F54 8015FB4C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 25F58 8015FB50 21880000 */  addu       $s1, $zero, $zero
    /* 25F5C 8015FB54 1800B2AF */  sw         $s2, 0x18($sp)
    /* 25F60 8015FB58 21900000 */  addu       $s2, $zero, $zero
    /* 25F64 8015FB5C 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 25F68 8015FB60 1000B0AF */  sw         $s0, 0x10($sp)
  .L8015FB64:
    /* 25F6C 8015FB64 21202002 */  addu       $a0, $s1, $zero
    /* 25F70 8015FB68 1080103C */  lui        $s0, %hi(monster)
    /* 25F74 8015FB6C 94531026 */  addiu      $s0, $s0, %lo(monster)
    /* 25F78 8015FB70 F4FD010C */  jal        ClearMVars__Fi
    /* 25F7C 8015FB74 21805002 */   addu      $s0, $s2, $s0
    /* 25F80 8015FB78 08000424 */  addiu      $a0, $zero, 0x8
    /* 25F84 8015FB7C 5C0000AE */  sw         $zero, 0x5C($s0)
    /* 25F88 8015FB80 490000A2 */  sb         $zero, 0x49($s0)
    /* 25F8C 8015FB84 330000A2 */  sb         $zero, 0x33($s0)
    /* 25F90 8015FB88 180000A6 */  sh         $zero, 0x18($s0)
    /* 25F94 8015FB8C 1A0000A6 */  sh         $zero, 0x1A($s0)
    /* 25F98 8015FB90 340000A2 */  sb         $zero, 0x34($s0)
    /* 25F9C 8015FB94 350000A2 */  sb         $zero, 0x35($s0)
    /* 25FA0 8015FB98 360000A2 */  sb         $zero, 0x36($s0)
    /* 25FA4 8015FB9C 370000A2 */  sb         $zero, 0x37($s0)
    /* 25FA8 8015FBA0 380000A2 */  sb         $zero, 0x38($s0)
    /* 25FAC 8015FBA4 C9F6000C */  jal        ENG_random__Fl
    /* 25FB0 8015FBA8 390000A2 */   sb        $zero, 0x39($s0)
    /* 25FB4 8015FBAC 3C0002A2 */  sb         $v0, 0x3C($s0)
    /* 25FB8 8015FBB0 5A0000A2 */  sb         $zero, 0x5A($s0)
    /* 25FBC 8015FBB4 3E0000A2 */  sb         $zero, 0x3E($s0)
    /* 25FC0 8015FBB8 3F0000A2 */  sb         $zero, 0x3F($s0)
    /* 25FC4 8015FBBC 400000A2 */  sb         $zero, 0x40($s0)
    /* 25FC8 8015FBC0 410000A2 */  sb         $zero, 0x41($s0)
    /* 25FCC 8015FBC4 5B0000A2 */  sb         $zero, 0x5B($s0)
    /* 25FD0 8015FBC8 1280043C */  lui        $a0, %hi(gbActivePlayers)
    /* 25FD4 8015FBCC A3B98490 */  lbu        $a0, %lo(gbActivePlayers)($a0)
    /* 25FD8 8015FBD0 280000A6 */  sh         $zero, 0x28($s0)
    /* 25FDC 8015FBD4 2A0000A6 */  sh         $zero, 0x2A($s0)
    /* 25FE0 8015FBD8 C9F6000C */  jal        ENG_random__Fl
    /* 25FE4 8015FBDC 2C0000A6 */   sh        $zero, 0x2C($s0)
    /* 25FE8 8015FBE0 3D0002A2 */  sb         $v0, 0x3D($s0)
    /* 25FEC 8015FBE4 FF004230 */  andi       $v0, $v0, 0xFF
    /* 25FF0 8015FBE8 40180200 */  sll        $v1, $v0, 1
    /* 25FF4 8015FBEC 21186200 */  addu       $v1, $v1, $v0
    /* 25FF8 8015FBF0 80180300 */  sll        $v1, $v1, 2
    /* 25FFC 8015FBF4 21186200 */  addu       $v1, $v1, $v0
    /* 26000 8015FBF8 00190300 */  sll        $v1, $v1, 4
    /* 26004 8015FBFC 23186200 */  subu       $v1, $v1, $v0
    /* 26008 8015FC00 80180300 */  sll        $v1, $v1, 2
    /* 2600C 8015FC04 21186200 */  addu       $v1, $v1, $v0
    /* 26010 8015FC08 C0180300 */  sll        $v1, $v1, 3
    /* 26014 8015FC0C 0E80013C */  lui        $at, %hi(plr + 0x30)
    /* 26018 8015FC10 21082300 */  addu       $at, $at, $v1
    /* 2601C 8015FC14 68A52294 */  lhu        $v0, %lo(plr + 0x30)($at)
    /* 26020 8015FC18 3D000392 */  lbu        $v1, 0x3D($s0)
    /* 26024 8015FC1C 4A0002A2 */  sb         $v0, 0x4A($s0)
    /* 26028 8015FC20 40100300 */  sll        $v0, $v1, 1
    /* 2602C 8015FC24 21104300 */  addu       $v0, $v0, $v1
    /* 26030 8015FC28 80100200 */  sll        $v0, $v0, 2
    /* 26034 8015FC2C 21104300 */  addu       $v0, $v0, $v1
    /* 26038 8015FC30 00110200 */  sll        $v0, $v0, 4
    /* 2603C 8015FC34 23104300 */  subu       $v0, $v0, $v1
    /* 26040 8015FC38 80100200 */  sll        $v0, $v0, 2
    /* 26044 8015FC3C 21104300 */  addu       $v0, $v0, $v1
    /* 26048 8015FC40 C0100200 */  sll        $v0, $v0, 3
    /* 2604C 8015FC44 0E80013C */  lui        $at, %hi(plr + 0x32)
    /* 26050 8015FC48 21082200 */  addu       $at, $at, $v0
    /* 26054 8015FC4C 6AA52294 */  lhu        $v0, %lo(plr + 0x32)($at)
    /* 26058 8015FC50 01003126 */  addiu      $s1, $s1, 0x1
    /* 2605C 8015FC54 4B0002A2 */  sb         $v0, 0x4B($s0)
    /* 26060 8015FC58 BE00222A */  slti       $v0, $s1, 0xBE
    /* 26064 8015FC5C C1FF4014 */  bnez       $v0, .L8015FB64
    /* 26068 8015FC60 68005226 */   addiu     $s2, $s2, 0x68
    /* 2606C 8015FC64 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 26070 8015FC68 1800B28F */  lw         $s2, 0x18($sp)
    /* 26074 8015FC6C 1400B18F */  lw         $s1, 0x14($sp)
    /* 26078 8015FC70 1000B08F */  lw         $s0, 0x10($sp)
    /* 2607C 8015FC74 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 26080 8015FC78 0800E003 */  jr         $ra
    /* 26084 8015FC7C 00000000 */   nop
endlabel ClrAllMonsters__Fv
