.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MI_Flamec__Fi, 0x27C

glabel MI_Flamec__Fi
    /* F39C 80148F94 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* F3A0 80148F98 2C00B1AF */  sw         $s1, 0x2C($sp)
    /* F3A4 80148F9C 21888000 */  addu       $s1, $a0, $zero
    /* F3A8 80148FA0 80101100 */  sll        $v0, $s1, 2
    /* F3AC 80148FA4 21105100 */  addu       $v0, $v0, $s1
    /* F3B0 80148FA8 80100200 */  sll        $v0, $v0, 2
    /* F3B4 80148FAC 23105100 */  subu       $v0, $v0, $s1
    /* F3B8 80148FB0 2800B0AF */  sw         $s0, 0x28($sp)
    /* F3BC 80148FB4 80800200 */  sll        $s0, $v0, 2
    /* F3C0 80148FB8 3400BFAF */  sw         $ra, 0x34($sp)
    /* F3C4 80148FBC 3000B2AF */  sw         $s2, 0x30($sp)
    /* F3C8 80148FC0 1080013C */  lui        $at, %hi(missile + 0x18)
    /* F3CC 80148FC4 21083000 */  addu       $at, $at, $s0
    /* F3D0 80148FC8 702C2294 */  lhu        $v0, %lo(missile + 0x18)($at)
    /* F3D4 80148FCC 1080013C */  lui        $at, %hi(missile)
    /* F3D8 80148FD0 21083000 */  addu       $at, $at, $s0
    /* F3DC 80148FD4 582C258C */  lw         $a1, %lo(missile)($at)
    /* F3E0 80148FD8 1080013C */  lui        $at, %hi(missile + 0xC)
    /* F3E4 80148FDC 21083000 */  addu       $at, $at, $s0
    /* F3E8 80148FE0 642C238C */  lw         $v1, %lo(missile + 0xC)($at)
    /* F3EC 80148FE4 1080013C */  lui        $at, %hi(missile + 0x4)
    /* F3F0 80148FE8 21083000 */  addu       $at, $at, $s0
    /* F3F4 80148FEC 5C2C268C */  lw         $a2, %lo(missile + 0x4)($at)
    /* F3F8 80148FF0 1080013C */  lui        $at, %hi(missile + 0x2E)
    /* F3FC 80148FF4 21083000 */  addu       $at, $at, $s0
    /* F400 80148FF8 862C3284 */  lh         $s2, %lo(missile + 0x2E)($at)
    /* F404 80148FFC FFFF4224 */  addiu      $v0, $v0, -0x1
    /* F408 80149000 1080013C */  lui        $at, %hi(missile + 0x18)
    /* F40C 80149004 21083000 */  addu       $at, $at, $s0
    /* F410 80149008 702C22A4 */  sh         $v0, %lo(missile + 0x18)($at)
    /* F414 8014900C 1080013C */  lui        $at, %hi(missile + 0x8)
    /* F418 80149010 21083000 */  addu       $at, $at, $s0
    /* F41C 80149014 602C228C */  lw         $v0, %lo(missile + 0x8)($at)
    /* F420 80149018 21186600 */  addu       $v1, $v1, $a2
    /* F424 8014901C 1080013C */  lui        $at, %hi(missile + 0xC)
    /* F428 80149020 21083000 */  addu       $at, $at, $s0
    /* F42C 80149024 642C23AC */  sw         $v1, %lo(missile + 0xC)($at)
    /* F430 80149028 21104500 */  addu       $v0, $v0, $a1
    /* F434 8014902C 1080013C */  lui        $at, %hi(missile + 0x8)
    /* F438 80149030 21083000 */  addu       $at, $at, $s0
    /* F43C 80149034 602C22AC */  sw         $v0, %lo(missile + 0x8)($at)
    /* F440 80149038 68EB040C */  jal        GetMissilePos__Fi
    /* F444 8014903C 00000000 */   nop
    /* F448 80149040 1080013C */  lui        $at, %hi(missile + 0x31)
    /* F44C 80149044 21083000 */  addu       $at, $at, $s0
    /* F450 80149048 892C2290 */  lbu        $v0, %lo(missile + 0x31)($at)
    /* F454 8014904C 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* F458 80149050 21083000 */  addu       $at, $at, $s0
    /* F45C 80149054 762C2384 */  lh         $v1, %lo(missile + 0x1E)($at)
    /* F460 80149058 00260200 */  sll        $a0, $v0, 24
    /* F464 8014905C 03160400 */  sra        $v0, $a0, 24
    /* F468 80149060 0A004314 */  bne        $v0, $v1, .L8014908C
    /* F46C 80149064 00000000 */   nop
    /* F470 80149068 1080013C */  lui        $at, %hi(missile + 0x32)
    /* F474 8014906C 21083000 */  addu       $at, $at, $s0
    /* F478 80149070 8A2C2380 */  lb         $v1, %lo(missile + 0x32)($at)
    /* F47C 80149074 1080013C */  lui        $at, %hi(missile + 0x20)
    /* F480 80149078 21083000 */  addu       $at, $at, $s0
    /* F484 8014907C 782C2284 */  lh         $v0, %lo(missile + 0x20)($at)
    /* F488 80149080 00000000 */  nop
    /* F48C 80149084 47006210 */  beq        $v1, $v0, .L801491A4
    /* F490 80149088 80101100 */   sll       $v0, $s1, 2
  .L8014908C:
    /* F494 8014908C 1080013C */  lui        $at, %hi(missile + 0x32)
    /* F498 80149090 21083000 */  addu       $at, $at, $s0
    /* F49C 80149094 8A2C2580 */  lb         $a1, %lo(missile + 0x32)($at)
    /* F4A0 80149098 900B020C */  jal        GetMISSILE__Fii
    /* F4A4 8014909C 03260400 */   sra       $a0, $a0, 24
    /* F4A8 801490A0 20004014 */  bnez       $v0, .L80149124
    /* F4AC 801490A4 30000224 */   addiu     $v0, $zero, 0x30
    /* F4B0 801490A8 1080013C */  lui        $at, %hi(missile + 0x31)
    /* F4B4 801490AC 21083000 */  addu       $at, $at, $s0
    /* F4B8 801490B0 892C2480 */  lb         $a0, %lo(missile + 0x31)($at)
    /* F4BC 801490B4 1080013C */  lui        $at, %hi(missile + 0x32)
    /* F4C0 801490B8 21083000 */  addu       $at, $at, $s0
    /* F4C4 801490BC 8A2C2580 */  lb         $a1, %lo(missile + 0x32)($at)
    /* F4C8 801490C0 1080013C */  lui        $at, %hi(missile + 0x35)
    /* F4CC 801490C4 21083000 */  addu       $at, $at, $s0
    /* F4D0 801490C8 8D2C2680 */  lb         $a2, %lo(missile + 0x35)($at)
    /* F4D4 801490CC 1080013C */  lui        $at, %hi(missile + 0x36)
    /* F4D8 801490D0 21083000 */  addu       $at, $at, $s0
    /* F4DC 801490D4 8E2C2780 */  lb         $a3, %lo(missile + 0x36)($at)
    /* F4E0 801490D8 1000B1AF */  sw         $s1, 0x10($sp)
    /* F4E4 801490DC 1400A2AF */  sw         $v0, 0x14($sp)
    /* F4E8 801490E0 1080013C */  lui        $at, %hi(missile + 0x1A)
    /* F4EC 801490E4 21083000 */  addu       $at, $at, $s0
    /* F4F0 801490E8 722C2280 */  lb         $v0, %lo(missile + 0x1A)($at)
    /* F4F4 801490EC 1C00B2AF */  sw         $s2, 0x1C($sp)
    /* F4F8 801490F0 1800A2AF */  sw         $v0, 0x18($sp)
    /* F4FC 801490F4 1080013C */  lui        $at, %hi(missile + 0x22)
    /* F500 801490F8 21083000 */  addu       $at, $at, $s0
    /* F504 801490FC 7A2C2284 */  lh         $v0, %lo(missile + 0x22)($at)
    /* F508 80149100 00000000 */  nop
    /* F50C 80149104 2000A2AF */  sw         $v0, 0x20($sp)
    /* F510 80149108 1080013C */  lui        $at, %hi(missile + 0x40)
    /* F514 8014910C 21083000 */  addu       $at, $at, $s0
    /* F518 80149110 982C2280 */  lb         $v0, %lo(missile + 0x40)($at)
    /* F51C 80149114 810A050C */  jal        AddMissile__Fiiiiiiciii
    /* F520 80149118 2400A2AF */   sw        $v0, 0x24($sp)
    /* F524 8014911C 4D240508 */  j          .L80149134
    /* F528 80149120 80101100 */   sll       $v0, $s1, 2
  .L80149124:
    /* F52C 80149124 1080013C */  lui        $at, %hi(missile + 0x18)
    /* F530 80149128 21083000 */  addu       $at, $at, $s0
    /* F534 8014912C 702C20A4 */  sh         $zero, %lo(missile + 0x18)($at)
    /* F538 80149130 80101100 */  sll        $v0, $s1, 2
  .L80149134:
    /* F53C 80149134 21105100 */  addu       $v0, $v0, $s1
    /* F540 80149138 80100200 */  sll        $v0, $v0, 2
    /* F544 8014913C 23105100 */  subu       $v0, $v0, $s1
    /* F548 80149140 80100200 */  sll        $v0, $v0, 2
    /* F54C 80149144 1080013C */  lui        $at, %hi(missile + 0x31)
    /* F550 80149148 21082200 */  addu       $at, $at, $v0
    /* F554 8014914C 892C2590 */  lbu        $a1, %lo(missile + 0x31)($at)
    /* F558 80149150 1080013C */  lui        $at, %hi(missile + 0x32)
    /* F55C 80149154 21082200 */  addu       $at, $at, $v0
    /* F560 80149158 8A2C2390 */  lbu        $v1, %lo(missile + 0x32)($at)
    /* F564 8014915C 1080013C */  lui        $at, %hi(missile + 0x22)
    /* F568 80149160 21082200 */  addu       $at, $at, $v0
    /* F56C 80149164 7A2C2494 */  lhu        $a0, %lo(missile + 0x22)($at)
    /* F570 80149168 002E0500 */  sll        $a1, $a1, 24
    /* F574 8014916C 032E0500 */  sra        $a1, $a1, 24
    /* F578 80149170 001E0300 */  sll        $v1, $v1, 24
    /* F57C 80149174 031E0300 */  sra        $v1, $v1, 24
    /* F580 80149178 01008424 */  addiu      $a0, $a0, 0x1
    /* F584 8014917C 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* F588 80149180 21082200 */  addu       $at, $at, $v0
    /* F58C 80149184 762C25A4 */  sh         $a1, %lo(missile + 0x1E)($at)
    /* F590 80149188 1080013C */  lui        $at, %hi(missile + 0x20)
    /* F594 8014918C 21082200 */  addu       $at, $at, $v0
    /* F598 80149190 782C23A4 */  sh         $v1, %lo(missile + 0x20)($at)
    /* F59C 80149194 1080013C */  lui        $at, %hi(missile + 0x22)
    /* F5A0 80149198 21082200 */  addu       $at, $at, $v0
    /* F5A4 8014919C 7A2C24A4 */  sh         $a0, %lo(missile + 0x22)($at)
    /* F5A8 801491A0 80101100 */  sll        $v0, $s1, 2
  .L801491A4:
    /* F5AC 801491A4 21105100 */  addu       $v0, $v0, $s1
    /* F5B0 801491A8 80100200 */  sll        $v0, $v0, 2
    /* F5B4 801491AC 23105100 */  subu       $v0, $v0, $s1
    /* F5B8 801491B0 80200200 */  sll        $a0, $v0, 2
    /* F5BC 801491B4 1080013C */  lui        $at, %hi(missile + 0x18)
    /* F5C0 801491B8 21082400 */  addu       $at, $at, $a0
    /* F5C4 801491BC 702C2294 */  lhu        $v0, %lo(missile + 0x18)($at)
    /* F5C8 801491C0 00000000 */  nop
    /* F5CC 801491C4 07004010 */  beqz       $v0, .L801491E4
    /* F5D0 801491C8 03000224 */   addiu     $v0, $zero, 0x3
    /* F5D4 801491CC 1080013C */  lui        $at, %hi(missile + 0x22)
    /* F5D8 801491D0 21082400 */  addu       $at, $at, $a0
    /* F5DC 801491D4 7A2C2384 */  lh         $v1, %lo(missile + 0x22)($at)
    /* F5E0 801491D8 00000000 */  nop
    /* F5E4 801491DC 05006214 */  bne        $v1, $v0, .L801491F4
    /* F5E8 801491E0 00000000 */   nop
  .L801491E4:
    /* F5EC 801491E4 01000224 */  addiu      $v0, $zero, 0x1
    /* F5F0 801491E8 1080013C */  lui        $at, %hi(missile + 0x38)
    /* F5F4 801491EC 21082400 */  addu       $at, $at, $a0
    /* F5F8 801491F0 902C22A0 */  sb         $v0, %lo(missile + 0x38)($at)
  .L801491F4:
    /* F5FC 801491F4 3400BF8F */  lw         $ra, 0x34($sp)
    /* F600 801491F8 3000B28F */  lw         $s2, 0x30($sp)
    /* F604 801491FC 2C00B18F */  lw         $s1, 0x2C($sp)
    /* F608 80149200 2800B08F */  lw         $s0, 0x28($sp)
    /* F60C 80149204 3800BD27 */  addiu      $sp, $sp, 0x38
    /* F610 80149208 0800E003 */  jr         $ra
    /* F614 8014920C 00000000 */   nop
endlabel MI_Flamec__Fi
