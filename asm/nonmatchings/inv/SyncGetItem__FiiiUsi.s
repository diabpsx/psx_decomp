.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SyncGetItem__FiiiUsi, 0x168

glabel SyncGetItem__FiiiUsi
    /* 252C0 8015EEB8 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 252C4 8015EEBC C0280500 */  sll        $a1, $a1, 3
    /* 252C8 8015EEC0 C0100400 */  sll        $v0, $a0, 3
    /* 252CC 8015EEC4 23104400 */  subu       $v0, $v0, $a0
    /* 252D0 8015EEC8 C0110200 */  sll        $v0, $v0, 7
    /* 252D4 8015EECC 2128A200 */  addu       $a1, $a1, $v0
    /* 252D8 8015EED0 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 252DC 8015EED4 1800B0AF */  sw         $s0, 0x18($sp)
    /* 252E0 8015EED8 0E80013C */  lui        $at, %hi(dung_map + 0x4)
    /* 252E4 8015EEDC 21082500 */  addu       $at, $at, $a1
    /* 252E8 8015EEE0 2C7A2280 */  lb         $v0, %lo(dung_map + 0x4)($at)
    /* 252EC 8015EEE4 3000A88F */  lw         $t0, 0x30($sp)
    /* 252F0 8015EEE8 18004010 */  beqz       $v0, .L8015EF4C
    /* 252F4 8015EEEC FFFF5024 */   addiu     $s0, $v0, -0x1
    /* 252F8 8015EEF0 C0101000 */  sll        $v0, $s0, 3
    /* 252FC 8015EEF4 23105000 */  subu       $v0, $v0, $s0
    /* 25300 8015EEF8 80100200 */  sll        $v0, $v0, 2
    /* 25304 8015EEFC 23105000 */  subu       $v0, $v0, $s0
    /* 25308 8015EF00 80180200 */  sll        $v1, $v0, 2
    /* 2530C 8015EF04 0D80013C */  lui        $at, %hi(item + 0x2E)
    /* 25310 8015EF08 21082300 */  addu       $at, $at, $v1
    /* 25314 8015EF0C 821D2284 */  lh         $v0, %lo(item + 0x2E)($at)
    /* 25318 8015EF10 00000000 */  nop
    /* 2531C 8015EF14 0D004614 */  bne        $v0, $a2, .L8015EF4C
    /* 25320 8015EF18 00000000 */   nop
    /* 25324 8015EF1C 0D80013C */  lui        $at, %hi(item + 0x10)
    /* 25328 8015EF20 21082300 */  addu       $at, $at, $v1
    /* 2532C 8015EF24 641D228C */  lw         $v0, %lo(item + 0x10)($at)
    /* 25330 8015EF28 00000000 */  nop
    /* 25334 8015EF2C 07004814 */  bne        $v0, $t0, .L8015EF4C
    /* 25338 8015EF30 FFFFE230 */   andi      $v0, $a3, 0xFFFF
    /* 2533C 8015EF34 0D80013C */  lui        $at, %hi(item + 0x24)
    /* 25340 8015EF38 21082300 */  addu       $at, $at, $v1
    /* 25344 8015EF3C 781D2394 */  lhu        $v1, %lo(item + 0x24)($at)
    /* 25348 8015EF40 00000000 */  nop
    /* 2534C 8015EF44 07006210 */  beq        $v1, $v0, .L8015EF64
    /* 25350 8015EF48 FFFF0224 */   addiu     $v0, $zero, -0x1
  .L8015EF4C:
    /* 25354 8015EF4C 2120C000 */  addu       $a0, $a2, $zero
    /* 25358 8015EF50 FFFFE530 */  andi       $a1, $a3, 0xFFFF
    /* 2535C 8015EF54 C709020C */  jal        FindGetItem__FiUsi
    /* 25360 8015EF58 21300001 */   addu      $a2, $t0, $zero
    /* 25364 8015EF5C 21804000 */  addu       $s0, $v0, $zero
    /* 25368 8015EF60 FFFF0224 */  addiu      $v0, $zero, -0x1
  .L8015EF64:
    /* 2536C 8015EF64 29000212 */  beq        $s0, $v0, .L8015F00C
    /* 25370 8015EF68 C0101000 */   sll       $v0, $s0, 3
    /* 25374 8015EF6C 23105000 */  subu       $v0, $v0, $s0
    /* 25378 8015EF70 80100200 */  sll        $v0, $v0, 2
    /* 2537C 8015EF74 23105000 */  subu       $v0, $v0, $s0
    /* 25380 8015EF78 80100200 */  sll        $v0, $v0, 2
    /* 25384 8015EF7C 0D80013C */  lui        $at, %hi(item + 0x53)
    /* 25388 8015EF80 21082200 */  addu       $at, $at, $v0
    /* 2538C 8015EF84 A71D2380 */  lb         $v1, %lo(item + 0x53)($at)
    /* 25390 8015EF88 0D80013C */  lui        $at, %hi(item + 0x52)
    /* 25394 8015EF8C 21082200 */  addu       $at, $at, $v0
    /* 25398 8015EF90 A61D2480 */  lb         $a0, %lo(item + 0x52)($at)
    /* 2539C 8015EF94 C0180300 */  sll        $v1, $v1, 3
    /* 253A0 8015EF98 C0100400 */  sll        $v0, $a0, 3
    /* 253A4 8015EF9C 23104400 */  subu       $v0, $v0, $a0
    /* 253A8 8015EFA0 C0110200 */  sll        $v0, $v0, 7
    /* 253AC 8015EFA4 21186200 */  addu       $v1, $v1, $v0
    /* 253B0 8015EFA8 0E80013C */  lui        $at, %hi(dung_map + 0x4)
    /* 253B4 8015EFAC 21082300 */  addu       $at, $at, $v1
    /* 253B8 8015EFB0 2C7A20A0 */  sb         $zero, %lo(dung_map + 0x4)($at)
    /* 253BC 8015EFB4 1280023C */  lui        $v0, %hi(numitems)
    /* 253C0 8015EFB8 88B8428C */  lw         $v0, %lo(numitems)($v0)
    /* 253C4 8015EFBC 00000000 */  nop
    /* 253C8 8015EFC0 12004018 */  blez       $v0, .L8015F00C
    /* 253CC 8015EFC4 21280000 */   addu      $a1, $zero, $zero
  .L8015EFC8:
    /* 253D0 8015EFC8 0D80013C */  lui        $at, %hi(itemactive)
    /* 253D4 8015EFCC 21082500 */  addu       $at, $at, $a1
    /* 253D8 8015EFD0 54532480 */  lb         $a0, %lo(itemactive)($at)
    /* 253DC 8015EFD4 00000000 */  nop
    /* 253E0 8015EFD8 05009014 */  bne        $a0, $s0, .L8015EFF0
    /* 253E4 8015EFDC 00000000 */   nop
    /* 253E8 8015EFE0 EE15010C */  jal        DeleteItem__Fii
    /* 253EC 8015EFE4 00000000 */   nop
    /* 253F0 8015EFE8 FD7B0508 */  j          .L8015EFF4
    /* 253F4 8015EFEC 21280000 */   addu      $a1, $zero, $zero
  .L8015EFF0:
    /* 253F8 8015EFF0 0100A524 */  addiu      $a1, $a1, 0x1
  .L8015EFF4:
    /* 253FC 8015EFF4 1280023C */  lui        $v0, %hi(numitems)
    /* 25400 8015EFF8 88B8428C */  lw         $v0, %lo(numitems)($v0)
    /* 25404 8015EFFC 00000000 */  nop
    /* 25408 8015F000 2A10A200 */  slt        $v0, $a1, $v0
    /* 2540C 8015F004 F0FF4014 */  bnez       $v0, .L8015EFC8
    /* 25410 8015F008 00000000 */   nop
  .L8015F00C:
    /* 25414 8015F00C 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 25418 8015F010 1800B08F */  lw         $s0, 0x18($sp)
    /* 2541C 8015F014 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 25420 8015F018 0800E003 */  jr         $ra
    /* 25424 8015F01C 00000000 */   nop
endlabel SyncGetItem__FiiiUsi
