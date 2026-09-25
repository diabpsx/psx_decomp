.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching STR_AsyncTASK__FP4TASK, 0x3E8

glabel STR_AsyncTASK__FP4TASK
    /* 89C84 80099C84 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 89C88 80099C88 3C00BFAF */  sw         $ra, 0x3C($sp)
    /* 89C8C 80099C8C 3800B6AF */  sw         $s6, 0x38($sp)
    /* 89C90 80099C90 3400B5AF */  sw         $s5, 0x34($sp)
    /* 89C94 80099C94 3000B4AF */  sw         $s4, 0x30($sp)
    /* 89C98 80099C98 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 89C9C 80099C9C 2800B2AF */  sw         $s2, 0x28($sp)
    /* 89CA0 80099CA0 2400B1AF */  sw         $s1, 0x24($sp)
    /* 89CA4 80099CA4 2000B0AF */  sw         $s0, 0x20($sp)
    /* 89CA8 80099CA8 1C00828C */  lw         $v0, 0x1C($a0)
    /* 89CAC 80099CAC 1000A427 */  addiu      $a0, $sp, 0x10
    /* 89CB0 80099CB0 0400508C */  lw         $s0, 0x4($v0)
    /* 89CB4 80099CB4 0000558C */  lw         $s5, 0x0($v0)
    /* 89CB8 80099CB8 F240000C */  jal        strcpy
    /* 89CBC 80099CBC 74000526 */   addiu     $a1, $s0, 0x74
    /* 89CC0 80099CC0 2120A002 */  addu       $a0, $s5, $zero
    /* 89CC4 80099CC4 D56A020C */  jal        AS_OpenStream__FP6STRHDRP6SFXHDR
    /* 89CC8 80099CC8 21280002 */   addu      $a1, $s0, $zero
    /* 89CCC 80099CCC 21B04000 */  addu       $s6, $v0, $zero
    /* 89CD0 80099CD0 01000224 */  addiu      $v0, $zero, 0x1
    /* 89CD4 80099CD4 040002AE */  sw         $v0, 0x4($s0)
    /* 89CD8 80099CD8 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 89CDC 80099CDC 0D00C216 */  bne        $s6, $v0, .L80099D14
    /* 89CE0 80099CE0 080015AE */   sw        $s5, 0x8($s0)
    /* 89CE4 80099CE4 1180023C */  lui        $v0, %hi(D_80110900)
    /* 89CE8 80099CE8 00094224 */  addiu      $v0, $v0, %lo(D_80110900)
    /* 89CEC 80099CEC D4004010 */  beqz       $v0, .L8009A040
    /* 89CF0 80099CF0 21200000 */   addu      $a0, $zero, $zero
    /* 89CF4 80099CF4 1180053C */  lui        $a1, %hi(D_801108B4)
    /* 89CF8 80099CF8 B408A524 */  addiu      $a1, $a1, %lo(D_801108B4)
    /* 89CFC 80099CFC A583000C */  jal        DBG_Error
    /* 89D00 80099D00 18050624 */   addiu     $a2, $zero, 0x518
    /* 89D04 80099D04 10680208 */  j          .L8009A040
    /* 89D08 80099D08 00000000 */   nop
  .L80099D0C:
    /* 89D0C 80099D0C 06680208 */  j          .L8009A018
    /* 89D10 80099D10 040000AE */   sw        $zero, 0x4($s0)
  .L80099D14:
    /* 89D14 80099D14 21880000 */  addu       $s1, $zero, $zero
    /* 89D18 80099D18 00161100 */  sll        $v0, $s1, 24
  .L80099D1C:
    /* 89D1C 80099D1C BE004014 */  bnez       $v0, .L8009A018
    /* 89D20 80099D20 1000A427 */   addiu     $a0, $sp, 0x10
    /* 89D24 80099D24 7F67000C */  jal        strcmp
    /* 89D28 80099D28 74000526 */   addiu     $a1, $s0, 0x74
    /* 89D2C 80099D2C F7FF4014 */  bnez       $v0, .L80099D0C
    /* 89D30 80099D30 00000000 */   nop
    /* 89D34 80099D34 1D65020C */  jal        STR_Command__FP6SFXHDR
    /* 89D38 80099D38 21200002 */   addu      $a0, $s0, $zero
    /* 89D3C 80099D3C 3E10020C */  jal        VID_GetTick__Fv
    /* 89D40 80099D40 21884000 */   addu      $s1, $v0, $zero
    /* 89D44 80099D44 4400038E */  lw         $v1, 0x44($s0)
    /* 89D48 80099D48 21984000 */  addu       $s3, $v0, $zero
    /* 89D4C 80099D4C 23906302 */  subu       $s2, $s3, $v1
    /* 89D50 80099D50 02004106 */  bgez       $s2, .L80099D5C
    /* 89D54 80099D54 00000000 */   nop
    /* 89D58 80099D58 23901200 */  negu       $s2, $s2
  .L80099D5C:
    /* 89D5C 80099D5C 3000028E */  lw         $v0, 0x30($s0)
    /* 89D60 80099D60 3C00038E */  lw         $v1, 0x3C($s0)
    /* 89D64 80099D64 6400048E */  lw         $a0, 0x64($s0)
    /* 89D68 80099D68 00000000 */  nop
    /* 89D6C 80099D6C 0200801C */  bgtz       $a0, .L80099D78
    /* 89D70 80099D70 23A04300 */   subu      $s4, $v0, $v1
    /* 89D74 80099D74 01001124 */  addiu      $s1, $zero, 0x1
  .L80099D78:
    /* 89D78 80099D78 00161100 */  sll        $v0, $s1, 24
    /* 89D7C 80099D7C 30004010 */  beqz       $v0, .L80099E40
    /* 89D80 80099D80 08000224 */   addiu     $v0, $zero, 0x8
    /* 89D84 80099D84 03000382 */  lb         $v1, 0x3($s0)
    /* 89D88 80099D88 00000000 */  nop
    /* 89D8C 80099D8C 2B006210 */  beq        $v1, $v0, .L80099E3C
    /* 89D90 80099D90 21880000 */   addu      $s1, $zero, $zero
    /* 89D94 80099D94 5800028E */  lw         $v0, 0x58($s0)
    /* 89D98 80099D98 3C00038E */  lw         $v1, 0x3C($s0)
    /* 89D9C 80099D9C 3000048E */  lw         $a0, 0x30($s0)
    /* 89DA0 80099DA0 01004224 */  addiu      $v0, $v0, 0x1
    /* 89DA4 80099DA4 2A186400 */  slt        $v1, $v1, $a0
    /* 89DA8 80099DA8 05006010 */  beqz       $v1, .L80099DC0
    /* 89DAC 80099DAC 580002AE */   sw        $v0, 0x58($s0)
    /* 89DB0 80099DB0 1400028E */  lw         $v0, 0x14($s0)
    /* 89DB4 80099DB4 00000000 */  nop
    /* 89DB8 80099DB8 22004104 */  bgez       $v0, .L80099E44
    /* 89DBC 80099DBC 802F822A */   slti      $v0, $s4, 0x2F80
  .L80099DC0:
    /* 89DC0 80099DC0 01000282 */  lb         $v0, 0x1($s0)
    /* 89DC4 80099DC4 00000000 */  nop
    /* 89DC8 80099DC8 16004010 */  beqz       $v0, .L80099E24
    /* 89DCC 80099DCC 21200002 */   addu      $a0, $s0, $zero
    /* 89DD0 80099DD0 1400908C */  lw         $s0, 0x14($a0)
    /* 89DD4 80099DD4 E264020C */  jal        STR_SoundCommand__FP6SFXHDRi
    /* 89DD8 80099DD8 08000524 */   addiu     $a1, $zero, 0x8
    /* 89DDC 80099DDC 1280023C */  lui        $v0, %hi(sghMusic)
    /* 89DE0 80099DE0 B4BB428C */  lw         $v0, %lo(sghMusic)($v0)
    /* 89DE4 80099DE4 00000000 */  nop
    /* 89DE8 80099DE8 95004014 */  bnez       $v0, .L8009A040
    /* 89DEC 80099DEC 01000524 */   addiu     $a1, $zero, 0x1
    /* 89DF0 80099DF0 1280023C */  lui        $v0, %hi(sgnMusicTrack)
    /* 89DF4 80099DF4 ACBB428C */  lw         $v0, %lo(sgnMusicTrack)($v0)
    /* 89DF8 80099DF8 21300002 */  addu       $a2, $s0, $zero
    /* 89DFC 80099DFC 40100200 */  sll        $v0, $v0, 1
    /* 89E00 80099E00 0E80013C */  lui        $at, %hi(sgszMusicTracks)
    /* 89E04 80099E04 21082200 */  addu       $at, $at, $v0
    /* 89E08 80099E08 9C382494 */  lhu        $a0, %lo(sgszMusicTracks)($at)
    /* 89E0C 80099E0C 7263020C */  jal        STR_PlaySound__FUscic
    /* 89E10 80099E10 01000724 */   addiu     $a3, $zero, 0x1
    /* 89E14 80099E14 1280013C */  lui        $at, %hi(sghMusic)
    /* 89E18 80099E18 B4BB22AC */  sw         $v0, %lo(sghMusic)($at)
    /* 89E1C 80099E1C 10680208 */  j          .L8009A040
    /* 89E20 80099E20 00000000 */   nop
  .L80099E24:
    /* 89E24 80099E24 E264020C */  jal        STR_SoundCommand__FP6SFXHDRi
    /* 89E28 80099E28 08000524 */   addiu     $a1, $zero, 0x8
    /* 89E2C 80099E2C 1180053C */  lui        $a1, %hi(D_80110918)
    /* 89E30 80099E30 1809A524 */  addiu      $a1, $a1, %lo(D_80110918)
    /* 89E34 80099E34 BE62020C */  jal        STR_Debug__FP6SFXHDRPce
    /* 89E38 80099E38 21200002 */   addu      $a0, $s0, $zero
  .L80099E3C:
    /* 89E3C 80099E3C 01001124 */  addiu      $s1, $zero, 0x1
  .L80099E40:
    /* 89E40 80099E40 802F822A */  slti       $v0, $s4, 0x2F80
  .L80099E44:
    /* 89E44 80099E44 19004010 */  beqz       $v0, .L80099EAC
    /* 89E48 80099E48 00000000 */   nop
    /* 89E4C 80099E4C 02000282 */  lb         $v0, 0x2($s0)
    /* 89E50 80099E50 00000000 */  nop
    /* 89E54 80099E54 15004010 */  beqz       $v0, .L80099EAC
    /* 89E58 80099E58 00000000 */   nop
    /* 89E5C 80099E5C 5800028E */  lw         $v0, 0x58($s0)
    /* 89E60 80099E60 00000000 */  nop
    /* 89E64 80099E64 11004014 */  bnez       $v0, .L80099EAC
    /* 89E68 80099E68 01000224 */   addiu     $v0, $zero, 0x1
    /* 89E6C 80099E6C 2C00038E */  lw         $v1, 0x2C($s0)
    /* 89E70 80099E70 00000000 */  nop
    /* 89E74 80099E74 07006214 */  bne        $v1, $v0, .L80099E94
    /* 89E78 80099E78 21200002 */   addu      $a0, $s0, $zero
    /* 89E7C 80099E7C 1400028E */  lw         $v0, 0x14($s0)
    /* 89E80 80099E80 140000AE */  sw         $zero, 0x14($s0)
    /* 89E84 80099E84 0464020C */  jal        STR_setvolume__FP6SFXHDR
    /* 89E88 80099E88 180002AE */   sw        $v0, 0x18($s0)
    /* 89E8C 80099E8C A7670208 */  j          .L80099E9C
    /* 89E90 80099E90 00000000 */   nop
  .L80099E94:
    /* 89E94 80099E94 E264020C */  jal        STR_SoundCommand__FP6SFXHDRi
    /* 89E98 80099E98 07000524 */   addiu     $a1, $zero, 0x7
  .L80099E9C:
    /* 89E9C 80099E9C 2C00028E */  lw         $v0, 0x2C($s0)
    /* 89EA0 80099EA0 00000000 */  nop
    /* 89EA4 80099EA4 01004224 */  addiu      $v0, $v0, 0x1
    /* 89EA8 80099EA8 2C0002AE */  sw         $v0, 0x2C($s0)
  .L80099EAC:
    /* 89EAC 80099EAC 03000382 */  lb         $v1, 0x3($s0)
    /* 89EB0 80099EB0 03000224 */  addiu      $v0, $zero, 0x3
    /* 89EB4 80099EB4 53006210 */  beq        $v1, $v0, .L8009A004
    /* 89EB8 80099EB8 00161100 */   sll       $v0, $s1, 24
    /* 89EBC 80099EBC 51004014 */  bnez       $v0, .L8009A004
    /* 89EC0 80099EC0 015F822A */   slti      $v0, $s4, 0x5F01
    /* 89EC4 80099EC4 05004014 */  bnez       $v0, .L80099EDC
    /* 89EC8 80099EC8 00000000 */   nop
    /* 89ECC 80099ECC 02000282 */  lb         $v0, 0x2($s0)
    /* 89ED0 80099ED0 00000000 */  nop
    /* 89ED4 80099ED4 28004014 */  bnez       $v0, .L80099F78
    /* 89ED8 80099ED8 00000000 */   nop
  .L80099EDC:
    /* 89EDC 80099EDC 5800028E */  lw         $v0, 0x58($s0)
    /* 89EE0 80099EE0 00000000 */  nop
    /* 89EE4 80099EE4 24004014 */  bnez       $v0, .L80099F78
    /* 89EE8 80099EE8 00000000 */   nop
    /* 89EEC 80099EEC FD6A020C */  jal        AS_GetBlock__FP6SFXHDR
    /* 89EF0 80099EF0 21200002 */   addu      $a0, $s0, $zero
    /* 89EF4 80099EF4 00160200 */  sll        $v0, $v0, 24
    /* 89EF8 80099EF8 1F004010 */  beqz       $v0, .L80099F78
    /* 89EFC 80099EFC 21200002 */   addu      $a0, $s0, $zero
    /* 89F00 80099F00 4800068E */  lw         $a2, 0x48($s0)
    /* 89F04 80099F04 1180053C */  lui        $a1, %hi(D_80110928)
    /* 89F08 80099F08 2809A524 */  addiu      $a1, $a1, %lo(D_80110928)
    /* 89F0C 80099F0C BE62020C */  jal        STR_Debug__FP6SFXHDRPce
    /* 89F10 80099F10 23306602 */   subu      $a2, $s3, $a2
    /* 89F14 80099F14 2C00028E */  lw         $v0, 0x2C($s0)
    /* 89F18 80099F18 00000000 */  nop
    /* 89F1C 80099F1C 06004010 */  beqz       $v0, .L80099F38
    /* 89F20 80099F20 00000000 */   nop
    /* 89F24 80099F24 1800028E */  lw         $v0, 0x18($s0)
    /* 89F28 80099F28 21200002 */  addu       $a0, $s0, $zero
    /* 89F2C 80099F2C 0464020C */  jal        STR_setvolume__FP6SFXHDR
    /* 89F30 80099F30 140002AE */   sw        $v0, 0x14($s0)
    /* 89F34 80099F34 2C0000AE */  sw         $zero, 0x2C($s0)
  .L80099F38:
    /* 89F38 80099F38 21200002 */  addu       $a0, $s0, $zero
    /* 89F3C 80099F3C 00300624 */  addiu      $a2, $zero, 0x3000
    /* 89F40 80099F40 2000038E */  lw         $v1, 0x20($s0)
    /* 89F44 80099F44 6800028E */  lw         $v0, 0x68($s0)
    /* 89F48 80099F48 40280300 */  sll        $a1, $v1, 1
    /* 89F4C 80099F4C 2128A300 */  addu       $a1, $a1, $v1
    /* 89F50 80099F50 002B0500 */  sll        $a1, $a1, 12
    /* 89F54 80099F54 CB65020C */  jal        STR_PlayStream__FP6SFXHDRPUci
    /* 89F58 80099F58 21284500 */   addu      $a1, $v0, $a1
    /* 89F5C 80099F5C 2120C002 */  addu       $a0, $s6, $zero
    /* 89F60 80099F60 2128A002 */  addu       $a1, $s5, $zero
    /* 89F64 80099F64 A36A020C */  jal        AS_WasLastBlock__FiP6STRHDRP6SFXHDR
    /* 89F68 80099F68 21300002 */   addu      $a2, $s0, $zero
    /* 89F6C 80099F6C 5400168E */  lw         $s6, 0x54($s0)
    /* 89F70 80099F70 0D0000A2 */  sb         $zero, 0xD($s0)
    /* 89F74 80099F74 480013AE */  sw         $s3, 0x48($s0)
  .L80099F78:
    /* 89F78 80099F78 9965020C */  jal        STR_DMAControl__FP6SFXHDR
    /* 89F7C 80099F7C 21200002 */   addu      $a0, $s0, $zero
    /* 89F80 80099F80 02000282 */  lb         $v0, 0x2($s0)
    /* 89F84 80099F84 00000000 */  nop
    /* 89F88 80099F88 1E004010 */  beqz       $v0, .L8009A004
    /* 89F8C 80099F8C 76AC033C */   lui       $v1, (0xAC769185 >> 16)
    /* 89F90 80099F90 6000028E */  lw         $v0, 0x60($s0)
    /* 89F94 80099F94 00000000 */  nop
    /* 89F98 80099F98 18005200 */  mult       $v0, $s2
    /* 89F9C 80099F9C 3C00028E */  lw         $v0, 0x3C($s0)
    /* 89FA0 80099FA0 12400000 */  mflo       $t0
    /* 89FA4 80099FA4 21104800 */  addu       $v0, $v0, $t0
    /* 89FA8 80099FA8 3C0002AE */  sw         $v0, 0x3C($s0)
    /* 89FAC 80099FAC 3C00028E */  lw         $v0, 0x3C($s0)
    /* 89FB0 80099FB0 85916334 */  ori        $v1, $v1, (0xAC769185 & 0xFFFF)
    /* 89FB4 80099FB4 18004300 */  mult       $v0, $v1
    /* 89FB8 80099FB8 5555033C */  lui        $v1, (0x55555556 >> 16)
    /* 89FBC 80099FBC 56556334 */  ori        $v1, $v1, (0x55555556 & 0xFFFF)
    /* 89FC0 80099FC0 10400000 */  mfhi       $t0
    /* 89FC4 80099FC4 21200201 */  addu       $a0, $t0, $v0
    /* 89FC8 80099FC8 43230400 */  sra        $a0, $a0, 13
    /* 89FCC 80099FCC C3170200 */  sra        $v0, $v0, 31
    /* 89FD0 80099FD0 23208200 */  subu       $a0, $a0, $v0
    /* 89FD4 80099FD4 18008300 */  mult       $a0, $v1
    /* 89FD8 80099FD8 3400028E */  lw         $v0, 0x34($s0)
    /* 89FDC 80099FDC C31F0400 */  sra        $v1, $a0, 31
    /* 89FE0 80099FE0 500004AE */  sw         $a0, 0x50($s0)
    /* 89FE4 80099FE4 21105200 */  addu       $v0, $v0, $s2
    /* 89FE8 80099FE8 340002AE */  sw         $v0, 0x34($s0)
    /* 89FEC 80099FEC 10400000 */  mfhi       $t0
    /* 89FF0 80099FF0 23180301 */  subu       $v1, $t0, $v1
    /* 89FF4 80099FF4 40100300 */  sll        $v0, $v1, 1
    /* 89FF8 80099FF8 21104300 */  addu       $v0, $v0, $v1
    /* 89FFC 80099FFC 23208200 */  subu       $a0, $a0, $v0
    /* 8A000 8009A000 380004AE */  sw         $a0, 0x38($s0)
  .L8009A004:
    /* 8A004 8009A004 440013AE */  sw         $s3, 0x44($s0)
    /* 8A008 8009A008 EE80000C */  jal        TSK_Sleep
    /* 8A00C 8009A00C 01000424 */   addiu     $a0, $zero, 0x1
    /* 8A010 8009A010 47670208 */  j          .L80099D1C
    /* 8A014 8009A014 00161100 */   sll       $v0, $s1, 24
  .L8009A018:
    /* 8A018 8009A018 0400028E */  lw         $v0, 0x4($s0)
    /* 8A01C 8009A01C 00000000 */  nop
    /* 8A020 8009A020 07004010 */  beqz       $v0, .L8009A040
    /* 8A024 8009A024 2120A002 */   addu      $a0, $s5, $zero
    /* 8A028 8009A028 096B020C */  jal        AS_CloseStream__FP6STRHDRP6SFXHDR
    /* 8A02C 8009A02C 21280002 */   addu      $a1, $s0, $zero
    /* 8A030 8009A030 C764020C */  jal        STR_CloseStream__FP6SFXHDR
    /* 8A034 8009A034 21200002 */   addu      $a0, $s0, $zero
    /* 8A038 8009A038 7320020C */  jal        BL_CloseStreamFile__FP6STRHDR
    /* 8A03C 8009A03C 2120A002 */   addu      $a0, $s5, $zero
  .L8009A040:
    /* 8A040 8009A040 3C00BF8F */  lw         $ra, 0x3C($sp)
    /* 8A044 8009A044 3800B68F */  lw         $s6, 0x38($sp)
    /* 8A048 8009A048 3400B58F */  lw         $s5, 0x34($sp)
    /* 8A04C 8009A04C 3000B48F */  lw         $s4, 0x30($sp)
    /* 8A050 8009A050 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 8A054 8009A054 2800B28F */  lw         $s2, 0x28($sp)
    /* 8A058 8009A058 2400B18F */  lw         $s1, 0x24($sp)
    /* 8A05C 8009A05C 2000B08F */  lw         $s0, 0x20($sp)
    /* 8A060 8009A060 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 8A064 8009A064 0800E003 */  jr         $ra
    /* 8A068 8009A068 00000000 */   nop
endlabel STR_AsyncTASK__FP4TASK
