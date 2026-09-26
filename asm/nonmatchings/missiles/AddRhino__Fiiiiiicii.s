.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddRhino__Fiiiiiicii, 0x184

glabel AddRhino__Fiiiiiicii
    /* 6350 8013FF48 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 6354 8013FF4C 2000B2AF */  sw         $s2, 0x20($sp)
    /* 6358 8013FF50 4C00B28F */  lw         $s2, 0x4C($sp)
    /* 635C 8013FF54 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 6360 8013FF58 21888000 */  addu       $s1, $a0, $zero
    /* 6364 8013FF5C 2800BFAF */  sw         $ra, 0x28($sp)
    /* 6368 8013FF60 2400B3AF */  sw         $s3, 0x24($sp)
    /* 636C 8013FF64 1800B0AF */  sw         $s0, 0x18($sp)
    /* 6370 8013FF68 40101200 */  sll        $v0, $s2, 1
    /* 6374 8013FF6C 21105200 */  addu       $v0, $v0, $s2
    /* 6378 8013FF70 80100200 */  sll        $v0, $v0, 2
    /* 637C 8013FF74 21105200 */  addu       $v0, $v0, $s2
    /* 6380 8013FF78 C0100200 */  sll        $v0, $v0, 3
    /* 6384 8013FF7C 1080013C */  lui        $at, %hi(monster + 0x60)
    /* 6388 8013FF80 21082200 */  addu       $at, $at, $v0
    /* 638C 8013FF84 F453238C */  lw         $v1, %lo(monster + 0x60)($at)
    /* 6390 8013FF88 4000A88F */  lw         $t0, 0x40($sp)
    /* 6394 8013FF8C 12006490 */  lbu        $a0, 0x12($v1)
    /* 6398 8013FF90 4400B38F */  lw         $s3, 0x44($sp)
    /* 639C 8013FF94 C0FF8224 */  addiu      $v0, $a0, -0x40
    /* 63A0 8013FF98 0400422C */  sltiu      $v0, $v0, 0x4
    /* 63A4 8013FF9C 06004014 */  bnez       $v0, .L8013FFB8
    /* 63A8 8013FFA0 0E007024 */   addiu     $s0, $v1, 0xE
    /* 63AC 8013FFA4 A7FF8224 */  addiu      $v0, $a0, -0x59
    /* 63B0 8013FFA8 0400422C */  sltiu      $v0, $v0, 0x4
    /* 63B4 8013FFAC 02004014 */  bnez       $v0, .L8013FFB8
    /* 63B8 8013FFB0 08007024 */   addiu     $s0, $v1, 0x8
    /* 63BC 8013FFB4 06007024 */  addiu      $s0, $v1, 0x6
  .L8013FFB8:
    /* 63C0 8013FFB8 21202002 */  addu       $a0, $s1, $zero
    /* 63C4 8013FFBC 12000224 */  addiu      $v0, $zero, 0x12
    /* 63C8 8013FFC0 1000A8AF */  sw         $t0, 0x10($sp)
    /* 63CC 8013FFC4 62EA040C */  jal        GetMissileVel__Fiiiiii
    /* 63D0 8013FFC8 1400A2AF */   sw        $v0, 0x14($sp)
    /* 63D4 8013FFCC 80101100 */  sll        $v0, $s1, 2
    /* 63D8 8013FFD0 21105100 */  addu       $v0, $v0, $s1
    /* 63DC 8013FFD4 80100200 */  sll        $v0, $v0, 2
    /* 63E0 8013FFD8 23105100 */  subu       $v0, $v0, $s1
    /* 63E4 8013FFDC 80180200 */  sll        $v1, $v0, 2
    /* 63E8 8013FFE0 1080013C */  lui        $at, %hi(missile + 0x3F)
    /* 63EC 8013FFE4 21082300 */  addu       $at, $at, $v1
    /* 63F0 8013FFE8 972C33A0 */  sb         $s3, %lo(missile + 0x3F)($at)
    /* 63F4 8013FFEC 1080013C */  lui        $at, %hi(missile + 0x39)
    /* 63F8 8013FFF0 21082300 */  addu       $at, $at, $v1
    /* 63FC 8013FFF4 912C20A0 */  sb         $zero, %lo(missile + 0x39)($at)
    /* 6400 8013FFF8 01000292 */  lbu        $v0, 0x1($s0)
    /* 6404 8013FFFC 1080013C */  lui        $at, %hi(missile + 0x41)
    /* 6408 80140000 21082300 */  addu       $at, $at, $v1
    /* 640C 80140004 992C22A0 */  sb         $v0, %lo(missile + 0x41)($at)
    /* 6410 80140008 00000292 */  lbu        $v0, 0x0($s0)
    /* 6414 8014000C 01000524 */  addiu      $a1, $zero, 0x1
    /* 6418 80140010 1080013C */  lui        $at, %hi(missile + 0x46)
    /* 641C 80140014 21082300 */  addu       $at, $at, $v1
    /* 6420 80140018 9E2C25A0 */  sb         $a1, %lo(missile + 0x46)($at)
    /* 6424 8014001C 1080013C */  lui        $at, %hi(missile + 0x42)
    /* 6428 80140020 21082300 */  addu       $at, $at, $v1
    /* 642C 80140024 9A2C22A0 */  sb         $v0, %lo(missile + 0x42)($at)
    /* 6430 80140028 40101200 */  sll        $v0, $s2, 1
    /* 6434 8014002C 21105200 */  addu       $v0, $v0, $s2
    /* 6438 80140030 80100200 */  sll        $v0, $v0, 2
    /* 643C 80140034 21105200 */  addu       $v0, $v0, $s2
    /* 6440 80140038 C0100200 */  sll        $v0, $v0, 3
    /* 6444 8014003C 1080013C */  lui        $at, %hi(monster + 0x60)
    /* 6448 80140040 21082200 */  addu       $at, $at, $v0
    /* 644C 80140044 F453228C */  lw         $v0, %lo(monster + 0x60)($at)
    /* 6450 80140048 00000000 */  nop
    /* 6454 8014004C 12004290 */  lbu        $v0, 0x12($v0)
    /* 6458 80140050 00000000 */  nop
    /* 645C 80140054 A7FF4224 */  addiu      $v0, $v0, -0x59
    /* 6460 80140058 0400422C */  sltiu      $v0, $v0, 0x4
    /* 6464 8014005C 04004010 */  beqz       $v0, .L80140070
    /* 6468 80140060 07000224 */   addiu     $v0, $zero, 0x7
    /* 646C 80140064 1080013C */  lui        $at, %hi(missile + 0x47)
    /* 6470 80140068 21082300 */  addu       $at, $at, $v1
    /* 6474 8014006C 9F2C22A0 */  sb         $v0, %lo(missile + 0x47)($at)
  .L80140070:
    /* 6478 80140070 00010224 */  addiu      $v0, $zero, 0x100
    /* 647C 80140074 1080013C */  lui        $at, %hi(missile + 0x1E)
    /* 6480 80140078 21082300 */  addu       $at, $at, $v1
    /* 6484 8014007C 762C20A4 */  sh         $zero, %lo(missile + 0x1E)($at)
    /* 6488 80140080 1080013C */  lui        $at, %hi(missile + 0x20)
    /* 648C 80140084 21082300 */  addu       $at, $at, $v1
    /* 6490 80140088 782C20A4 */  sh         $zero, %lo(missile + 0x20)($at)
    /* 6494 8014008C 1080013C */  lui        $at, %hi(missile + 0x3B)
    /* 6498 80140090 21082300 */  addu       $at, $at, $v1
    /* 649C 80140094 932C25A0 */  sb         $a1, %lo(missile + 0x3B)($at)
    /* 64A0 80140098 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 64A4 8014009C 21082300 */  addu       $at, $at, $v1
    /* 64A8 801400A0 702C22A4 */  sh         $v0, %lo(missile + 0x18)($at)
    /* 64AC 801400A4 D1EA040C */  jal        PutMissile__Fi
    /* 64B0 801400A8 21202002 */   addu      $a0, $s1, $zero
    /* 64B4 801400AC 2800BF8F */  lw         $ra, 0x28($sp)
    /* 64B8 801400B0 2400B38F */  lw         $s3, 0x24($sp)
    /* 64BC 801400B4 2000B28F */  lw         $s2, 0x20($sp)
    /* 64C0 801400B8 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 64C4 801400BC 1800B08F */  lw         $s0, 0x18($sp)
    /* 64C8 801400C0 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 64CC 801400C4 0800E003 */  jr         $ra
    /* 64D0 801400C8 00000000 */   nop
endlabel AddRhino__Fiiiiiicii
