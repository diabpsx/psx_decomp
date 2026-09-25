.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PlrHasItem__FiiRi, 0xD4

glabel PlrHasItem__FiiRi
    /* 2B768 8003B768 40480400 */  sll        $t1, $a0, 1
    /* 2B76C 8003B76C 21102401 */  addu       $v0, $t1, $a0
    /* 2B770 8003B770 80100200 */  sll        $v0, $v0, 2
    /* 2B774 8003B774 21104400 */  addu       $v0, $v0, $a0
    /* 2B778 8003B778 00110200 */  sll        $v0, $v0, 4
    /* 2B77C 8003B77C 23104400 */  subu       $v0, $v0, $a0
    /* 2B780 8003B780 80100200 */  sll        $v0, $v0, 2
    /* 2B784 8003B784 21104400 */  addu       $v0, $v0, $a0
    /* 2B788 8003B788 C0100200 */  sll        $v0, $v0, 3
    /* 2B78C 8003B78C 0000C0AC */  sw         $zero, 0x0($a2)
    /* 2B790 8003B790 0E80013C */  lui        $at, %hi(plr + 0x1584)
    /* 2B794 8003B794 21082200 */  addu       $at, $at, $v0
    /* 2B798 8003B798 BCBA228C */  lw         $v0, %lo(plr + 0x1584)($at)
    /* 2B79C 8003B79C 00000000 */  nop
    /* 2B7A0 8003B7A0 24004018 */  blez       $v0, .L8003B834
    /* 2B7A4 8003B7A4 21100000 */   addu      $v0, $zero, $zero
    /* 2B7A8 8003B7A8 0E800A3C */  lui        $t2, %hi(plr + 0x4A4)
    /* 2B7AC 8003B7AC DCA94A25 */  addiu      $t2, $t2, %lo(plr + 0x4A4)
  .L8003B7B0:
    /* 2B7B0 8003B7B0 0000C78C */  lw         $a3, 0x0($a2)
    /* 2B7B4 8003B7B4 00000000 */  nop
    /* 2B7B8 8003B7B8 C0100700 */  sll        $v0, $a3, 3
    /* 2B7BC 8003B7BC 23104700 */  subu       $v0, $v0, $a3
    /* 2B7C0 8003B7C0 80100200 */  sll        $v0, $v0, 2
    /* 2B7C4 8003B7C4 23104700 */  subu       $v0, $v0, $a3
    /* 2B7C8 8003B7C8 80400200 */  sll        $t0, $v0, 2
    /* 2B7CC 8003B7CC 21102401 */  addu       $v0, $t1, $a0
    /* 2B7D0 8003B7D0 80100200 */  sll        $v0, $v0, 2
    /* 2B7D4 8003B7D4 21104400 */  addu       $v0, $v0, $a0
    /* 2B7D8 8003B7D8 00110200 */  sll        $v0, $v0, 4
    /* 2B7DC 8003B7DC 23104400 */  subu       $v0, $v0, $a0
    /* 2B7E0 8003B7E0 80100200 */  sll        $v0, $v0, 2
    /* 2B7E4 8003B7E4 21104400 */  addu       $v0, $v0, $a0
    /* 2B7E8 8003B7E8 C0180200 */  sll        $v1, $v0, 3
    /* 2B7EC 8003B7EC 21100301 */  addu       $v0, $t0, $v1
    /* 2B7F0 8003B7F0 0E80013C */  lui        $at, %hi(plr + 0x4D2)
    /* 2B7F4 8003B7F4 21082200 */  addu       $at, $at, $v0
    /* 2B7F8 8003B7F8 0AAA2284 */  lh         $v0, %lo(plr + 0x4D2)($at)
    /* 2B7FC 8003B7FC 00000000 */  nop
    /* 2B800 8003B800 03004514 */  bne        $v0, $a1, .L8003B810
    /* 2B804 8003B804 21106A00 */   addu      $v0, $v1, $t2
    /* 2B808 8003B808 0DEE0008 */  j          .L8003B834
    /* 2B80C 8003B80C 21104800 */   addu      $v0, $v0, $t0
  .L8003B810:
    /* 2B810 8003B810 0100E224 */  addiu      $v0, $a3, 0x1
    /* 2B814 8003B814 0000C2AC */  sw         $v0, 0x0($a2)
    /* 2B818 8003B818 0E80013C */  lui        $at, %hi(plr + 0x1584)
    /* 2B81C 8003B81C 21082300 */  addu       $at, $at, $v1
    /* 2B820 8003B820 BCBA238C */  lw         $v1, %lo(plr + 0x1584)($at)
    /* 2B824 8003B824 00000000 */  nop
    /* 2B828 8003B828 2A104300 */  slt        $v0, $v0, $v1
    /* 2B82C 8003B82C E0FF4014 */  bnez       $v0, .L8003B7B0
    /* 2B830 8003B830 21100000 */   addu      $v0, $zero, $zero
  .L8003B834:
    /* 2B834 8003B834 0800E003 */  jr         $ra
    /* 2B838 8003B838 00000000 */   nop
endlabel PlrHasItem__FiiRi
