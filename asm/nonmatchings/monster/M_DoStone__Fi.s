.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching M_DoStone__Fi, 0x7C

glabel M_DoStone__Fi
    /* 15498 8014F090 40100400 */  sll        $v0, $a0, 1
    /* 1549C 8014F094 21104400 */  addu       $v0, $v0, $a0
    /* 154A0 8014F098 80100200 */  sll        $v0, $v0, 2
    /* 154A4 8014F09C 21104400 */  addu       $v0, $v0, $a0
    /* 154A8 8014F0A0 C0280200 */  sll        $a1, $v0, 3
    /* 154AC 8014F0A4 1080013C */  lui        $at, %hi(monster + 0x10)
    /* 154B0 8014F0A8 21082500 */  addu       $at, $at, $a1
    /* 154B4 8014F0AC A453228C */  lw         $v0, %lo(monster + 0x10)($at)
    /* 154B8 8014F0B0 00000000 */  nop
    /* 154BC 8014F0B4 13004014 */  bnez       $v0, .L8014F104
    /* 154C0 8014F0B8 00000000 */   nop
    /* 154C4 8014F0BC 1080013C */  lui        $at, %hi(monster + 0x35)
    /* 154C8 8014F0C0 21082500 */  addu       $at, $at, $a1
    /* 154CC 8014F0C4 C9532380 */  lb         $v1, %lo(monster + 0x35)($at)
    /* 154D0 8014F0C8 1080013C */  lui        $at, %hi(monster + 0x34)
    /* 154D4 8014F0CC 21082500 */  addu       $at, $at, $a1
    /* 154D8 8014F0D0 C8532480 */  lb         $a0, %lo(monster + 0x34)($at)
    /* 154DC 8014F0D4 C0180300 */  sll        $v1, $v1, 3
    /* 154E0 8014F0D8 C0100400 */  sll        $v0, $a0, 3
    /* 154E4 8014F0DC 23104400 */  subu       $v0, $v0, $a0
    /* 154E8 8014F0E0 C0110200 */  sll        $v0, $v0, 7
    /* 154EC 8014F0E4 21186200 */  addu       $v1, $v1, $v0
    /* 154F0 8014F0E8 01000224 */  addiu      $v0, $zero, 0x1
    /* 154F4 8014F0EC 0E80013C */  lui        $at, %hi(dung_map)
    /* 154F8 8014F0F0 21082300 */  addu       $at, $at, $v1
    /* 154FC 8014F0F4 287A20A4 */  sh         $zero, %lo(dung_map)($at)
    /* 15500 8014F0F8 1080013C */  lui        $at, %hi(monster + 0x5B)
    /* 15504 8014F0FC 21082500 */  addu       $at, $at, $a1
    /* 15508 8014F100 EF5322A0 */  sb         $v0, %lo(monster + 0x5B)($at)
  .L8014F104:
    /* 1550C 8014F104 0800E003 */  jr         $ra
    /* 15510 8014F108 21100000 */   addu      $v0, $zero, $zero
endlabel M_DoStone__Fi
