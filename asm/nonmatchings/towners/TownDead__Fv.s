.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TownDead__Fv, 0xE8

glabel TownDead__Fv
    /* 2B318 8003B318 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 2B31C 8003B31C 02000424 */  addiu      $a0, $zero, 0x2
    /* 2B320 8003B320 1400BFAF */  sw         $ra, 0x14($sp)
    /* 2B324 8003B324 E2E7000C */  jal        GetActiveTowner__Fi
    /* 2B328 8003B328 1000B0AF */   sw        $s0, 0x10($sp)
    /* 2B32C 8003B32C 21804000 */  addu       $s0, $v0, $zero
    /* 2B330 8003B330 42EC000C */  jal        TownCtrlMsg__Fi
    /* 2B334 8003B334 21200002 */   addu      $a0, $s0, $zero
    /* 2B338 8003B338 1280023C */  lui        $v0, %hi(qtextflag)
    /* 2B33C 8003B33C 60B94290 */  lbu        $v0, %lo(qtextflag)($v0)
    /* 2B340 8003B340 00000000 */  nop
    /* 2B344 8003B344 1D004014 */  bnez       $v0, .L8003B3BC
    /* 2B348 8003B348 02000224 */   addiu     $v0, $zero, 0x2
    /* 2B34C 8003B34C 0E80033C */  lui        $v1, %hi(quests + 0x7A)
    /* 2B350 8003B350 BADA6390 */  lbu        $v1, %lo(quests + 0x7A)($v1)
    /* 2B354 8003B354 00000000 */  nop
    /* 2B358 8003B358 06006214 */  bne        $v1, $v0, .L8003B374
    /* 2B35C 8003B35C 00000000 */   nop
    /* 2B360 8003B360 0E80023C */  lui        $v0, %hi(quests + 0x89)
    /* 2B364 8003B364 C9DA4290 */  lbu        $v0, %lo(quests + 0x89)($v0)
    /* 2B368 8003B368 00000000 */  nop
    /* 2B36C 8003B36C 1F004010 */  beqz       $v0, .L8003B3EC
    /* 2B370 8003B370 00000000 */   nop
  .L8003B374:
    /* 2B374 8003B374 01000424 */  addiu      $a0, $zero, 0x1
    /* 2B378 8003B378 1C006410 */  beq        $v1, $a0, .L8003B3EC
    /* 2B37C 8003B37C 40101000 */   sll       $v0, $s0, 1
    /* 2B380 8003B380 21105000 */  addu       $v0, $v0, $s0
    /* 2B384 8003B384 00110200 */  sll        $v0, $v0, 4
    /* 2B388 8003B388 21105000 */  addu       $v0, $v0, $s0
    /* 2B38C 8003B38C 80100200 */  sll        $v0, $v0, 2
    /* 2B390 8003B390 E8030324 */  addiu      $v1, $zero, 0x3E8
    /* 2B394 8003B394 0D80013C */  lui        $at, %hi(towner + 0x24)
    /* 2B398 8003B398 21082200 */  addu       $at, $at, $v0
    /* 2B39C 8003B39C A4FE23AC */  sw         $v1, %lo(towner + 0x24)($at)
    /* 2B3A0 8003B3A0 DA030324 */  addiu      $v1, $zero, 0x3DA
    /* 2B3A4 8003B3A4 0D80013C */  lui        $at, %hi(towner + 0x30)
    /* 2B3A8 8003B3A8 21082200 */  addu       $at, $at, $v0
    /* 2B3AC 8003B3AC B0FE24AC */  sw         $a0, %lo(towner + 0x30)($at)
    /* 2B3B0 8003B3B0 0D80013C */  lui        $at, %hi(towner + 0x98)
    /* 2B3B4 8003B3B4 21082200 */  addu       $at, $at, $v0
    /* 2B3B8 8003B3B8 18FF23AC */  sw         $v1, %lo(towner + 0x98)($at)
  .L8003B3BC:
    /* 2B3BC 8003B3BC 0E80033C */  lui        $v1, %hi(quests + 0x7A)
    /* 2B3C0 8003B3C0 BADA6390 */  lbu        $v1, %lo(quests + 0x7A)($v1)
    /* 2B3C4 8003B3C4 01000224 */  addiu      $v0, $zero, 0x1
    /* 2B3C8 8003B3C8 08006210 */  beq        $v1, $v0, .L8003B3EC
    /* 2B3CC 8003B3CC 40101000 */   sll       $v0, $s0, 1
    /* 2B3D0 8003B3D0 21105000 */  addu       $v0, $v0, $s0
    /* 2B3D4 8003B3D4 00110200 */  sll        $v0, $v0, 4
    /* 2B3D8 8003B3D8 21105000 */  addu       $v0, $v0, $s0
    /* 2B3DC 8003B3DC 80100200 */  sll        $v0, $v0, 2
    /* 2B3E0 8003B3E0 0D80013C */  lui        $at, %hi(towner + 0x28)
    /* 2B3E4 8003B3E4 21082200 */  addu       $at, $at, $v0
    /* 2B3E8 8003B3E8 A8FE20AC */  sw         $zero, %lo(towner + 0x28)($at)
  .L8003B3EC:
    /* 2B3EC 8003B3EC 1400BF8F */  lw         $ra, 0x14($sp)
    /* 2B3F0 8003B3F0 1000B08F */  lw         $s0, 0x10($sp)
    /* 2B3F4 8003B3F4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 2B3F8 8003B3F8 0800E003 */  jr         $ra
    /* 2B3FC 8003B3FC 00000000 */   nop
endlabel TownDead__Fv
