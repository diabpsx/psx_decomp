.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddRndTeleport__Fiiiiiicii, 0x344

glabel AddRndTeleport__Fiiiiiicii
    /* 3D5C 8013D954 B8FFBD27 */  addiu      $sp, $sp, -0x48
    /* 3D60 8013D958 6000A28F */  lw         $v0, 0x60($sp)
    /* 3D64 8013D95C 3000B4AF */  sw         $s4, 0x30($sp)
    /* 3D68 8013D960 21A08000 */  addu       $s4, $a0, $zero
    /* 3D6C 8013D964 3800B6AF */  sw         $s6, 0x38($sp)
    /* 3D70 8013D968 21B0A000 */  addu       $s6, $a1, $zero
    /* 3D74 8013D96C 3C00B7AF */  sw         $s7, 0x3C($sp)
    /* 3D78 8013D970 21B8C000 */  addu       $s7, $a2, $zero
    /* 3D7C 8013D974 3400B5AF */  sw         $s5, 0x34($sp)
    /* 3D80 8013D978 01001524 */  addiu      $s5, $zero, 0x1
    /* 3D84 8013D97C 4400BFAF */  sw         $ra, 0x44($sp)
    /* 3D88 8013D980 4000BEAF */  sw         $fp, 0x40($sp)
    /* 3D8C 8013D984 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 3D90 8013D988 2800B2AF */  sw         $s2, 0x28($sp)
    /* 3D94 8013D98C 2400B1AF */  sw         $s1, 0x24($sp)
    /* 3D98 8013D990 2000B0AF */  sw         $s0, 0x20($sp)
    /* 3D9C 8013D994 1000A7AF */  sw         $a3, 0x10($sp)
    /* 3DA0 8013D998 1800A2A3 */  sb         $v0, 0x18($sp)
    /* 3DA4 8013D99C 00160200 */  sll        $v0, $v0, 24
    /* 3DA8 8013D9A0 03F60200 */  sra        $fp, $v0, 24
  .L8013D9A4:
    /* 3DAC 8013D9A4 6400A88F */  lw         $t0, 0x64($sp)
    /* 3DB0 8013D9A8 01001124 */  addiu      $s1, $zero, 0x1
    /* 3DB4 8013D9AC 01000339 */  xori       $v1, $t0, 0x1
    /* 3DB8 8013D9B0 40100300 */  sll        $v0, $v1, 1
    /* 3DBC 8013D9B4 21104300 */  addu       $v0, $v0, $v1
    /* 3DC0 8013D9B8 80100200 */  sll        $v0, $v0, 2
    /* 3DC4 8013D9BC 21104300 */  addu       $v0, $v0, $v1
    /* 3DC8 8013D9C0 00110200 */  sll        $v0, $v0, 4
    /* 3DCC 8013D9C4 23104300 */  subu       $v0, $v0, $v1
    /* 3DD0 8013D9C8 80100200 */  sll        $v0, $v0, 2
    /* 3DD4 8013D9CC 21104300 */  addu       $v0, $v0, $v1
    /* 3DD8 8013D9D0 C0800200 */  sll        $s0, $v0, 3
  .L8013D9D4:
    /* 3DDC 8013D9D4 C9F6000C */  jal        ENG_random__Fl
    /* 3DE0 8013D9D8 03000424 */   addiu     $a0, $zero, 0x3
    /* 3DE4 8013D9DC 04005324 */  addiu      $s3, $v0, 0x4
    /* 3DE8 8013D9E0 C9F6000C */  jal        ENG_random__Fl
    /* 3DEC 8013D9E4 03000424 */   addiu     $a0, $zero, 0x3
    /* 3DF0 8013D9E8 04005224 */  addiu      $s2, $v0, 0x4
    /* 3DF4 8013D9EC C9F6000C */  jal        ENG_random__Fl
    /* 3DF8 8013D9F0 02000424 */   addiu     $a0, $zero, 0x2
    /* 3DFC 8013D9F4 01000824 */  addiu      $t0, $zero, 0x1
    /* 3E00 8013D9F8 02004814 */  bne        $v0, $t0, .L8013DA04
    /* 3E04 8013D9FC 00000000 */   nop
    /* 3E08 8013DA00 23981300 */  negu       $s3, $s3
  .L8013DA04:
    /* 3E0C 8013DA04 C9F6000C */  jal        ENG_random__Fl
    /* 3E10 8013DA08 02000424 */   addiu     $a0, $zero, 0x2
    /* 3E14 8013DA0C 01000824 */  addiu      $t0, $zero, 0x1
    /* 3E18 8013DA10 02004814 */  bne        $v0, $t0, .L8013DA1C
    /* 3E1C 8013DA14 00000000 */   nop
    /* 3E20 8013DA18 23901200 */  negu       $s2, $s2
  .L8013DA1C:
    /* 3E24 8013DA1C 1700C017 */  bnez       $fp, .L8013DA7C
    /* 3E28 8013DA20 FF002232 */   andi      $v0, $s1, 0xFF
    /* 3E2C 8013DA24 0E80023C */  lui        $v0, %hi(plr + 0x1D)
    /* 3E30 8013DA28 55A54290 */  lbu        $v0, %lo(plr + 0x1D)($v0)
    /* 3E34 8013DA2C 00000000 */  nop
    /* 3E38 8013DA30 12004010 */  beqz       $v0, .L8013DA7C
    /* 3E3C 8013DA34 FF002232 */   andi      $v0, $s1, 0xFF
    /* 3E40 8013DA38 0E80023C */  lui        $v0, %hi(plr + 0x1A05)
    /* 3E44 8013DA3C 3DBF4290 */  lbu        $v0, %lo(plr + 0x1A05)($v0)
    /* 3E48 8013DA40 00000000 */  nop
    /* 3E4C 8013DA44 0C004010 */  beqz       $v0, .L8013DA78
    /* 3E50 8013DA48 2120D302 */   addu      $a0, $s6, $s3
    /* 3E54 8013DA4C C0200400 */  sll        $a0, $a0, 3
    /* 3E58 8013DA50 2128F202 */  addu       $a1, $s7, $s2
    /* 3E5C 8013DA54 0E80013C */  lui        $at, %hi(plr + 0x28)
    /* 3E60 8013DA58 21083000 */  addu       $at, $at, $s0
    /* 3E64 8013DA5C 60A5268C */  lw         $a2, %lo(plr + 0x28)($at)
    /* 3E68 8013DA60 0E80013C */  lui        $at, %hi(plr + 0x2C)
    /* 3E6C 8013DA64 21083000 */  addu       $at, $at, $s0
    /* 3E70 8013DA68 64A5278C */  lw         $a3, %lo(plr + 0x2C)($at)
    /* 3E74 8013DA6C 5A89010C */  jal        ChkPlrOffsets__Fiiii
    /* 3E78 8013DA70 C0280500 */   sll       $a1, $a1, 3
    /* 3E7C 8013DA74 21884000 */  addu       $s1, $v0, $zero
  .L8013DA78:
    /* 3E80 8013DA78 FF002232 */  andi       $v0, $s1, 0xFF
  .L8013DA7C:
    /* 3E84 8013DA7C D5FF4010 */  beqz       $v0, .L8013D9D4
    /* 3E88 8013DA80 00000000 */   nop
    /* 3E8C 8013DA84 2180D302 */  addu       $s0, $s6, $s3
    /* 3E90 8013DA88 21200002 */  addu       $a0, $s0, $zero
    /* 3E94 8013DA8C 2188F202 */  addu       $s1, $s7, $s2
    /* 3E98 8013DA90 380B020C */  jal        GetSOLID__Fii
    /* 3E9C 8013DA94 21282002 */   addu      $a1, $s1, $zero
    /* 3EA0 8013DA98 11004014 */  bnez       $v0, .L8013DAE0
    /* 3EA4 8013DA9C C0101100 */   sll       $v0, $s1, 3
    /* 3EA8 8013DAA0 C0181000 */  sll        $v1, $s0, 3
    /* 3EAC 8013DAA4 23187000 */  subu       $v1, $v1, $s0
    /* 3EB0 8013DAA8 C0190300 */  sll        $v1, $v1, 7
    /* 3EB4 8013DAAC 21184300 */  addu       $v1, $v0, $v1
    /* 3EB8 8013DAB0 0E80013C */  lui        $at, %hi(dung_map + 0x3)
    /* 3EBC 8013DAB4 21082300 */  addu       $at, $at, $v1
    /* 3EC0 8013DAB8 2B7A2280 */  lb         $v0, %lo(dung_map + 0x3)($at)
    /* 3EC4 8013DABC 00000000 */  nop
    /* 3EC8 8013DAC0 07004014 */  bnez       $v0, .L8013DAE0
    /* 3ECC 8013DAC4 00000000 */   nop
    /* 3ED0 8013DAC8 0E80013C */  lui        $at, %hi(dung_map)
    /* 3ED4 8013DACC 21082300 */  addu       $at, $at, $v1
    /* 3ED8 8013DAD0 287A2284 */  lh         $v0, %lo(dung_map)($at)
    /* 3EDC 8013DAD4 00000000 */  nop
    /* 3EE0 8013DAD8 07004010 */  beqz       $v0, .L8013DAF8
    /* 3EE4 8013DADC 80101400 */   sll       $v0, $s4, 2
  .L8013DAE0:
    /* 3EE8 8013DAE0 0100B526 */  addiu      $s5, $s5, 0x1
    /* 3EEC 8013DAE4 F501A22A */  slti       $v0, $s5, 0x1F5
    /* 3EF0 8013DAE8 AEFF4014 */  bnez       $v0, .L8013D9A4
    /* 3EF4 8013DAEC 21980000 */   addu      $s3, $zero, $zero
    /* 3EF8 8013DAF0 21900000 */  addu       $s2, $zero, $zero
    /* 3EFC 8013DAF4 80101400 */  sll        $v0, $s4, 2
  .L8013DAF8:
    /* 3F00 8013DAF8 21105400 */  addu       $v0, $v0, $s4
    /* 3F04 8013DAFC 80100200 */  sll        $v0, $v0, 2
    /* 3F08 8013DB00 23105400 */  subu       $v0, $v0, $s4
    /* 3F0C 8013DB04 80200200 */  sll        $a0, $v0, 2
    /* 3F10 8013DB08 1280033C */  lui        $v1, %hi(setlevel)
    /* 3F14 8013DB0C 0EC16390 */  lbu        $v1, %lo(setlevel)($v1)
    /* 3F18 8013DB10 02000224 */  addiu      $v0, $zero, 0x2
    /* 3F1C 8013DB14 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 3F20 8013DB18 21082400 */  addu       $at, $at, $a0
    /* 3F24 8013DB1C 702C22A4 */  sh         $v0, %lo(missile + 0x18)($at)
    /* 3F28 8013DB20 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* 3F2C 8013DB24 21082400 */  addu       $at, $at, $a0
    /* 3F30 8013DB28 762C20A4 */  sh         $zero, %lo(missile + 0x1E)($at)
    /* 3F34 8013DB2C 38006010 */  beqz       $v1, .L8013DC10
    /* 3F38 8013DB30 05000224 */   addiu     $v0, $zero, 0x5
    /* 3F3C 8013DB34 1280033C */  lui        $v1, %hi(setlvlnum)
    /* 3F40 8013DB38 0FC16390 */  lbu        $v1, %lo(setlvlnum)($v1)
    /* 3F44 8013DB3C 00000000 */  nop
    /* 3F48 8013DB40 34006214 */  bne        $v1, $v0, .L8013DC14
    /* 3F4C 8013DB44 80101400 */   sll       $v0, $s4, 2
    /* 3F50 8013DB48 5800A88F */  lw         $t0, 0x58($sp)
    /* 3F54 8013DB4C 00000000 */  nop
    /* 3F58 8013DB50 C0180800 */  sll        $v1, $t0, 3
    /* 3F5C 8013DB54 1000A88F */  lw         $t0, 0x10($sp)
    /* 3F60 8013DB58 00000000 */  nop
    /* 3F64 8013DB5C C0100800 */  sll        $v0, $t0, 3
    /* 3F68 8013DB60 23104800 */  subu       $v0, $v0, $t0
    /* 3F6C 8013DB64 C0110200 */  sll        $v0, $v0, 7
    /* 3F70 8013DB68 21186200 */  addu       $v1, $v1, $v0
    /* 3F74 8013DB6C 0E80013C */  lui        $at, %hi(dung_map + 0x3)
    /* 3F78 8013DB70 21082300 */  addu       $at, $at, $v1
    /* 3F7C 8013DB74 2B7A2380 */  lb         $v1, %lo(dung_map + 0x3)($at)
    /* 3F80 8013DB78 00000000 */  nop
    /* 3F84 8013DB7C FFFF6324 */  addiu      $v1, $v1, -0x1
    /* 3F88 8013DB80 40100300 */  sll        $v0, $v1, 1
    /* 3F8C 8013DB84 21104300 */  addu       $v0, $v0, $v1
    /* 3F90 8013DB88 80100200 */  sll        $v0, $v0, 2
    /* 3F94 8013DB8C 23104300 */  subu       $v0, $v0, $v1
    /* 3F98 8013DB90 80100200 */  sll        $v0, $v0, 2
    /* 3F9C 8013DB94 0E80013C */  lui        $at, %hi(object + 0x1E)
    /* 3FA0 8013DB98 21082200 */  addu       $at, $at, $v0
    /* 3FA4 8013DB9C 6A8C2290 */  lbu        $v0, %lo(object + 0x1E)($at)
    /* 3FA8 8013DBA0 00000000 */  nop
    /* 3FAC 8013DBA4 ACFF4224 */  addiu      $v0, $v0, -0x54
    /* 3FB0 8013DBA8 0200422C */  sltiu      $v0, $v0, 0x2
    /* 3FB4 8013DBAC 2D004010 */  beqz       $v0, .L8013DC64
    /* 3FB8 8013DBB0 00000000 */   nop
    /* 3FBC 8013DBB4 1000A58F */  lw         $a1, 0x10($sp)
    /* 3FC0 8013DBB8 1000A893 */  lbu        $t0, 0x10($sp)
    /* 3FC4 8013DBBC 1080013C */  lui        $at, %hi(missile + 0x31)
    /* 3FC8 8013DBC0 21082400 */  addu       $at, $at, $a0
    /* 3FCC 8013DBC4 892C28A0 */  sb         $t0, %lo(missile + 0x31)($at)
    /* 3FD0 8013DBC8 5800A893 */  lbu        $t0, 0x58($sp)
    /* 3FD4 8013DBCC 1080013C */  lui        $at, %hi(missile + 0x32)
    /* 3FD8 8013DBD0 21082400 */  addu       $at, $at, $a0
    /* 3FDC 8013DBD4 8A2C28A0 */  sb         $t0, %lo(missile + 0x32)($at)
    /* 3FE0 8013DBD8 1280043C */  lui        $a0, %hi(myplr)
    /* 3FE4 8013DBDC 08BA848C */  lw         $a0, %lo(myplr)($a0)
    /* 3FE8 8013DBE0 5800A68F */  lw         $a2, 0x58($sp)
    /* 3FEC 8013DBE4 DB9A010C */  jal        PosOkPlayer__Fiii
    /* 3FF0 8013DBE8 00000000 */   nop
    /* 3FF4 8013DBEC FF004230 */  andi       $v0, $v0, 0xFF
    /* 3FF8 8013DBF0 1C004014 */  bnez       $v0, .L8013DC64
    /* 3FFC 8013DBF4 00000000 */   nop
    /* 4000 8013DBF8 1000A58F */  lw         $a1, 0x10($sp)
    /* 4004 8013DBFC 5800A68F */  lw         $a2, 0x58($sp)
    /* 4008 8013DC00 06F6040C */  jal        GetVileMissPos__Fiii
    /* 400C 8013DC04 21208002 */   addu      $a0, $s4, $zero
    /* 4010 8013DC08 19F70408 */  j          .L8013DC64
    /* 4014 8013DC0C 00000000 */   nop
  .L8013DC10:
    /* 4018 8013DC10 80101400 */  sll        $v0, $s4, 2
  .L8013DC14:
    /* 401C 8013DC14 21105400 */  addu       $v0, $v0, $s4
    /* 4020 8013DC18 80100200 */  sll        $v0, $v0, 2
    /* 4024 8013DC1C 23105400 */  subu       $v0, $v0, $s4
    /* 4028 8013DC20 80100200 */  sll        $v0, $v0, 2
    /* 402C 8013DC24 2118D302 */  addu       $v1, $s6, $s3
    /* 4030 8013DC28 1080013C */  lui        $at, %hi(missile + 0x31)
    /* 4034 8013DC2C 21082200 */  addu       $at, $at, $v0
    /* 4038 8013DC30 892C23A0 */  sb         $v1, %lo(missile + 0x31)($at)
    /* 403C 8013DC34 2118F202 */  addu       $v1, $s7, $s2
    /* 4040 8013DC38 1080013C */  lui        $at, %hi(missile + 0x32)
    /* 4044 8013DC3C 21082200 */  addu       $at, $at, $v0
    /* 4048 8013DC40 8A2C23A0 */  sb         $v1, %lo(missile + 0x32)($at)
    /* 404C 8013DC44 1800A893 */  lbu        $t0, 0x18($sp)
    /* 4050 8013DC48 00000000 */  nop
    /* 4054 8013DC4C 00160800 */  sll        $v0, $t0, 24
    /* 4058 8013DC50 04004014 */  bnez       $v0, .L8013DC64
    /* 405C 8013DC54 00000000 */   nop
    /* 4060 8013DC58 6400A48F */  lw         $a0, 0x64($sp)
    /* 4064 8013DC5C C2DC010C */  jal        UseMana__Fii
    /* 4068 8013DC60 0A000524 */   addiu     $a1, $zero, 0xA
  .L8013DC64:
    /* 406C 8013DC64 4400BF8F */  lw         $ra, 0x44($sp)
    /* 4070 8013DC68 4000BE8F */  lw         $fp, 0x40($sp)
    /* 4074 8013DC6C 3C00B78F */  lw         $s7, 0x3C($sp)
    /* 4078 8013DC70 3800B68F */  lw         $s6, 0x38($sp)
    /* 407C 8013DC74 3400B58F */  lw         $s5, 0x34($sp)
    /* 4080 8013DC78 3000B48F */  lw         $s4, 0x30($sp)
    /* 4084 8013DC7C 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 4088 8013DC80 2800B28F */  lw         $s2, 0x28($sp)
    /* 408C 8013DC84 2400B18F */  lw         $s1, 0x24($sp)
    /* 4090 8013DC88 2000B08F */  lw         $s0, 0x20($sp)
    /* 4094 8013DC8C 4800BD27 */  addiu      $sp, $sp, 0x48
    /* 4098 8013DC90 0800E003 */  jr         $ra
    /* 409C 8013DC94 00000000 */   nop
endlabel AddRndTeleport__Fiiiiiicii
