.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ForceL3Trig__Fv, 0x30C

glabel ForceL3Trig__Fv
    /* 65D48 80075D48 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 65D4C 80075D4C 1280043C */  lui        $a0, %hi(cursmx)
    /* 65D50 80075D50 50B7848C */  lw         $a0, %lo(cursmx)($a0)
    /* 65D54 80075D54 1280053C */  lui        $a1, %hi(cursmy)
    /* 65D58 80075D58 54B7A58C */  lw         $a1, %lo(cursmy)($a1)
    /* 65D5C 80075D5C 21300000 */  addu       $a2, $zero, $zero
    /* 65D60 80075D60 3C00BFAF */  sw         $ra, 0x3C($sp)
    /* 65D64 80075D64 3800B4AF */  sw         $s4, 0x38($sp)
    /* 65D68 80075D68 3400B3AF */  sw         $s3, 0x34($sp)
    /* 65D6C 80075D6C 3000B2AF */  sw         $s2, 0x30($sp)
    /* 65D70 80075D70 2C00B1AF */  sw         $s1, 0x2C($sp)
    /* 65D74 80075D74 18D4010C */  jal        FindLevTrig__Fiii
    /* 65D78 80075D78 2800B0AF */   sw        $s0, 0x28($sp)
    /* 65D7C 80075D7C 27004010 */  beqz       $v0, .L80075E1C
    /* 65D80 80075D80 21800000 */   addu      $s0, $zero, $zero
    /* 65D84 80075D84 4AED010C */  jal        GetStr__Fi
    /* 65D88 80075D88 A7040424 */   addiu     $a0, $zero, 0x4A7
    /* 65D8C 80075D8C 21284000 */  addu       $a1, $v0, $zero
    /* 65D90 80075D90 0D80023C */  lui        $v0, %hi(_infostr)
    /* 65D94 80075D94 10E84224 */  addiu      $v0, $v0, %lo(_infostr)
    /* 65D98 80075D98 1280043C */  lui        $a0, %hi(sel_data)
    /* 65D9C 80075D9C 2CB7848C */  lw         $a0, %lo(sel_data)($a0)
    /* 65DA0 80075DA0 1280063C */  lui        $a2, %hi(currlevel)
    /* 65DA4 80075DA4 0CC1C690 */  lbu        $a2, %lo(currlevel)($a2)
    /* 65DA8 80075DA8 00220400 */  sll        $a0, $a0, 8
    /* 65DAC 80075DAC 21208200 */  addu       $a0, $a0, $v0
    /* 65DB0 80075DB0 9767000C */  jal        sprintf
    /* 65DB4 80075DB4 FFFFC624 */   addiu     $a2, $a2, -0x1
    /* 65DB8 80075DB8 F813828F */  lw         $v0, %gp_rel(numtrigs)($gp)
    /* 65DBC 80075DBC 00000000 */  nop
    /* 65DC0 80075DC0 15004018 */  blez       $v0, .L80075E18
    /* 65DC4 80075DC4 21880000 */   addu      $s1, $zero, $zero
    /* 65DC8 80075DC8 43000524 */  addiu      $a1, $zero, 0x43
    /* 65DCC 80075DCC 21184000 */  addu       $v1, $v0, $zero
    /* 65DD0 80075DD0 21200000 */  addu       $a0, $zero, $zero
  .L80075DD4:
    /* 65DD4 80075DD4 0E80013C */  lui        $at, %hi(trigs + 0x8)
    /* 65DD8 80075DD8 21082400 */  addu       $at, $at, $a0
    /* 65DDC 80075DDC D433228C */  lw         $v0, %lo(trigs + 0x8)($at)
    /* 65DE0 80075DE0 00000000 */  nop
    /* 65DE4 80075DE4 09004514 */  bne        $v0, $a1, .L80075E0C
    /* 65DE8 80075DE8 01003126 */   addiu     $s1, $s1, 0x1
    /* 65DEC 80075DEC 0E80013C */  lui        $at, %hi(trigs)
    /* 65DF0 80075DF0 21082400 */  addu       $at, $at, $a0
    /* 65DF4 80075DF4 CC33238C */  lw         $v1, %lo(trigs)($at)
    /* 65DF8 80075DF8 0E80013C */  lui        $at, %hi(trigs + 0x4)
    /* 65DFC 80075DFC 21082400 */  addu       $at, $at, $a0
    /* 65E00 80075E00 D033248C */  lw         $a0, %lo(trigs + 0x4)($at)
    /* 65E04 80075E04 FED70108 */  j          .L80075FF8
    /* 65E08 80075E08 00000000 */   nop
  .L80075E0C:
    /* 65E0C 80075E0C 2A102302 */  slt        $v0, $s1, $v1
    /* 65E10 80075E10 F0FF4014 */  bnez       $v0, .L80075DD4
    /* 65E14 80075E14 10008424 */   addiu     $a0, $a0, 0x10
  .L80075E18:
    /* 65E18 80075E18 21800000 */  addu       $s0, $zero, $zero
  .L80075E1C:
    /* 65E1C 80075E1C 1280043C */  lui        $a0, %hi(cursmx)
    /* 65E20 80075E20 50B7848C */  lw         $a0, %lo(cursmx)($a0)
    /* 65E24 80075E24 1280053C */  lui        $a1, %hi(cursmy)
    /* 65E28 80075E28 54B7A58C */  lw         $a1, %lo(cursmy)($a1)
    /* 65E2C 80075E2C 18D4010C */  jal        FindLevTrig__Fiii
    /* 65E30 80075E30 01000624 */   addiu     $a2, $zero, 0x1
    /* 65E34 80075E34 11004014 */  bnez       $v0, .L80075E7C
    /* 65E38 80075E38 01000624 */   addiu     $a2, $zero, 0x1
    /* 65E3C 80075E3C 1280043C */  lui        $a0, %hi(cursmx)
    /* 65E40 80075E40 50B7848C */  lw         $a0, %lo(cursmx)($a0)
    /* 65E44 80075E44 1280053C */  lui        $a1, %hi(cursmy)
    /* 65E48 80075E48 54B7A58C */  lw         $a1, %lo(cursmy)($a1)
    /* 65E4C 80075E4C 18D4010C */  jal        FindLevTrig__Fiii
    /* 65E50 80075E50 01008424 */   addiu     $a0, $a0, 0x1
    /* 65E54 80075E54 09004014 */  bnez       $v0, .L80075E7C
    /* 65E58 80075E58 01000624 */   addiu     $a2, $zero, 0x1
    /* 65E5C 80075E5C 1280043C */  lui        $a0, %hi(cursmx)
    /* 65E60 80075E60 50B7848C */  lw         $a0, %lo(cursmx)($a0)
    /* 65E64 80075E64 1280053C */  lui        $a1, %hi(cursmy)
    /* 65E68 80075E68 54B7A58C */  lw         $a1, %lo(cursmy)($a1)
    /* 65E6C 80075E6C 18D4010C */  jal        FindLevTrig__Fiii
    /* 65E70 80075E70 02008424 */   addiu     $a0, $a0, 0x2
    /* 65E74 80075E74 02004010 */  beqz       $v0, .L80075E80
    /* 65E78 80075E78 00000000 */   nop
  .L80075E7C:
    /* 65E7C 80075E7C 01001024 */  addiu      $s0, $zero, 0x1
  .L80075E80:
    /* 65E80 80075E80 26000012 */  beqz       $s0, .L80075F1C
    /* 65E84 80075E84 00000000 */   nop
    /* 65E88 80075E88 4AED010C */  jal        GetStr__Fi
    /* 65E8C 80075E8C 15010424 */   addiu     $a0, $zero, 0x115
    /* 65E90 80075E90 21284000 */  addu       $a1, $v0, $zero
    /* 65E94 80075E94 0D80023C */  lui        $v0, %hi(_infostr)
    /* 65E98 80075E98 10E84224 */  addiu      $v0, $v0, %lo(_infostr)
    /* 65E9C 80075E9C 1280043C */  lui        $a0, %hi(sel_data)
    /* 65EA0 80075EA0 2CB7848C */  lw         $a0, %lo(sel_data)($a0)
    /* 65EA4 80075EA4 1280063C */  lui        $a2, %hi(currlevel)
    /* 65EA8 80075EA8 0CC1C690 */  lbu        $a2, %lo(currlevel)($a2)
    /* 65EAC 80075EAC 00220400 */  sll        $a0, $a0, 8
    /* 65EB0 80075EB0 21208200 */  addu       $a0, $a0, $v0
    /* 65EB4 80075EB4 9767000C */  jal        sprintf
    /* 65EB8 80075EB8 0100C624 */   addiu     $a2, $a2, 0x1
    /* 65EBC 80075EBC F813828F */  lw         $v0, %gp_rel(numtrigs)($gp)
    /* 65EC0 80075EC0 00000000 */  nop
    /* 65EC4 80075EC4 15004018 */  blez       $v0, .L80075F1C
    /* 65EC8 80075EC8 21880000 */   addu      $s1, $zero, $zero
    /* 65ECC 80075ECC 42000524 */  addiu      $a1, $zero, 0x42
    /* 65ED0 80075ED0 21184000 */  addu       $v1, $v0, $zero
    /* 65ED4 80075ED4 21200000 */  addu       $a0, $zero, $zero
  .L80075ED8:
    /* 65ED8 80075ED8 0E80013C */  lui        $at, %hi(trigs + 0x8)
    /* 65EDC 80075EDC 21082400 */  addu       $at, $at, $a0
    /* 65EE0 80075EE0 D433228C */  lw         $v0, %lo(trigs + 0x8)($at)
    /* 65EE4 80075EE4 00000000 */  nop
    /* 65EE8 80075EE8 09004514 */  bne        $v0, $a1, .L80075F10
    /* 65EEC 80075EEC 01003126 */   addiu     $s1, $s1, 0x1
    /* 65EF0 80075EF0 0E80013C */  lui        $at, %hi(trigs)
    /* 65EF4 80075EF4 21082400 */  addu       $at, $at, $a0
    /* 65EF8 80075EF8 CC33238C */  lw         $v1, %lo(trigs)($at)
    /* 65EFC 80075EFC 0E80013C */  lui        $at, %hi(trigs + 0x4)
    /* 65F00 80075F00 21082400 */  addu       $at, $at, $a0
    /* 65F04 80075F04 D033248C */  lw         $a0, %lo(trigs + 0x4)($at)
    /* 65F08 80075F08 FED70108 */  j          .L80075FF8
    /* 65F0C 80075F0C 00000000 */   nop
  .L80075F10:
    /* 65F10 80075F10 2A102302 */  slt        $v0, $s1, $v1
    /* 65F14 80075F14 F0FF4014 */  bnez       $v0, .L80075ED8
    /* 65F18 80075F18 10008424 */   addiu     $a0, $a0, 0x10
  .L80075F1C:
    /* 65F1C 80075F1C 1280033C */  lui        $v1, %hi(currlevel)
    /* 65F20 80075F20 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 65F24 80075F24 09000224 */  addiu      $v0, $zero, 0x9
    /* 65F28 80075F28 41006214 */  bne        $v1, $v0, .L80076030
    /* 65F2C 80075F2C 21100000 */   addu      $v0, $zero, $zero
    /* 65F30 80075F30 1280043C */  lui        $a0, %hi(cursmx)
    /* 65F34 80075F34 50B7848C */  lw         $a0, %lo(cursmx)($a0)
    /* 65F38 80075F38 1280053C */  lui        $a1, %hi(cursmy)
    /* 65F3C 80075F3C 54B7A58C */  lw         $a1, %lo(cursmy)($a1)
    /* 65F40 80075F40 18D4010C */  jal        FindLevTrig__Fiii
    /* 65F44 80075F44 02000624 */   addiu     $a2, $zero, 0x2
    /* 65F48 80075F48 39004010 */  beqz       $v0, .L80076030
    /* 65F4C 80075F4C 21100000 */   addu      $v0, $zero, $zero
    /* 65F50 80075F50 F813828F */  lw         $v0, %gp_rel(numtrigs)($gp)
    /* 65F54 80075F54 00000000 */  nop
    /* 65F58 80075F58 34004018 */  blez       $v0, .L8007602C
    /* 65F5C 80075F5C 21880000 */   addu      $s1, $zero, $zero
    /* 65F60 80075F60 0E80123C */  lui        $s2, %hi(trigs + 0x4)
    /* 65F64 80075F64 D0335226 */  addiu      $s2, $s2, %lo(trigs + 0x4)
    /* 65F68 80075F68 FCFF5326 */  addiu      $s3, $s2, -0x4
    /* 65F6C 80075F6C 21A00000 */  addu       $s4, $zero, $zero
  .L80075F70:
    /* 65F70 80075F70 0E80013C */  lui        $at, %hi(trigs + 0x8)
    /* 65F74 80075F74 21083400 */  addu       $at, $at, $s4
    /* 65F78 80075F78 D433238C */  lw         $v1, %lo(trigs + 0x8)($at)
    /* 65F7C 80075F7C 48000224 */  addiu      $v0, $zero, 0x48
    /* 65F80 80075F80 23006214 */  bne        $v1, $v0, .L80076010
    /* 65F84 80075F84 00000000 */   nop
    /* 65F88 80075F88 0000628E */  lw         $v0, 0x0($s3)
    /* 65F8C 80075F8C 1280043C */  lui        $a0, %hi(cursmx)
    /* 65F90 80075F90 50B7848C */  lw         $a0, %lo(cursmx)($a0)
    /* 65F94 80075F94 6D41000C */  jal        abs
    /* 65F98 80075F98 23204400 */   subu      $a0, $v0, $a0
    /* 65F9C 80075F9C 0000438E */  lw         $v1, 0x0($s2)
    /* 65FA0 80075FA0 1280043C */  lui        $a0, %hi(cursmy)
    /* 65FA4 80075FA4 54B7848C */  lw         $a0, %lo(cursmy)($a0)
    /* 65FA8 80075FA8 21804000 */  addu       $s0, $v0, $zero
    /* 65FAC 80075FAC 6D41000C */  jal        abs
    /* 65FB0 80075FB0 23206400 */   subu      $a0, $v1, $a0
    /* 65FB4 80075FB4 0400102A */  slti       $s0, $s0, 0x4
    /* 65FB8 80075FB8 15000012 */  beqz       $s0, .L80076010
    /* 65FBC 80075FBC 04004228 */   slti      $v0, $v0, 0x4
    /* 65FC0 80075FC0 13004010 */  beqz       $v0, .L80076010
    /* 65FC4 80075FC4 00000000 */   nop
    /* 65FC8 80075FC8 4AED010C */  jal        GetStr__Fi
    /* 65FCC 80075FCC A8040424 */   addiu     $a0, $zero, 0x4A8
    /* 65FD0 80075FD0 21284000 */  addu       $a1, $v0, $zero
    /* 65FD4 80075FD4 1280033C */  lui        $v1, %hi(sel_data)
    /* 65FD8 80075FD8 2CB7638C */  lw         $v1, %lo(sel_data)($v1)
    /* 65FDC 80075FDC 0D80043C */  lui        $a0, %hi(_infostr)
    /* 65FE0 80075FE0 10E88424 */  addiu      $a0, $a0, %lo(_infostr)
    /* 65FE4 80075FE4 001A0300 */  sll        $v1, $v1, 8
    /* 65FE8 80075FE8 F240000C */  jal        strcpy
    /* 65FEC 80075FEC 21206400 */   addu      $a0, $v1, $a0
    /* 65FF0 80075FF0 0000638E */  lw         $v1, 0x0($s3)
    /* 65FF4 80075FF4 0000448E */  lw         $a0, 0x0($s2)
  .L80075FF8:
    /* 65FF8 80075FF8 1280013C */  lui        $at, %hi(cursmx)
    /* 65FFC 80075FFC 50B723AC */  sw         $v1, %lo(cursmx)($at)
    /* 66000 80076000 1280013C */  lui        $at, %hi(cursmy)
    /* 66004 80076004 54B724AC */  sw         $a0, %lo(cursmy)($at)
    /* 66008 80076008 0CD80108 */  j          .L80076030
    /* 6600C 8007600C 01000224 */   addiu     $v0, $zero, 0x1
  .L80076010:
    /* 66010 80076010 10005226 */  addiu      $s2, $s2, 0x10
    /* 66014 80076014 10007326 */  addiu      $s3, $s3, 0x10
    /* 66018 80076018 F813828F */  lw         $v0, %gp_rel(numtrigs)($gp)
    /* 6601C 8007601C 01003126 */  addiu      $s1, $s1, 0x1
    /* 66020 80076020 2A102202 */  slt        $v0, $s1, $v0
    /* 66024 80076024 D2FF4014 */  bnez       $v0, .L80075F70
    /* 66028 80076028 10009426 */   addiu     $s4, $s4, 0x10
  .L8007602C:
    /* 6602C 8007602C 21100000 */  addu       $v0, $zero, $zero
  .L80076030:
    /* 66030 80076030 3C00BF8F */  lw         $ra, 0x3C($sp)
    /* 66034 80076034 3800B48F */  lw         $s4, 0x38($sp)
    /* 66038 80076038 3400B38F */  lw         $s3, 0x34($sp)
    /* 6603C 8007603C 3000B28F */  lw         $s2, 0x30($sp)
    /* 66040 80076040 2C00B18F */  lw         $s1, 0x2C($sp)
    /* 66044 80076044 2800B08F */  lw         $s0, 0x28($sp)
    /* 66048 80076048 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 6604C 8007604C 0800E003 */  jr         $ra
    /* 66050 80076050 00000000 */   nop
endlabel ForceL3Trig__Fv
