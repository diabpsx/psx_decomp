.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching WallTrapLocOk__Fii, 0x58

glabel WallTrapLocOk__Fii
    /* 1EA90 80158688 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1EA94 8015868C C0100500 */  sll        $v0, $a1, 3
    /* 1EA98 80158690 C0180400 */  sll        $v1, $a0, 3
    /* 1EA9C 80158694 23186400 */  subu       $v1, $v1, $a0
    /* 1EAA0 80158698 C0190300 */  sll        $v1, $v1, 7
    /* 1EAA4 8015869C 21104300 */  addu       $v0, $v0, $v1
    /* 1EAA8 801586A0 1000BFAF */  sw         $ra, 0x10($sp)
    /* 1EAAC 801586A4 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 1EAB0 801586A8 21082200 */  addu       $at, $at, $v0
    /* 1EAB4 801586AC 2E7A2290 */  lbu        $v0, %lo(dung_map + 0x6)($at)
    /* 1EAB8 801586B0 00000000 */  nop
    /* 1EABC 801586B4 08004230 */  andi       $v0, $v0, 0x8
    /* 1EAC0 801586B8 05004014 */  bnez       $v0, .L801586D0
    /* 1EAC4 801586BC 21100000 */   addu      $v0, $zero, $zero
    /* 1EAC8 801586C0 340C020C */  jal        GetTRAP__Fii
    /* 1EACC 801586C4 00000000 */   nop
    /* 1EAD0 801586C8 01004238 */  xori       $v0, $v0, 0x1
    /* 1EAD4 801586CC 0100422C */  sltiu      $v0, $v0, 0x1
  .L801586D0:
    /* 1EAD8 801586D0 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1EADC 801586D4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1EAE0 801586D8 0800E003 */  jr         $ra
    /* 1EAE4 801586DC 00000000 */   nop
endlabel WallTrapLocOk__Fii
