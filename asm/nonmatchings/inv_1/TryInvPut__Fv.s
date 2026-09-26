.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TryInvPut__Fv, 0x14C

glabel TryInvPut__Fv
    /* 25428 8015F020 1280023C */  lui        $v0, %hi(numitems)
    /* 2542C 8015F024 88B8428C */  lw         $v0, %lo(numitems)($v0)
    /* 25430 8015F028 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 25434 8015F02C 1800BFAF */  sw         $ra, 0x18($sp)
    /* 25438 8015F030 1400B1AF */  sw         $s1, 0x14($sp)
    /* 2543C 8015F034 7A004228 */  slti       $v0, $v0, 0x7A
    /* 25440 8015F038 05004014 */  bnez       $v0, .L8015F050
    /* 25444 8015F03C 1000B0AF */   sw        $s0, 0x10($sp)
    /* 25448 8015F040 C6F5000C */  jal        PlaySFX__Fi
    /* 2544C 8015F044 D3030424 */   addiu     $a0, $zero, 0x3D3
    /* 25450 8015F048 557C0508 */  j          .L8015F154
    /* 25454 8015F04C 21100000 */   addu      $v0, $zero, $zero
  .L8015F050:
    /* 25458 8015F050 1280023C */  lui        $v0, %hi(myplr)
    /* 2545C 8015F054 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 25460 8015F058 00000000 */  nop
    /* 25464 8015F05C 40180200 */  sll        $v1, $v0, 1
    /* 25468 8015F060 21186200 */  addu       $v1, $v1, $v0
    /* 2546C 8015F064 80180300 */  sll        $v1, $v1, 2
    /* 25470 8015F068 21186200 */  addu       $v1, $v1, $v0
    /* 25474 8015F06C 00190300 */  sll        $v1, $v1, 4
    /* 25478 8015F070 23186200 */  subu       $v1, $v1, $v0
    /* 2547C 8015F074 80180300 */  sll        $v1, $v1, 2
    /* 25480 8015F078 21186200 */  addu       $v1, $v1, $v0
    /* 25484 8015F07C C0180300 */  sll        $v1, $v1, 3
    /* 25488 8015F080 0E80013C */  lui        $at, %hi(plr + 0x30)
    /* 2548C 8015F084 21082300 */  addu       $at, $at, $v1
    /* 25490 8015F088 68A52484 */  lh         $a0, %lo(plr + 0x30)($at)
    /* 25494 8015F08C 0E80013C */  lui        $at, %hi(plr + 0x32)
    /* 25498 8015F090 21082300 */  addu       $at, $at, $v1
    /* 2549C 8015F094 6AA52584 */  lh         $a1, %lo(plr + 0x32)($at)
    /* 254A0 8015F098 B001020C */  jal        CanPut__Fii
    /* 254A4 8015F09C 00000000 */   nop
    /* 254A8 8015F0A0 FF004230 */  andi       $v0, $v0, 0xFF
    /* 254AC 8015F0A4 03004010 */  beqz       $v0, .L8015F0B4
    /* 254B0 8015F0A8 01001124 */   addiu     $s1, $zero, 0x1
  .L8015F0AC:
    /* 254B4 8015F0AC 557C0508 */  j          .L8015F154
    /* 254B8 8015F0B0 01000224 */   addiu     $v0, $zero, 0x1
  .L8015F0B4:
    /* 254BC 8015F0B4 21800000 */  addu       $s0, $zero, $zero
    /* 254C0 8015F0B8 0800022A */  slti       $v0, $s0, 0x8
  .L8015F0BC:
    /* 254C4 8015F0BC 25004010 */  beqz       $v0, .L8015F154
    /* 254C8 8015F0C0 21100000 */   addu      $v0, $zero, $zero
    /* 254CC 8015F0C4 1280013C */  lui        $at, %hi(offset_x)
    /* 254D0 8015F0C8 21083000 */  addu       $at, $at, $s0
    /* 254D4 8015F0CC A8C22280 */  lb         $v0, %lo(offset_x)($at)
    /* 254D8 8015F0D0 00000000 */  nop
    /* 254DC 8015F0D4 18005100 */  mult       $v0, $s1
    /* 254E0 8015F0D8 1280043C */  lui        $a0, %hi(myplr)
    /* 254E4 8015F0DC 08BA848C */  lw         $a0, %lo(myplr)($a0)
    /* 254E8 8015F0E0 12300000 */  mflo       $a2
    /* 254EC 8015F0E4 1280013C */  lui        $at, %hi(offset_y)
    /* 254F0 8015F0E8 21083000 */  addu       $at, $at, $s0
    /* 254F4 8015F0EC B0C22380 */  lb         $v1, %lo(offset_y)($at)
    /* 254F8 8015F0F0 40100400 */  sll        $v0, $a0, 1
    /* 254FC 8015F0F4 18007100 */  mult       $v1, $s1
    /* 25500 8015F0F8 21104400 */  addu       $v0, $v0, $a0
    /* 25504 8015F0FC 80100200 */  sll        $v0, $v0, 2
    /* 25508 8015F100 21104400 */  addu       $v0, $v0, $a0
    /* 2550C 8015F104 00110200 */  sll        $v0, $v0, 4
    /* 25510 8015F108 23104400 */  subu       $v0, $v0, $a0
    /* 25514 8015F10C 80100200 */  sll        $v0, $v0, 2
    /* 25518 8015F110 21104400 */  addu       $v0, $v0, $a0
    /* 2551C 8015F114 C0100200 */  sll        $v0, $v0, 3
    /* 25520 8015F118 0E80013C */  lui        $at, %hi(plr + 0x30)
    /* 25524 8015F11C 21082200 */  addu       $at, $at, $v0
    /* 25528 8015F120 68A52484 */  lh         $a0, %lo(plr + 0x30)($at)
    /* 2552C 8015F124 0E80013C */  lui        $at, %hi(plr + 0x32)
    /* 25530 8015F128 21082200 */  addu       $at, $at, $v0
    /* 25534 8015F12C 6AA52584 */  lh         $a1, %lo(plr + 0x32)($at)
    /* 25538 8015F130 21208600 */  addu       $a0, $a0, $a2
    /* 2553C 8015F134 12180000 */  mflo       $v1
    /* 25540 8015F138 B001020C */  jal        CanPut__Fii
    /* 25544 8015F13C 2128A300 */   addu      $a1, $a1, $v1
    /* 25548 8015F140 FF004230 */  andi       $v0, $v0, 0xFF
    /* 2554C 8015F144 D9FF4014 */  bnez       $v0, .L8015F0AC
    /* 25550 8015F148 01001026 */   addiu     $s0, $s0, 0x1
    /* 25554 8015F14C 2F7C0508 */  j          .L8015F0BC
    /* 25558 8015F150 0800022A */   slti      $v0, $s0, 0x8
  .L8015F154:
    /* 2555C 8015F154 1800BF8F */  lw         $ra, 0x18($sp)
    /* 25560 8015F158 1400B18F */  lw         $s1, 0x14($sp)
    /* 25564 8015F15C 1000B08F */  lw         $s0, 0x10($sp)
    /* 25568 8015F160 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 2556C 8015F164 0800E003 */  jr         $ra
    /* 25570 8015F168 00000000 */   nop
endlabel TryInvPut__Fv
