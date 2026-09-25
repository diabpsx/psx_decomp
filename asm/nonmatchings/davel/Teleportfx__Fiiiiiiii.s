.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Teleportfx__Fiiiiiiii, 0x300

glabel Teleportfx__Fiiiiiiii
    /* 8FAC0 8009FAC0 50FEBD27 */  addiu      $sp, $sp, -0x1B0
    /* 8FAC4 8009FAC4 C401A28F */  lw         $v0, 0x1C4($sp)
    /* 8FAC8 8009FAC8 2801A4AF */  sw         $a0, 0x128($sp)
    /* 8FACC 8009FACC 21200000 */  addu       $a0, $zero, $zero
    /* 8FAD0 8009FAD0 AC01BFAF */  sw         $ra, 0x1AC($sp)
    /* 8FAD4 8009FAD4 A801BEAF */  sw         $fp, 0x1A8($sp)
    /* 8FAD8 8009FAD8 A401B7AF */  sw         $s7, 0x1A4($sp)
    /* 8FADC 8009FADC A001B6AF */  sw         $s6, 0x1A0($sp)
    /* 8FAE0 8009FAE0 9C01B5AF */  sw         $s5, 0x19C($sp)
    /* 8FAE4 8009FAE4 9801B4AF */  sw         $s4, 0x198($sp)
    /* 8FAE8 8009FAE8 9401B3AF */  sw         $s3, 0x194($sp)
    /* 8FAEC 8009FAEC 9001B2AF */  sw         $s2, 0x190($sp)
    /* 8FAF0 8009FAF0 8C01B1AF */  sw         $s1, 0x18C($sp)
    /* 8FAF4 8009FAF4 8801B0AF */  sw         $s0, 0x188($sp)
    /* 8FAF8 8009FAF8 3001A5AF */  sw         $a1, 0x130($sp)
    /* 8FAFC 8009FAFC 3801A6AF */  sw         $a2, 0x138($sp)
    /* 8FB00 8009FB00 4001A7AF */  sw         $a3, 0x140($sp)
    /* 8FB04 8009FB04 5001A0AF */  sw         $zero, 0x150($sp)
    /* 8FB08 8009FB08 02440200 */  srl        $t0, $v0, 16
    /* 8FB0C 8009FB0C 024A0200 */  srl        $t1, $v0, 8
    /* 8FB10 8009FB10 5801A8A3 */  sb         $t0, 0x158($sp)
    /* 8FB14 8009FB14 6001A9A3 */  sb         $t1, 0x160($sp)
    /* 8FB18 8009FB18 044F020C */  jal        GM_UseTexData__Fi
    /* 8FB1C 8009FB1C 6801A2A3 */   sb        $v0, 0x168($sp)
    /* 8FB20 8009FB20 C801A88F */  lw         $t0, 0x1C8($sp)
    /* 8FB24 8009FB24 00000000 */  nop
    /* 8FB28 8009FB28 95000019 */  blez       $t0, .L8009FD80
    /* 8FB2C 8009FB2C 4801A2AF */   sw        $v0, 0x148($sp)
    /* 8FB30 8009FB30 FF00093C */  lui        $t1, (0xFFFFFF >> 16)
    /* 8FB34 8009FB34 FFFF2935 */  ori        $t1, $t1, (0xFFFFFF & 0xFFFF)
    /* 8FB38 8009FB38 7001A9AF */  sw         $t1, 0x170($sp)
    /* 8FB3C 8009FB3C 8001A0AF */  sw         $zero, 0x180($sp)
  .L8009FB40:
    /* 8FB40 8009FB40 7C09828F */  lw         $v0, %gp_rel(D_8011B0FC)($gp)
    /* 8FB44 8009FB44 00000000 */  nop
    /* 8FB48 8009FB48 07004014 */  bnez       $v0, .L8009FB68
    /* 8FB4C 8009FB4C 00000000 */   nop
    /* 8FB50 8009FB50 3D83000C */  jal        GU_GetRnd
    /* 8FB54 8009FB54 00000000 */   nop
    /* 8FB58 8009FB58 8001A88F */  lw         $t0, 0x180($sp)
    /* 8FB5C 8009FB5C 2000A327 */  addiu      $v1, $sp, 0x20
    /* 8FB60 8009FB60 21180301 */  addu       $v1, $t0, $v1
    /* 8FB64 8009FB64 000062AC */  sw         $v0, 0x0($v1)
  .L8009FB68:
    /* 8FB68 8009FB68 8001A98F */  lw         $t1, 0x180($sp)
    /* 8FB6C 8009FB6C 00000000 */  nop
    /* 8FB70 8009FB70 2110A903 */  addu       $v0, $sp, $t1
    /* 8FB74 8009FB74 2000428C */  lw         $v0, 0x20($v0)
    /* 8FB78 8009FB78 3801A88F */  lw         $t0, 0x138($sp)
    /* 8FB7C 8009FB7C FFFF5530 */  andi       $s5, $v0, 0xFFFF
    /* 8FB80 8009FB80 1A00A802 */  div        $zero, $s5, $t0
    /* 8FB84 8009FB84 10300000 */  mfhi       $a2
    /* 8FB88 8009FB88 4001A88F */  lw         $t0, 0x140($sp)
    /* 8FB8C 8009FB8C 038C0200 */  sra        $s1, $v0, 16
    /* 8FB90 8009FB90 1A002802 */  div        $zero, $s1, $t0
    /* 8FB94 8009FB94 10180000 */  mfhi       $v1
    /* 8FB98 8009FB98 5001A98F */  lw         $t1, 0x150($sp)
    /* 8FB9C 8009FB9C 4801A48F */  lw         $a0, 0x148($sp)
    /* 8FBA0 8009FBA0 07002231 */  andi       $v0, $t1, 0x7
    /* 8FBA4 8009FBA4 D0005E24 */  addiu      $fp, $v0, 0xD0
    /* 8FBA8 8009FBA8 2128C003 */  addu       $a1, $fp, $zero
    /* 8FBAC 8009FBAC 2801A88F */  lw         $t0, 0x128($sp)
    /* 8FBB0 8009FBB0 3001A98F */  lw         $t1, 0x130($sp)
    /* 8FBB4 8009FBB4 21900601 */  addu       $s2, $t0, $a2
    /* 8FBB8 8009FBB8 7082020C */  jal        GetFr__7TextDati_800a09c0
    /* 8FBBC 8009FBBC 21982301 */   addu      $s3, $t1, $v1
    /* 8FBC0 8009FBC0 0800428C */  lw         $v0, 0x8($v0)
    /* 8FBC4 8009FBC4 C001A88F */  lw         $t0, 0x1C0($sp)
    /* 8FBC8 8009FBC8 FF015430 */  andi       $s4, $v0, 0x1FF
    /* 8FBCC 8009FBCC 18008802 */  mult       $s4, $t0
    /* 8FBD0 8009FBD0 42820200 */  srl        $s0, $v0, 9
    /* 8FBD4 8009FBD4 12200000 */  mflo       $a0
    /* 8FBD8 8009FBD8 03008104 */  bgez       $a0, .L8009FBE8
    /* 8FBDC 8009FBDC FF011032 */   andi      $s0, $s0, 0x1FF
    /* 8FBE0 8009FBE0 FF7F8424 */  addiu      $a0, $a0, 0x7FFF
    /* 8FBE4 8009FBE4 C001A88F */  lw         $t0, 0x1C0($sp)
  .L8009FBE8:
    /* 8FBE8 8009FBE8 00000000 */  nop
    /* 8FBEC 8009FBEC 18000802 */  mult       $s0, $t0
    /* 8FBF0 8009FBF0 12180000 */  mflo       $v1
    /* 8FBF4 8009FBF4 02006104 */  bgez       $v1, .L8009FC00
    /* 8FBF8 8009FBF8 C3A30400 */   sra       $s4, $a0, 15
    /* 8FBFC 8009FBFC FF7F6324 */  addiu      $v1, $v1, 0x7FFF
  .L8009FC00:
    /* 8FC00 8009FC00 C3830300 */  sra        $s0, $v1, 15
    /* 8FC04 8009FC04 C2170400 */  srl        $v0, $a0, 31
    /* 8FC08 8009FC08 21108202 */  addu       $v0, $s4, $v0
    /* 8FC0C 8009FC0C 43100200 */  sra        $v0, $v0, 1
    /* 8FC10 8009FC10 23904202 */  subu       $s2, $s2, $v0
    /* 8FC14 8009FC14 C2170300 */  srl        $v0, $v1, 31
    /* 8FC18 8009FC18 21100202 */  addu       $v0, $s0, $v0
    /* 8FC1C 8009FC1C 43100200 */  sra        $v0, $v0, 1
    /* 8FC20 8009FC20 23986202 */  subu       $s3, $s3, $v0
    /* 8FC24 8009FC24 5801A293 */  lbu        $v0, 0x158($sp)
    /* 8FC28 8009FC28 00000000 */  nop
    /* 8FC2C 8009FC2C 02004010 */  beqz       $v0, .L8009FC38
    /* 8FC30 8009FC30 21B02002 */   addu      $s6, $s1, $zero
    /* 8FC34 8009FC34 5801B693 */  lbu        $s6, 0x158($sp)
  .L8009FC38:
    /* 8FC38 8009FC38 6001A293 */  lbu        $v0, 0x160($sp)
    /* 8FC3C 8009FC3C 00000000 */  nop
    /* 8FC40 8009FC40 02004010 */  beqz       $v0, .L8009FC4C
    /* 8FC44 8009FC44 02BA1500 */   srl       $s7, $s5, 8
    /* 8FC48 8009FC48 6001B793 */  lbu        $s7, 0x160($sp)
  .L8009FC4C:
    /* 8FC4C 8009FC4C 6801A293 */  lbu        $v0, 0x168($sp)
    /* 8FC50 8009FC50 00000000 */  nop
    /* 8FC54 8009FC54 02004010 */  beqz       $v0, .L8009FC60
    /* 8FC58 8009FC58 2188A002 */   addu      $s1, $s5, $zero
    /* 8FC5C 8009FC5C 6801B193 */  lbu        $s1, 0x168($sp)
  .L8009FC60:
    /* 8FC60 8009FC60 2B82020C */  jal        PRIM_GetPrim__FPP8POLY_FT4_800a08ac
    /* 8FC64 8009FC64 2001A427 */   addiu     $a0, $sp, 0x120
    /* 8FC68 8009FC68 4801A48F */  lw         $a0, 0x148($sp)
    /* 8FC6C 8009FC6C 2130C003 */  addu       $a2, $fp, $zero
    /* 8FC70 8009FC70 1000B3AF */  sw         $s3, 0x10($sp)
    /* 8FC74 8009FC74 1400A0AF */  sw         $zero, 0x14($sp)
    /* 8FC78 8009FC78 1800A0AF */  sw         $zero, 0x18($sp)
    /* 8FC7C 8009FC7C 2001A58F */  lw         $a1, 0x120($sp)
    /* 8FC80 8009FC80 A04A020C */  jal        PrepareFt4__7TextDatP8POLY_FT4iiiii
    /* 8FC84 8009FC84 21384002 */   addu      $a3, $s2, $zero
    /* 8FC88 8009FC88 2001A28F */  lw         $v0, 0x120($sp)
    /* 8FC8C 8009FC8C 21285402 */  addu       $a1, $s2, $s4
    /* 8FC90 8009FC90 080052A4 */  sh         $s2, 0x8($v0)
    /* 8FC94 8009FC94 0A0053A4 */  sh         $s3, 0xA($v0)
    /* 8FC98 8009FC98 100045A4 */  sh         $a1, 0x10($v0)
    /* 8FC9C 8009FC9C 120053A4 */  sh         $s3, 0x12($v0)
    /* 8FCA0 8009FCA0 180052A4 */  sh         $s2, 0x18($v0)
    /* 8FCA4 8009FCA4 040056A0 */  sb         $s6, 0x4($v0)
    /* 8FCA8 8009FCA8 2001A48F */  lw         $a0, 0x120($sp)
    /* 8FCAC 8009FCAC 21187002 */  addu       $v1, $s3, $s0
    /* 8FCB0 8009FCB0 1A0043A4 */  sh         $v1, 0x1A($v0)
    /* 8FCB4 8009FCB4 200045A4 */  sh         $a1, 0x20($v0)
    /* 8FCB8 8009FCB8 220043A4 */  sh         $v1, 0x22($v0)
    /* 8FCBC 8009FCBC 050097A0 */  sb         $s7, 0x5($a0)
    /* 8FCC0 8009FCC0 2001A28F */  lw         $v0, 0x120($sp)
    /* 8FCC4 8009FCC4 00000000 */  nop
    /* 8FCC8 8009FCC8 060051A0 */  sb         $s1, 0x6($v0)
    /* 8FCCC 8009FCCC 2001A38F */  lw         $v1, 0x120($sp)
    /* 8FCD0 8009FCD0 00000000 */  nop
    /* 8FCD4 8009FCD4 07006290 */  lbu        $v0, 0x7($v1)
    /* 8FCD8 8009FCD8 00000000 */  nop
    /* 8FCDC 8009FCDC 02004234 */  ori        $v0, $v0, 0x2
    /* 8FCE0 8009FCE0 070062A0 */  sb         $v0, 0x7($v1)
    /* 8FCE4 8009FCE4 2001A38F */  lw         $v1, 0x120($sp)
    /* 8FCE8 8009FCE8 00000000 */  nop
    /* 8FCEC 8009FCEC 07006290 */  lbu        $v0, 0x7($v1)
    /* 8FCF0 8009FCF0 00000000 */  nop
    /* 8FCF4 8009FCF4 FE004230 */  andi       $v0, $v0, 0xFE
    /* 8FCF8 8009FCF8 070062A0 */  sb         $v0, 0x7($v1)
    /* 8FCFC 8009FCFC 2001A58F */  lw         $a1, 0x120($sp)
    /* 8FD00 8009FD00 8001A98F */  lw         $t1, 0x180($sp)
    /* 8FD04 8009FD04 1280023C */  lui        $v0, %hi(ThisOt)
    /* 8FD08 8009FD08 B4AA428C */  lw         $v0, %lo(ThisOt)($v0)
    /* 8FD0C 8009FD0C CC01A88F */  lw         $t0, 0x1CC($sp)
    /* 8FD10 8009FD10 04002925 */  addiu      $t1, $t1, 0x4
    /* 8FD14 8009FD14 80200800 */  sll        $a0, $t0, 2
    /* 8FD18 8009FD18 21208200 */  addu       $a0, $a0, $v0
    /* 8FD1C 8009FD1C 8001A9AF */  sw         $t1, 0x180($sp)
    /* 8FD20 8009FD20 00FF093C */  lui        $t1, (0xFF000000 >> 16)
    /* 8FD24 8009FD24 0000A38C */  lw         $v1, 0x0($a1)
    /* 8FD28 8009FD28 0800828C */  lw         $v0, 0x8($a0)
    /* 8FD2C 8009FD2C 7001A88F */  lw         $t0, 0x170($sp)
    /* 8FD30 8009FD30 24186900 */  and        $v1, $v1, $t1
    /* 8FD34 8009FD34 24104800 */  and        $v0, $v0, $t0
    /* 8FD38 8009FD38 25186200 */  or         $v1, $v1, $v0
    /* 8FD3C 8009FD3C 00FF083C */  lui        $t0, (0xFF000000 >> 16)
    /* 8FD40 8009FD40 0000A3AC */  sw         $v1, 0x0($a1)
    /* 8FD44 8009FD44 5001A98F */  lw         $t1, 0x150($sp)
    /* 8FD48 8009FD48 0800828C */  lw         $v0, 0x8($a0)
    /* 8FD4C 8009FD4C 01002925 */  addiu      $t1, $t1, 0x1
    /* 8FD50 8009FD50 5001A9AF */  sw         $t1, 0x150($sp)
    /* 8FD54 8009FD54 7001A98F */  lw         $t1, 0x170($sp)
    /* 8FD58 8009FD58 24104800 */  and        $v0, $v0, $t0
    /* 8FD5C 8009FD5C 2428A900 */  and        $a1, $a1, $t1
    /* 8FD60 8009FD60 25104500 */  or         $v0, $v0, $a1
    /* 8FD64 8009FD64 080082AC */  sw         $v0, 0x8($a0)
    /* 8FD68 8009FD68 5001A88F */  lw         $t0, 0x150($sp)
    /* 8FD6C 8009FD6C C801A98F */  lw         $t1, 0x1C8($sp)
    /* 8FD70 8009FD70 00000000 */  nop
    /* 8FD74 8009FD74 2A100901 */  slt        $v0, $t0, $t1
    /* 8FD78 8009FD78 71FF4014 */  bnez       $v0, .L8009FB40
    /* 8FD7C 8009FD7C 00000000 */   nop
  .L8009FD80:
    /* 8FD80 8009FD80 4801A48F */  lw         $a0, 0x148($sp)
    /* 8FD84 8009FD84 604F020C */  jal        GM_FinishedUsing__FP7TextDat
    /* 8FD88 8009FD88 00000000 */   nop
    /* 8FD8C 8009FD8C AC01BF8F */  lw         $ra, 0x1AC($sp)
    /* 8FD90 8009FD90 A801BE8F */  lw         $fp, 0x1A8($sp)
    /* 8FD94 8009FD94 A401B78F */  lw         $s7, 0x1A4($sp)
    /* 8FD98 8009FD98 A001B68F */  lw         $s6, 0x1A0($sp)
    /* 8FD9C 8009FD9C 9C01B58F */  lw         $s5, 0x19C($sp)
    /* 8FDA0 8009FDA0 9801B48F */  lw         $s4, 0x198($sp)
    /* 8FDA4 8009FDA4 9401B38F */  lw         $s3, 0x194($sp)
    /* 8FDA8 8009FDA8 9001B28F */  lw         $s2, 0x190($sp)
    /* 8FDAC 8009FDAC 8C01B18F */  lw         $s1, 0x18C($sp)
    /* 8FDB0 8009FDB0 8801B08F */  lw         $s0, 0x188($sp)
    /* 8FDB4 8009FDB4 B001BD27 */  addiu      $sp, $sp, 0x1B0
    /* 8FDB8 8009FDB8 0800E003 */  jr         $ra
    /* 8FDBC 8009FDBC 00000000 */   nop
endlabel Teleportfx__Fiiiiiiii
