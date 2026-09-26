.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FindClosest__Fiii, 0x18C

glabel FindClosest__Fiii
    /* 6B8 8013A2B0 80FFBD27 */  addiu      $sp, $sp, -0x80
    /* 6BC 8013A2B4 7000B4AF */  sw         $s4, 0x70($sp)
    /* 6C0 8013A2B8 21A08000 */  addu       $s4, $a0, $zero
    /* 6C4 8013A2BC 7400B5AF */  sw         $s5, 0x74($sp)
    /* 6C8 8013A2C0 21A8A000 */  addu       $s5, $a1, $zero
    /* 6CC 8013A2C4 7800B6AF */  sw         $s6, 0x78($sp)
    /* 6D0 8013A2C8 21B0C000 */  addu       $s6, $a2, $zero
    /* 6D4 8013A2CC 1000A727 */  addiu      $a3, $sp, 0x10
    /* 6D8 8013A2D0 1280063C */  lui        $a2, %hi(D_80119DE4)
    /* 6DC 8013A2D4 E49DC624 */  addiu      $a2, $a2, %lo(D_80119DE4)
    /* 6E0 8013A2D8 4000C824 */  addiu      $t0, $a2, 0x40
    /* 6E4 8013A2DC 7C00BFAF */  sw         $ra, 0x7C($sp)
    /* 6E8 8013A2E0 6C00B3AF */  sw         $s3, 0x6C($sp)
    /* 6EC 8013A2E4 6800B2AF */  sw         $s2, 0x68($sp)
    /* 6F0 8013A2E8 6400B1AF */  sw         $s1, 0x64($sp)
    /* 6F4 8013A2EC 6000B0AF */  sw         $s0, 0x60($sp)
  .L8013A2F0:
    /* 6F8 8013A2F0 0000C28C */  lw         $v0, 0x0($a2)
    /* 6FC 8013A2F4 0400C38C */  lw         $v1, 0x4($a2)
    /* 700 8013A2F8 0800C48C */  lw         $a0, 0x8($a2)
    /* 704 8013A2FC 0C00C58C */  lw         $a1, 0xC($a2)
    /* 708 8013A300 0000E2AC */  sw         $v0, 0x0($a3)
    /* 70C 8013A304 0400E3AC */  sw         $v1, 0x4($a3)
    /* 710 8013A308 0800E4AC */  sw         $a0, 0x8($a3)
    /* 714 8013A30C 0C00E5AC */  sw         $a1, 0xC($a3)
    /* 718 8013A310 1000C624 */  addiu      $a2, $a2, 0x10
    /* 71C 8013A314 F6FFC814 */  bne        $a2, $t0, .L8013A2F0
    /* 720 8013A318 1000E724 */   addiu     $a3, $a3, 0x10
    /* 724 8013A31C 0000C28C */  lw         $v0, 0x0($a2)
    /* 728 8013A320 0400C38C */  lw         $v1, 0x4($a2)
    /* 72C 8013A324 0800C48C */  lw         $a0, 0x8($a2)
    /* 730 8013A328 0000E2AC */  sw         $v0, 0x0($a3)
    /* 734 8013A32C 0400E3AC */  sw         $v1, 0x4($a3)
    /* 738 8013A330 0800E4AC */  sw         $a0, 0x8($a3)
    /* 73C 8013A334 1400C22A */  slti       $v0, $s6, 0x14
    /* 740 8013A338 02004014 */  bnez       $v0, .L8013A344
    /* 744 8013A33C 01001324 */   addiu     $s3, $zero, 0x1
    /* 748 8013A340 13001624 */  addiu      $s6, $zero, 0x13
  .L8013A344:
    /* 74C 8013A344 2A107602 */  slt        $v0, $s3, $s6
    /* 750 8013A348 31004010 */  beqz       $v0, .L8013A410
    /* 754 8013A34C FFFF0224 */   addiu     $v0, $zero, -0x1
    /* 758 8013A350 80101300 */  sll        $v0, $s3, 2
  .L8013A354:
    /* 75C 8013A354 2110A203 */  addu       $v0, $sp, $v0
    /* 760 8013A358 1000428C */  lw         $v0, 0x10($v0)
    /* 764 8013A35C 0D80013C */  lui        $at, %hi(CrawlTable)
    /* 768 8013A360 21082200 */  addu       $at, $at, $v0
    /* 76C 8013A364 54553290 */  lbu        $s2, %lo(CrawlTable)($at)
    /* 770 8013A368 00000000 */  nop
    /* 774 8013A36C 2300401A */  blez       $s2, .L8013A3FC
    /* 778 8013A370 01005124 */   addiu     $s1, $v0, 0x1
  .L8013A374:
    /* 77C 8013A374 0D80013C */  lui        $at, %hi(CrawlTable)
    /* 780 8013A378 21083100 */  addu       $at, $at, $s1
    /* 784 8013A37C 54552280 */  lb         $v0, %lo(CrawlTable)($at)
    /* 788 8013A380 0D80013C */  lui        $at, %hi(CrawlTable + 0x1)
    /* 78C 8013A384 21083100 */  addu       $at, $at, $s1
    /* 790 8013A388 55552380 */  lb         $v1, %lo(CrawlTable + 0x1)($at)
    /* 794 8013A38C 21308202 */  addu       $a2, $s4, $v0
    /* 798 8013A390 FFFFC224 */  addiu      $v0, $a2, -0x1
    /* 79C 8013A394 6F00422C */  sltiu      $v0, $v0, 0x6F
    /* 7A0 8013A398 15004010 */  beqz       $v0, .L8013A3F0
    /* 7A4 8013A39C 2138A302 */   addu      $a3, $s5, $v1
    /* 7A8 8013A3A0 FFFFE224 */  addiu      $v0, $a3, -0x1
    /* 7AC 8013A3A4 6F00422C */  sltiu      $v0, $v0, 0x6F
    /* 7B0 8013A3A8 11004010 */  beqz       $v0, .L8013A3F0
    /* 7B4 8013A3AC C0180700 */   sll       $v1, $a3, 3
    /* 7B8 8013A3B0 C0100600 */  sll        $v0, $a2, 3
    /* 7BC 8013A3B4 23104600 */  subu       $v0, $v0, $a2
    /* 7C0 8013A3B8 C0110200 */  sll        $v0, $v0, 7
    /* 7C4 8013A3BC 21186200 */  addu       $v1, $v1, $v0
    /* 7C8 8013A3C0 0E80013C */  lui        $at, %hi(dung_map)
    /* 7CC 8013A3C4 21082300 */  addu       $at, $at, $v1
    /* 7D0 8013A3C8 287A3084 */  lh         $s0, %lo(dung_map)($at)
    /* 7D4 8013A3CC 00000000 */  nop
    /* 7D8 8013A3D0 0700001A */  blez       $s0, .L8013A3F0
    /* 7DC 8013A3D4 21208002 */   addu      $a0, $s4, $zero
    /* 7E0 8013A3D8 7FE8040C */  jal        CheckBlock__Fiiii
    /* 7E4 8013A3DC 2128A002 */   addu      $a1, $s5, $zero
    /* 7E8 8013A3E0 04004014 */  bnez       $v0, .L8013A3F4
    /* 7EC 8013A3E4 FFFF5226 */   addiu     $s2, $s2, -0x1
    /* 7F0 8013A3E8 04E90408 */  j          .L8013A410
    /* 7F4 8013A3EC FFFF0226 */   addiu     $v0, $s0, -0x1
  .L8013A3F0:
    /* 7F8 8013A3F0 FFFF5226 */  addiu      $s2, $s2, -0x1
  .L8013A3F4:
    /* 7FC 8013A3F4 DFFF401E */  bgtz       $s2, .L8013A374
    /* 800 8013A3F8 02003126 */   addiu     $s1, $s1, 0x2
  .L8013A3FC:
    /* 804 8013A3FC 01007326 */  addiu      $s3, $s3, 0x1
    /* 808 8013A400 2A107602 */  slt        $v0, $s3, $s6
    /* 80C 8013A404 D3FF4014 */  bnez       $v0, .L8013A354
    /* 810 8013A408 80101300 */   sll       $v0, $s3, 2
    /* 814 8013A40C FFFF0224 */  addiu      $v0, $zero, -0x1
  .L8013A410:
    /* 818 8013A410 7C00BF8F */  lw         $ra, 0x7C($sp)
    /* 81C 8013A414 7800B68F */  lw         $s6, 0x78($sp)
    /* 820 8013A418 7400B58F */  lw         $s5, 0x74($sp)
    /* 824 8013A41C 7000B48F */  lw         $s4, 0x70($sp)
    /* 828 8013A420 6C00B38F */  lw         $s3, 0x6C($sp)
    /* 82C 8013A424 6800B28F */  lw         $s2, 0x68($sp)
    /* 830 8013A428 6400B18F */  lw         $s1, 0x64($sp)
    /* 834 8013A42C 6000B08F */  lw         $s0, 0x60($sp)
    /* 838 8013A430 8000BD27 */  addiu      $sp, $sp, 0x80
    /* 83C 8013A434 0800E003 */  jr         $ra
    /* 840 8013A438 00000000 */   nop
endlabel FindClosest__Fiii
