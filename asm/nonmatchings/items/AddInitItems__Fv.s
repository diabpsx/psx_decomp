.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddInitItems__Fv, 0x208

glabel AddInitItems__Fv
    /* 2E2F0 8003E2F0 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 2E2F4 8003E2F4 03000424 */  addiu      $a0, $zero, 0x3
    /* 2E2F8 8003E2F8 2C00BFAF */  sw         $ra, 0x2C($sp)
    /* 2E2FC 8003E2FC 2800B6AF */  sw         $s6, 0x28($sp)
    /* 2E300 8003E300 2400B5AF */  sw         $s5, 0x24($sp)
    /* 2E304 8003E304 2000B4AF */  sw         $s4, 0x20($sp)
    /* 2E308 8003E308 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 2E30C 8003E30C 1800B2AF */  sw         $s2, 0x18($sp)
    /* 2E310 8003E310 1400B1AF */  sw         $s1, 0x14($sp)
    /* 2E314 8003E314 C9F6000C */  jal        ENG_random__Fl
    /* 2E318 8003E318 1000B0AF */   sw        $s0, 0x10($sp)
    /* 2E31C 8003E31C 03005624 */  addiu      $s6, $v0, 0x3
    /* 2E320 8003E320 21A00000 */  addu       $s4, $zero, $zero
    /* 2E324 8003E324 0D80153C */  lui        $s5, %hi(itemavail)
    /* 2E328 8003E328 D453B526 */  addiu      $s5, $s5, %lo(itemavail)
  .L8003E32C:
    /* 2E32C 8003E32C 2A109602 */  slt        $v0, $s4, $s6
    /* 2E330 8003E330 66004010 */  beqz       $v0, .L8003E4CC
    /* 2E334 8003E334 7E00A326 */   addiu     $v1, $s5, 0x7E
    /* 2E338 8003E338 0811828F */  lw         $v0, %gp_rel(numitems)($gp)
    /* 2E33C 8003E33C 0000B382 */  lb         $s3, 0x0($s5)
    /* 2E340 8003E340 23186200 */  subu       $v1, $v1, $v0
    /* 2E344 8003E344 00006390 */  lbu        $v1, 0x0($v1)
    /* 2E348 8003E348 40000424 */  addiu      $a0, $zero, 0x40
    /* 2E34C 8003E34C 0000A3A2 */  sb         $v1, 0x0($s5)
    /* 2E350 8003E350 0D80013C */  lui        $at, %hi(itemactive)
    /* 2E354 8003E354 21082200 */  addu       $at, $at, $v0
    /* 2E358 8003E358 545333A0 */  sb         $s3, %lo(itemactive)($at)
  .L8003E35C:
    /* 2E35C 8003E35C C9F6000C */  jal        ENG_random__Fl
    /* 2E360 8003E360 00000000 */   nop
    /* 2E364 8003E364 10005224 */  addiu      $s2, $v0, 0x10
    /* 2E368 8003E368 C9F6000C */  jal        ENG_random__Fl
    /* 2E36C 8003E36C 40000424 */   addiu     $a0, $zero, 0x40
    /* 2E370 8003E370 10005124 */  addiu      $s1, $v0, 0x10
    /* 2E374 8003E374 21204002 */  addu       $a0, $s2, $zero
    /* 2E378 8003E378 95F8000C */  jal        ItemPlace__Fii
    /* 2E37C 8003E37C 21282002 */   addu      $a1, $s1, $zero
    /* 2E380 8003E380 FF004230 */  andi       $v0, $v0, 0xFF
    /* 2E384 8003E384 03004014 */  bnez       $v0, .L8003E394
    /* 2E388 8003E388 C0801300 */   sll       $s0, $s3, 3
    /* 2E38C 8003E38C D7F80008 */  j          .L8003E35C
    /* 2E390 8003E390 40000424 */   addiu     $a0, $zero, 0x40
  .L8003E394:
    /* 2E394 8003E394 23801302 */  subu       $s0, $s0, $s3
    /* 2E398 8003E398 80801000 */  sll        $s0, $s0, 2
    /* 2E39C 8003E39C 23801302 */  subu       $s0, $s0, $s3
    /* 2E3A0 8003E3A0 80801000 */  sll        $s0, $s0, 2
    /* 2E3A4 8003E3A4 C0181100 */  sll        $v1, $s1, 3
    /* 2E3A8 8003E3A8 C0101200 */  sll        $v0, $s2, 3
    /* 2E3AC 8003E3AC 23105200 */  subu       $v0, $v0, $s2
    /* 2E3B0 8003E3B0 C0110200 */  sll        $v0, $v0, 7
    /* 2E3B4 8003E3B4 21186200 */  addu       $v1, $v1, $v0
    /* 2E3B8 8003E3B8 01006226 */  addiu      $v0, $s3, 0x1
    /* 2E3BC 8003E3BC 0D80013C */  lui        $at, %hi(item + 0x52)
    /* 2E3C0 8003E3C0 21083000 */  addu       $at, $at, $s0
    /* 2E3C4 8003E3C4 A61D32A0 */  sb         $s2, %lo(item + 0x52)($at)
    /* 2E3C8 8003E3C8 0D80013C */  lui        $at, %hi(item + 0x53)
    /* 2E3CC 8003E3CC 21083000 */  addu       $at, $at, $s0
    /* 2E3D0 8003E3D0 A71D31A0 */  sb         $s1, %lo(item + 0x53)($at)
    /* 2E3D4 8003E3D4 0E80013C */  lui        $at, %hi(dung_map + 0x4)
    /* 2E3D8 8003E3D8 21082300 */  addu       $at, $at, $v1
    /* 2E3DC 8003E3DC 2C7A22A0 */  sb         $v0, %lo(dung_map + 0x4)($at)
    /* 2E3E0 8003E3E0 B7F6000C */  jal        GetRndSeed__Fv
    /* 2E3E4 8003E3E4 00000000 */   nop
    /* 2E3E8 8003E3E8 21204000 */  addu       $a0, $v0, $zero
    /* 2E3EC 8003E3EC 0D80013C */  lui        $at, %hi(item + 0x10)
    /* 2E3F0 8003E3F0 21083000 */  addu       $at, $at, $s0
    /* 2E3F4 8003E3F4 641D24AC */  sw         $a0, %lo(item + 0x10)($at)
    /* 2E3F8 8003E3F8 B3F6000C */  jal        SetRndSeed__Fl
    /* 2E3FC 8003E3FC 00000000 */   nop
    /* 2E400 8003E400 C9F6000C */  jal        ENG_random__Fl
    /* 2E404 8003E404 02000424 */   addiu     $a0, $zero, 0x2
    /* 2E408 8003E408 05004010 */  beqz       $v0, .L8003E420
    /* 2E40C 8003E40C 21206002 */   addu      $a0, $s3, $zero
    /* 2E410 8003E410 1280063C */  lui        $a2, %hi(currlevel)
    /* 2E414 8003E414 0CC1C690 */  lbu        $a2, %lo(currlevel)($a2)
    /* 2E418 8003E418 0BF90008 */  j          .L8003E42C
    /* 2E41C 8003E41C 18000524 */   addiu     $a1, $zero, 0x18
  .L8003E420:
    /* 2E420 8003E420 1280063C */  lui        $a2, %hi(currlevel)
    /* 2E424 8003E424 0CC1C690 */  lbu        $a2, %lo(currlevel)($a2)
    /* 2E428 8003E428 19000524 */  addiu      $a1, $zero, 0x19
  .L8003E42C:
    /* 2E42C 8003E42C A704010C */  jal        GetItemAttrs__Fiii
    /* 2E430 8003E430 C0801300 */   sll       $s0, $s3, 3
    /* 2E434 8003E434 23801302 */  subu       $s0, $s0, $s3
    /* 2E438 8003E438 80801000 */  sll        $s0, $s0, 2
    /* 2E43C 8003E43C 23801302 */  subu       $s0, $s0, $s3
    /* 2E440 8003E440 80801000 */  sll        $s0, $s0, 2
    /* 2E444 8003E444 1280023C */  lui        $v0, %hi(currlevel)
    /* 2E448 8003E448 0CC14290 */  lbu        $v0, %lo(currlevel)($v0)
    /* 2E44C 8003E44C 1280033C */  lui        $v1, %hi(FePlayerNo)
    /* 2E450 8003E450 78B3638C */  lw         $v1, %lo(FePlayerNo)($v1)
    /* 2E454 8003E454 00804234 */  ori        $v0, $v0, 0x8000
    /* 2E458 8003E458 0D80013C */  lui        $at, %hi(item + 0x24)
    /* 2E45C 8003E45C 21083000 */  addu       $at, $at, $s0
    /* 2E460 8003E460 781D22A4 */  sh         $v0, %lo(item + 0x24)($at)
    /* 2E464 8003E464 0D80013C */  lui        $at, %hi(item + 0x65)
    /* 2E468 8003E468 21083000 */  addu       $at, $at, $s0
    /* 2E46C 8003E46C B91D23A0 */  sb         $v1, %lo(item + 0x65)($at)
    /* 2E470 8003E470 4C0D010C */  jal        SetupItem__Fi
    /* 2E474 8003E474 21206002 */   addu      $a0, $s3, $zero
    /* 2E478 8003E478 0D80013C */  lui        $at, %hi(item + 0x4E)
    /* 2E47C 8003E47C 21083000 */  addu       $at, $at, $s0
    /* 2E480 8003E480 A21D2390 */  lbu        $v1, %lo(item + 0x4E)($at)
    /* 2E484 8003E484 01000224 */  addiu      $v0, $zero, 0x1
    /* 2E488 8003E488 0D80013C */  lui        $at, %hi(item + 0x68)
    /* 2E48C 8003E48C 21083000 */  addu       $at, $at, $s0
    /* 2E490 8003E490 BC1D20A0 */  sb         $zero, %lo(item + 0x68)($at)
    /* 2E494 8003E494 0D80013C */  lui        $at, %hi(item + 0x50)
    /* 2E498 8003E498 21083000 */  addu       $at, $at, $s0
    /* 2E49C 8003E49C A41D22A0 */  sb         $v0, %lo(item + 0x50)($at)
    /* 2E4A0 8003E4A0 0D80013C */  lui        $at, %hi(item + 0x4F)
    /* 2E4A4 8003E4A4 21083000 */  addu       $at, $at, $s0
    /* 2E4A8 8003E4A8 A31D23A0 */  sb         $v1, %lo(item + 0x4F)($at)
    /* 2E4AC 8003E4AC CE3C010C */  jal        DeltaAddItem__Fi
    /* 2E4B0 8003E4B0 21206002 */   addu      $a0, $s3, $zero
    /* 2E4B4 8003E4B4 0811828F */  lw         $v0, %gp_rel(numitems)($gp)
    /* 2E4B8 8003E4B8 00000000 */  nop
    /* 2E4BC 8003E4BC 01004224 */  addiu      $v0, $v0, 0x1
    /* 2E4C0 8003E4C0 081182AF */  sw         $v0, %gp_rel(numitems)($gp)
    /* 2E4C4 8003E4C4 CBF80008 */  j          .L8003E32C
    /* 2E4C8 8003E4C8 01009426 */   addiu     $s4, $s4, 0x1
  .L8003E4CC:
    /* 2E4CC 8003E4CC 2C00BF8F */  lw         $ra, 0x2C($sp)
    /* 2E4D0 8003E4D0 2800B68F */  lw         $s6, 0x28($sp)
    /* 2E4D4 8003E4D4 2400B58F */  lw         $s5, 0x24($sp)
    /* 2E4D8 8003E4D8 2000B48F */  lw         $s4, 0x20($sp)
    /* 2E4DC 8003E4DC 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 2E4E0 8003E4E0 1800B28F */  lw         $s2, 0x18($sp)
    /* 2E4E4 8003E4E4 1400B18F */  lw         $s1, 0x14($sp)
    /* 2E4E8 8003E4E8 1000B08F */  lw         $s0, 0x10($sp)
    /* 2E4EC 8003E4EC 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 2E4F0 8003E4F0 0800E003 */  jr         $ra
    /* 2E4F4 8003E4F4 00000000 */   nop
endlabel AddInitItems__Fv
