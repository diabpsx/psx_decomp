.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_SetMapTrans__FPc, 0xC4

glabel DRLG_SetMapTrans__FPc
    /* 1B9EC 801555E4 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 1B9F0 801555E8 2000BFAF */  sw         $ra, 0x20($sp)
    /* 1B9F4 801555EC A7D3010C */  jal        GRL_LoadFileInMemSig__FPCcPUl
    /* 1B9F8 801555F0 21280000 */   addu      $a1, $zero, $zero
    /* 1B9FC 801555F4 21604000 */  addu       $t4, $v0, $zero
    /* 1BA00 801555F8 00008991 */  lbu        $t1, 0x0($t4)
    /* 1BA04 801555FC 02008B91 */  lbu        $t3, 0x2($t4)
    /* 1BA08 80155600 00000000 */  nop
    /* 1BA0C 80155604 18002B01 */  mult       $t1, $t3
    /* 1BA10 80155608 12380000 */  mflo       $a3
    /* 1BA14 8015560C 40480900 */  sll        $t1, $t1, 1
    /* 1BA18 80155610 40580B00 */  sll        $t3, $t3, 1
    /* 1BA1C 80155614 18002B01 */  mult       $t1, $t3
    /* 1BA20 80155618 02008625 */  addiu      $a2, $t4, 0x2
    /* 1BA24 8015561C 21400000 */  addu       $t0, $zero, $zero
    /* 1BA28 80155620 40100700 */  sll        $v0, $a3, 1
    /* 1BA2C 80155624 02004224 */  addiu      $v0, $v0, 0x2
    /* 1BA30 80155628 12180000 */  mflo       $v1
    /* 1BA34 8015562C 40200300 */  sll        $a0, $v1, 1
    /* 1BA38 80155630 80180300 */  sll        $v1, $v1, 2
    /* 1BA3C 80155634 21186400 */  addu       $v1, $v1, $a0
    /* 1BA40 80155638 21104300 */  addu       $v0, $v0, $v1
    /* 1BA44 8015563C 14006011 */  beqz       $t3, .L80155690
    /* 1BA48 80155640 2130C200 */   addu      $a2, $a2, $v0
    /* 1BA4C 80155644 80000A24 */  addiu      $t2, $zero, 0x80
  .L80155648:
    /* 1BA50 80155648 0D002011 */  beqz       $t1, .L80155680
    /* 1BA54 8015564C 21280000 */   addu      $a1, $zero, $zero
    /* 1BA58 80155650 21384001 */  addu       $a3, $t2, $zero
    /* 1BA5C 80155654 00380424 */  addiu      $a0, $zero, 0x3800
  .L80155658:
    /* 1BA60 80155658 0000C390 */  lbu        $v1, 0x0($a2)
    /* 1BA64 8015565C 0200C624 */  addiu      $a2, $a2, 0x2
    /* 1BA68 80155660 2110E400 */  addu       $v0, $a3, $a0
    /* 1BA6C 80155664 0100A524 */  addiu      $a1, $a1, 0x1
    /* 1BA70 80155668 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 1BA74 8015566C 21082200 */  addu       $at, $at, $v0
    /* 1BA78 80155670 2F7A23A0 */  sb         $v1, %lo(dung_map + 0x7)($at)
    /* 1BA7C 80155674 2A10A900 */  slt        $v0, $a1, $t1
    /* 1BA80 80155678 F7FF4014 */  bnez       $v0, .L80155658
    /* 1BA84 8015567C 80038424 */   addiu     $a0, $a0, 0x380
  .L80155680:
    /* 1BA88 80155680 01000825 */  addiu      $t0, $t0, 0x1
    /* 1BA8C 80155684 2A100B01 */  slt        $v0, $t0, $t3
    /* 1BA90 80155688 EFFF4014 */  bnez       $v0, .L80155648
    /* 1BA94 8015568C 08004A25 */   addiu     $t2, $t2, 0x8
  .L80155690:
    /* 1BA98 80155690 F7F6000C */  jal        mem_free_dbg__FPv
    /* 1BA9C 80155694 21208001 */   addu      $a0, $t4, $zero
    /* 1BAA0 80155698 2000BF8F */  lw         $ra, 0x20($sp)
    /* 1BAA4 8015569C 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 1BAA8 801556A0 0800E003 */  jr         $ra
    /* 1BAAC 801556A4 00000000 */   nop
endlabel DRLG_SetMapTrans__FPc
