.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetupTownStores__Fv, 0x204

glabel SetupTownStores__Fv
    /* 291D8 80162DD0 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 291DC 80162DD4 2800B4AF */  sw         $s4, 0x28($sp)
    /* 291E0 80162DD8 1280143C */  lui        $s4, %hi(myplr)
    /* 291E4 80162DDC 08BA948E */  lw         $s4, %lo(myplr)($s4)
    /* 291E8 80162DE0 3000BFAF */  sw         $ra, 0x30($sp)
    /* 291EC 80162DE4 2C00B5AF */  sw         $s5, 0x2C($sp)
    /* 291F0 80162DE8 2400B3AF */  sw         $s3, 0x24($sp)
    /* 291F4 80162DEC 2000B2AF */  sw         $s2, 0x20($sp)
    /* 291F8 80162DF0 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 291FC 80162DF4 B7F6000C */  jal        GetRndSeed__Fv
    /* 29200 80162DF8 1800B0AF */   sw        $s0, 0x18($sp)
    /* 29204 80162DFC 21984000 */  addu       $s3, $v0, $zero
    /* 29208 80162E00 B3F6000C */  jal        SetRndSeed__Fl
    /* 2920C 80162E04 21206002 */   addu      $a0, $s3, $zero
    /* 29210 80162E08 1280033C */  lui        $v1, %hi(gbMaxPlayers)
    /* 29214 80162E0C A2B96390 */  lbu        $v1, %lo(gbMaxPlayers)($v1)
    /* 29218 80162E10 00000000 */  nop
    /* 2921C 80162E14 61006010 */  beqz       $v1, .L80162F9C
    /* 29220 80162E18 21880000 */   addu      $s1, $zero, $zero
    /* 29224 80162E1C 0E80153C */  lui        $s5, %hi(plr + 0x166)
    /* 29228 80162E20 9EA6B526 */  addiu      $s5, $s5, %lo(plr + 0x166)
    /* 2922C 80162E24 21900000 */  addu       $s2, $zero, $zero
    /* 29230 80162E28 FF006330 */  andi       $v1, $v1, 0xFF
  .L80162E2C:
    /* 29234 80162E2C 01000224 */  addiu      $v0, $zero, 0x1
    /* 29238 80162E30 1280013C */  lui        $at, %hi(StorePlrNo)
    /* 2923C 80162E34 B4BA31AC */  sw         $s1, %lo(StorePlrNo)($at)
    /* 29240 80162E38 1280013C */  lui        $at, %hi(myplr)
    /* 29244 80162E3C 08BA31AC */  sw         $s1, %lo(myplr)($at)
    /* 29248 80162E40 17006214 */  bne        $v1, $v0, .L80162EA0
    /* 2924C 80162E44 21800000 */   addu      $s0, $zero, $zero
    /* 29250 80162E48 21200000 */  addu       $a0, $zero, $zero
    /* 29254 80162E4C 40101100 */  sll        $v0, $s1, 1
    /* 29258 80162E50 21105100 */  addu       $v0, $v0, $s1
    /* 2925C 80162E54 80100200 */  sll        $v0, $v0, 2
    /* 29260 80162E58 21105100 */  addu       $v0, $v0, $s1
    /* 29264 80162E5C 00110200 */  sll        $v0, $v0, 4
    /* 29268 80162E60 23105100 */  subu       $v0, $v0, $s1
    /* 2926C 80162E64 80100200 */  sll        $v0, $v0, 2
    /* 29270 80162E68 21105100 */  addu       $v0, $v0, $s1
    /* 29274 80162E6C C0100200 */  sll        $v0, $v0, 3
    /* 29278 80162E70 21185500 */  addu       $v1, $v0, $s5
  .L80162E74:
    /* 2927C 80162E74 00006290 */  lbu        $v0, 0x0($v1)
    /* 29280 80162E78 00000000 */  nop
    /* 29284 80162E7C 02004010 */  beqz       $v0, .L80162E88
    /* 29288 80162E80 00000000 */   nop
    /* 2928C 80162E84 21808000 */  addu       $s0, $a0, $zero
  .L80162E88:
    /* 29290 80162E88 01008424 */  addiu      $a0, $a0, 0x1
    /* 29294 80162E8C 11008228 */  slti       $v0, $a0, 0x11
    /* 29298 80162E90 F8FF4014 */  bnez       $v0, .L80162E74
    /* 2929C 80162E94 01006324 */   addiu     $v1, $v1, 0x1
    /* 292A0 80162E98 AF8B0508 */  j          .L80162EBC
    /* 292A4 80162E9C 02001026 */   addiu     $s0, $s0, 0x2
  .L80162EA0:
    /* 292A8 80162EA0 0E80013C */  lui        $at, %hi(plr + 0x13C)
    /* 292AC 80162EA4 21083200 */  addu       $at, $at, $s2
    /* 292B0 80162EA8 74A62290 */  lbu        $v0, %lo(plr + 0x13C)($at)
    /* 292B4 80162EAC 00000000 */  nop
    /* 292B8 80162EB0 00160200 */  sll        $v0, $v0, 24
    /* 292BC 80162EB4 43860200 */  sra        $s0, $v0, 25
    /* 292C0 80162EB8 02001026 */  addiu      $s0, $s0, 0x2
  .L80162EBC:
    /* 292C4 80162EBC 0600022A */  slti       $v0, $s0, 0x6
    /* 292C8 80162EC0 03004010 */  beqz       $v0, .L80162ED0
    /* 292CC 80162EC4 1100022A */   slti      $v0, $s0, 0x11
    /* 292D0 80162EC8 06001024 */  addiu      $s0, $zero, 0x6
    /* 292D4 80162ECC 1100022A */  slti       $v0, $s0, 0x11
  .L80162ED0:
    /* 292D8 80162ED0 02004014 */  bnez       $v0, .L80162EDC
    /* 292DC 80162ED4 00000000 */   nop
    /* 292E0 80162ED8 10001024 */  addiu      $s0, $zero, 0x10
  .L80162EDC:
    /* 292E4 80162EDC E221010C */  jal        SpawnStoreGold__Fv
    /* 292E8 80162EE0 E8195226 */   addiu     $s2, $s2, 0x19E8
    /* 292EC 80162EE4 5029010C */  jal        SpawnSmith__Fi
    /* 292F0 80162EE8 21200002 */   addu      $a0, $s0, $zero
    /* 292F4 80162EEC 1B2A010C */  jal        SpawnWitch__Fi
    /* 292F8 80162EF0 21200002 */   addu      $a0, $s0, $zero
    /* 292FC 80162EF4 972B010C */  jal        SpawnHealer__Fi
    /* 29300 80162EF8 21200002 */   addu      $a0, $s0, $zero
    /* 29304 80162EFC 1280033C */  lui        $v1, %hi(myplr)
    /* 29308 80162F00 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 2930C 80162F04 00000000 */  nop
    /* 29310 80162F08 40100300 */  sll        $v0, $v1, 1
    /* 29314 80162F0C 21104300 */  addu       $v0, $v0, $v1
    /* 29318 80162F10 80100200 */  sll        $v0, $v0, 2
    /* 2931C 80162F14 21104300 */  addu       $v0, $v0, $v1
    /* 29320 80162F18 00110200 */  sll        $v0, $v0, 4
    /* 29324 80162F1C 23104300 */  subu       $v0, $v0, $v1
    /* 29328 80162F20 80100200 */  sll        $v0, $v0, 2
    /* 2932C 80162F24 21104300 */  addu       $v0, $v0, $v1
    /* 29330 80162F28 C0100200 */  sll        $v0, $v0, 3
    /* 29334 80162F2C 0E80013C */  lui        $at, %hi(plr + 0x13C)
    /* 29338 80162F30 21082200 */  addu       $at, $at, $v0
    /* 2933C 80162F34 74A62480 */  lb         $a0, %lo(plr + 0x13C)($at)
    /* 29340 80162F38 FF2C010C */  jal        SpawnBoy__Fi
    /* 29344 80162F3C 01003126 */   addiu     $s1, $s1, 0x1
    /* 29348 80162F40 1280033C */  lui        $v1, %hi(myplr)
    /* 2934C 80162F44 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 29350 80162F48 00000000 */  nop
    /* 29354 80162F4C 40100300 */  sll        $v0, $v1, 1
    /* 29358 80162F50 21104300 */  addu       $v0, $v0, $v1
    /* 2935C 80162F54 80100200 */  sll        $v0, $v0, 2
    /* 29360 80162F58 21104300 */  addu       $v0, $v0, $v1
    /* 29364 80162F5C 00110200 */  sll        $v0, $v0, 4
    /* 29368 80162F60 23104300 */  subu       $v0, $v0, $v1
    /* 2936C 80162F64 80100200 */  sll        $v0, $v0, 2
    /* 29370 80162F68 21104300 */  addu       $v0, $v0, $v1
    /* 29374 80162F6C C0100200 */  sll        $v0, $v0, 3
    /* 29378 80162F70 0E80013C */  lui        $at, %hi(plr + 0x13C)
    /* 2937C 80162F74 21082200 */  addu       $at, $at, $v0
    /* 29380 80162F78 74A62480 */  lb         $a0, %lo(plr + 0x13C)($at)
    /* 29384 80162F7C 8320010C */  jal        SpawnPremium__Fi
    /* 29388 80162F80 00000000 */   nop
    /* 2938C 80162F84 1280033C */  lui        $v1, %hi(gbMaxPlayers)
    /* 29390 80162F88 A2B96390 */  lbu        $v1, %lo(gbMaxPlayers)($v1)
    /* 29394 80162F8C 00000000 */  nop
    /* 29398 80162F90 2A102302 */  slt        $v0, $s1, $v1
    /* 2939C 80162F94 A5FF4014 */  bnez       $v0, .L80162E2C
    /* 293A0 80162F98 FF006330 */   andi      $v1, $v1, 0xFF
  .L80162F9C:
    /* 293A4 80162F9C 1280013C */  lui        $at, %hi(myplr)
    /* 293A8 80162FA0 08BA34AC */  sw         $s4, %lo(myplr)($at)
    /* 293AC 80162FA4 B3F6000C */  jal        SetRndSeed__Fl
    /* 293B0 80162FA8 21206002 */   addu      $a0, $s3, $zero
    /* 293B4 80162FAC 3000BF8F */  lw         $ra, 0x30($sp)
    /* 293B8 80162FB0 2C00B58F */  lw         $s5, 0x2C($sp)
    /* 293BC 80162FB4 2800B48F */  lw         $s4, 0x28($sp)
    /* 293C0 80162FB8 2400B38F */  lw         $s3, 0x24($sp)
    /* 293C4 80162FBC 2000B28F */  lw         $s2, 0x20($sp)
    /* 293C8 80162FC0 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 293CC 80162FC4 1800B08F */  lw         $s0, 0x18($sp)
    /* 293D0 80162FC8 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 293D4 80162FCC 0800E003 */  jr         $ra
    /* 293D8 80162FD0 00000000 */   nop
endlabel SetupTownStores__Fv
