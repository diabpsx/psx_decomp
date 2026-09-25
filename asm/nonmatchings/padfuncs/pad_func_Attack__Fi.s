.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching pad_func_Attack__Fi, 0x4B4

glabel pad_func_Attack__Fi
    /* 90EEC 800A0EEC B8FFBD27 */  addiu      $sp, $sp, -0x48
    /* 90EF0 800A0EF0 3400B5AF */  sw         $s5, 0x34($sp)
    /* 90EF4 800A0EF4 21A88000 */  addu       $s5, $a0, $zero
    /* 90EF8 800A0EF8 40101500 */  sll        $v0, $s5, 1
    /* 90EFC 800A0EFC 21105500 */  addu       $v0, $v0, $s5
    /* 90F00 800A0F00 80100200 */  sll        $v0, $v0, 2
    /* 90F04 800A0F04 21105500 */  addu       $v0, $v0, $s5
    /* 90F08 800A0F08 00110200 */  sll        $v0, $v0, 4
    /* 90F0C 800A0F0C 23105500 */  subu       $v0, $v0, $s5
    /* 90F10 800A0F10 80100200 */  sll        $v0, $v0, 2
    /* 90F14 800A0F14 21105500 */  addu       $v0, $v0, $s5
    /* 90F18 800A0F18 C0100200 */  sll        $v0, $v0, 3
    /* 90F1C 800A0F1C 0E80033C */  lui        $v1, %hi(plr)
    /* 90F20 800A0F20 38A56324 */  addiu      $v1, $v1, %lo(plr)
    /* 90F24 800A0F24 2800B2AF */  sw         $s2, 0x28($sp)
    /* 90F28 800A0F28 21904300 */  addu       $s2, $v0, $v1
    /* 90F2C 800A0F2C 4400BFAF */  sw         $ra, 0x44($sp)
    /* 90F30 800A0F30 4000BEAF */  sw         $fp, 0x40($sp)
    /* 90F34 800A0F34 3C00B7AF */  sw         $s7, 0x3C($sp)
    /* 90F38 800A0F38 3800B6AF */  sw         $s6, 0x38($sp)
    /* 90F3C 800A0F3C 3000B4AF */  sw         $s4, 0x30($sp)
    /* 90F40 800A0F40 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 90F44 800A0F44 2400B1AF */  sw         $s1, 0x24($sp)
    /* 90F48 800A0F48 2000B0AF */  sw         $s0, 0x20($sp)
    /* 90F4C 800A0F4C 30005086 */  lh         $s0, 0x30($s2)
    /* 90F50 800A0F50 32005186 */  lh         $s1, 0x32($s2)
    /* 90F54 800A0F54 A4BF020C */  jal        GetSpellTarget__Fi
    /* 90F58 800A0F58 00000000 */   nop
    /* 90F5C 800A0F5C C890020C */  jal        Active__11SpellTarget_800a4320
    /* 90F60 800A0F60 21204000 */   addu      $a0, $v0, $zero
    /* 90F64 800A0F64 07004010 */  beqz       $v0, .L800A0F84
    /* 90F68 800A0F68 00000000 */   nop
    /* 90F6C 800A0F6C 01DE000C */  jal        NewCursor__Fi
    /* 90F70 800A0F70 01000424 */   addiu     $a0, $zero, 0x1
    /* 90F74 800A0F74 E385020C */  jal        RemoveTargetCursor__Fi
    /* 90F78 800A0F78 2120A002 */   addu      $a0, $s5, $zero
    /* 90F7C 800A0F7C DB840208 */  j          .L800A136C
    /* 90F80 800A0F80 00000000 */   nop
  .L800A0F84:
    /* 90F84 800A0F84 0000438E */  lw         $v1, 0x0($s2)
    /* 90F88 800A0F88 00000000 */  nop
    /* 90F8C 800A0F8C 04006228 */  slti       $v0, $v1, 0x4
    /* 90F90 800A0F90 0A004014 */  bnez       $v0, .L800A0FBC
    /* 90F94 800A0F94 FCFF6224 */   addiu     $v0, $v1, -0x4
    /* 90F98 800A0F98 0200422C */  sltiu      $v0, $v0, 0x2
    /* 90F9C 800A0F9C F3004010 */  beqz       $v0, .L800A136C
    /* 90FA0 800A0FA0 00000000 */   nop
    /* 90FA4 800A0FA4 5400428E */  lw         $v0, 0x54($s2)
    /* 90FA8 800A0FA8 8C01438E */  lw         $v1, 0x18C($s2)
    /* 90FAC 800A0FAC 00000000 */  nop
    /* 90FB0 800A0FB0 2A104300 */  slt        $v0, $v0, $v1
    /* 90FB4 800A0FB4 ED004014 */  bnez       $v0, .L800A136C
    /* 90FB8 800A0FB8 00000000 */   nop
  .L800A0FBC:
    /* 90FBC 800A0FBC 1280023C */  lui        $v0, %hi(questlog)
    /* 90FC0 800A0FC0 29BA4290 */  lbu        $v0, %lo(questlog)($v0)
    /* 90FC4 800A0FC4 1280033C */  lui        $v1, %hi(stextflag)
    /* 90FC8 800A0FC8 E0BA6380 */  lb         $v1, %lo(stextflag)($v1)
    /* 90FCC 800A0FCC 1280043C */  lui        $a0, %hi(qtextflag)
    /* 90FD0 800A0FD0 60B98490 */  lbu        $a0, %lo(qtextflag)($a0)
    /* 90FD4 800A0FD4 25104300 */  or         $v0, $v0, $v1
    /* 90FD8 800A0FD8 25104400 */  or         $v0, $v0, $a0
    /* 90FDC 800A0FDC 1280033C */  lui        $v1, %hi(chrflag)
    /* 90FE0 800A0FE0 C0B66390 */  lbu        $v1, %lo(chrflag)($v1)
    /* 90FE4 800A0FE4 1280043C */  lui        $a0, %hi(invflag)
    /* 90FE8 800A0FE8 2CC38490 */  lbu        $a0, %lo(invflag)($a0)
    /* 90FEC 800A0FEC 25104300 */  or         $v0, $v0, $v1
    /* 90FF0 800A0FF0 25104400 */  or         $v0, $v0, $a0
    /* 90FF4 800A0FF4 80181500 */  sll        $v1, $s5, 2
    /* 90FF8 800A0FF8 1280043C */  lui        $a0, %hi(optionsflag)
    /* 90FFC 800A0FFC 48B2848C */  lw         $a0, %lo(optionsflag)($a0)
    /* 91000 800A1000 1280013C */  lui        $at, %hi(_spselflag)
    /* 91004 800A1004 21082300 */  addu       $at, $at, $v1
    /* 91008 800A1008 50B6238C */  lw         $v1, %lo(_spselflag)($at)
    /* 9100C 800A100C 25104400 */  or         $v0, $v0, $a0
    /* 91010 800A1010 25104300 */  or         $v0, $v0, $v1
    /* 91014 800A1014 D5004014 */  bnez       $v0, .L800A136C
    /* 91018 800A1018 00000000 */   nop
    /* 9101C 800A101C 1280023C */  lui        $v0, %hi(leveltype)
    /* 91020 800A1020 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 91024 800A1024 00000000 */  nop
    /* 91028 800A1028 3A004010 */  beqz       $v0, .L800A1114
    /* 9102C 800A102C 00000000 */   nop
    /* 91030 800A1030 1280033C */  lui        $v1, %hi(sel_data)
    /* 91034 800A1034 2CB7638C */  lw         $v1, %lo(sel_data)($v1)
    /* 91038 800A1038 00000000 */  nop
    /* 9103C 800A103C 80100300 */  sll        $v0, $v1, 2
    /* 91040 800A1040 1280013C */  lui        $at, %hi(_pcursmonst)
    /* 91044 800A1044 21082200 */  addu       $at, $at, $v0
    /* 91048 800A1048 58B7248C */  lw         $a0, %lo(_pcursmonst)($at)
    /* 9104C 800A104C FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 91050 800A1050 3A008214 */  bne        $a0, $v0, .L800A113C
    /* 91054 800A1054 00000000 */   nop
    /* 91058 800A1058 1280013C */  lui        $at, %hi(_pcursobj)
    /* 9105C 800A105C 21082300 */  addu       $at, $at, $v1
    /* 91060 800A1060 60B72380 */  lb         $v1, %lo(_pcursobj)($at)
    /* 91064 800A1064 00000000 */  nop
    /* 91068 800A1068 0B006410 */  beq        $v1, $a0, .L800A1098
    /* 9106C 800A106C 40100300 */   sll       $v0, $v1, 1
    /* 91070 800A1070 21104300 */  addu       $v0, $v0, $v1
    /* 91074 800A1074 80100200 */  sll        $v0, $v0, 2
    /* 91078 800A1078 23104300 */  subu       $v0, $v0, $v1
    /* 9107C 800A107C 80100200 */  sll        $v0, $v0, 2
    /* 91080 800A1080 0E80013C */  lui        $at, %hi(object + 0x22)
    /* 91084 800A1084 21082200 */  addu       $at, $at, $v0
    /* 91088 800A1088 6E8C2380 */  lb         $v1, %lo(object + 0x22)($at)
    /* 9108C 800A108C 01000224 */  addiu      $v0, $zero, 0x1
    /* 91090 800A1090 20006210 */  beq        $v1, $v0, .L800A1114
    /* 91094 800A1094 00000000 */   nop
  .L800A1098:
    /* 91098 800A1098 21200002 */  addu       $a0, $s0, $zero
    /* 9109C 800A109C 42004282 */  lb         $v0, 0x42($s2)
    /* 910A0 800A10A0 21282002 */  addu       $a1, $s1, $zero
    /* 910A4 800A10A4 1280013C */  lui        $at, %hi(offset_x)
    /* 910A8 800A10A8 21082200 */  addu       $at, $at, $v0
    /* 910AC 800A10AC A8C23090 */  lbu        $s0, %lo(offset_x)($at)
    /* 910B0 800A10B0 42004282 */  lb         $v0, 0x42($s2)
    /* 910B4 800A10B4 00861000 */  sll        $s0, $s0, 24
    /* 910B8 800A10B8 03861000 */  sra        $s0, $s0, 24
    /* 910BC 800A10BC 21800402 */  addu       $s0, $s0, $a0
    /* 910C0 800A10C0 600150A6 */  sh         $s0, 0x160($s2)
    /* 910C4 800A10C4 00841000 */  sll        $s0, $s0, 16
    /* 910C8 800A10C8 03841000 */  sra        $s0, $s0, 16
    /* 910CC 800A10CC 1280013C */  lui        $at, %hi(offset_y)
    /* 910D0 800A10D0 21082200 */  addu       $at, $at, $v0
    /* 910D4 800A10D4 B0C22290 */  lbu        $v0, %lo(offset_y)($at)
    /* 910D8 800A10D8 21300002 */  addu       $a2, $s0, $zero
    /* 910DC 800A10DC 00160200 */  sll        $v0, $v0, 24
    /* 910E0 800A10E0 03160200 */  sra        $v0, $v0, 24
    /* 910E4 800A10E4 21104500 */  addu       $v0, $v0, $a1
    /* 910E8 800A10E8 008C0200 */  sll        $s1, $v0, 16
    /* 910EC 800A10EC 038C1100 */  sra        $s1, $s1, 16
    /* 910F0 800A10F0 21382002 */  addu       $a3, $s1, $zero
    /* 910F4 800A10F4 8AF6000C */  jal        GetDirection__Fiiii
    /* 910F8 800A10F8 620142A6 */   sh        $v0, 0x162($s2)
    /* 910FC 800A10FC 01000424 */  addiu      $a0, $zero, 0x1
    /* 91100 800A1100 37000524 */  addiu      $a1, $zero, 0x37
    /* 91104 800A1104 FF000632 */  andi       $a2, $s0, 0xFF
    /* 91108 800A1108 FF002732 */  andi       $a3, $s1, 0xFF
    /* 9110C 800A110C D9840208 */  j          .L800A1364
    /* 91110 800A1110 420042A2 */   sb        $v0, 0x42($s2)
  .L800A1114:
    /* 91114 800A1114 1280033C */  lui        $v1, %hi(sel_data)
    /* 91118 800A1118 2CB7638C */  lw         $v1, %lo(sel_data)($v1)
    /* 9111C 800A111C 00000000 */  nop
    /* 91120 800A1120 80100300 */  sll        $v0, $v1, 2
    /* 91124 800A1124 1280013C */  lui        $at, %hi(_pcursmonst)
    /* 91128 800A1128 21082200 */  addu       $at, $at, $v0
    /* 9112C 800A112C 58B7248C */  lw         $a0, %lo(_pcursmonst)($at)
    /* 91130 800A1130 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 91134 800A1134 68008210 */  beq        $a0, $v0, .L800A12D8
    /* 91138 800A1138 00000000 */   nop
  .L800A113C:
    /* 9113C 800A113C 21204002 */  addu       $a0, $s2, $zero
    /* 91140 800A1140 1280023C */  lui        $v0, %hi(sel_data)
    /* 91144 800A1144 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 91148 800A1148 0100B33A */  xori       $s3, $s5, 0x1
    /* 9114C 800A114C 80100200 */  sll        $v0, $v0, 2
    /* 91150 800A1150 1280013C */  lui        $at, %hi(_pcursmonst)
    /* 91154 800A1154 21082200 */  addu       $at, $at, $v0
    /* 91158 800A1158 58B7258C */  lw         $a1, %lo(_pcursmonst)($at)
    /* 9115C 800A115C 40101300 */  sll        $v0, $s3, 1
    /* 91160 800A1160 21105300 */  addu       $v0, $v0, $s3
    /* 91164 800A1164 80100200 */  sll        $v0, $v0, 2
    /* 91168 800A1168 21105300 */  addu       $v0, $v0, $s3
    /* 9116C 800A116C 00110200 */  sll        $v0, $v0, 4
    /* 91170 800A1170 23105300 */  subu       $v0, $v0, $s3
    /* 91174 800A1174 80100200 */  sll        $v0, $v0, 2
    /* 91178 800A1178 21105300 */  addu       $v0, $v0, $s3
    /* 9117C 800A117C C0F00200 */  sll        $fp, $v0, 3
    /* 91180 800A1180 0E80023C */  lui        $v0, %hi(plr)
    /* 91184 800A1184 38A54224 */  addiu      $v0, $v0, %lo(plr)
    /* 91188 800A1188 9783020C */  jal        SetFindMonsterXY__FP12PlayerStructi
    /* 9118C 800A118C 21B8C203 */   addu      $s7, $fp, $v0
    /* 91190 800A1190 21200002 */  addu       $a0, $s0, $zero
    /* 91194 800A1194 21282002 */  addu       $a1, $s1, $zero
    /* 91198 800A1198 60015186 */  lh         $s1, 0x160($s2)
    /* 9119C 800A119C 62015486 */  lh         $s4, 0x162($s2)
    /* 911A0 800A11A0 21302002 */  addu       $a2, $s1, $zero
    /* 911A4 800A11A4 8AF6000C */  jal        GetDirection__Fiiii
    /* 911A8 800A11A8 21388002 */   addu      $a3, $s4, $zero
    /* 911AC 800A11AC 420042A2 */  sb         $v0, 0x42($s2)
    /* 911B0 800A11B0 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 911B4 800A11B4 040042A2 */  sb         $v0, 0x4($s2)
    /* 911B8 800A11B8 1280023C */  lui        $v0, %hi(leveltype)
    /* 911BC 800A11BC 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 911C0 800A11C0 1280163C */  lui        $s6, %hi(_pcursmonst)
    /* 911C4 800A11C4 58B7D626 */  addiu      $s6, $s6, %lo(_pcursmonst)
    /* 911C8 800A11C8 21004010 */  beqz       $v0, .L800A1250
    /* 911CC 800A11CC 00000000 */   nop
    /* 911D0 800A11D0 1280023C */  lui        $v0, %hi(sel_data)
    /* 911D4 800A11D4 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 911D8 800A11D8 00000000 */  nop
    /* 911DC 800A11DC 80100200 */  sll        $v0, $v0, 2
    /* 911E0 800A11E0 21105600 */  addu       $v0, $v0, $s6
    /* 911E4 800A11E4 0000448C */  lw         $a0, 0x0($v0)
    /* 911E8 800A11E8 535A050C */  jal        func_8015694C
    /* 911EC 800A11EC 00000000 */   nop
    /* 911F0 800A11F0 FF004230 */  andi       $v0, $v0, 0xFF
    /* 911F4 800A11F4 34004010 */  beqz       $v0, .L800A12C8
    /* 911F8 800A11F8 37000524 */   addiu     $a1, $zero, 0x37
    /* 911FC 800A11FC 1280023C */  lui        $v0, %hi(sel_data)
    /* 91200 800A1200 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 91204 800A1204 00000000 */  nop
    /* 91208 800A1208 80100200 */  sll        $v0, $v0, 2
    /* 9120C 800A120C 21105600 */  addu       $v0, $v0, $s6
    /* 91210 800A1210 0000458C */  lw         $a1, 0x0($v0)
    /* 91214 800A1214 9783020C */  jal        SetFindMonsterXY__FP12PlayerStructi
    /* 91218 800A1218 21204002 */   addu      $a0, $s2, $zero
    /* 9121C 800A121C 30004486 */  lh         $a0, 0x30($s2)
    /* 91220 800A1220 21800000 */  addu       $s0, $zero, $zero
    /* 91224 800A1224 6D41000C */  jal        abs
    /* 91228 800A1228 23209100 */   subu      $a0, $a0, $s1
    /* 9122C 800A122C 02004228 */  slti       $v0, $v0, 0x2
    /* 91230 800A1230 05004010 */  beqz       $v0, .L800A1248
    /* 91234 800A1234 00000000 */   nop
    /* 91238 800A1238 32004486 */  lh         $a0, 0x32($s2)
    /* 9123C 800A123C 6D41000C */  jal        abs
    /* 91240 800A1240 23209400 */   subu      $a0, $a0, $s4
    /* 91244 800A1244 02005028 */  slti       $s0, $v0, 0x2
  .L800A1248:
    /* 91248 800A1248 48000012 */  beqz       $s0, .L800A136C
    /* 9124C 800A124C 00000000 */   nop
  .L800A1250:
    /* 91250 800A1250 42004582 */  lb         $a1, 0x42($s2)
    /* 91254 800A1254 299B010C */  jal        StartStand__Fii
    /* 91258 800A1258 2120A002 */   addu      $a0, $s5, $zero
    /* 9125C 800A125C 0E80013C */  lui        $at, %hi(plr)
    /* 91260 800A1260 21083E00 */  addu       $at, $at, $fp
    /* 91264 800A1264 38A5238C */  lw         $v1, %lo(plr)($at)
    /* 91268 800A1268 01000224 */  addiu      $v0, $zero, 0x1
    /* 9126C 800A126C 0A006214 */  bne        $v1, $v0, .L800A1298
    /* 91270 800A1270 01000424 */   addiu     $a0, $zero, 0x1
    /* 91274 800A1274 21302002 */  addu       $a2, $s1, $zero
    /* 91278 800A1278 3000E486 */  lh         $a0, 0x30($s7)
    /* 9127C 800A127C 3200E586 */  lh         $a1, 0x32($s7)
    /* 91280 800A1280 8AF6000C */  jal        GetDirection__Fiiii
    /* 91284 800A1284 21388002 */   addu      $a3, $s4, $zero
    /* 91288 800A1288 21206002 */  addu       $a0, $s3, $zero
    /* 9128C 800A128C 299B010C */  jal        StartStand__Fii
    /* 91290 800A1290 21284000 */   addu      $a1, $v0, $zero
    /* 91294 800A1294 01000424 */  addiu      $a0, $zero, 0x1
  .L800A1298:
    /* 91298 800A1298 1D000524 */  addiu      $a1, $zero, 0x1D
    /* 9129C 800A129C 1280023C */  lui        $v0, %hi(sel_data)
    /* 912A0 800A12A0 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 912A4 800A12A4 FF002632 */  andi       $a2, $s1, 0xFF
    /* 912A8 800A12A8 80100200 */  sll        $v0, $v0, 2
    /* 912AC 800A12AC 21105600 */  addu       $v0, $v0, $s6
    /* 912B0 800A12B0 00004294 */  lhu        $v0, 0x0($v0)
    /* 912B4 800A12B4 FF008732 */  andi       $a3, $s4, 0xFF
    /* 912B8 800A12B8 DD3D010C */  jal        NetSendCmdLocParam1__FUcUcUcUcUs
    /* 912BC 800A12BC 1000A2AF */   sw        $v0, 0x10($sp)
    /* 912C0 800A12C0 DB840208 */  j          .L800A136C
    /* 912C4 800A12C4 00000000 */   nop
  .L800A12C8:
    /* 912C8 800A12C8 01000424 */  addiu      $a0, $zero, 0x1
    /* 912CC 800A12CC FF002632 */  andi       $a2, $s1, 0xFF
    /* 912D0 800A12D0 D9840208 */  j          .L800A1364
    /* 912D4 800A12D4 FF008732 */   andi      $a3, $s4, 0xFF
  .L800A12D8:
    /* 912D8 800A12D8 1280023C */  lui        $v0, %hi(leveltype)
    /* 912DC 800A12DC 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 912E0 800A12E0 1280013C */  lui        $at, %hi(_pcursobj)
    /* 912E4 800A12E4 21082300 */  addu       $at, $at, $v1
    /* 912E8 800A12E8 60B72380 */  lb         $v1, %lo(_pcursobj)($at)
    /* 912EC 800A12EC 1F004010 */  beqz       $v0, .L800A136C
    /* 912F0 800A12F0 00000000 */   nop
    /* 912F4 800A12F4 1D006410 */  beq        $v1, $a0, .L800A136C
    /* 912F8 800A12F8 21200002 */   addu      $a0, $s0, $zero
    /* 912FC 800A12FC 21282002 */  addu       $a1, $s1, $zero
    /* 91300 800A1300 40100300 */  sll        $v0, $v1, 1
    /* 91304 800A1304 21104300 */  addu       $v0, $v0, $v1
    /* 91308 800A1308 80100200 */  sll        $v0, $v0, 2
    /* 9130C 800A130C 23104300 */  subu       $v0, $v0, $v1
    /* 91310 800A1310 80100200 */  sll        $v0, $v0, 2
    /* 91314 800A1314 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 91318 800A1318 21082200 */  addu       $at, $at, $v0
    /* 9131C 800A131C 6B8C3080 */  lb         $s0, %lo(object + 0x1F)($at)
    /* 91320 800A1320 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 91324 800A1324 21082200 */  addu       $at, $at, $v0
    /* 91328 800A1328 6C8C3180 */  lb         $s1, %lo(object + 0x20)($at)
    /* 9132C 800A132C 21300002 */  addu       $a2, $s0, $zero
    /* 91330 800A1330 21382002 */  addu       $a3, $s1, $zero
    /* 91334 800A1334 600150A6 */  sh         $s0, 0x160($s2)
    /* 91338 800A1338 8AF6000C */  jal        GetDirection__Fiiii
    /* 9133C 800A133C 620151A6 */   sh        $s1, 0x162($s2)
    /* 91340 800A1340 2120A002 */  addu       $a0, $s5, $zero
    /* 91344 800A1344 002E0200 */  sll        $a1, $v0, 24
    /* 91348 800A1348 032E0500 */  sra        $a1, $a1, 24
    /* 9134C 800A134C 299B010C */  jal        StartStand__Fii
    /* 91350 800A1350 420042A2 */   sb        $v0, 0x42($s2)
    /* 91354 800A1354 01000424 */  addiu      $a0, $zero, 0x1
    /* 91358 800A1358 37000524 */  addiu      $a1, $zero, 0x37
    /* 9135C 800A135C FF000632 */  andi       $a2, $s0, 0xFF
    /* 91360 800A1360 FF002732 */  andi       $a3, $s1, 0xFF
  .L800A1364:
    /* 91364 800A1364 D13D010C */  jal        NetSendCmdLoc__FUcUcUcUc
    /* 91368 800A1368 00000000 */   nop
  .L800A136C:
    /* 9136C 800A136C 4400BF8F */  lw         $ra, 0x44($sp)
    /* 91370 800A1370 4000BE8F */  lw         $fp, 0x40($sp)
    /* 91374 800A1374 3C00B78F */  lw         $s7, 0x3C($sp)
    /* 91378 800A1378 3800B68F */  lw         $s6, 0x38($sp)
    /* 9137C 800A137C 3400B58F */  lw         $s5, 0x34($sp)
    /* 91380 800A1380 3000B48F */  lw         $s4, 0x30($sp)
    /* 91384 800A1384 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 91388 800A1388 2800B28F */  lw         $s2, 0x28($sp)
    /* 9138C 800A138C 2400B18F */  lw         $s1, 0x24($sp)
    /* 91390 800A1390 2000B08F */  lw         $s0, 0x20($sp)
    /* 91394 800A1394 4800BD27 */  addiu      $sp, $sp, 0x48
    /* 91398 800A1398 0800E003 */  jr         $ra
    /* 9139C 800A139C 00000000 */   nop
endlabel pad_func_Attack__Fi
