.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddMonst__FP9CacheInfoP8map_infoii, 0xE8

glabel AddMonst__FP9CacheInfoP8map_infoii
    /* 7F510 8008F510 21388000 */  addu       $a3, $a0, $zero
    /* 7F514 8008F514 0000A284 */  lh         $v0, 0x0($a1)
    /* 7F518 8008F518 0600A980 */  lb         $t1, 0x6($a1)
    /* 7F51C 8008F51C 10004018 */  blez       $v0, .L8008F560
    /* 7F520 8008F520 21400000 */   addu      $t0, $zero, $zero
    /* 7F524 8008F524 01000824 */  addiu      $t0, $zero, 0x1
    /* 7F528 8008F528 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 7F52C 8008F52C 40180200 */  sll        $v1, $v0, 1
    /* 7F530 8008F530 21186200 */  addu       $v1, $v1, $v0
    /* 7F534 8008F534 80180300 */  sll        $v1, $v1, 2
    /* 7F538 8008F538 21186200 */  addu       $v1, $v1, $v0
    /* 7F53C 8008F53C C0180300 */  sll        $v1, $v1, 3
    /* 7F540 8008F540 1080043C */  lui        $a0, %hi(monster)
    /* 7F544 8008F544 94538424 */  addiu      $a0, $a0, %lo(monster)
    /* 7F548 8008F548 21186400 */  addu       $v1, $v1, $a0
    /* 7F54C 8008F54C 0000E690 */  lbu        $a2, 0x0($a3)
    /* 7F550 8008F550 001A0300 */  sll        $v1, $v1, 8
    /* 7F554 8008F554 2530C300 */  or         $a2, $a2, $v1
    /* 7F558 8008F558 0000E6AC */  sw         $a2, 0x0($a3)
    /* 7F55C 8008F55C 0000E2A0 */  sb         $v0, 0x0($a3)
  .L8008F560:
    /* 7F560 8008F560 40002231 */  andi       $v0, $t1, 0x40
    /* 7F564 8008F564 22004010 */  beqz       $v0, .L8008F5F0
    /* 7F568 8008F568 00000000 */   nop
    /* 7F56C 8008F56C 0500A380 */  lb         $v1, 0x5($a1)
    /* 7F570 8008F570 00000000 */  nop
    /* 7F574 8008F574 1E006018 */  blez       $v1, .L8008F5F0
    /* 7F578 8008F578 FFFF6324 */   addiu     $v1, $v1, -0x1
    /* 7F57C 8008F57C 80100300 */  sll        $v0, $v1, 2
    /* 7F580 8008F580 21104300 */  addu       $v0, $v0, $v1
    /* 7F584 8008F584 80100200 */  sll        $v0, $v0, 2
    /* 7F588 8008F588 23104300 */  subu       $v0, $v0, $v1
    /* 7F58C 8008F58C 80200200 */  sll        $a0, $v0, 2
    /* 7F590 8008F590 1080013C */  lui        $at, %hi(missile + 0x30)
    /* 7F594 8008F594 21082400 */  addu       $at, $at, $a0
    /* 7F598 8008F598 882C2380 */  lb         $v1, %lo(missile + 0x30)($at)
    /* 7F59C 8008F59C 14000224 */  addiu      $v0, $zero, 0x14
    /* 7F5A0 8008F5A0 13006214 */  bne        $v1, $v0, .L8008F5F0
    /* 7F5A4 8008F5A4 80280800 */   sll       $a1, $t0, 2
    /* 7F5A8 8008F5A8 01000825 */  addiu      $t0, $t0, 0x1
    /* 7F5AC 8008F5AC 2128A700 */  addu       $a1, $a1, $a3
    /* 7F5B0 8008F5B0 1080033C */  lui        $v1, %hi(monster)
    /* 7F5B4 8008F5B4 94536324 */  addiu      $v1, $v1, %lo(monster)
    /* 7F5B8 8008F5B8 1080013C */  lui        $at, %hi(missile + 0x2E)
    /* 7F5BC 8008F5BC 21082400 */  addu       $at, $at, $a0
    /* 7F5C0 8008F5C0 862C2484 */  lh         $a0, %lo(missile + 0x2E)($at)
    /* 7F5C4 8008F5C4 0000A690 */  lbu        $a2, 0x0($a1)
    /* 7F5C8 8008F5C8 40100400 */  sll        $v0, $a0, 1
    /* 7F5CC 8008F5CC 21104400 */  addu       $v0, $v0, $a0
    /* 7F5D0 8008F5D0 80100200 */  sll        $v0, $v0, 2
    /* 7F5D4 8008F5D4 21104400 */  addu       $v0, $v0, $a0
    /* 7F5D8 8008F5D8 C0100200 */  sll        $v0, $v0, 3
    /* 7F5DC 8008F5DC 21104300 */  addu       $v0, $v0, $v1
    /* 7F5E0 8008F5E0 00120200 */  sll        $v0, $v0, 8
    /* 7F5E4 8008F5E4 2530C200 */  or         $a2, $a2, $v0
    /* 7F5E8 8008F5E8 0000A6AC */  sw         $a2, 0x0($a1)
    /* 7F5EC 8008F5EC 0000A4A0 */  sb         $a0, 0x0($a1)
  .L8008F5F0:
    /* 7F5F0 8008F5F0 0800E003 */  jr         $ra
    /* 7F5F4 8008F5F4 21100001 */   addu      $v0, $t0, $zero
endlabel AddMonst__FP9CacheInfoP8map_infoii
