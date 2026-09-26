.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddFlame__Fiiiiiicii, 0x238

glabel AddFlame__Fiiiiiicii
    /* 8110 80141D08 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 8114 80141D0C 80100400 */  sll        $v0, $a0, 2
    /* 8118 80141D10 21104400 */  addu       $v0, $v0, $a0
    /* 811C 80141D14 80100200 */  sll        $v0, $v0, 2
    /* 8120 80141D18 23104400 */  subu       $v0, $v0, $a0
    /* 8124 80141D1C 4000A88F */  lw         $t0, 0x40($sp)
    /* 8128 80141D20 80100200 */  sll        $v0, $v0, 2
    /* 812C 80141D24 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 8130 80141D28 1800B2AF */  sw         $s2, 0x18($sp)
    /* 8134 80141D2C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 8138 80141D30 1000B0AF */  sw         $s0, 0x10($sp)
    /* 813C 80141D34 1080013C */  lui        $at, %hi(missile + 0x20)
    /* 8140 80141D38 21082200 */  addu       $at, $at, $v0
    /* 8144 80141D3C 782C20A4 */  sh         $zero, %lo(missile + 0x20)($at)
    /* 8148 80141D40 3000AA8F */  lw         $t2, 0x30($sp)
    /* 814C 80141D44 3400A98F */  lw         $t1, 0x34($sp)
    /* 8150 80141D48 3C00B28F */  lw         $s2, 0x3C($sp)
    /* 8154 80141D4C 3800B093 */  lbu        $s0, 0x38($sp)
    /* 8158 80141D50 0B000019 */  blez       $t0, .L80141D80
    /* 815C 80141D54 21184000 */   addu      $v1, $v0, $zero
  .L80141D58:
    /* 8160 80141D58 1080013C */  lui        $at, %hi(missile + 0x20)
    /* 8164 80141D5C 21082300 */  addu       $at, $at, $v1
    /* 8168 80141D60 782C2294 */  lhu        $v0, %lo(missile + 0x20)($at)
    /* 816C 80141D64 FFFF0825 */  addiu      $t0, $t0, -0x1
    /* 8170 80141D68 05004224 */  addiu      $v0, $v0, 0x5
    /* 8174 80141D6C 1080013C */  lui        $at, %hi(missile + 0x20)
    /* 8178 80141D70 21082300 */  addu       $at, $at, $v1
    /* 817C 80141D74 782C22A4 */  sh         $v0, %lo(missile + 0x20)($at)
    /* 8180 80141D78 F7FF001D */  bgtz       $t0, .L80141D58
    /* 8184 80141D7C 00000000 */   nop
  .L80141D80:
    /* 8188 80141D80 80100400 */  sll        $v0, $a0, 2
    /* 818C 80141D84 21104400 */  addu       $v0, $v0, $a0
    /* 8190 80141D88 80100200 */  sll        $v0, $v0, 2
    /* 8194 80141D8C 23104400 */  subu       $v0, $v0, $a0
    /* 8198 80141D90 80880200 */  sll        $s1, $v0, 2
    /* 819C 80141D94 80100900 */  sll        $v0, $t1, 2
    /* 81A0 80141D98 21104900 */  addu       $v0, $v0, $t1
    /* 81A4 80141D9C 80100200 */  sll        $v0, $v0, 2
    /* 81A8 80141DA0 23104900 */  subu       $v0, $v0, $t1
    /* 81AC 80141DA4 80100200 */  sll        $v0, $v0, 2
    /* 81B0 80141DA8 1080013C */  lui        $at, %hi(missile + 0x35)
    /* 81B4 80141DAC 21083100 */  addu       $at, $at, $s1
    /* 81B8 80141DB0 8D2C27A0 */  sb         $a3, %lo(missile + 0x35)($at)
    /* 81BC 80141DB4 1080013C */  lui        $at, %hi(missile + 0x36)
    /* 81C0 80141DB8 21083100 */  addu       $at, $at, $s1
    /* 81C4 80141DBC 8E2C2AA0 */  sb         $t2, %lo(missile + 0x36)($at)
    /* 81C8 80141DC0 1080013C */  lui        $at, %hi(missile + 0x33)
    /* 81CC 80141DC4 21082200 */  addu       $at, $at, $v0
    /* 81D0 80141DC8 8B2C2390 */  lbu        $v1, %lo(missile + 0x33)($at)
    /* 81D4 80141DCC 2120A000 */  addu       $a0, $a1, $zero
    /* 81D8 80141DD0 1080013C */  lui        $at, %hi(missile + 0x33)
    /* 81DC 80141DD4 21083100 */  addu       $at, $at, $s1
    /* 81E0 80141DD8 8B2C23A0 */  sb         $v1, %lo(missile + 0x33)($at)
    /* 81E4 80141DDC 1080013C */  lui        $at, %hi(missile + 0x34)
    /* 81E8 80141DE0 21082200 */  addu       $at, $at, $v0
    /* 81EC 80141DE4 8C2C2390 */  lbu        $v1, %lo(missile + 0x34)($at)
    /* 81F0 80141DE8 2128C000 */  addu       $a1, $a2, $zero
    /* 81F4 80141DEC 1080013C */  lui        $at, %hi(missile + 0x34)
    /* 81F8 80141DF0 21083100 */  addu       $at, $at, $s1
    /* 81FC 80141DF4 8C2C23A0 */  sb         $v1, %lo(missile + 0x34)($at)
    /* 8200 80141DF8 1080013C */  lui        $at, %hi(missile + 0x8)
    /* 8204 80141DFC 21082200 */  addu       $at, $at, $v0
    /* 8208 80141E00 602C238C */  lw         $v1, %lo(missile + 0x8)($at)
    /* 820C 80141E04 1080013C */  lui        $at, %hi(missile + 0x8)
    /* 8210 80141E08 21083100 */  addu       $at, $at, $s1
    /* 8214 80141E0C 602C23AC */  sw         $v1, %lo(missile + 0x8)($at)
    /* 8218 80141E10 1080013C */  lui        $at, %hi(missile + 0x20)
    /* 821C 80141E14 21083100 */  addu       $at, $at, $s1
    /* 8220 80141E18 782C2394 */  lhu        $v1, %lo(missile + 0x20)($at)
    /* 8224 80141E1C 1080013C */  lui        $at, %hi(missile + 0xC)
    /* 8228 80141E20 21082200 */  addu       $at, $at, $v0
    /* 822C 80141E24 642C228C */  lw         $v0, %lo(missile + 0xC)($at)
    /* 8230 80141E28 14006324 */  addiu      $v1, $v1, 0x14
    /* 8234 80141E2C 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 8238 80141E30 21083100 */  addu       $at, $at, $s1
    /* 823C 80141E34 702C23A4 */  sh         $v1, %lo(missile + 0x18)($at)
    /* 8240 80141E38 1080013C */  lui        $at, %hi(missile + 0xC)
    /* 8244 80141E3C 21083100 */  addu       $at, $at, $s1
    /* 8248 80141E40 642C22AC */  sw         $v0, %lo(missile + 0xC)($at)
    /* 824C 80141E44 BA34010C */  jal        AddLight__Fiii
    /* 8250 80141E48 94000624 */   addiu     $a2, $zero, 0x94
    /* 8254 80141E4C 1080013C */  lui        $at, %hi(missile + 0x3E)
    /* 8258 80141E50 21083100 */  addu       $at, $at, $s1
    /* 825C 80141E54 962C22A0 */  sb         $v0, %lo(missile + 0x3E)($at)
    /* 8260 80141E58 1C000016 */  bnez       $s0, .L80141ECC
    /* 8264 80141E5C 40801200 */   sll       $s0, $s2, 1
    /* 8268 80141E60 40101200 */  sll        $v0, $s2, 1
    /* 826C 80141E64 21105200 */  addu       $v0, $v0, $s2
    /* 8270 80141E68 80100200 */  sll        $v0, $v0, 2
    /* 8274 80141E6C 21105200 */  addu       $v0, $v0, $s2
    /* 8278 80141E70 00110200 */  sll        $v0, $v0, 4
    /* 827C 80141E74 23105200 */  subu       $v0, $v0, $s2
    /* 8280 80141E78 80100200 */  sll        $v0, $v0, 2
    /* 8284 80141E7C 21105200 */  addu       $v0, $v0, $s2
    /* 8288 80141E80 C0100200 */  sll        $v0, $v0, 3
    /* 828C 80141E84 0E80013C */  lui        $at, %hi(plr + 0x13C)
    /* 8290 80141E88 21082200 */  addu       $at, $at, $v0
    /* 8294 80141E8C 74A62480 */  lb         $a0, %lo(plr + 0x13C)($at)
    /* 8298 80141E90 C9F6000C */  jal        ENG_random__Fl
    /* 829C 80141E94 00000000 */   nop
    /* 82A0 80141E98 02000424 */  addiu      $a0, $zero, 0x2
    /* 82A4 80141E9C C9F6000C */  jal        ENG_random__Fl
    /* 82A8 80141EA0 21804000 */   addu      $s0, $v0, $zero
    /* 82AC 80141EA4 21800202 */  addu       $s0, $s0, $v0
    /* 82B0 80141EA8 02001026 */  addiu      $s0, $s0, 0x2
    /* 82B4 80141EAC C0801000 */  sll        $s0, $s0, 3
    /* 82B8 80141EB0 43101000 */  sra        $v0, $s0, 1
    /* 82BC 80141EB4 21800202 */  addu       $s0, $s0, $v0
    /* 82C0 80141EB8 1080013C */  lui        $at, %hi(missile + 0x10)
    /* 82C4 80141EBC 21083100 */  addu       $at, $at, $s1
    /* 82C8 80141EC0 682C30AC */  sw         $s0, %lo(missile + 0x10)($at)
    /* 82CC 80141EC4 C9070508 */  j          .L80141F24
    /* 82D0 80141EC8 00000000 */   nop
  .L80141ECC:
    /* 82D4 80141ECC 21801202 */  addu       $s0, $s0, $s2
    /* 82D8 80141ED0 80801000 */  sll        $s0, $s0, 2
    /* 82DC 80141ED4 21801202 */  addu       $s0, $s0, $s2
    /* 82E0 80141ED8 C0801000 */  sll        $s0, $s0, 3
    /* 82E4 80141EDC 1080013C */  lui        $at, %hi(monster + 0x52)
    /* 82E8 80141EE0 21083000 */  addu       $at, $at, $s0
    /* 82EC 80141EE4 E6532490 */  lbu        $a0, %lo(monster + 0x52)($at)
    /* 82F0 80141EE8 1080013C */  lui        $at, %hi(monster + 0x51)
    /* 82F4 80141EEC 21083000 */  addu       $at, $at, $s0
    /* 82F8 80141EF0 E5532290 */  lbu        $v0, %lo(monster + 0x51)($at)
    /* 82FC 80141EF4 00000000 */  nop
    /* 8300 80141EF8 23208200 */  subu       $a0, $a0, $v0
    /* 8304 80141EFC C9F6000C */  jal        ENG_random__Fl
    /* 8308 80141F00 01008424 */   addiu     $a0, $a0, 0x1
    /* 830C 80141F04 1080013C */  lui        $at, %hi(monster + 0x51)
    /* 8310 80141F08 21083000 */  addu       $at, $at, $s0
    /* 8314 80141F0C E5532390 */  lbu        $v1, %lo(monster + 0x51)($at)
    /* 8318 80141F10 00000000 */  nop
    /* 831C 80141F14 21104300 */  addu       $v0, $v0, $v1
    /* 8320 80141F18 1080013C */  lui        $at, %hi(missile + 0x10)
    /* 8324 80141F1C 21083100 */  addu       $at, $at, $s1
    /* 8328 80141F20 682C22AC */  sw         $v0, %lo(missile + 0x10)($at)
  .L80141F24:
    /* 832C 80141F24 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 8330 80141F28 1800B28F */  lw         $s2, 0x18($sp)
    /* 8334 80141F2C 1400B18F */  lw         $s1, 0x14($sp)
    /* 8338 80141F30 1000B08F */  lw         $s0, 0x10($sp)
    /* 833C 80141F34 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 8340 80141F38 0800E003 */  jr         $ra
    /* 8344 80141F3C 00000000 */   nop
endlabel AddFlame__Fiiiiiicii
