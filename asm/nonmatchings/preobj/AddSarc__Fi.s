.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddSarc__Fi, 0xC8

glabel AddSarc__Fi
    /* 1C918 80156510 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1C91C 80156514 40100400 */  sll        $v0, $a0, 1
    /* 1C920 80156518 21104400 */  addu       $v0, $v0, $a0
    /* 1C924 8015651C 80100200 */  sll        $v0, $v0, 2
    /* 1C928 80156520 23104400 */  subu       $v0, $v0, $a0
    /* 1C92C 80156524 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1C930 80156528 80800200 */  sll        $s0, $v0, 2
    /* 1C934 8015652C 27200400 */  nor        $a0, $zero, $a0
    /* 1C938 80156530 1400BFAF */  sw         $ra, 0x14($sp)
    /* 1C93C 80156534 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 1C940 80156538 21083000 */  addu       $at, $at, $s0
    /* 1C944 8015653C 6C8C2380 */  lb         $v1, %lo(object + 0x20)($at)
    /* 1C948 80156540 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 1C94C 80156544 21083000 */  addu       $at, $at, $s0
    /* 1C950 80156548 6B8C2580 */  lb         $a1, %lo(object + 0x1F)($at)
    /* 1C954 8015654C FFFF6324 */  addiu      $v1, $v1, -0x1
    /* 1C958 80156550 C0180300 */  sll        $v1, $v1, 3
    /* 1C95C 80156554 C0100500 */  sll        $v0, $a1, 3
    /* 1C960 80156558 23104500 */  subu       $v0, $v0, $a1
    /* 1C964 8015655C C0110200 */  sll        $v0, $v0, 7
    /* 1C968 80156560 21186200 */  addu       $v1, $v1, $v0
    /* 1C96C 80156564 0E80013C */  lui        $at, %hi(dung_map + 0x3)
    /* 1C970 80156568 21082300 */  addu       $at, $at, $v1
    /* 1C974 8015656C 2B7A24A0 */  sb         $a0, %lo(dung_map + 0x3)($at)
    /* 1C978 80156570 C9F6000C */  jal        ENG_random__Fl
    /* 1C97C 80156574 0A000424 */   addiu     $a0, $zero, 0xA
    /* 1C980 80156578 0E80013C */  lui        $at, %hi(object + 0xE)
    /* 1C984 8015657C 21083000 */  addu       $at, $at, $s0
    /* 1C988 80156580 5A8C22A4 */  sh         $v0, %lo(object + 0xE)($at)
    /* 1C98C 80156584 B7F6000C */  jal        GetRndSeed__Fv
    /* 1C990 80156588 00000000 */   nop
    /* 1C994 8015658C 0E80013C */  lui        $at, %hi(object + 0xE)
    /* 1C998 80156590 21083000 */  addu       $at, $at, $s0
    /* 1C99C 80156594 5A8C2384 */  lh         $v1, %lo(object + 0xE)($at)
    /* 1C9A0 80156598 0E80013C */  lui        $at, %hi(object + 0x4)
    /* 1C9A4 8015659C 21083000 */  addu       $at, $at, $s0
    /* 1C9A8 801565A0 508C22AC */  sw         $v0, %lo(object + 0x4)($at)
    /* 1C9AC 801565A4 08006328 */  slti       $v1, $v1, 0x8
    /* 1C9B0 801565A8 06006014 */  bnez       $v1, .L801565C4
    /* 1C9B4 801565AC 00000000 */   nop
    /* 1C9B8 801565B0 5787050C */  jal        PreSpawnSkeleton__Fv
    /* 1C9BC 801565B4 00000000 */   nop
    /* 1C9C0 801565B8 0E80013C */  lui        $at, %hi(object + 0x10)
    /* 1C9C4 801565BC 21083000 */  addu       $at, $at, $s0
    /* 1C9C8 801565C0 5C8C22A4 */  sh         $v0, %lo(object + 0x10)($at)
  .L801565C4:
    /* 1C9CC 801565C4 1400BF8F */  lw         $ra, 0x14($sp)
    /* 1C9D0 801565C8 1000B08F */  lw         $s0, 0x10($sp)
    /* 1C9D4 801565CC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1C9D8 801565D0 0800E003 */  jr         $ra
    /* 1C9DC 801565D4 00000000 */   nop
endlabel AddSarc__Fi
