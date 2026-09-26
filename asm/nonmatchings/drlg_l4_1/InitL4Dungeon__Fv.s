.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitL4Dungeon__Fv, 0xB4

glabel InitL4Dungeon__Fv
    /* 15974 8014F56C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 15978 8014F570 1000BFAF */  sw         $ra, 0x10($sp)
    /* 1597C 8014F574 1580043C */  lui        $a0, %hi(L4dungeon)
    /* 15980 8014F578 18DA8424 */  addiu      $a0, $a0, %lo(L4dungeon)
    /* 15984 8014F57C 21280000 */  addu       $a1, $zero, $zero
    /* 15988 8014F580 E940000C */  jal        memset
    /* 1598C 8014F584 00190624 */   addiu     $a2, $zero, 0x1900
    /* 15990 8014F588 21280000 */  addu       $a1, $zero, $zero
    /* 15994 8014F58C 0E80083C */  lui        $t0, %hi(dungeon)
    /* 15998 8014F590 C4400825 */  addiu      $t0, $t0, %lo(dungeon)
    /* 1599C 8014F594 1E000724 */  addiu      $a3, $zero, 0x1E
  .L8014F598:
    /* 159A0 8014F598 3000A228 */  slti       $v0, $a1, 0x30
    /* 159A4 8014F59C 0B004010 */  beqz       $v0, .L8014F5CC
    /* 159A8 8014F5A0 21200000 */   addu      $a0, $zero, $zero
    /* 159AC 8014F5A4 40300500 */  sll        $a2, $a1, 1
    /* 159B0 8014F5A8 21180001 */  addu       $v1, $t0, $zero
  .L8014F5AC:
    /* 159B4 8014F5AC 2110C300 */  addu       $v0, $a2, $v1
    /* 159B8 8014F5B0 000047A4 */  sh         $a3, 0x0($v0)
    /* 159BC 8014F5B4 01008424 */  addiu      $a0, $a0, 0x1
    /* 159C0 8014F5B8 30008228 */  slti       $v0, $a0, 0x30
    /* 159C4 8014F5BC FBFF4014 */  bnez       $v0, .L8014F5AC
    /* 159C8 8014F5C0 60006324 */   addiu     $v1, $v1, 0x60
    /* 159CC 8014F5C4 663D0508 */  j          .L8014F598
    /* 159D0 8014F5C8 0100A524 */   addiu     $a1, $a1, 0x1
  .L8014F5CC:
    /* 159D4 8014F5CC 21380000 */  addu       $a3, $zero, $zero
    /* 159D8 8014F5D0 21300000 */  addu       $a2, $zero, $zero
  .L8014F5D4:
    /* 159DC 8014F5D4 2800E228 */  slti       $v0, $a3, 0x28
    /* 159E0 8014F5D8 0D004010 */  beqz       $v0, .L8014F610
    /* 159E4 8014F5DC 21200000 */   addu      $a0, $zero, $zero
    /* 159E8 8014F5E0 2128C000 */  addu       $a1, $a2, $zero
  .L8014F5E4:
    /* 159EC 8014F5E4 2110A400 */  addu       $v0, $a1, $a0
    /* 159F0 8014F5E8 1280033C */  lui        $v1, %hi(mydflags)
    /* 159F4 8014F5EC D8C0638C */  lw         $v1, %lo(mydflags)($v1)
    /* 159F8 8014F5F0 01008424 */  addiu      $a0, $a0, 0x1
    /* 159FC 8014F5F4 21186200 */  addu       $v1, $v1, $v0
    /* 15A00 8014F5F8 28008228 */  slti       $v0, $a0, 0x28
    /* 15A04 8014F5FC F9FF4014 */  bnez       $v0, .L8014F5E4
    /* 15A08 8014F600 000060A0 */   sb        $zero, 0x0($v1)
    /* 15A0C 8014F604 2800C624 */  addiu      $a2, $a2, 0x28
    /* 15A10 8014F608 753D0508 */  j          .L8014F5D4
    /* 15A14 8014F60C 0100E724 */   addiu     $a3, $a3, 0x1
  .L8014F610:
    /* 15A18 8014F610 1000BF8F */  lw         $ra, 0x10($sp)
    /* 15A1C 8014F614 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 15A20 8014F618 0800E003 */  jr         $ra
    /* 15A24 8014F61C 00000000 */   nop
endlabel InitL4Dungeon__Fv
