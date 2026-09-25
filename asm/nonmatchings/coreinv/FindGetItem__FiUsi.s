.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FindGetItem__FiUsi, 0xB4

glabel FindGetItem__FiUsi
    /* 7271C 8008271C F8FFBD27 */  addiu      $sp, $sp, -0x8
    /* 72720 80082720 1280023C */  lui        $v0, %hi(numitems)
    /* 72724 80082724 88B8428C */  lw         $v0, %lo(numitems)($v0)
    /* 72728 80082728 00000000 */  nop
    /* 7272C 8008272C 24004018 */  blez       $v0, .L800827C0
    /* 72730 80082730 21400000 */   addu      $t0, $zero, $zero
    /* 72734 80082734 FFFFA530 */  andi       $a1, $a1, 0xFFFF
    /* 72738 80082738 21484000 */  addu       $t1, $v0, $zero
  .L8008273C:
    /* 7273C 8008273C 0D80013C */  lui        $at, %hi(itemactive)
    /* 72740 80082740 21082800 */  addu       $at, $at, $t0
    /* 72744 80082744 54532780 */  lb         $a3, %lo(itemactive)($at)
    /* 72748 80082748 00000000 */  nop
    /* 7274C 8008274C C0100700 */  sll        $v0, $a3, 3
    /* 72750 80082750 23104700 */  subu       $v0, $v0, $a3
    /* 72754 80082754 80100200 */  sll        $v0, $v0, 2
    /* 72758 80082758 23104700 */  subu       $v0, $v0, $a3
    /* 7275C 8008275C 80180200 */  sll        $v1, $v0, 2
    /* 72760 80082760 0D80013C */  lui        $at, %hi(item + 0x2E)
    /* 72764 80082764 21082300 */  addu       $at, $at, $v1
    /* 72768 80082768 821D2284 */  lh         $v0, %lo(item + 0x2E)($at)
    /* 7276C 8008276C 00000000 */  nop
    /* 72770 80082770 0F004414 */  bne        $v0, $a0, .L800827B0
    /* 72774 80082774 00000000 */   nop
    /* 72778 80082778 0D80013C */  lui        $at, %hi(item + 0x10)
    /* 7277C 8008277C 21082300 */  addu       $at, $at, $v1
    /* 72780 80082780 641D228C */  lw         $v0, %lo(item + 0x10)($at)
    /* 72784 80082784 00000000 */  nop
    /* 72788 80082788 09004614 */  bne        $v0, $a2, .L800827B0
    /* 7278C 8008278C 00000000 */   nop
    /* 72790 80082790 0D80013C */  lui        $at, %hi(item + 0x24)
    /* 72794 80082794 21082300 */  addu       $at, $at, $v1
    /* 72798 80082798 781D2294 */  lhu        $v0, %lo(item + 0x24)($at)
    /* 7279C 8008279C 00000000 */  nop
    /* 727A0 800827A0 04004514 */  bne        $v0, $a1, .L800827B4
    /* 727A4 800827A4 01000825 */   addiu     $t0, $t0, 0x1
    /* 727A8 800827A8 F1090208 */  j          .L800827C4
    /* 727AC 800827AC 2110E000 */   addu      $v0, $a3, $zero
  .L800827B0:
    /* 727B0 800827B0 01000825 */  addiu      $t0, $t0, 0x1
  .L800827B4:
    /* 727B4 800827B4 2A100901 */  slt        $v0, $t0, $t1
    /* 727B8 800827B8 E0FF4014 */  bnez       $v0, .L8008273C
    /* 727BC 800827BC 00000000 */   nop
  .L800827C0:
    /* 727C0 800827C0 FFFF0224 */  addiu      $v0, $zero, -0x1
  .L800827C4:
    /* 727C4 800827C4 0800BD27 */  addiu      $sp, $sp, 0x8
    /* 727C8 800827C8 0800E003 */  jr         $ra
    /* 727CC 800827CC 00000000 */   nop
endlabel FindGetItem__FiUsi
