.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_L2Pass3__Fv, 0x1F8

glabel DRLG_L2Pass3__Fv
    /* C9F8 801465F0 0D80023C */  lui        $v0, %hi(pMegaTiles + 0x58)
    /* C9FC 801465F4 04ED4284 */  lh         $v0, %lo(pMegaTiles + 0x58)($v0)
    /* CA00 801465F8 0D80033C */  lui        $v1, %hi(pMegaTiles + 0x5A)
    /* CA04 801465FC 06ED6384 */  lh         $v1, %lo(pMegaTiles + 0x5A)($v1)
    /* CA08 80146600 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* CA0C 80146604 2000B2AF */  sw         $s2, 0x20($sp)
    /* CA10 80146608 21900000 */  addu       $s2, $zero, $zero
    /* CA14 8014660C 3C00BFAF */  sw         $ra, 0x3C($sp)
    /* CA18 80146610 3800BEAF */  sw         $fp, 0x38($sp)
    /* CA1C 80146614 3400B7AF */  sw         $s7, 0x34($sp)
    /* CA20 80146618 3000B6AF */  sw         $s6, 0x30($sp)
    /* CA24 8014661C 2C00B5AF */  sw         $s5, 0x2C($sp)
    /* CA28 80146620 2800B4AF */  sw         $s4, 0x28($sp)
    /* CA2C 80146624 2400B3AF */  sw         $s3, 0x24($sp)
    /* CA30 80146628 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* CA34 8014662C 1800B0AF */  sw         $s0, 0x18($sp)
    /* CA38 80146630 01004724 */  addiu      $a3, $v0, 0x1
    /* CA3C 80146634 01007624 */  addiu      $s6, $v1, 0x1
    /* CA40 80146638 00A40700 */  sll        $s4, $a3, 16
    /* CA44 8014663C 0D80023C */  lui        $v0, %hi(pMegaTiles + 0x5C)
    /* CA48 80146640 08ED4284 */  lh         $v0, %lo(pMegaTiles + 0x5C)($v0)
    /* CA4C 80146644 0D80033C */  lui        $v1, %hi(pMegaTiles + 0x5E)
    /* CA50 80146648 0AED6384 */  lh         $v1, %lo(pMegaTiles + 0x5E)($v1)
    /* CA54 8014664C 01005524 */  addiu      $s5, $v0, 0x1
    /* CA58 80146650 01007724 */  addiu      $s7, $v1, 0x1
  .L80146654:
    /* CA5C 80146654 21880000 */  addu       $s1, $zero, $zero
    /* CA60 80146658 01005326 */  addiu      $s3, $s2, 0x1
    /* CA64 8014665C 21202002 */  addu       $a0, $s1, $zero
  .L80146660:
    /* CA68 80146660 21284002 */  addu       $a1, $s2, $zero
    /* CA6C 80146664 B30A020C */  jal        SetDPiece__Fiis
    /* CA70 80146668 03341400 */   sra       $a2, $s4, 16
    /* CA74 8014666C 01003026 */  addiu      $s0, $s1, 0x1
    /* CA78 80146670 21200002 */  addu       $a0, $s0, $zero
    /* CA7C 80146674 21284002 */  addu       $a1, $s2, $zero
    /* CA80 80146678 00341600 */  sll        $a2, $s6, 16
    /* CA84 8014667C B30A020C */  jal        SetDPiece__Fiis
    /* CA88 80146680 03340600 */   sra       $a2, $a2, 16
    /* CA8C 80146684 21202002 */  addu       $a0, $s1, $zero
    /* CA90 80146688 21286002 */  addu       $a1, $s3, $zero
    /* CA94 8014668C 00341500 */  sll        $a2, $s5, 16
    /* CA98 80146690 B30A020C */  jal        SetDPiece__Fiis
    /* CA9C 80146694 03340600 */   sra       $a2, $a2, 16
    /* CAA0 80146698 21200002 */  addu       $a0, $s0, $zero
    /* CAA4 8014669C 21286002 */  addu       $a1, $s3, $zero
    /* CAA8 801466A0 00341700 */  sll        $a2, $s7, 16
    /* CAAC 801466A4 B30A020C */  jal        SetDPiece__Fiis
    /* CAB0 801466A8 03340600 */   sra       $a2, $a2, 16
    /* CAB4 801466AC 02003126 */  addiu      $s1, $s1, 0x2
    /* CAB8 801466B0 6000222A */  slti       $v0, $s1, 0x60
    /* CABC 801466B4 EAFF4014 */  bnez       $v0, .L80146660
    /* CAC0 801466B8 21202002 */   addu      $a0, $s1, $zero
    /* CAC4 801466BC 02005226 */  addiu      $s2, $s2, 0x2
    /* CAC8 801466C0 6000422A */  slti       $v0, $s2, 0x60
    /* CACC 801466C4 E3FF4014 */  bnez       $v0, .L80146654
    /* CAD0 801466C8 21F00000 */   addu      $fp, $zero, $zero
    /* CAD4 801466CC 10001224 */  addiu      $s2, $zero, 0x10
  .L801466D0:
    /* CAD8 801466D0 10001124 */  addiu      $s1, $zero, 0x10
    /* CADC 801466D4 21A00000 */  addu       $s4, $zero, $zero
    /* CAE0 801466D8 01004826 */  addiu      $t0, $s2, 0x1
    /* CAE4 801466DC 1000A8AF */  sw         $t0, 0x10($sp)
    /* CAE8 801466E0 0E80133C */  lui        $s3, %hi(dungeon)
    /* CAEC 801466E4 C4407326 */  addiu      $s3, $s3, %lo(dungeon)
  .L801466E8:
    /* CAF0 801466E8 21202002 */  addu       $a0, $s1, $zero
    /* CAF4 801466EC 21284002 */  addu       $a1, $s2, $zero
    /* CAF8 801466F0 40101E00 */  sll        $v0, $fp, 1
    /* CAFC 801466F4 21105300 */  addu       $v0, $v0, $s3
    /* CB00 801466F8 60007326 */  addiu      $s3, $s3, 0x60
    /* CB04 801466FC 01009426 */  addiu      $s4, $s4, 0x1
    /* CB08 80146700 00004294 */  lhu        $v0, 0x0($v0)
    /* CB0C 80146704 0D80083C */  lui        $t0, %hi(pMegaTiles)
    /* CB10 80146708 ACEC0825 */  addiu      $t0, $t0, %lo(pMegaTiles)
    /* CB14 8014670C FFFF4224 */  addiu      $v0, $v0, -0x1
    /* CB18 80146710 C0100200 */  sll        $v0, $v0, 3
    /* CB1C 80146714 21184800 */  addu       $v1, $v0, $t0
    /* CB20 80146718 21300201 */  addu       $a2, $t0, $v0
    /* CB24 8014671C 00006384 */  lh         $v1, 0x0($v1)
    /* CB28 80146720 0200C684 */  lh         $a2, 0x2($a2)
    /* CB2C 80146724 01006724 */  addiu      $a3, $v1, 0x1
    /* CB30 80146728 0100D624 */  addiu      $s6, $a2, 0x1
    /* CB34 8014672C 21180201 */  addu       $v1, $t0, $v0
    /* CB38 80146730 0D80083C */  lui        $t0, %hi(pMegaTiles + 0x6)
    /* CB3C 80146734 B2EC0825 */  addiu      $t0, $t0, %lo(pMegaTiles + 0x6)
    /* CB40 80146738 21104800 */  addu       $v0, $v0, $t0
    /* CB44 8014673C 00340700 */  sll        $a2, $a3, 16
    /* CB48 80146740 03340600 */  sra        $a2, $a2, 16
    /* CB4C 80146744 04006384 */  lh         $v1, 0x4($v1)
    /* CB50 80146748 00004284 */  lh         $v0, 0x0($v0)
    /* CB54 8014674C 01007524 */  addiu      $s5, $v1, 0x1
    /* CB58 80146750 B30A020C */  jal        SetDPiece__Fiis
    /* CB5C 80146754 01005724 */   addiu     $s7, $v0, 0x1
    /* CB60 80146758 01003026 */  addiu      $s0, $s1, 0x1
    /* CB64 8014675C 21200002 */  addu       $a0, $s0, $zero
    /* CB68 80146760 21284002 */  addu       $a1, $s2, $zero
    /* CB6C 80146764 00341600 */  sll        $a2, $s6, 16
    /* CB70 80146768 B30A020C */  jal        SetDPiece__Fiis
    /* CB74 8014676C 03340600 */   sra       $a2, $a2, 16
    /* CB78 80146770 21202002 */  addu       $a0, $s1, $zero
    /* CB7C 80146774 00341500 */  sll        $a2, $s5, 16
    /* CB80 80146778 1000A58F */  lw         $a1, 0x10($sp)
    /* CB84 8014677C B30A020C */  jal        SetDPiece__Fiis
    /* CB88 80146780 03340600 */   sra       $a2, $a2, 16
    /* CB8C 80146784 21200002 */  addu       $a0, $s0, $zero
    /* CB90 80146788 00341700 */  sll        $a2, $s7, 16
    /* CB94 8014678C 1000A58F */  lw         $a1, 0x10($sp)
    /* CB98 80146790 B30A020C */  jal        SetDPiece__Fiis
    /* CB9C 80146794 03340600 */   sra       $a2, $a2, 16
    /* CBA0 80146798 2800822A */  slti       $v0, $s4, 0x28
    /* CBA4 8014679C D2FF4014 */  bnez       $v0, .L801466E8
    /* CBA8 801467A0 02003126 */   addiu     $s1, $s1, 0x2
    /* CBAC 801467A4 0100DE27 */  addiu      $fp, $fp, 0x1
    /* CBB0 801467A8 2800C22B */  slti       $v0, $fp, 0x28
    /* CBB4 801467AC C8FF4014 */  bnez       $v0, .L801466D0
    /* CBB8 801467B0 02005226 */   addiu     $s2, $s2, 0x2
    /* CBBC 801467B4 3C00BF8F */  lw         $ra, 0x3C($sp)
    /* CBC0 801467B8 3800BE8F */  lw         $fp, 0x38($sp)
    /* CBC4 801467BC 3400B78F */  lw         $s7, 0x34($sp)
    /* CBC8 801467C0 3000B68F */  lw         $s6, 0x30($sp)
    /* CBCC 801467C4 2C00B58F */  lw         $s5, 0x2C($sp)
    /* CBD0 801467C8 2800B48F */  lw         $s4, 0x28($sp)
    /* CBD4 801467CC 2400B38F */  lw         $s3, 0x24($sp)
    /* CBD8 801467D0 2000B28F */  lw         $s2, 0x20($sp)
    /* CBDC 801467D4 1C00B18F */  lw         $s1, 0x1C($sp)
    /* CBE0 801467D8 1800B08F */  lw         $s0, 0x18($sp)
    /* CBE4 801467DC 4000BD27 */  addiu      $sp, $sp, 0x40
    /* CBE8 801467E0 0800E003 */  jr         $ra
    /* CBEC 801467E4 00000000 */   nop
endlabel DRLG_L2Pass3__Fv
