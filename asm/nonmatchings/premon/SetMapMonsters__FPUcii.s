.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetMapMonsters__FPUcii, 0x234

glabel SetMapMonsters__FPUcii
    /* 270A8 80160CA0 B0FFBD27 */  addiu      $sp, $sp, -0x50
    /* 270AC 80160CA4 3000B0AF */  sw         $s0, 0x30($sp)
    /* 270B0 80160CA8 21808000 */  addu       $s0, $a0, $zero
    /* 270B4 80160CAC 4400B5AF */  sw         $s5, 0x44($sp)
    /* 270B8 80160CB0 21A8A000 */  addu       $s5, $a1, $zero
    /* 270BC 80160CB4 4800B6AF */  sw         $s6, 0x48($sp)
    /* 270C0 80160CB8 21B0C000 */  addu       $s6, $a2, $zero
    /* 270C4 80160CBC 6D000424 */  addiu      $a0, $zero, 0x6D
    /* 270C8 80160CC0 02000524 */  addiu      $a1, $zero, 0x2
    /* 270CC 80160CC4 4C00BFAF */  sw         $ra, 0x4C($sp)
    /* 270D0 80160CC8 4000B4AF */  sw         $s4, 0x40($sp)
    /* 270D4 80160CCC 3C00B3AF */  sw         $s3, 0x3C($sp)
    /* 270D8 80160CD0 3800B2AF */  sw         $s2, 0x38($sp)
    /* 270DC 80160CD4 637E050C */  jal        AddMonsterType__Fii
    /* 270E0 80160CD8 3400B1AF */   sw        $s1, 0x34($sp)
    /* 270E4 80160CDC 01000424 */  addiu      $a0, $zero, 0x1
    /* 270E8 80160CE0 21280000 */  addu       $a1, $zero, $zero
    /* 270EC 80160CE4 21300000 */  addu       $a2, $zero, $zero
    /* 270F0 80160CE8 21380000 */  addu       $a3, $zero, $zero
    /* 270F4 80160CEC 74FF010C */  jal        AddMonster__FiiiiUc
    /* 270F8 80160CF0 1000A0AF */   sw        $zero, 0x10($sp)
    /* 270FC 80160CF4 01000424 */  addiu      $a0, $zero, 0x1
    /* 27100 80160CF8 21280000 */  addu       $a1, $zero, $zero
    /* 27104 80160CFC 21300000 */  addu       $a2, $zero, $zero
    /* 27108 80160D00 21380000 */  addu       $a3, $zero, $zero
    /* 2710C 80160D04 74FF010C */  jal        AddMonster__FiiiiUc
    /* 27110 80160D08 1000A0AF */   sw        $zero, 0x10($sp)
    /* 27114 80160D0C 01000424 */  addiu      $a0, $zero, 0x1
    /* 27118 80160D10 21280000 */  addu       $a1, $zero, $zero
    /* 2711C 80160D14 21300000 */  addu       $a2, $zero, $zero
    /* 27120 80160D18 21380000 */  addu       $a3, $zero, $zero
    /* 27124 80160D1C 74FF010C */  jal        AddMonster__FiiiiUc
    /* 27128 80160D20 1000A0AF */   sw        $zero, 0x10($sp)
    /* 2712C 80160D24 01000424 */  addiu      $a0, $zero, 0x1
    /* 27130 80160D28 21280000 */  addu       $a1, $zero, $zero
    /* 27134 80160D2C 21300000 */  addu       $a2, $zero, $zero
    /* 27138 80160D30 21380000 */  addu       $a3, $zero, $zero
    /* 2713C 80160D34 74FF010C */  jal        AddMonster__FiiiiUc
    /* 27140 80160D38 1000A0AF */   sw        $zero, 0x10($sp)
    /* 27144 80160D3C 1280023C */  lui        $v0, %hi(setlevel)
    /* 27148 80160D40 0EC14290 */  lbu        $v0, %lo(setlevel)($v0)
    /* 2714C 80160D44 00000000 */  nop
    /* 27150 80160D48 1E004010 */  beqz       $v0, .L80160DC4
    /* 27154 80160D4C 05000224 */   addiu     $v0, $zero, 0x5
    /* 27158 80160D50 1280033C */  lui        $v1, %hi(setlvlnum)
    /* 2715C 80160D54 0FC16390 */  lbu        $v1, %lo(setlvlnum)($v1)
    /* 27160 80160D58 00000000 */  nop
    /* 27164 80160D5C 19006214 */  bne        $v1, $v0, .L80160DC4
    /* 27168 80160D60 00000000 */   nop
    /* 2716C 80160D64 1180043C */  lui        $a0, %hi(UniqMonst + 0x60)
    /* 27170 80160D68 68C78480 */  lb         $a0, %lo(UniqMonst + 0x60)($a0)
    /* 27174 80160D6C 637E050C */  jal        AddMonsterType__Fii
    /* 27178 80160D70 04000524 */   addiu     $a1, $zero, 0x4
    /* 2717C 80160D74 1180043C */  lui        $a0, %hi(UniqMonst + 0x78)
    /* 27180 80160D78 80C78480 */  lb         $a0, %lo(UniqMonst + 0x78)($a0)
    /* 27184 80160D7C 637E050C */  jal        AddMonsterType__Fii
    /* 27188 80160D80 04000524 */   addiu     $a1, $zero, 0x4
    /* 2718C 80160D84 1180043C */  lui        $a0, %hi(UniqMonst + 0x90)
    /* 27190 80160D88 98C78480 */  lb         $a0, %lo(UniqMonst + 0x90)($a0)
    /* 27194 80160D8C 637E050C */  jal        AddMonsterType__Fii
    /* 27198 80160D90 04000524 */   addiu     $a1, $zero, 0x4
    /* 2719C 80160D94 04000424 */  addiu      $a0, $zero, 0x4
    /* 271A0 80160D98 21280000 */  addu       $a1, $zero, $zero
    /* 271A4 80160D9C A284050C */  jal        PlaceUniqueMonst__Fiii
    /* 271A8 80160DA0 21300000 */   addu      $a2, $zero, $zero
    /* 271AC 80160DA4 05000424 */  addiu      $a0, $zero, 0x5
    /* 271B0 80160DA8 21280000 */  addu       $a1, $zero, $zero
    /* 271B4 80160DAC A284050C */  jal        PlaceUniqueMonst__Fiii
    /* 271B8 80160DB0 21300000 */   addu      $a2, $zero, $zero
    /* 271BC 80160DB4 06000424 */  addiu      $a0, $zero, 0x6
    /* 271C0 80160DB8 21280000 */  addu       $a1, $zero, $zero
    /* 271C4 80160DBC A284050C */  jal        PlaceUniqueMonst__Fiii
    /* 271C8 80160DC0 21300000 */   addu      $a2, $zero, $zero
  .L80160DC4:
    /* 271CC 80160DC4 21880002 */  addu       $s1, $s0, $zero
    /* 271D0 80160DC8 00000296 */  lhu        $v0, 0x0($s0)
    /* 271D4 80160DCC 02003126 */  addiu      $s1, $s1, 0x2
    /* 271D8 80160DD0 00003496 */  lhu        $s4, 0x0($s1)
    /* 271DC 80160DD4 00000000 */  nop
    /* 271E0 80160DD8 18008202 */  mult       $s4, $v0
    /* 271E4 80160DDC 40100200 */  sll        $v0, $v0, 1
    /* 271E8 80160DE0 40A01400 */  sll        $s4, $s4, 1
    /* 271EC 80160DE4 12280000 */  mflo       $a1
    /* 271F0 80160DE8 FFFF4430 */  andi       $a0, $v0, 0xFFFF
    /* 271F4 80160DEC FFFF8332 */  andi       $v1, $s4, 0xFFFF
    /* 271F8 80160DF0 18008300 */  mult       $a0, $v1
    /* 271FC 80160DF4 02003126 */  addiu      $s1, $s1, 0x2
    /* 27200 80160DF8 21900000 */  addu       $s2, $zero, $zero
    /* 27204 80160DFC 40100500 */  sll        $v0, $a1, 1
    /* 27208 80160E00 21882202 */  addu       $s1, $s1, $v0
    /* 2720C 80160E04 12480000 */  mflo       $t1
    /* 27210 80160E08 40100900 */  sll        $v0, $t1, 1
    /* 27214 80160E0C 26006010 */  beqz       $v1, .L80160EA8
    /* 27218 80160E10 21882202 */   addu      $s1, $s1, $v0
    /* 2721C 80160E14 21988000 */  addu       $s3, $a0, $zero
  .L80160E18:
    /* 27220 80160E18 1E006012 */  beqz       $s3, .L80160E94
    /* 27224 80160E1C 21800000 */   addu      $s0, $zero, $zero
  .L80160E20:
    /* 27228 80160E20 00002296 */  lhu        $v0, 0x0($s1)
    /* 2722C 80160E24 00000000 */  nop
    /* 27230 80160E28 16004010 */  beqz       $v0, .L80160E84
    /* 27234 80160E2C 1800A427 */   addiu     $a0, $sp, 0x18
    /* 27238 80160E30 1800A2AF */  sw         $v0, 0x18($sp)
    /* 2723C 80160E34 1180013C */  lui        $at, %hi(monsterdata + 0x1A7B)
    /* 27240 80160E38 21082200 */  addu       $at, $at, $v0
    /* 27244 80160E3C 17C62280 */  lb         $v0, %lo(monsterdata + 0x1A7B)($at)
    /* 27248 80160E40 BA7D050C */  jal        SwapMonsterType__FPi
    /* 2724C 80160E44 1800A2AF */   sw        $v0, 0x18($sp)
    /* 27250 80160E48 1800A48F */  lw         $a0, 0x18($sp)
    /* 27254 80160E4C 637E050C */  jal        AddMonsterType__Fii
    /* 27258 80160E50 02000524 */   addiu     $a1, $zero, 0x2
    /* 2725C 80160E54 21284000 */  addu       $a1, $v0, $zero
    /* 27260 80160E58 1000A626 */  addiu      $a2, $s5, 0x10
    /* 27264 80160E5C 21300602 */  addu       $a2, $s0, $a2
    /* 27268 80160E60 1000C726 */  addiu      $a3, $s6, 0x10
    /* 2726C 80160E64 1280043C */  lui        $a0, %hi(nummonsters)
    /* 27270 80160E68 CCC2848C */  lw         $a0, %lo(nummonsters)($a0)
    /* 27274 80160E6C 00000000 */  nop
    /* 27278 80160E70 01008224 */  addiu      $v0, $a0, 0x1
    /* 2727C 80160E74 1280013C */  lui        $at, %hi(nummonsters)
    /* 27280 80160E78 CCC222AC */  sw         $v0, %lo(nummonsters)($at)
    /* 27284 80160E7C 407E050C */  jal        PlaceMonster__Fiiii
    /* 27288 80160E80 21384702 */   addu      $a3, $s2, $a3
  .L80160E84:
    /* 2728C 80160E84 01001026 */  addiu      $s0, $s0, 0x1
    /* 27290 80160E88 2A101302 */  slt        $v0, $s0, $s3
    /* 27294 80160E8C E4FF4014 */  bnez       $v0, .L80160E20
    /* 27298 80160E90 02003126 */   addiu     $s1, $s1, 0x2
  .L80160E94:
    /* 2729C 80160E94 01005226 */  addiu      $s2, $s2, 0x1
    /* 272A0 80160E98 FFFF8232 */  andi       $v0, $s4, 0xFFFF
    /* 272A4 80160E9C 2A104202 */  slt        $v0, $s2, $v0
    /* 272A8 80160EA0 DDFF4014 */  bnez       $v0, .L80160E18
    /* 272AC 80160EA4 00000000 */   nop
  .L80160EA8:
    /* 272B0 80160EA8 4C00BF8F */  lw         $ra, 0x4C($sp)
    /* 272B4 80160EAC 4800B68F */  lw         $s6, 0x48($sp)
    /* 272B8 80160EB0 4400B58F */  lw         $s5, 0x44($sp)
    /* 272BC 80160EB4 4000B48F */  lw         $s4, 0x40($sp)
    /* 272C0 80160EB8 3C00B38F */  lw         $s3, 0x3C($sp)
    /* 272C4 80160EBC 3800B28F */  lw         $s2, 0x38($sp)
    /* 272C8 80160EC0 3400B18F */  lw         $s1, 0x34($sp)
    /* 272CC 80160EC4 3000B08F */  lw         $s0, 0x30($sp)
    /* 272D0 80160EC8 5000BD27 */  addiu      $sp, $sp, 0x50
    /* 272D4 80160ECC 0800E003 */  jr         $ra
    /* 272D8 80160ED0 00000000 */   nop
endlabel SetMapMonsters__FPUcii
