.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_L2SetWalls__Fv, 0x1B8

glabel DRLG_L2SetWalls__Fv
    /* D930 80147528 10000E24 */  addiu      $t6, $zero, 0x10
    /* D934 8014752C 21500000 */  addu       $t2, $zero, $zero
    /* D938 80147530 0E800F3C */  lui        $t7, %hi(dungeon)
    /* D93C 80147534 C440EF25 */  addiu      $t7, $t7, %lo(dungeon)
    /* D940 80147538 DFFF0D24 */  addiu      $t5, $zero, -0x21
    /* D944 8014753C 88000C24 */  addiu      $t4, $zero, 0x88
  .L80147540:
    /* D948 80147540 28004229 */  slti       $v0, $t2, 0x28
    /* D94C 80147544 64004010 */  beqz       $v0, .L801476D8
    /* D950 80147548 21400000 */   addu      $t0, $zero, $zero
    /* D954 8014754C 21588001 */  addu       $t3, $t4, $zero
    /* D958 80147550 2138E001 */  addu       $a3, $t7, $zero
    /* D95C 80147554 00388625 */  addiu      $a2, $t4, 0x3800
    /* D960 80147558 803B0524 */  addiu      $a1, $zero, 0x3B80
    /* D964 8014755C C0480E00 */  sll        $t1, $t6, 3
    /* D968 80147560 00382425 */  addiu      $a0, $t1, 0x3800
  .L80147564:
    /* D96C 80147564 28000229 */  slti       $v0, $t0, 0x28
    /* D970 80147568 57004010 */  beqz       $v0, .L801476C8
    /* D974 8014756C 40100A00 */   sll       $v0, $t2, 1
    /* D978 80147570 21104700 */  addu       $v0, $v0, $a3
    /* D97C 80147574 00004394 */  lhu        $v1, 0x0($v0)
    /* D980 80147578 03000224 */  addiu      $v0, $zero, 0x3
    /* D984 8014757C 0F006210 */  beq        $v1, $v0, .L801475BC
    /* D988 80147580 00000000 */   nop
    /* D98C 80147584 0C000224 */  addiu      $v0, $zero, 0xC
    /* D990 80147588 0C006210 */  beq        $v1, $v0, .L801475BC
    /* D994 8014758C 00000000 */   nop
    /* D998 80147590 0A006010 */  beqz       $v1, .L801475BC
    /* D99C 80147594 00000000 */   nop
    /* D9A0 80147598 4C000224 */  addiu      $v0, $zero, 0x4C
    /* D9A4 8014759C 07006210 */  beq        $v1, $v0, .L801475BC
    /* D9A8 801475A0 00000000 */   nop
    /* D9AC 801475A4 9F000224 */  addiu      $v0, $zero, 0x9F
    /* D9B0 801475A8 04006210 */  beq        $v1, $v0, .L801475BC
    /* D9B4 801475AC 00000000 */   nop
    /* D9B8 801475B0 32000224 */  addiu      $v0, $zero, 0x32
    /* D9BC 801475B4 1E006214 */  bne        $v1, $v0, .L80147630
    /* D9C0 801475B8 21182501 */   addu      $v1, $t1, $a1
  .L801475BC:
    /* D9C4 801475BC 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* D9C8 801475C0 21082400 */  addu       $at, $at, $a0
    /* D9CC 801475C4 2E7A2290 */  lbu        $v0, %lo(dung_map + 0x6)($at)
    /* D9D0 801475C8 21182501 */  addu       $v1, $t1, $a1
    /* D9D4 801475CC 20004234 */  ori        $v0, $v0, 0x20
    /* D9D8 801475D0 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* D9DC 801475D4 21082400 */  addu       $at, $at, $a0
    /* D9E0 801475D8 2E7A22A0 */  sb         $v0, %lo(dung_map + 0x6)($at)
    /* D9E4 801475DC 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* D9E8 801475E0 21082300 */  addu       $at, $at, $v1
    /* D9EC 801475E4 2E7A2290 */  lbu        $v0, %lo(dung_map + 0x6)($at)
    /* D9F0 801475E8 00000000 */  nop
    /* D9F4 801475EC 20004234 */  ori        $v0, $v0, 0x20
    /* D9F8 801475F0 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* D9FC 801475F4 21082300 */  addu       $at, $at, $v1
    /* DA00 801475F8 2E7A22A0 */  sb         $v0, %lo(dung_map + 0x6)($at)
    /* DA04 801475FC 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* DA08 80147600 21082600 */  addu       $at, $at, $a2
    /* DA0C 80147604 2E7A2290 */  lbu        $v0, %lo(dung_map + 0x6)($at)
    /* DA10 80147608 21186501 */  addu       $v1, $t3, $a1
    /* DA14 8014760C 20004234 */  ori        $v0, $v0, 0x20
    /* DA18 80147610 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* DA1C 80147614 21082600 */  addu       $at, $at, $a2
    /* DA20 80147618 2E7A22A0 */  sb         $v0, %lo(dung_map + 0x6)($at)
    /* DA24 8014761C 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* DA28 80147620 21082300 */  addu       $at, $at, $v1
    /* DA2C 80147624 2E7A2290 */  lbu        $v0, %lo(dung_map + 0x6)($at)
    /* DA30 80147628 A91D0508 */  j          .L801476A4
    /* DA34 8014762C 20004234 */   ori       $v0, $v0, 0x20
  .L80147630:
    /* DA38 80147630 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* DA3C 80147634 21082400 */  addu       $at, $at, $a0
    /* DA40 80147638 2E7A2290 */  lbu        $v0, %lo(dung_map + 0x6)($at)
    /* DA44 8014763C 00000000 */  nop
    /* DA48 80147640 24104D00 */  and        $v0, $v0, $t5
    /* DA4C 80147644 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* DA50 80147648 21082400 */  addu       $at, $at, $a0
    /* DA54 8014764C 2E7A22A0 */  sb         $v0, %lo(dung_map + 0x6)($at)
    /* DA58 80147650 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* DA5C 80147654 21082300 */  addu       $at, $at, $v1
    /* DA60 80147658 2E7A2290 */  lbu        $v0, %lo(dung_map + 0x6)($at)
    /* DA64 8014765C 00000000 */  nop
    /* DA68 80147660 24104D00 */  and        $v0, $v0, $t5
    /* DA6C 80147664 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* DA70 80147668 21082300 */  addu       $at, $at, $v1
    /* DA74 8014766C 2E7A22A0 */  sb         $v0, %lo(dung_map + 0x6)($at)
    /* DA78 80147670 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* DA7C 80147674 21082600 */  addu       $at, $at, $a2
    /* DA80 80147678 2E7A2290 */  lbu        $v0, %lo(dung_map + 0x6)($at)
    /* DA84 8014767C 21186501 */  addu       $v1, $t3, $a1
    /* DA88 80147680 24104D00 */  and        $v0, $v0, $t5
    /* DA8C 80147684 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* DA90 80147688 21082600 */  addu       $at, $at, $a2
    /* DA94 8014768C 2E7A22A0 */  sb         $v0, %lo(dung_map + 0x6)($at)
    /* DA98 80147690 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* DA9C 80147694 21082300 */  addu       $at, $at, $v1
    /* DAA0 80147698 2E7A2290 */  lbu        $v0, %lo(dung_map + 0x6)($at)
    /* DAA4 8014769C 00000000 */  nop
    /* DAA8 801476A0 24104D00 */  and        $v0, $v0, $t5
  .L801476A4:
    /* DAAC 801476A4 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* DAB0 801476A8 21082300 */  addu       $at, $at, $v1
    /* DAB4 801476AC 2E7A22A0 */  sb         $v0, %lo(dung_map + 0x6)($at)
    /* DAB8 801476B0 0007C624 */  addiu      $a2, $a2, 0x700
    /* DABC 801476B4 0007A524 */  addiu      $a1, $a1, 0x700
    /* DAC0 801476B8 00078424 */  addiu      $a0, $a0, 0x700
    /* DAC4 801476BC 6000E724 */  addiu      $a3, $a3, 0x60
    /* DAC8 801476C0 591D0508 */  j          .L80147564
    /* DACC 801476C4 01000825 */   addiu     $t0, $t0, 0x1
  .L801476C8:
    /* DAD0 801476C8 10008C25 */  addiu      $t4, $t4, 0x10
    /* DAD4 801476CC 0200CE25 */  addiu      $t6, $t6, 0x2
    /* DAD8 801476D0 501D0508 */  j          .L80147540
    /* DADC 801476D4 01004A25 */   addiu     $t2, $t2, 0x1
  .L801476D8:
    /* DAE0 801476D8 0800E003 */  jr         $ra
    /* DAE4 801476DC 00000000 */   nop
endlabel DRLG_L2SetWalls__Fv
