.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MAI_Golum__Fi, 0x52C

glabel MAI_Golum__Fi
    /* 1CF08 80156B00 A8FFBD27 */  addiu      $sp, $sp, -0x58
    /* 1CF0C 80156B04 4000B4AF */  sw         $s4, 0x40($sp)
    /* 1CF10 80156B08 21A08000 */  addu       $s4, $a0, $zero
    /* 1CF14 80156B0C 1280023C */  lui        $v0, %hi(sel_data)
    /* 1CF18 80156B10 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 1CF1C 80156B14 1080053C */  lui        $a1, %hi(monster)
    /* 1CF20 80156B18 9453A524 */  addiu      $a1, $a1, %lo(monster)
    /* 1CF24 80156B1C 4C00B7AF */  sw         $s7, 0x4C($sp)
    /* 1CF28 80156B20 1280173C */  lui        $s7, %hi(myplr)
    /* 1CF2C 80156B24 08BAF78E */  lw         $s7, %lo(myplr)($s7)
    /* 1CF30 80156B28 01000324 */  addiu      $v1, $zero, 0x1
    /* 1CF34 80156B2C 5400BFAF */  sw         $ra, 0x54($sp)
    /* 1CF38 80156B30 5000BEAF */  sw         $fp, 0x50($sp)
    /* 1CF3C 80156B34 4800B6AF */  sw         $s6, 0x48($sp)
    /* 1CF40 80156B38 4400B5AF */  sw         $s5, 0x44($sp)
    /* 1CF44 80156B3C 3C00B3AF */  sw         $s3, 0x3C($sp)
    /* 1CF48 80156B40 3800B2AF */  sw         $s2, 0x38($sp)
    /* 1CF4C 80156B44 3400B1AF */  sw         $s1, 0x34($sp)
    /* 1CF50 80156B48 3000B0AF */  sw         $s0, 0x30($sp)
    /* 1CF54 80156B4C 80200200 */  sll        $a0, $v0, 2
    /* 1CF58 80156B50 1800A2AF */  sw         $v0, 0x18($sp)
    /* 1CF5C 80156B54 40101400 */  sll        $v0, $s4, 1
    /* 1CF60 80156B58 21105400 */  addu       $v0, $v0, $s4
    /* 1CF64 80156B5C 80100200 */  sll        $v0, $v0, 2
    /* 1CF68 80156B60 21105400 */  addu       $v0, $v0, $s4
    /* 1CF6C 80156B64 C0100200 */  sll        $v0, $v0, 3
    /* 1CF70 80156B68 21984500 */  addu       $s3, $v0, $a1
    /* 1CF74 80156B6C 34006296 */  lhu        $v0, 0x34($s3)
    /* 1CF78 80156B70 1280013C */  lui        $at, %hi(_pcursmonst)
    /* 1CF7C 80156B74 21082400 */  addu       $at, $at, $a0
    /* 1CF80 80156B78 58B73E8C */  lw         $fp, %lo(_pcursmonst)($at)
    /* 1CF84 80156B7C 1E014310 */  beq        $v0, $v1, .L80156FF8
    /* 1CF88 80156B80 06000224 */   addiu     $v0, $zero, 0x6
    /* 1CF8C 80156B84 33006482 */  lb         $a0, 0x33($s3)
    /* 1CF90 80156B88 00000000 */  nop
    /* 1CF94 80156B8C 1A018210 */  beq        $a0, $v0, .L80156FF8
    /* 1CF98 80156B90 21188000 */   addu      $v1, $a0, $zero
    /* 1CF9C 80156B94 0B000224 */  addiu      $v0, $zero, 0xB
    /* 1CFA0 80156B98 17018210 */  beq        $a0, $v0, .L80156FF8
    /* 1CFA4 80156B9C FFFF6224 */   addiu     $v0, $v1, -0x1
    /* 1CFA8 80156BA0 FF004230 */  andi       $v0, $v0, 0xFF
    /* 1CFAC 80156BA4 0300422C */  sltiu      $v0, $v0, 0x3
    /* 1CFB0 80156BA8 13014014 */  bnez       $v0, .L80156FF8
    /* 1CFB4 80156BAC FFFF0224 */   addiu     $v0, $zero, -0x1
    /* 1CFB8 80156BB0 1280013C */  lui        $at, %hi(sel_data)
    /* 1CFBC 80156BB4 2CB720AC */  sw         $zero, %lo(sel_data)($at)
    /* 1CFC0 80156BB8 1280013C */  lui        $at, %hi(myplr)
    /* 1CFC4 80156BBC 08BA22AC */  sw         $v0, %lo(myplr)($at)
    /* 1CFC8 80156BC0 1280013C */  lui        $at, %hi(_pcursmonst)
    /* 1CFCC 80156BC4 58B722AC */  sw         $v0, %lo(_pcursmonst)($at)
    /* 1CFD0 80156BC8 3D006392 */  lbu        $v1, 0x3D($s3)
    /* 1CFD4 80156BCC 00000000 */  nop
    /* 1CFD8 80156BD0 0E006010 */  beqz       $v1, .L80156C0C
    /* 1CFDC 80156BD4 2188A000 */   addu      $s1, $a1, $zero
    /* 1CFE0 80156BD8 40100300 */  sll        $v0, $v1, 1
    /* 1CFE4 80156BDC 21104300 */  addu       $v0, $v0, $v1
    /* 1CFE8 80156BE0 80100200 */  sll        $v0, $v0, 2
    /* 1CFEC 80156BE4 21104300 */  addu       $v0, $v0, $v1
    /* 1CFF0 80156BE8 C0100200 */  sll        $v0, $v0, 3
    /* 1CFF4 80156BEC 1080013C */  lui        $at, %hi(monster + 0x10)
    /* 1CFF8 80156BF0 21082200 */  addu       $at, $at, $v0
    /* 1CFFC 80156BF4 A453228C */  lw         $v0, %lo(monster + 0x10)($at)
    /* 1D000 80156BF8 00000000 */  nop
    /* 1D004 80156BFC 83110200 */  sra        $v0, $v0, 6
    /* 1D008 80156C00 0200401C */  bgtz       $v0, .L80156C0C
    /* 1D00C 80156C04 00000000 */   nop
    /* 1D010 80156C08 3D0060A2 */  sb         $zero, 0x3D($s3)
  .L80156C0C:
    /* 1D014 80156C0C 33006382 */  lb         $v1, 0x33($s3)
    /* 1D018 80156C10 04000224 */  addiu      $v0, $zero, 0x4
    /* 1D01C 80156C14 ED006210 */  beq        $v1, $v0, .L80156FCC
    /* 1D020 80156C18 00000000 */   nop
    /* 1D024 80156C1C 3D006392 */  lbu        $v1, 0x3D($s3)
    /* 1D028 80156C20 00000000 */  nop
    /* 1D02C 80156C24 06006010 */  beqz       $v1, .L80156C40
    /* 1D030 80156C28 04000624 */   addiu     $a2, $zero, 0x4
    /* 1D034 80156C2C 4E006292 */  lbu        $v0, 0x4E($s3)
    /* 1D038 80156C30 00000000 */  nop
    /* 1D03C 80156C34 64004014 */  bnez       $v0, .L80156DC8
    /* 1D040 80156C38 21B00000 */   addu      $s6, $zero, $zero
    /* 1D044 80156C3C 04000624 */  addiu      $a2, $zero, 0x4
  .L80156C40:
    /* 1D048 80156C40 21380000 */  addu       $a3, $zero, $zero
    /* 1D04C 80156C44 34006482 */  lb         $a0, 0x34($s3)
    /* 1D050 80156C48 35006582 */  lb         $a1, 0x35($s3)
    /* 1D054 80156C4C FA000224 */  addiu      $v0, $zero, 0xFA
    /* 1D058 80156C50 4E0062A2 */  sb         $v0, 0x4E($s3)
    /* 1D05C 80156C54 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 1D060 80156C58 A78E020C */  jal        CheckArea__FiiiUci
    /* 1D064 80156C5C 1000A2AF */   sw        $v0, 0x10($sp)
    /* 1D068 80156C60 1280023C */  lui        $v0, %hi(sel_data)
    /* 1D06C 80156C64 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 1D070 80156C68 00000000 */  nop
    /* 1D074 80156C6C 80100200 */  sll        $v0, $v0, 2
    /* 1D078 80156C70 1280013C */  lui        $at, %hi(_pcursmonst)
    /* 1D07C 80156C74 21082200 */  addu       $at, $at, $v0
    /* 1D080 80156C78 58B7248C */  lw         $a0, %lo(_pcursmonst)($at)
    /* 1D084 80156C7C 1280103C */  lui        $s0, %hi(_pcursmonst)
    /* 1D088 80156C80 58B71026 */  addiu      $s0, $s0, %lo(_pcursmonst)
    /* 1D08C 80156C84 2D008018 */  blez       $a0, .L80156D3C
    /* 1D090 80156C88 01001224 */   addiu     $s2, $zero, 0x1
    /* 1D094 80156C8C 9A5A050C */  jal        gSameRoom__Fii
    /* 1D098 80156C90 21288002 */   addu      $a1, $s4, $zero
    /* 1D09C 80156C94 29004010 */  beqz       $v0, .L80156D3C
    /* 1D0A0 80156C98 01001224 */   addiu     $s2, $zero, 0x1
    /* 1D0A4 80156C9C 1280023C */  lui        $v0, %hi(sel_data)
    /* 1D0A8 80156CA0 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 1D0AC 80156CA4 00000000 */  nop
    /* 1D0B0 80156CA8 80100200 */  sll        $v0, $v0, 2
    /* 1D0B4 80156CAC 21105000 */  addu       $v0, $v0, $s0
    /* 1D0B8 80156CB0 0000428C */  lw         $v0, 0x0($v0)
    /* 1D0BC 80156CB4 00000000 */  nop
    /* 1D0C0 80156CB8 3D0062A2 */  sb         $v0, 0x3D($s3)
    /* 1D0C4 80156CBC 1280023C */  lui        $v0, %hi(sel_data)
    /* 1D0C8 80156CC0 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 1D0CC 80156CC4 00000000 */  nop
    /* 1D0D0 80156CC8 80100200 */  sll        $v0, $v0, 2
    /* 1D0D4 80156CCC 21105000 */  addu       $v0, $v0, $s0
    /* 1D0D8 80156CD0 0000438C */  lw         $v1, 0x0($v0)
    /* 1D0DC 80156CD4 00000000 */  nop
    /* 1D0E0 80156CD8 40100300 */  sll        $v0, $v1, 1
    /* 1D0E4 80156CDC 21104300 */  addu       $v0, $v0, $v1
    /* 1D0E8 80156CE0 80100200 */  sll        $v0, $v0, 2
    /* 1D0EC 80156CE4 21104300 */  addu       $v0, $v0, $v1
    /* 1D0F0 80156CE8 C0100200 */  sll        $v0, $v0, 3
    /* 1D0F4 80156CEC 21105100 */  addu       $v0, $v0, $s1
    /* 1D0F8 80156CF0 36004290 */  lbu        $v0, 0x36($v0)
    /* 1D0FC 80156CF4 00000000 */  nop
    /* 1D100 80156CF8 4A0062A2 */  sb         $v0, 0x4A($s3)
    /* 1D104 80156CFC 1280023C */  lui        $v0, %hi(sel_data)
    /* 1D108 80156D00 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 1D10C 80156D04 00000000 */  nop
    /* 1D110 80156D08 80100200 */  sll        $v0, $v0, 2
    /* 1D114 80156D0C 21105000 */  addu       $v0, $v0, $s0
    /* 1D118 80156D10 0000438C */  lw         $v1, 0x0($v0)
    /* 1D11C 80156D14 00000000 */  nop
    /* 1D120 80156D18 40100300 */  sll        $v0, $v1, 1
    /* 1D124 80156D1C 21104300 */  addu       $v0, $v0, $v1
    /* 1D128 80156D20 80100200 */  sll        $v0, $v0, 2
    /* 1D12C 80156D24 21104300 */  addu       $v0, $v0, $v1
    /* 1D130 80156D28 C0100200 */  sll        $v0, $v0, 3
    /* 1D134 80156D2C 21105100 */  addu       $v0, $v0, $s1
    /* 1D138 80156D30 37004290 */  lbu        $v0, 0x37($v0)
    /* 1D13C 80156D34 F35B0508 */  j          .L80156FCC
    /* 1D140 80156D38 4B0062A2 */   sb        $v0, 0x4B($s3)
  .L80156D3C:
    /* 1D144 80156D3C 40101400 */  sll        $v0, $s4, 1
    /* 1D148 80156D40 21105400 */  addu       $v0, $v0, $s4
    /* 1D14C 80156D44 80100200 */  sll        $v0, $v0, 2
    /* 1D150 80156D48 21105400 */  addu       $v0, $v0, $s4
    /* 1D154 80156D4C 00110200 */  sll        $v0, $v0, 4
    /* 1D158 80156D50 23105400 */  subu       $v0, $v0, $s4
    /* 1D15C 80156D54 80100200 */  sll        $v0, $v0, 2
    /* 1D160 80156D58 21105400 */  addu       $v0, $v0, $s4
    /* 1D164 80156D5C C0100200 */  sll        $v0, $v0, 3
    /* 1D168 80156D60 3D0060A2 */  sb         $zero, 0x3D($s3)
    /* 1D16C 80156D64 0E80013C */  lui        $at, %hi(plr + 0x42)
    /* 1D170 80156D68 21082200 */  addu       $at, $at, $v0
    /* 1D174 80156D6C 7AA53180 */  lb         $s1, %lo(plr + 0x42)($at)
    /* 1D178 80156D70 21208002 */  addu       $a0, $s4, $zero
    /* 1D17C 80156D74 EB53050C */  jal        DirOK__Fii
    /* 1D180 80156D78 21282002 */   addu      $a1, $s1, $zero
    /* 1D184 80156D7C FF004230 */  andi       $v0, $v0, 0xFF
    /* 1D188 80156D80 0D004014 */  bnez       $v0, .L80156DB8
    /* 1D18C 80156D84 00000000 */   nop
    /* 1D190 80156D88 21800000 */  addu       $s0, $zero, $zero
  .L80156D8C:
    /* 1D194 80156D8C 21880002 */  addu       $s1, $s0, $zero
    /* 1D198 80156D90 21208002 */  addu       $a0, $s4, $zero
    /* 1D19C 80156D94 EB53050C */  jal        DirOK__Fii
    /* 1D1A0 80156D98 21282002 */   addu      $a1, $s1, $zero
    /* 1D1A4 80156D9C FF005230 */  andi       $s2, $v0, 0xFF
    /* 1D1A8 80156DA0 01003026 */  addiu      $s0, $s1, 0x1
    /* 1D1AC 80156DA4 0800022A */  slti       $v0, $s0, 0x8
    /* 1D1B0 80156DA8 03004010 */  beqz       $v0, .L80156DB8
    /* 1D1B4 80156DAC 00000000 */   nop
    /* 1D1B8 80156DB0 F6FF4012 */  beqz       $s2, .L80156D8C
    /* 1D1BC 80156DB4 00000000 */   nop
  .L80156DB8:
    /* 1D1C0 80156DB8 84004012 */  beqz       $s2, .L80156FCC
    /* 1D1C4 80156DBC 21208002 */   addu      $a0, $s4, $zero
    /* 1D1C8 80156DC0 EE5B0508 */  j          .L80156FB8
    /* 1D1CC 80156DC4 00000000 */   nop
  .L80156DC8:
    /* 1D1D0 80156DC8 40100300 */  sll        $v0, $v1, 1
    /* 1D1D4 80156DCC 21104300 */  addu       $v0, $v0, $v1
    /* 1D1D8 80156DD0 80100200 */  sll        $v0, $v0, 2
    /* 1D1DC 80156DD4 21104300 */  addu       $v0, $v0, $v1
    /* 1D1E0 80156DD8 C0900200 */  sll        $s2, $v0, 3
    /* 1D1E4 80156DDC 21105102 */  addu       $v0, $s2, $s1
    /* 1D1E8 80156DE0 34004680 */  lb         $a2, 0x34($v0)
    /* 1D1EC 80156DE4 35004780 */  lb         $a3, 0x35($v0)
    /* 1D1F0 80156DE8 34006482 */  lb         $a0, 0x34($s3)
    /* 1D1F4 80156DEC 35006582 */  lb         $a1, 0x35($s3)
    /* 1D1F8 80156DF0 36004380 */  lb         $v1, 0x36($v0)
    /* 1D1FC 80156DF4 37004280 */  lb         $v0, 0x37($v0)
    /* 1D200 80156DF8 23808300 */  subu       $s0, $a0, $v1
    /* 1D204 80156DFC 8AF6000C */  jal        GetDirection__Fiiii
    /* 1D208 80156E00 23A8A200 */   subu      $s5, $a1, $v0
    /* 1D20C 80156E04 21884000 */  addu       $s1, $v0, $zero
    /* 1D210 80156E08 21200002 */  addu       $a0, $s0, $zero
    /* 1D214 80156E0C 6D41000C */  jal        abs
    /* 1D218 80156E10 3C0071A2 */   sb        $s1, 0x3C($s3)
    /* 1D21C 80156E14 02004228 */  slti       $v0, $v0, 0x2
    /* 1D220 80156E18 04004010 */  beqz       $v0, .L80156E2C
    /* 1D224 80156E1C 00000000 */   nop
    /* 1D228 80156E20 6D41000C */  jal        abs
    /* 1D22C 80156E24 2120A002 */   addu      $a0, $s5, $zero
    /* 1D230 80156E28 02005628 */  slti       $s6, $v0, 0x2
  .L80156E2C:
    /* 1D234 80156E2C 4200C012 */  beqz       $s6, .L80156F38
    /* 1D238 80156E30 00000000 */   nop
    /* 1D23C 80156E34 1080013C */  lui        $at, %hi(monster + 0x4E)
    /* 1D240 80156E38 21083200 */  addu       $at, $at, $s2
    /* 1D244 80156E3C E2532290 */  lbu        $v0, %lo(monster + 0x4E)($at)
    /* 1D248 80156E40 00000000 */  nop
    /* 1D24C 80156E44 38004014 */  bnez       $v0, .L80156F28
    /* 1D250 80156E48 FF000224 */   addiu     $v0, $zero, 0xFF
    /* 1D254 80156E4C 1080013C */  lui        $at, %hi(monster + 0x4E)
    /* 1D258 80156E50 21083200 */  addu       $at, $at, $s2
    /* 1D25C 80156E54 E25322A0 */  sb         $v0, %lo(monster + 0x4E)($at)
    /* 1D260 80156E58 34006292 */  lbu        $v0, 0x34($s3)
    /* 1D264 80156E5C 21800000 */  addu       $s0, $zero, $zero
    /* 1D268 80156E60 1080013C */  lui        $at, %hi(monster + 0x43)
    /* 1D26C 80156E64 21083200 */  addu       $at, $at, $s2
    /* 1D270 80156E68 D75322A0 */  sb         $v0, %lo(monster + 0x43)($at)
    /* 1D274 80156E6C 40101400 */  sll        $v0, $s4, 1
    /* 1D278 80156E70 21105400 */  addu       $v0, $v0, $s4
    /* 1D27C 80156E74 80100200 */  sll        $v0, $v0, 2
    /* 1D280 80156E78 21105400 */  addu       $v0, $v0, $s4
    /* 1D284 80156E7C 35006392 */  lbu        $v1, 0x35($s3)
    /* 1D288 80156E80 C0300200 */  sll        $a2, $v0, 3
    /* 1D28C 80156E84 1080013C */  lui        $at, %hi(monster + 0x44)
    /* 1D290 80156E88 21083200 */  addu       $at, $at, $s2
    /* 1D294 80156E8C D85323A0 */  sb         $v1, %lo(monster + 0x44)($at)
    /* 1D298 80156E90 21280000 */  addu       $a1, $zero, $zero
  .L80156E94:
    /* 1D29C 80156E94 FEFF0726 */  addiu      $a3, $s0, -0x2
    /* 1D2A0 80156E98 FF000824 */  addiu      $t0, $zero, 0xFF
    /* 1D2A4 80156E9C FEFFA224 */  addiu      $v0, $a1, -0x2
  .L80156EA0:
    /* 1D2A8 80156EA0 1080013C */  lui        $at, %hi(monster + 0x35)
    /* 1D2AC 80156EA4 21082600 */  addu       $at, $at, $a2
    /* 1D2B0 80156EA8 C9532480 */  lb         $a0, %lo(monster + 0x35)($at)
    /* 1D2B4 80156EAC 1080013C */  lui        $at, %hi(monster + 0x34)
    /* 1D2B8 80156EB0 21082600 */  addu       $at, $at, $a2
    /* 1D2BC 80156EB4 C8532380 */  lb         $v1, %lo(monster + 0x34)($at)
    /* 1D2C0 80156EB8 21208700 */  addu       $a0, $a0, $a3
    /* 1D2C4 80156EBC C0200400 */  sll        $a0, $a0, 3
    /* 1D2C8 80156EC0 21186200 */  addu       $v1, $v1, $v0
    /* 1D2CC 80156EC4 C0100300 */  sll        $v0, $v1, 3
    /* 1D2D0 80156EC8 23104300 */  subu       $v0, $v0, $v1
    /* 1D2D4 80156ECC C0110200 */  sll        $v0, $v0, 7
    /* 1D2D8 80156ED0 21208200 */  addu       $a0, $a0, $v0
    /* 1D2DC 80156ED4 0E80013C */  lui        $at, %hi(dung_map)
    /* 1D2E0 80156ED8 21082400 */  addu       $at, $at, $a0
    /* 1D2E4 80156EDC 287A2384 */  lh         $v1, %lo(dung_map)($at)
    /* 1D2E8 80156EE0 00000000 */  nop
    /* 1D2EC 80156EE4 08006018 */  blez       $v1, .L80156F08
    /* 1D2F0 80156EE8 40100300 */   sll       $v0, $v1, 1
    /* 1D2F4 80156EEC 21104300 */  addu       $v0, $v0, $v1
    /* 1D2F8 80156EF0 80100200 */  sll        $v0, $v0, 2
    /* 1D2FC 80156EF4 21104300 */  addu       $v0, $v0, $v1
    /* 1D300 80156EF8 C0100200 */  sll        $v0, $v0, 3
    /* 1D304 80156EFC 1080013C */  lui        $at, %hi(monster + 0x4E)
    /* 1D308 80156F00 21082200 */  addu       $at, $at, $v0
    /* 1D30C 80156F04 E25328A0 */  sb         $t0, %lo(monster + 0x4E)($at)
  .L80156F08:
    /* 1D310 80156F08 0100A524 */  addiu      $a1, $a1, 0x1
    /* 1D314 80156F0C 0500A228 */  slti       $v0, $a1, 0x5
    /* 1D318 80156F10 E3FF4014 */  bnez       $v0, .L80156EA0
    /* 1D31C 80156F14 FEFFA224 */   addiu     $v0, $a1, -0x2
    /* 1D320 80156F18 01001026 */  addiu      $s0, $s0, 0x1
    /* 1D324 80156F1C 0500022A */  slti       $v0, $s0, 0x5
    /* 1D328 80156F20 DCFF4014 */  bnez       $v0, .L80156E94
    /* 1D32C 80156F24 21280000 */   addu      $a1, $zero, $zero
  .L80156F28:
    /* 1D330 80156F28 0B5C050C */  jal        M_StartAttack__Fi
    /* 1D334 80156F2C 21208002 */   addu      $a0, $s4, $zero
    /* 1D338 80156F30 F35B0508 */  j          .L80156FCC
    /* 1D33C 80156F34 00000000 */   nop
  .L80156F38:
    /* 1D340 80156F38 4E006292 */  lbu        $v0, 0x4E($s3)
    /* 1D344 80156F3C 00000000 */  nop
    /* 1D348 80156F40 03004010 */  beqz       $v0, .L80156F50
    /* 1D34C 80156F44 FFFF4224 */   addiu     $v0, $v0, -0x1
    /* 1D350 80156F48 D55B0508 */  j          .L80156F54
    /* 1D354 80156F4C 4E0062A2 */   sb        $v0, 0x4E($s3)
  .L80156F50:
    /* 1D358 80156F50 4E0060A2 */  sb         $zero, 0x4E($s3)
  .L80156F54:
    /* 1D35C 80156F54 01001224 */  addiu      $s2, $zero, 0x1
    /* 1D360 80156F58 21208002 */  addu       $a0, $s4, $zero
    /* 1D364 80156F5C EB53050C */  jal        DirOK__Fii
    /* 1D368 80156F60 21282002 */   addu      $a1, $s1, $zero
    /* 1D36C 80156F64 FF004230 */  andi       $v0, $v0, 0xFF
    /* 1D370 80156F68 11004014 */  bnez       $v0, .L80156FB0
    /* 1D374 80156F6C 01002226 */   addiu     $v0, $s1, 0x1
    /* 1D378 80156F70 07005030 */  andi       $s0, $v0, 0x7
    /* 1D37C 80156F74 0E001112 */  beq        $s0, $s1, .L80156FB0
    /* 1D380 80156F78 21900000 */   addu      $s2, $zero, $zero
  .L80156F7C:
    /* 1D384 80156F7C 07001032 */  andi       $s0, $s0, 0x7
    /* 1D388 80156F80 21208002 */  addu       $a0, $s4, $zero
    /* 1D38C 80156F84 EB53050C */  jal        DirOK__Fii
    /* 1D390 80156F88 21280002 */   addu      $a1, $s0, $zero
    /* 1D394 80156F8C FF005230 */  andi       $s2, $v0, 0xFF
    /* 1D398 80156F90 02004012 */  beqz       $s2, .L80156F9C
    /* 1D39C 80156F94 00000000 */   nop
    /* 1D3A0 80156F98 21880002 */  addu       $s1, $s0, $zero
  .L80156F9C:
    /* 1D3A4 80156F9C 01001026 */  addiu      $s0, $s0, 0x1
    /* 1D3A8 80156FA0 03001112 */  beq        $s0, $s1, .L80156FB0
    /* 1D3AC 80156FA4 00000000 */   nop
    /* 1D3B0 80156FA8 F4FF4012 */  beqz       $s2, .L80156F7C
    /* 1D3B4 80156FAC 00000000 */   nop
  .L80156FB0:
    /* 1D3B8 80156FB0 05004012 */  beqz       $s2, .L80156FC8
    /* 1D3BC 80156FB4 21208002 */   addu      $a0, $s4, $zero
  .L80156FB8:
    /* 1D3C0 80156FB8 433C050C */  jal        M_WalkDir__Fii
    /* 1D3C4 80156FBC 21282002 */   addu      $a1, $s1, $zero
    /* 1D3C8 80156FC0 F35B0508 */  j          .L80156FCC
    /* 1D3CC 80156FC4 00000000 */   nop
  .L80156FC8:
    /* 1D3D0 80156FC8 3D0060A2 */  sb         $zero, 0x3D($s3)
  .L80156FCC:
    /* 1D3D4 80156FCC 1280023C */  lui        $v0, %hi(sel_data)
    /* 1D3D8 80156FD0 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 1D3DC 80156FD4 1800A98F */  lw         $t1, 0x18($sp)
    /* 1D3E0 80156FD8 1280013C */  lui        $at, %hi(myplr)
    /* 1D3E4 80156FDC 08BA37AC */  sw         $s7, %lo(myplr)($at)
    /* 1D3E8 80156FE0 80100200 */  sll        $v0, $v0, 2
    /* 1D3EC 80156FE4 1280013C */  lui        $at, %hi(sel_data)
    /* 1D3F0 80156FE8 2CB729AC */  sw         $t1, %lo(sel_data)($at)
    /* 1D3F4 80156FEC 1280013C */  lui        $at, %hi(_pcursmonst)
    /* 1D3F8 80156FF0 21082200 */  addu       $at, $at, $v0
    /* 1D3FC 80156FF4 58B73EAC */  sw         $fp, %lo(_pcursmonst)($at)
  .L80156FF8:
    /* 1D400 80156FF8 5400BF8F */  lw         $ra, 0x54($sp)
    /* 1D404 80156FFC 5000BE8F */  lw         $fp, 0x50($sp)
    /* 1D408 80157000 4C00B78F */  lw         $s7, 0x4C($sp)
    /* 1D40C 80157004 4800B68F */  lw         $s6, 0x48($sp)
    /* 1D410 80157008 4400B58F */  lw         $s5, 0x44($sp)
    /* 1D414 8015700C 4000B48F */  lw         $s4, 0x40($sp)
    /* 1D418 80157010 3C00B38F */  lw         $s3, 0x3C($sp)
    /* 1D41C 80157014 3800B28F */  lw         $s2, 0x38($sp)
    /* 1D420 80157018 3400B18F */  lw         $s1, 0x34($sp)
    /* 1D424 8015701C 3000B08F */  lw         $s0, 0x30($sp)
    /* 1D428 80157020 5800BD27 */  addiu      $sp, $sp, 0x58
    /* 1D42C 80157024 0800E003 */  jr         $ra
    /* 1D430 80157028 00000000 */   nop
endlabel MAI_Golum__Fi
