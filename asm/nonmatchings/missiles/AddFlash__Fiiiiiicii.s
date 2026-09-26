.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddFlash__Fiiiiiicii, 0x22C

glabel AddFlash__Fiiiiiicii
    /* 5828 8013F420 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 582C 8013F424 4000A283 */  lb         $v0, 0x40($sp)
    /* 5830 8013F428 2000B4AF */  sw         $s4, 0x20($sp)
    /* 5834 8013F42C 4400B48F */  lw         $s4, 0x44($sp)
    /* 5838 8013F430 1400B1AF */  sw         $s1, 0x14($sp)
    /* 583C 8013F434 21888000 */  addu       $s1, $a0, $zero
    /* 5840 8013F438 2400BFAF */  sw         $ra, 0x24($sp)
    /* 5844 8013F43C 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 5848 8013F440 1800B2AF */  sw         $s2, 0x18($sp)
    /* 584C 8013F444 5E004014 */  bnez       $v0, .L8013F5C0
    /* 5850 8013F448 1000B0AF */   sw        $s0, 0x10($sp)
    /* 5854 8013F44C FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 5858 8013F450 53008212 */  beq        $s4, $v0, .L8013F5A0
    /* 585C 8013F454 80101100 */   sll       $v0, $s1, 2
    /* 5860 8013F458 21105100 */  addu       $v0, $v0, $s1
    /* 5864 8013F45C 80100200 */  sll        $v0, $v0, 2
    /* 5868 8013F460 23105100 */  subu       $v0, $v0, $s1
    /* 586C 8013F464 80200200 */  sll        $a0, $v0, 2
    /* 5870 8013F468 40101400 */  sll        $v0, $s4, 1
    /* 5874 8013F46C 21105400 */  addu       $v0, $v0, $s4
    /* 5878 8013F470 80100200 */  sll        $v0, $v0, 2
    /* 587C 8013F474 21105400 */  addu       $v0, $v0, $s4
    /* 5880 8013F478 00110200 */  sll        $v0, $v0, 4
    /* 5884 8013F47C 23105400 */  subu       $v0, $v0, $s4
    /* 5888 8013F480 80100200 */  sll        $v0, $v0, 2
    /* 588C 8013F484 21105400 */  addu       $v0, $v0, $s4
    /* 5890 8013F488 C0180200 */  sll        $v1, $v0, 3
    /* 5894 8013F48C 1080013C */  lui        $at, %hi(missile + 0x10)
    /* 5898 8013F490 21082400 */  addu       $at, $at, $a0
    /* 589C 8013F494 682C20AC */  sw         $zero, %lo(missile + 0x10)($at)
    /* 58A0 8013F498 0E80013C */  lui        $at, %hi(plr + 0x13C)
    /* 58A4 8013F49C 21082300 */  addu       $at, $at, $v1
    /* 58A8 8013F4A0 74A62280 */  lb         $v0, %lo(plr + 0x13C)($at)
    /* 58AC 8013F4A4 00000000 */  nop
    /* 58B0 8013F4A8 15004004 */  bltz       $v0, .L8013F500
    /* 58B4 8013F4AC 21800000 */   addu      $s0, $zero, $zero
    /* 58B8 8013F4B0 21908000 */  addu       $s2, $a0, $zero
    /* 58BC 8013F4B4 21986000 */  addu       $s3, $v1, $zero
  .L8013F4B8:
    /* 58C0 8013F4B8 C9F6000C */  jal        ENG_random__Fl
    /* 58C4 8013F4BC 14000424 */   addiu     $a0, $zero, 0x14
    /* 58C8 8013F4C0 1080013C */  lui        $at, %hi(missile + 0x10)
    /* 58CC 8013F4C4 21083200 */  addu       $at, $at, $s2
    /* 58D0 8013F4C8 682C238C */  lw         $v1, %lo(missile + 0x10)($at)
    /* 58D4 8013F4CC 00000000 */  nop
    /* 58D8 8013F4D0 01006324 */  addiu      $v1, $v1, 0x1
    /* 58DC 8013F4D4 21186200 */  addu       $v1, $v1, $v0
    /* 58E0 8013F4D8 1080013C */  lui        $at, %hi(missile + 0x10)
    /* 58E4 8013F4DC 21083200 */  addu       $at, $at, $s2
    /* 58E8 8013F4E0 682C23AC */  sw         $v1, %lo(missile + 0x10)($at)
    /* 58EC 8013F4E4 0E80013C */  lui        $at, %hi(plr + 0x13C)
    /* 58F0 8013F4E8 21083300 */  addu       $at, $at, $s3
    /* 58F4 8013F4EC 74A62280 */  lb         $v0, %lo(plr + 0x13C)($at)
    /* 58F8 8013F4F0 01001026 */  addiu      $s0, $s0, 0x1
    /* 58FC 8013F4F4 2A105000 */  slt        $v0, $v0, $s0
    /* 5900 8013F4F8 EFFF4010 */  beqz       $v0, .L8013F4B8
    /* 5904 8013F4FC 00000000 */   nop
  .L8013F500:
    /* 5908 8013F500 80101100 */  sll        $v0, $s1, 2
    /* 590C 8013F504 21105100 */  addu       $v0, $v0, $s1
    /* 5910 8013F508 80100200 */  sll        $v0, $v0, 2
    /* 5914 8013F50C 23105100 */  subu       $v0, $v0, $s1
    /* 5918 8013F510 80100200 */  sll        $v0, $v0, 2
    /* 591C 8013F514 1080013C */  lui        $at, %hi(missile + 0x40)
    /* 5920 8013F518 21082200 */  addu       $at, $at, $v0
    /* 5924 8013F51C 982C3080 */  lb         $s0, %lo(missile + 0x40)($at)
    /* 5928 8013F520 00000000 */  nop
    /* 592C 8013F524 0C00001A */  blez       $s0, .L8013F558
    /* 5930 8013F528 21204000 */   addu      $a0, $v0, $zero
  .L8013F52C:
    /* 5934 8013F52C 1080013C */  lui        $at, %hi(missile + 0x10)
    /* 5938 8013F530 21082400 */  addu       $at, $at, $a0
    /* 593C 8013F534 682C238C */  lw         $v1, %lo(missile + 0x10)($at)
    /* 5940 8013F538 FFFF1026 */  addiu      $s0, $s0, -0x1
    /* 5944 8013F53C C3100300 */  sra        $v0, $v1, 3
    /* 5948 8013F540 21186200 */  addu       $v1, $v1, $v0
    /* 594C 8013F544 1080013C */  lui        $at, %hi(missile + 0x10)
    /* 5950 8013F548 21082400 */  addu       $at, $at, $a0
    /* 5954 8013F54C 682C23AC */  sw         $v1, %lo(missile + 0x10)($at)
    /* 5958 8013F550 F6FF001E */  bgtz       $s0, .L8013F52C
    /* 595C 8013F554 00000000 */   nop
  .L8013F558:
    /* 5960 8013F558 80101100 */  sll        $v0, $s1, 2
    /* 5964 8013F55C 21105100 */  addu       $v0, $v0, $s1
    /* 5968 8013F560 80100200 */  sll        $v0, $v0, 2
    /* 596C 8013F564 23105100 */  subu       $v0, $v0, $s1
    /* 5970 8013F568 80100200 */  sll        $v0, $v0, 2
    /* 5974 8013F56C 1080013C */  lui        $at, %hi(missile + 0x10)
    /* 5978 8013F570 21082200 */  addu       $at, $at, $v0
    /* 597C 8013F574 682C238C */  lw         $v1, %lo(missile + 0x10)($at)
    /* 5980 8013F578 21208002 */  addu       $a0, $s4, $zero
    /* 5984 8013F57C 43280300 */  sra        $a1, $v1, 1
    /* 5988 8013F580 21186500 */  addu       $v1, $v1, $a1
    /* 598C 8013F584 1080013C */  lui        $at, %hi(missile + 0x10)
    /* 5990 8013F588 21082200 */  addu       $at, $at, $v0
    /* 5994 8013F58C 682C23AC */  sw         $v1, %lo(missile + 0x10)($at)
    /* 5998 8013F590 C2DC010C */  jal        UseMana__Fii
    /* 599C 8013F594 04000524 */   addiu     $a1, $zero, 0x4
    /* 59A0 8013F598 82FD0408 */  j          .L8013F608
    /* 59A4 8013F59C 80101100 */   sll       $v0, $s1, 2
  .L8013F5A0:
    /* 59A8 8013F5A0 21105100 */  addu       $v0, $v0, $s1
    /* 59AC 8013F5A4 80100200 */  sll        $v0, $v0, 2
    /* 59B0 8013F5A8 23105100 */  subu       $v0, $v0, $s1
    /* 59B4 8013F5AC 1280033C */  lui        $v1, %hi(currlevel)
    /* 59B8 8013F5B0 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 59BC 8013F5B4 80100200 */  sll        $v0, $v0, 2
    /* 59C0 8013F5B8 7EFD0408 */  j          .L8013F5F8
    /* 59C4 8013F5BC 42180300 */   srl       $v1, $v1, 1
  .L8013F5C0:
    /* 59C8 8013F5C0 80101100 */  sll        $v0, $s1, 2
    /* 59CC 8013F5C4 21105100 */  addu       $v0, $v0, $s1
    /* 59D0 8013F5C8 80100200 */  sll        $v0, $v0, 2
    /* 59D4 8013F5CC 23105100 */  subu       $v0, $v0, $s1
    /* 59D8 8013F5D0 40181400 */  sll        $v1, $s4, 1
    /* 59DC 8013F5D4 21187400 */  addu       $v1, $v1, $s4
    /* 59E0 8013F5D8 80180300 */  sll        $v1, $v1, 2
    /* 59E4 8013F5DC 21187400 */  addu       $v1, $v1, $s4
    /* 59E8 8013F5E0 C0180300 */  sll        $v1, $v1, 3
    /* 59EC 8013F5E4 1080013C */  lui        $at, %hi(monster + 0x47)
    /* 59F0 8013F5E8 21082300 */  addu       $at, $at, $v1
    /* 59F4 8013F5EC DB532380 */  lb         $v1, %lo(monster + 0x47)($at)
    /* 59F8 8013F5F0 80100200 */  sll        $v0, $v0, 2
    /* 59FC 8013F5F4 40180300 */  sll        $v1, $v1, 1
  .L8013F5F8:
    /* 5A00 8013F5F8 1080013C */  lui        $at, %hi(missile + 0x10)
    /* 5A04 8013F5FC 21082200 */  addu       $at, $at, $v0
    /* 5A08 8013F600 682C23AC */  sw         $v1, %lo(missile + 0x10)($at)
    /* 5A0C 8013F604 80101100 */  sll        $v0, $s1, 2
  .L8013F608:
    /* 5A10 8013F608 21105100 */  addu       $v0, $v0, $s1
    /* 5A14 8013F60C 80100200 */  sll        $v0, $v0, 2
    /* 5A18 8013F610 23105100 */  subu       $v0, $v0, $s1
    /* 5A1C 8013F614 80100200 */  sll        $v0, $v0, 2
    /* 5A20 8013F618 13000324 */  addiu      $v1, $zero, 0x13
    /* 5A24 8013F61C 1080013C */  lui        $at, %hi(missile + 0x18)
    /* 5A28 8013F620 21082200 */  addu       $at, $at, $v0
    /* 5A2C 8013F624 702C23A4 */  sh         $v1, %lo(missile + 0x18)($at)
    /* 5A30 8013F628 2400BF8F */  lw         $ra, 0x24($sp)
    /* 5A34 8013F62C 2000B48F */  lw         $s4, 0x20($sp)
    /* 5A38 8013F630 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 5A3C 8013F634 1800B28F */  lw         $s2, 0x18($sp)
    /* 5A40 8013F638 1400B18F */  lw         $s1, 0x14($sp)
    /* 5A44 8013F63C 1000B08F */  lw         $s0, 0x10($sp)
    /* 5A48 8013F640 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 5A4C 8013F644 0800E003 */  jr         $ra
    /* 5A50 8013F648 00000000 */   nop
endlabel AddFlash__Fiiiiiicii
