.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitQstSnds__Fi, 0xC0

glabel InitQstSnds__Fi
    /* 2A1A4 8003A1A4 A1108293 */  lbu        $v0, %gp_rel(boyloadflag)($gp)
    /* 2A1A8 8003A1A8 00000000 */  nop
    /* 2A1AC 8003A1AC 02004010 */  beqz       $v0, .L8003A1B8
    /* 2A1B0 8003A1B0 21308000 */   addu      $a2, $a0, $zero
    /* 2A1B4 8003A1B4 01008424 */  addiu      $a0, $a0, 0x1
  .L8003A1B8:
    /* 2A1B8 8003A1B8 21380000 */  addu       $a3, $zero, $zero
    /* 2A1BC 8003A1BC FFFF0924 */  addiu      $t1, $zero, -0x1
    /* 2A1C0 8003A1C0 01000824 */  addiu      $t0, $zero, 0x1
    /* 2A1C4 8003A1C4 0D80033C */  lui        $v1, %hi(Qtalklist)
    /* 2A1C8 8003A1C8 C0FB6324 */  addiu      $v1, $v1, %lo(Qtalklist)
    /* 2A1CC 8003A1CC 80110400 */  sll        $v0, $a0, 6
    /* 2A1D0 8003A1D0 21204300 */  addu       $a0, $v0, $v1
    /* 2A1D4 8003A1D4 21280000 */  addu       $a1, $zero, $zero
    /* 2A1D8 8003A1D8 40100600 */  sll        $v0, $a2, 1
    /* 2A1DC 8003A1DC 21104600 */  addu       $v0, $v0, $a2
    /* 2A1E0 8003A1E0 00110200 */  sll        $v0, $v0, 4
    /* 2A1E4 8003A1E4 21104600 */  addu       $v0, $v0, $a2
    /* 2A1E8 8003A1E8 80180200 */  sll        $v1, $v0, 2
  .L8003A1EC:
    /* 2A1EC 8003A1EC 0E80013C */  lui        $at, %hi(quests + 0x1)
    /* 2A1F0 8003A1F0 21082500 */  addu       $at, $at, $a1
    /* 2A1F4 8003A1F4 41DA2290 */  lbu        $v0, %lo(quests + 0x1)($at)
    /* 2A1F8 8003A1F8 0D80013C */  lui        $at, %hi(towner + 0x52)
    /* 2A1FC 8003A1FC 21082300 */  addu       $at, $at, $v1
    /* 2A200 8003A200 D2FE22A0 */  sb         $v0, %lo(towner + 0x52)($at)
    /* 2A204 8003A204 0000828C */  lw         $v0, 0x0($a0)
    /* 2A208 8003A208 0D80013C */  lui        $at, %hi(towner + 0x53)
    /* 2A20C 8003A20C 21082300 */  addu       $at, $at, $v1
    /* 2A210 8003A210 D3FE22A0 */  sb         $v0, %lo(towner + 0x53)($at)
    /* 2A214 8003A214 0000828C */  lw         $v0, 0x0($a0)
    /* 2A218 8003A218 00000000 */  nop
    /* 2A21C 8003A21C 06004910 */  beq        $v0, $t1, .L8003A238
    /* 2A220 8003A220 00000000 */   nop
    /* 2A224 8003A224 0D80013C */  lui        $at, %hi(towner + 0x54)
    /* 2A228 8003A228 21082300 */  addu       $at, $at, $v1
    /* 2A22C 8003A22C D4FE28A0 */  sb         $t0, %lo(towner + 0x54)($at)
    /* 2A230 8003A230 92E80008 */  j          .L8003A248
    /* 2A234 8003A234 04008424 */   addiu     $a0, $a0, 0x4
  .L8003A238:
    /* 2A238 8003A238 0D80013C */  lui        $at, %hi(towner + 0x54)
    /* 2A23C 8003A23C 21082300 */  addu       $at, $at, $v1
    /* 2A240 8003A240 D4FE20A0 */  sb         $zero, %lo(towner + 0x54)($at)
    /* 2A244 8003A244 04008424 */  addiu      $a0, $a0, 0x4
  .L8003A248:
    /* 2A248 8003A248 1400A524 */  addiu      $a1, $a1, 0x14
    /* 2A24C 8003A24C 0100E724 */  addiu      $a3, $a3, 0x1
    /* 2A250 8003A250 1000E228 */  slti       $v0, $a3, 0x10
    /* 2A254 8003A254 E5FF4014 */  bnez       $v0, .L8003A1EC
    /* 2A258 8003A258 03006324 */   addiu     $v1, $v1, 0x3
    /* 2A25C 8003A25C 0800E003 */  jr         $ra
    /* 2A260 8003A260 00000000 */   nop
endlabel InitQstSnds__Fi
