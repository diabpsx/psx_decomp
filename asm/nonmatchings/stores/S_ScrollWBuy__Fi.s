.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching S_ScrollWBuy__Fi, 0x244

glabel S_ScrollWBuy__Fi
    /* 5C4D0 8006C4D0 20138283 */  lb         $v0, %gp_rel(WStaffFlag)($gp)
    /* 5C4D4 8006C4D4 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 5C4D8 8006C4D8 1800B0AF */  sw         $s0, 0x18($sp)
    /* 5C4DC 8006C4DC 21808000 */  addu       $s0, $a0, $zero
    /* 5C4E0 8006C4E0 3000B6AF */  sw         $s6, 0x30($sp)
    /* 5C4E4 8006C4E4 04001624 */  addiu      $s6, $zero, 0x4
    /* 5C4E8 8006C4E8 3800BFAF */  sw         $ra, 0x38($sp)
    /* 5C4EC 8006C4EC 3400B7AF */  sw         $s7, 0x34($sp)
    /* 5C4F0 8006C4F0 2C00B5AF */  sw         $s5, 0x2C($sp)
    /* 5C4F4 8006C4F4 2800B4AF */  sw         $s4, 0x28($sp)
    /* 5C4F8 8006C4F8 2400B3AF */  sw         $s3, 0x24($sp)
    /* 5C4FC 8006C4FC 2000B2AF */  sw         $s2, 0x20($sp)
    /* 5C500 8006C500 02004010 */  beqz       $v0, .L8006C50C
    /* 5C504 8006C504 1C00B1AF */   sw        $s1, 0x1C($sp)
    /* 5C508 8006C508 08001624 */  addiu      $s6, $zero, 0x8
  .L8006C50C:
    /* 5C50C 8006C50C 05000424 */  addiu      $a0, $zero, 0x5
    /* 5C510 8006C510 36A7010C */  jal        ClearSText__Fii
    /* 5C514 8006C514 15000524 */   addiu     $a1, $zero, 0x15
    /* 5C518 8006C518 05000224 */  addiu      $v0, $zero, 0x5
    /* 5C51C 8006C51C 1C2182AF */  sw         $v0, %gp_rel(D_8011C89C)($gp)
    /* 5C520 8006C520 05001224 */  addiu      $s2, $zero, 0x5
    /* 5C524 8006C524 0E80173C */  lui        $s7, %hi(_witchitem)
    /* 5C528 8006C528 18FAF726 */  addiu      $s7, $s7, %lo(_witchitem)
    /* 5C52C 8006C52C C0101000 */  sll        $v0, $s0, 3
    /* 5C530 8006C530 23105000 */  subu       $v0, $v0, $s0
    /* 5C534 8006C534 80100200 */  sll        $v0, $v0, 2
    /* 5C538 8006C538 23105000 */  subu       $v0, $v0, $s0
    /* 5C53C 8006C53C 80100200 */  sll        $v0, $v0, 2
    /* 5C540 8006C540 21A05700 */  addu       $s4, $v0, $s7
    /* 5C544 8006C544 21984000 */  addu       $s3, $v0, $zero
  .L8006C548:
    /* 5C548 8006C548 0F00422A */  slti       $v0, $s2, 0xF
    /* 5C54C 8006C54C 53004010 */  beqz       $v0, .L8006C69C
    /* 5C550 8006C550 00000000 */   nop
    /* 5C554 8006C554 3413838F */  lw         $v1, %gp_rel(StorePlrNo)($gp)
    /* 5C558 8006C558 00000000 */  nop
    /* 5C55C 8006C55C 00110300 */  sll        $v0, $v1, 4
    /* 5C560 8006C560 21104300 */  addu       $v0, $v0, $v1
    /* 5C564 8006C564 C0100200 */  sll        $v0, $v0, 3
    /* 5C568 8006C568 23104300 */  subu       $v0, $v0, $v1
    /* 5C56C 8006C56C 00310200 */  sll        $a2, $v0, 4
    /* 5C570 8006C570 21286602 */  addu       $a1, $s3, $a2
    /* 5C574 8006C574 0E80013C */  lui        $at, %hi(_witchitem + 0x2C)
    /* 5C578 8006C578 21082500 */  addu       $at, $at, $a1
    /* 5C57C 8006C57C 44FA2384 */  lh         $v1, %lo(_witchitem + 0x2C)($at)
    /* 5C580 8006C580 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 5C584 8006C584 43006210 */  beq        $v1, $v0, .L8006C694
    /* 5C588 8006C588 00000000 */   nop
    /* 5C58C 8006C58C 0E80013C */  lui        $at, %hi(_witchitem + 0x51)
    /* 5C590 8006C590 21082500 */  addu       $at, $at, $a1
    /* 5C594 8006C594 69FA2380 */  lb         $v1, %lo(_witchitem + 0x51)($at)
    /* 5C598 8006C598 00000000 */  nop
    /* 5C59C 8006C59C 2B100300 */  sltu       $v0, $zero, $v1
    /* 5C5A0 8006C5A0 21804000 */  addu       $s0, $v0, $zero
    /* 5C5A4 8006C5A4 0E80013C */  lui        $at, %hi(_witchitem + 0x66)
    /* 5C5A8 8006C5A8 21082500 */  addu       $at, $at, $a1
    /* 5C5AC 8006C5AC 7EFA2280 */  lb         $v0, %lo(_witchitem + 0x66)($at)
    /* 5C5B0 8006C5B0 00000000 */  nop
    /* 5C5B4 8006C5B4 02004014 */  bnez       $v0, .L8006C5C0
    /* 5C5B8 8006C5B8 21A84002 */   addu      $s5, $s2, $zero
    /* 5C5BC 8006C5BC 02001024 */  addiu      $s0, $zero, 0x2
  .L8006C5C0:
    /* 5C5C0 8006C5C0 06006010 */  beqz       $v1, .L8006C5DC
    /* 5C5C4 8006C5C4 21207702 */   addu      $a0, $s3, $s7
    /* 5C5C8 8006C5C8 0E80013C */  lui        $at, %hi(_witchitem + 0x28)
    /* 5C5CC 8006C5CC 21082500 */  addu       $at, $at, $a1
    /* 5C5D0 8006C5D0 40FA2594 */  lhu        $a1, %lo(_witchitem + 0x28)($at)
    /* 5C5D4 8006C5D4 7BB10108 */  j          .L8006C5EC
    /* 5C5D8 8006C5D8 2120C400 */   addu      $a0, $a2, $a0
  .L8006C5DC:
    /* 5C5DC 8006C5DC 2120C400 */  addu       $a0, $a2, $a0
    /* 5C5E0 8006C5E0 0E80013C */  lui        $at, %hi(_witchitem + 0x26)
    /* 5C5E4 8006C5E4 21082500 */  addu       $at, $at, $a1
    /* 5C5E8 8006C5E8 3EFA2594 */  lhu        $a1, %lo(_witchitem + 0x26)($at)
  .L8006C5EC:
    /* 5C5EC 8006C5EC 6624010C */  jal        MakeItemStr__FP10ItemStructUsUs
    /* 5C5F0 8006C5F0 00010624 */   addiu     $a2, $zero, 0x100
    /* 5C5F4 8006C5F4 21884000 */  addu       $s1, $v0, $zero
    /* 5C5F8 8006C5F8 0C000424 */  addiu      $a0, $zero, 0xC
    /* 5C5FC 8006C5FC 21284002 */  addu       $a1, $s2, $zero
    /* 5C600 8006C600 21300000 */  addu       $a2, $zero, $zero
    /* 5C604 8006C604 01000224 */  addiu      $v0, $zero, 0x1
    /* 5C608 8006C608 21382002 */  addu       $a3, $s1, $zero
    /* 5C60C 8006C60C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 5C610 8006C610 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5C614 8006C614 1400A2AF */   sw        $v0, 0x14($sp)
    /* 5C618 8006C618 3413838F */  lw         $v1, %gp_rel(StorePlrNo)($gp)
    /* 5C61C 8006C61C 21204002 */  addu       $a0, $s2, $zero
    /* 5C620 8006C620 00110300 */  sll        $v0, $v1, 4
    /* 5C624 8006C624 21104300 */  addu       $v0, $v0, $v1
    /* 5C628 8006C628 C0100200 */  sll        $v0, $v0, 3
    /* 5C62C 8006C62C 23104300 */  subu       $v0, $v0, $v1
    /* 5C630 8006C630 00110200 */  sll        $v0, $v0, 4
    /* 5C634 8006C634 21106202 */  addu       $v0, $s3, $v0
    /* 5C638 8006C638 0E80013C */  lui        $at, %hi(_witchitem + 0x18)
    /* 5C63C 8006C63C 21082200 */  addu       $at, $at, $v0
    /* 5C640 8006C640 30FA258C */  lw         $a1, %lo(_witchitem + 0x18)($at)
    /* 5C644 8006C644 70A7010C */  jal        AddSTextVal__Fii
    /* 5C648 8006C648 6C007326 */   addiu     $s3, $s3, 0x6C
    /* 5C64C 8006C64C 0C80043C */  lui        $a0, %hi(MediumFont)
    /* 5C650 8006C650 D8828424 */  addiu      $a0, $a0, %lo(MediumFont)
    /* 5C654 8006C654 1280063C */  lui        $a2, %hi(D_8011C8BC)
    /* 5C658 8006C658 BCC8C624 */  addiu      $a2, $a2, %lo(D_8011C8BC)
    /* 5C65C 8006C65C B229020C */  jal        GetWrap__5CFontPcP4RECT
    /* 5C660 8006C660 21282002 */   addu      $a1, $s1, $zero
    /* 5C664 8006C664 21284202 */  addu       $a1, $s2, $v0
    /* 5C668 8006C668 3413828F */  lw         $v0, %gp_rel(StorePlrNo)($gp)
    /* 5C66C 8006C66C 21300002 */  addu       $a2, $s0, $zero
    /* 5C670 8006C670 00210200 */  sll        $a0, $v0, 4
    /* 5C674 8006C674 21208200 */  addu       $a0, $a0, $v0
    /* 5C678 8006C678 C0200400 */  sll        $a0, $a0, 3
    /* 5C67C 8006C67C 23208200 */  subu       $a0, $a0, $v0
    /* 5C680 8006C680 00210400 */  sll        $a0, $a0, 4
    /* 5C684 8006C684 B3A7010C */  jal        PrintStoreItem__FPC10ItemStructic
    /* 5C688 8006C688 21209400 */   addu      $a0, $a0, $s4
    /* 5C68C 8006C68C 6C009426 */  addiu      $s4, $s4, 0x6C
    /* 5C690 8006C690 202195AF */  sw         $s5, %gp_rel(D_8011C8A0)($gp)
  .L8006C694:
    /* 5C694 8006C694 52B10108 */  j          .L8006C548
    /* 5C698 8006C698 21905602 */   addu      $s2, $s2, $s6
  .L8006C69C:
    /* 5C69C 8006C69C 0421838F */  lw         $v1, %gp_rel(D_8011C884)($gp)
    /* 5C6A0 8006C6A0 00000000 */  nop
    /* 5C6A4 8006C6A4 C0100300 */  sll        $v0, $v1, 3
    /* 5C6A8 8006C6A8 21104300 */  addu       $v0, $v0, $v1
    /* 5C6AC 8006C6AC 80100200 */  sll        $v0, $v0, 2
    /* 5C6B0 8006C6B0 23104300 */  subu       $v0, $v0, $v1
    /* 5C6B4 8006C6B4 80100200 */  sll        $v0, $v0, 2
    /* 5C6B8 8006C6B8 1380013C */  lui        $at, %hi(D_8012EECD)
    /* 5C6BC 8006C6BC 21082200 */  addu       $at, $at, $v0
    /* 5C6C0 8006C6C0 CDEE2290 */  lbu        $v0, %lo(D_8012EECD)($at)
    /* 5C6C4 8006C6C4 00000000 */  nop
    /* 5C6C8 8006C6C8 06004014 */  bnez       $v0, .L8006C6E4
    /* 5C6CC 8006C6CC 16000224 */   addiu     $v0, $zero, 0x16
    /* 5C6D0 8006C6D0 04006210 */  beq        $v1, $v0, .L8006C6E4
    /* 5C6D4 8006C6D4 00000000 */   nop
    /* 5C6D8 8006C6D8 2021828F */  lw         $v0, %gp_rel(D_8011C8A0)($gp)
    /* 5C6DC 8006C6DC 00000000 */  nop
    /* 5C6E0 8006C6E0 042182AF */  sw         $v0, %gp_rel(D_8011C884)($gp)
  .L8006C6E4:
    /* 5C6E4 8006C6E4 3800BF8F */  lw         $ra, 0x38($sp)
    /* 5C6E8 8006C6E8 3400B78F */  lw         $s7, 0x34($sp)
    /* 5C6EC 8006C6EC 3000B68F */  lw         $s6, 0x30($sp)
    /* 5C6F0 8006C6F0 2C00B58F */  lw         $s5, 0x2C($sp)
    /* 5C6F4 8006C6F4 2800B48F */  lw         $s4, 0x28($sp)
    /* 5C6F8 8006C6F8 2400B38F */  lw         $s3, 0x24($sp)
    /* 5C6FC 8006C6FC 2000B28F */  lw         $s2, 0x20($sp)
    /* 5C700 8006C700 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 5C704 8006C704 1800B08F */  lw         $s0, 0x18($sp)
    /* 5C708 8006C708 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 5C70C 8006C70C 0800E003 */  jr         $ra
    /* 5C710 8006C710 00000000 */   nop
endlabel S_ScrollWBuy__Fi
