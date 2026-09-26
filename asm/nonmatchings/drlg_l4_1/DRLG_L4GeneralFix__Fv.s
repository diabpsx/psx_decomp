.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_L4GeneralFix__Fv, 0xA4

glabel DRLG_L4GeneralFix__Fv
    /* 1A994 8015458C 21400000 */  addu       $t0, $zero, $zero
    /* 1A998 80154590 18000E24 */  addiu      $t6, $zero, 0x18
    /* 1A99C 80154594 7A000D24 */  addiu      $t5, $zero, 0x7A
    /* 1A9A0 80154598 0E800C3C */  lui        $t4, %hi(dungeon)
    /* 1A9A4 8015459C C4408C25 */  addiu      $t4, $t4, %lo(dungeon)
    /* 1A9A8 801545A0 60008F25 */  addiu      $t7, $t4, 0x60
    /* 1A9AC 801545A4 02000B24 */  addiu      $t3, $zero, 0x2
  .L801545A8:
    /* 1A9B0 801545A8 21300000 */  addu       $a2, $zero, $zero
    /* 1A9B4 801545AC 40380800 */  sll        $a3, $t0, 1
    /* 1A9B8 801545B0 05000A24 */  addiu      $t2, $zero, 0x5
    /* 1A9BC 801545B4 11000924 */  addiu      $t1, $zero, 0x11
    /* 1A9C0 801545B8 2128E001 */  addu       $a1, $t7, $zero
    /* 1A9C4 801545BC 21208001 */  addu       $a0, $t4, $zero
  .L801545C0:
    /* 1A9C8 801545C0 2118E400 */  addu       $v1, $a3, $a0
    /* 1A9CC 801545C4 00006294 */  lhu        $v0, 0x0($v1)
    /* 1A9D0 801545C8 00000000 */  nop
    /* 1A9D4 801545CC 03004E10 */  beq        $v0, $t6, .L801545DC
    /* 1A9D8 801545D0 00000000 */   nop
    /* 1A9DC 801545D4 0B004D14 */  bne        $v0, $t5, .L80154604
    /* 1A9E0 801545D8 00000000 */   nop
  .L801545DC:
    /* 1A9E4 801545DC 2110E500 */  addu       $v0, $a3, $a1
    /* 1A9E8 801545E0 00004294 */  lhu        $v0, 0x0($v0)
    /* 1A9EC 801545E4 00000000 */  nop
    /* 1A9F0 801545E8 06004B14 */  bne        $v0, $t3, .L80154604
    /* 1A9F4 801545EC 00000000 */   nop
    /* 1A9F8 801545F0 02006294 */  lhu        $v0, 0x2($v1)
    /* 1A9FC 801545F4 00000000 */  nop
    /* 1AA00 801545F8 02004A14 */  bne        $v0, $t2, .L80154604
    /* 1AA04 801545FC 00000000 */   nop
    /* 1AA08 80154600 000069A4 */  sh         $t1, 0x0($v1)
  .L80154604:
    /* 1AA0C 80154604 6000A524 */  addiu      $a1, $a1, 0x60
    /* 1AA10 80154608 0100C624 */  addiu      $a2, $a2, 0x1
    /* 1AA14 8015460C 2700C228 */  slti       $v0, $a2, 0x27
    /* 1AA18 80154610 EBFF4014 */  bnez       $v0, .L801545C0
    /* 1AA1C 80154614 60008424 */   addiu     $a0, $a0, 0x60
    /* 1AA20 80154618 01000825 */  addiu      $t0, $t0, 0x1
    /* 1AA24 8015461C 27000229 */  slti       $v0, $t0, 0x27
    /* 1AA28 80154620 E1FF4014 */  bnez       $v0, .L801545A8
    /* 1AA2C 80154624 00000000 */   nop
    /* 1AA30 80154628 0800E003 */  jr         $ra
    /* 1AA34 8015462C 00000000 */   nop
endlabel DRLG_L4GeneralFix__Fv
