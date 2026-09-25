.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching S_ScrollSSell__Fi, 0x254

glabel S_ScrollSSell__Fi
    /* 5B4B8 8006B4B8 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 5B4BC 8006B4BC 3000B6AF */  sw         $s6, 0x30($sp)
    /* 5B4C0 8006B4C0 21B08000 */  addu       $s6, $a0, $zero
    /* 5B4C4 8006B4C4 3800BEAF */  sw         $fp, 0x38($sp)
    /* 5B4C8 8006B4C8 08001E24 */  addiu      $fp, $zero, 0x8
    /* 5B4CC 8006B4CC 26218383 */  lb         $v1, %gp_rel(D_8011C8A6)($gp)
    /* 5B4D0 8006B4D0 01000224 */  addiu      $v0, $zero, 0x1
    /* 5B4D4 8006B4D4 3C00BFAF */  sw         $ra, 0x3C($sp)
    /* 5B4D8 8006B4D8 3400B7AF */  sw         $s7, 0x34($sp)
    /* 5B4DC 8006B4DC 2C00B5AF */  sw         $s5, 0x2C($sp)
    /* 5B4E0 8006B4E0 2800B4AF */  sw         $s4, 0x28($sp)
    /* 5B4E4 8006B4E4 2400B3AF */  sw         $s3, 0x24($sp)
    /* 5B4E8 8006B4E8 2000B2AF */  sw         $s2, 0x20($sp)
    /* 5B4EC 8006B4EC 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 5B4F0 8006B4F0 02006214 */  bne        $v1, $v0, .L8006B4FC
    /* 5B4F4 8006B4F4 1800B0AF */   sw        $s0, 0x18($sp)
    /* 5B4F8 8006B4F8 04001E24 */  addiu      $fp, $zero, 0x4
  .L8006B4FC:
    /* 5B4FC 8006B4FC 05000424 */  addiu      $a0, $zero, 0x5
    /* 5B500 8006B500 36A7010C */  jal        ClearSText__Fii
    /* 5B504 8006B504 15000524 */   addiu     $a1, $zero, 0x15
    /* 5B508 8006B508 05000224 */  addiu      $v0, $zero, 0x5
    /* 5B50C 8006B50C 1C2182AF */  sw         $v0, %gp_rel(D_8011C89C)($gp)
    /* 5B510 8006B510 05001424 */  addiu      $s4, $zero, 0x5
    /* 5B514 8006B514 C0101600 */  sll        $v0, $s6, 3
    /* 5B518 8006B518 23105600 */  subu       $v0, $v0, $s6
    /* 5B51C 8006B51C 80100200 */  sll        $v0, $v0, 2
    /* 5B520 8006B520 23105600 */  subu       $v0, $v0, $s6
    /* 5B524 8006B524 80100200 */  sll        $v0, $v0, 2
    /* 5B528 8006B528 0E80083C */  lui        $t0, %hi(storehold)
    /* 5B52C 8006B52C 881D0825 */  addiu      $t0, $t0, %lo(storehold)
    /* 5B530 8006B530 21A84800 */  addu       $s5, $v0, $t0
    /* 5B534 8006B534 21884000 */  addu       $s1, $v0, $zero
  .L8006B538:
    /* 5B538 8006B538 0F00822A */  slti       $v0, $s4, 0xF
    /* 5B53C 8006B53C 56004010 */  beqz       $v0, .L8006B698
    /* 5B540 8006B540 00000000 */   nop
    /* 5B544 8006B544 2821828F */  lw         $v0, %gp_rel(D_8011C8A8)($gp)
    /* 5B548 8006B548 00000000 */  nop
    /* 5B54C 8006B54C 2A10C202 */  slt        $v0, $s6, $v0
    /* 5B550 8006B550 51004010 */  beqz       $v0, .L8006B698
    /* 5B554 8006B554 FFFF0224 */   addiu     $v0, $zero, -0x1
    /* 5B558 8006B558 0E80013C */  lui        $at, %hi(storehold + 0x2C)
    /* 5B55C 8006B55C 21083100 */  addu       $at, $at, $s1
    /* 5B560 8006B560 B41D2384 */  lh         $v1, %lo(storehold + 0x2C)($at)
    /* 5B564 8006B564 00000000 */  nop
    /* 5B568 8006B568 46006210 */  beq        $v1, $v0, .L8006B684
    /* 5B56C 8006B56C 00000000 */   nop
    /* 5B570 8006B570 0E80013C */  lui        $at, %hi(storehold + 0x51)
    /* 5B574 8006B574 21083100 */  addu       $at, $at, $s1
    /* 5B578 8006B578 D91D2380 */  lb         $v1, %lo(storehold + 0x51)($at)
    /* 5B57C 8006B57C 00000000 */  nop
    /* 5B580 8006B580 2B100300 */  sltu       $v0, $zero, $v1
    /* 5B584 8006B584 21804000 */  addu       $s0, $v0, $zero
    /* 5B588 8006B588 02000224 */  addiu      $v0, $zero, 0x2
    /* 5B58C 8006B58C 02006214 */  bne        $v1, $v0, .L8006B598
    /* 5B590 8006B590 21B88002 */   addu      $s7, $s4, $zero
    /* 5B594 8006B594 03001024 */  addiu      $s0, $zero, 0x3
  .L8006B598:
    /* 5B598 8006B598 0E80013C */  lui        $at, %hi(storehold + 0x66)
    /* 5B59C 8006B59C 21083100 */  addu       $at, $at, $s1
    /* 5B5A0 8006B5A0 EE1D2280 */  lb         $v0, %lo(storehold + 0x66)($at)
    /* 5B5A4 8006B5A4 00000000 */  nop
    /* 5B5A8 8006B5A8 02004014 */  bnez       $v0, .L8006B5B4
    /* 5B5AC 8006B5AC 00000000 */   nop
    /* 5B5B0 8006B5B0 02001024 */  addiu      $s0, $zero, 0x2
  .L8006B5B4:
    /* 5B5B4 8006B5B4 14006010 */  beqz       $v1, .L8006B608
    /* 5B5B8 8006B5B8 2120A002 */   addu      $a0, $s5, $zero
    /* 5B5BC 8006B5BC 0E80013C */  lui        $at, %hi(storehold + 0x69)
    /* 5B5C0 8006B5C0 21083100 */  addu       $at, $at, $s1
    /* 5B5C4 8006B5C4 F11D2280 */  lb         $v0, %lo(storehold + 0x69)($at)
    /* 5B5C8 8006B5C8 00000000 */  nop
    /* 5B5CC 8006B5CC 0E004010 */  beqz       $v0, .L8006B608
    /* 5B5D0 8006B5D0 00000000 */   nop
    /* 5B5D4 8006B5D4 0E80083C */  lui        $t0, %hi(storehold)
    /* 5B5D8 8006B5D8 881D0825 */  addiu      $t0, $t0, %lo(storehold)
    /* 5B5DC 8006B5DC 21202802 */  addu       $a0, $s1, $t0
    /* 5B5E0 8006B5E0 0E80013C */  lui        $at, %hi(storehold + 0x28)
    /* 5B5E4 8006B5E4 21083100 */  addu       $at, $at, $s1
    /* 5B5E8 8006B5E8 B01D2594 */  lhu        $a1, %lo(storehold + 0x28)($at)
    /* 5B5EC 8006B5EC 6624010C */  jal        MakeItemStr__FP10ItemStructUsUs
    /* 5B5F0 8006B5F0 00010624 */   addiu     $a2, $zero, 0x100
    /* 5B5F4 8006B5F4 0E80013C */  lui        $at, %hi(storehold + 0x18)
    /* 5B5F8 8006B5F8 21083100 */  addu       $at, $at, $s1
    /* 5B5FC 8006B5FC A01D338C */  lw         $s3, %lo(storehold + 0x18)($at)
    /* 5B600 8006B600 8BAD0108 */  j          .L8006B62C
    /* 5B604 8006B604 21904000 */   addu      $s2, $v0, $zero
  .L8006B608:
    /* 5B608 8006B608 0E80013C */  lui        $at, %hi(storehold + 0x26)
    /* 5B60C 8006B60C 21083100 */  addu       $at, $at, $s1
    /* 5B610 8006B610 AE1D2594 */  lhu        $a1, %lo(storehold + 0x26)($at)
    /* 5B614 8006B614 6624010C */  jal        MakeItemStr__FP10ItemStructUsUs
    /* 5B618 8006B618 00010624 */   addiu     $a2, $zero, 0x100
    /* 5B61C 8006B61C 21904000 */  addu       $s2, $v0, $zero
    /* 5B620 8006B620 0E80013C */  lui        $at, %hi(storehold + 0x14)
    /* 5B624 8006B624 21083100 */  addu       $at, $at, $s1
    /* 5B628 8006B628 9C1D338C */  lw         $s3, %lo(storehold + 0x14)($at)
  .L8006B62C:
    /* 5B62C 8006B62C 0C000424 */  addiu      $a0, $zero, 0xC
    /* 5B630 8006B630 21288002 */  addu       $a1, $s4, $zero
    /* 5B634 8006B634 21300000 */  addu       $a2, $zero, $zero
    /* 5B638 8006B638 01000224 */  addiu      $v0, $zero, 0x1
    /* 5B63C 8006B63C 21384002 */  addu       $a3, $s2, $zero
    /* 5B640 8006B640 1000B0AF */  sw         $s0, 0x10($sp)
    /* 5B644 8006B644 84A7010C */  jal        AddSText__FiiUcPccUc
    /* 5B648 8006B648 1400A2AF */   sw        $v0, 0x14($sp)
    /* 5B64C 8006B64C 21208002 */  addu       $a0, $s4, $zero
    /* 5B650 8006B650 70A7010C */  jal        AddSTextVal__Fii
    /* 5B654 8006B654 21286002 */   addu      $a1, $s3, $zero
    /* 5B658 8006B658 0C80043C */  lui        $a0, %hi(MediumFont)
    /* 5B65C 8006B65C D8828424 */  addiu      $a0, $a0, %lo(MediumFont)
    /* 5B660 8006B660 1280063C */  lui        $a2, %hi(D_8011C8BC)
    /* 5B664 8006B664 BCC8C624 */  addiu      $a2, $a2, %lo(D_8011C8BC)
    /* 5B668 8006B668 B229020C */  jal        GetWrap__5CFontPcP4RECT
    /* 5B66C 8006B66C 21284002 */   addu      $a1, $s2, $zero
    /* 5B670 8006B670 2120A002 */  addu       $a0, $s5, $zero
    /* 5B674 8006B674 21288202 */  addu       $a1, $s4, $v0
    /* 5B678 8006B678 B3A7010C */  jal        PrintStoreItem__FPC10ItemStructic
    /* 5B67C 8006B67C 21300002 */   addu      $a2, $s0, $zero
    /* 5B680 8006B680 202197AF */  sw         $s7, %gp_rel(D_8011C8A0)($gp)
  .L8006B684:
    /* 5B684 8006B684 6C00B526 */  addiu      $s5, $s5, 0x6C
    /* 5B688 8006B688 6C003126 */  addiu      $s1, $s1, 0x6C
    /* 5B68C 8006B68C 0100D626 */  addiu      $s6, $s6, 0x1
    /* 5B690 8006B690 4EAD0108 */  j          .L8006B538
    /* 5B694 8006B694 21A09E02 */   addu      $s4, $s4, $fp
  .L8006B698:
    /* 5B698 8006B698 2821848F */  lw         $a0, %gp_rel(D_8011C8A8)($gp)
    /* 5B69C 8006B69C 20138383 */  lb         $v1, %gp_rel(WStaffFlag)($gp)
    /* 5B6A0 8006B6A0 FEFF8224 */  addiu      $v0, $a0, -0x2
    /* 5B6A4 8006B6A4 182182AF */  sw         $v0, %gp_rel(D_8011C898)($gp)
    /* 5B6A8 8006B6A8 06006014 */  bnez       $v1, .L8006B6C4
    /* 5B6AC 8006B6AC 00000000 */   nop
    /* 5B6B0 8006B6B0 21138283 */  lb         $v0, %gp_rel(WFlag)($gp)
    /* 5B6B4 8006B6B4 00000000 */  nop
    /* 5B6B8 8006B6B8 02004010 */  beqz       $v0, .L8006B6C4
    /* 5B6BC 8006B6BC FDFF8224 */   addiu     $v0, $a0, -0x3
    /* 5B6C0 8006B6C0 182182AF */  sw         $v0, %gp_rel(D_8011C898)($gp)
  .L8006B6C4:
    /* 5B6C4 8006B6C4 1821828F */  lw         $v0, %gp_rel(D_8011C898)($gp)
    /* 5B6C8 8006B6C8 00000000 */  nop
    /* 5B6CC 8006B6CC 02004104 */  bgez       $v0, .L8006B6D8
    /* 5B6D0 8006B6D0 00000000 */   nop
    /* 5B6D4 8006B6D4 182180AF */  sw         $zero, %gp_rel(D_8011C898)($gp)
  .L8006B6D8:
    /* 5B6D8 8006B6D8 3C00BF8F */  lw         $ra, 0x3C($sp)
    /* 5B6DC 8006B6DC 3800BE8F */  lw         $fp, 0x38($sp)
    /* 5B6E0 8006B6E0 3400B78F */  lw         $s7, 0x34($sp)
    /* 5B6E4 8006B6E4 3000B68F */  lw         $s6, 0x30($sp)
    /* 5B6E8 8006B6E8 2C00B58F */  lw         $s5, 0x2C($sp)
    /* 5B6EC 8006B6EC 2800B48F */  lw         $s4, 0x28($sp)
    /* 5B6F0 8006B6F0 2400B38F */  lw         $s3, 0x24($sp)
    /* 5B6F4 8006B6F4 2000B28F */  lw         $s2, 0x20($sp)
    /* 5B6F8 8006B6F8 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 5B6FC 8006B6FC 1800B08F */  lw         $s0, 0x18($sp)
    /* 5B700 8006B700 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 5B704 8006B704 0800E003 */  jr         $ra
    /* 5B708 8006B708 00000000 */   nop
endlabel S_ScrollSSell__Fi
