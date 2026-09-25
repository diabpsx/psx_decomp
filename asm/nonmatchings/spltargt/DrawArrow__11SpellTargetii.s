.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawArrow__11SpellTargetii, 0x27C

glabel DrawArrow__11SpellTargetii
    /* 9F57C 800AF57C 98FFBD27 */  addiu      $sp, $sp, -0x68
    /* 9F580 800AF580 5800B6AF */  sw         $s6, 0x58($sp)
    /* 9F584 800AF584 21B08000 */  addu       $s6, $a0, $zero
    /* 9F588 800AF588 4400B1AF */  sw         $s1, 0x44($sp)
    /* 9F58C 800AF58C 2188A000 */  addu       $s1, $a1, $zero
    /* 9F590 800AF590 4000B0AF */  sw         $s0, 0x40($sp)
    /* 9F594 800AF594 2180C000 */  addu       $s0, $a2, $zero
    /* 9F598 800AF598 5C00B7AF */  sw         $s7, 0x5C($sp)
    /* 9F59C 800AF59C 1E001724 */  addiu      $s7, $zero, 0x1E
    /* 9F5A0 800AF5A0 6400BFAF */  sw         $ra, 0x64($sp)
    /* 9F5A4 800AF5A4 6000BEAF */  sw         $fp, 0x60($sp)
    /* 9F5A8 800AF5A8 5400B5AF */  sw         $s5, 0x54($sp)
    /* 9F5AC 800AF5AC 5000B4AF */  sw         $s4, 0x50($sp)
    /* 9F5B0 800AF5B0 4C00B3AF */  sw         $s3, 0x4C($sp)
    /* 9F5B4 800AF5B4 4800B2AF */  sw         $s2, 0x48($sp)
    /* 9F5B8 800AF5B8 1C00C28E */  lw         $v0, 0x1C($s6)
    /* 9F5BC 800AF5BC 00000000 */  nop
    /* 9F5C0 800AF5C0 02004010 */  beqz       $v0, .L800AF5CC
    /* 9F5C4 800AF5C4 7F001524 */   addiu     $s5, $zero, 0x7F
    /* 9F5C8 800AF5C8 FFFF1524 */  addiu      $s5, $zero, -0x1
  .L800AF5CC:
    /* 9F5CC 800AF5CC 7F001324 */  addiu      $s3, $zero, 0x7F
    /* 9F5D0 800AF5D0 02004010 */  beqz       $v0, .L800AF5DC
    /* 9F5D4 800AF5D4 FFFF1424 */   addiu     $s4, $zero, -0x1
    /* 9F5D8 800AF5D8 7F001424 */  addiu      $s4, $zero, 0x7F
  .L800AF5DC:
    /* 9F5DC 800AF5DC 0000C292 */  lbu        $v0, 0x0($s6)
    /* 9F5E0 800AF5E0 00000000 */  nop
    /* 9F5E4 800AF5E4 05004014 */  bnez       $v0, .L800AF5FC
    /* 9F5E8 800AF5E8 03001E24 */   addiu     $fp, $zero, 0x3
    /* 9F5EC 800AF5EC BBC0020C */  jal        GetOverlayOtBase__7CBlocks_800b02ec
    /* 9F5F0 800AF5F0 FCFF3126 */   addiu     $s1, $s1, -0x4
    /* 9F5F4 800AF5F4 80BD0208 */  j          .L800AF600
    /* 9F5F8 800AF5F8 21F04000 */   addu      $fp, $v0, $zero
  .L800AF5FC:
    /* 9F5FC 800AF5FC FCFF3126 */  addiu      $s1, $s1, -0x4
  .L800AF600:
    /* 9F600 800AF600 04001026 */  addiu      $s0, $s0, 0x4
    /* 9F604 800AF604 07000524 */  addiu      $a1, $zero, 0x7
    /* 9F608 800AF608 0E00C426 */  addiu      $a0, $s6, 0xE
  .L800AF60C:
    /* 9F60C 800AF60C 26008294 */  lhu        $v0, 0x26($a0)
    /* 9F610 800AF610 36008394 */  lhu        $v1, 0x36($a0)
    /* 9F614 800AF614 FFFFA524 */  addiu      $a1, $a1, -0x1
    /* 9F618 800AF618 280082A4 */  sh         $v0, 0x28($a0)
    /* 9F61C 800AF61C 380083A4 */  sh         $v1, 0x38($a0)
    /* 9F620 800AF620 FAFFA01C */  bgtz       $a1, .L800AF60C
    /* 9F624 800AF624 FEFF8424 */   addiu     $a0, $a0, -0x2
    /* 9F628 800AF628 002C1000 */  sll        $a1, $s0, 16
    /* 9F62C 800AF62C 032C0500 */  sra        $a1, $a1, 16
    /* 9F630 800AF630 FF00B532 */  andi       $s5, $s5, 0xFF
    /* 9F634 800AF634 2130A002 */  addu       $a2, $s5, $zero
    /* 9F638 800AF638 FF009432 */  andi       $s4, $s4, 0xFF
    /* 9F63C 800AF63C 1000E226 */  addiu      $v0, $s7, 0x10
    /* 9F640 800AF640 28001224 */  addiu      $s2, $zero, 0x28
    /* 9F644 800AF644 FF007332 */  andi       $s3, $s3, 0xFF
    /* 9F648 800AF648 2800D1A6 */  sh         $s1, 0x28($s6)
    /* 9F64C 800AF64C 2800C486 */  lh         $a0, 0x28($s6)
    /* 9F650 800AF650 21386002 */  addu       $a3, $s3, $zero
    /* 9F654 800AF654 3800D0A6 */  sh         $s0, 0x38($s6)
    /* 9F658 800AF658 01001024 */  addiu      $s0, $zero, 0x1
    /* 9F65C 800AF65C 1000B4AF */  sw         $s4, 0x10($sp)
    /* 9F660 800AF660 1400A2AF */  sw         $v0, 0x14($sp)
    /* 9F664 800AF664 1800B2AF */  sw         $s2, 0x18($sp)
    /* 9F668 800AF668 2000C28E */  lw         $v0, 0x20($s6)
    /* 9F66C 800AF66C 08001124 */  addiu      $s1, $zero, 0x8
    /* 9F670 800AF670 2000A0AF */  sw         $zero, 0x20($sp)
    /* 9F674 800AF674 2400BEAF */  sw         $fp, 0x24($sp)
    /* 9F678 800AF678 2800B0AF */  sw         $s0, 0x28($sp)
    /* 9F67C 800AF67C 2C00B0AF */  sw         $s0, 0x2C($sp)
    /* 9F680 800AF680 3000B1AF */  sw         $s1, 0x30($sp)
    /* 9F684 800AF684 919A020C */  jal        DrawSpinner__FiiUcUcUciiibiT8T8Uc
    /* 9F688 800AF688 1C00A2AF */   sw        $v0, 0x1C($sp)
    /* 9F68C 800AF68C 2130A002 */  addu       $a2, $s5, $zero
    /* 9F690 800AF690 2800C486 */  lh         $a0, 0x28($s6)
    /* 9F694 800AF694 3800C586 */  lh         $a1, 0x38($s6)
    /* 9F698 800AF698 0800E226 */  addiu      $v0, $s7, 0x8
    /* 9F69C 800AF69C 1000B4AF */  sw         $s4, 0x10($sp)
    /* 9F6A0 800AF6A0 1400A2AF */  sw         $v0, 0x14($sp)
    /* 9F6A4 800AF6A4 1800B2AF */  sw         $s2, 0x18($sp)
    /* 9F6A8 800AF6A8 2000C28E */  lw         $v0, 0x20($s6)
    /* 9F6AC 800AF6AC 21386002 */  addu       $a3, $s3, $zero
    /* 9F6B0 800AF6B0 2000A0AF */  sw         $zero, 0x20($sp)
    /* 9F6B4 800AF6B4 2400BEAF */  sw         $fp, 0x24($sp)
    /* 9F6B8 800AF6B8 2800B0AF */  sw         $s0, 0x28($sp)
    /* 9F6BC 800AF6BC 2C00B0AF */  sw         $s0, 0x2C($sp)
    /* 9F6C0 800AF6C0 3000B1AF */  sw         $s1, 0x30($sp)
    /* 9F6C4 800AF6C4 2D004224 */  addiu      $v0, $v0, 0x2D
    /* 9F6C8 800AF6C8 23100200 */  negu       $v0, $v0
    /* 9F6CC 800AF6CC 919A020C */  jal        DrawSpinner__FiiUcUcUciiibiT8T8Uc
    /* 9F6D0 800AF6D0 1C00A2AF */   sw        $v0, 0x1C($sp)
    /* 9F6D4 800AF6D4 1C00C28E */  lw         $v0, 0x1C($s6)
    /* 9F6D8 800AF6D8 00000000 */  nop
    /* 9F6DC 800AF6DC 06004010 */  beqz       $v0, .L800AF6F8
    /* 9F6E0 800AF6E0 FFFF1524 */   addiu     $s5, $zero, -0x1
    /* 9F6E4 800AF6E4 7F001324 */  addiu      $s3, $zero, 0x7F
    /* 9F6E8 800AF6E8 C9F6000C */  jal        ENG_random__Fl
    /* 9F6EC 800AF6EC FF000424 */   addiu     $a0, $zero, 0xFF
    /* 9F6F0 800AF6F0 C3BD0208 */  j          .L800AF70C
    /* 9F6F4 800AF6F4 21A04000 */   addu      $s4, $v0, $zero
  .L800AF6F8:
    /* 9F6F8 800AF6F8 C9F6000C */  jal        ENG_random__Fl
    /* 9F6FC 800AF6FC FF000424 */   addiu     $a0, $zero, 0xFF
    /* 9F700 800AF700 21A84000 */  addu       $s5, $v0, $zero
    /* 9F704 800AF704 7F001324 */  addiu      $s3, $zero, 0x7F
    /* 9F708 800AF708 FFFF1424 */  addiu      $s4, $zero, -0x1
  .L800AF70C:
    /* 9F70C 800AF70C 01001124 */  addiu      $s1, $zero, 0x1
    /* 9F710 800AF710 FF00B532 */  andi       $s5, $s5, 0xFF
    /* 9F714 800AF714 3800B5AF */  sw         $s5, 0x38($sp)
    /* 9F718 800AF718 FF007532 */  andi       $s5, $s3, 0xFF
    /* 9F71C 800AF71C 01001324 */  addiu      $s3, $zero, 0x1
    /* 9F720 800AF720 0200D026 */  addiu      $s0, $s6, 0x2
    /* 9F724 800AF724 03001224 */  addiu      $s2, $zero, 0x3
  .L800AF728:
    /* 9F728 800AF728 1E000224 */  addiu      $v0, $zero, 0x1E
    /* 9F72C 800AF72C 23B85200 */  subu       $s7, $v0, $s2
    /* 9F730 800AF730 28000486 */  lh         $a0, 0x28($s0)
    /* 9F734 800AF734 38000586 */  lh         $a1, 0x38($s0)
    /* 9F738 800AF738 FF008232 */  andi       $v0, $s4, 0xFF
    /* 9F73C 800AF73C 1000A2AF */  sw         $v0, 0x10($sp)
    /* 9F740 800AF740 0C00E226 */  addiu      $v0, $s7, 0xC
    /* 9F744 800AF744 1400A2AF */  sw         $v0, 0x14($sp)
    /* 9F748 800AF748 0500E226 */  addiu      $v0, $s7, 0x5
    /* 9F74C 800AF74C 1800A2AF */  sw         $v0, 0x18($sp)
    /* 9F750 800AF750 01002232 */  andi       $v0, $s1, 0x1
    /* 9F754 800AF754 04004010 */  beqz       $v0, .L800AF768
    /* 9F758 800AF758 00000000 */   nop
    /* 9F75C 800AF75C 2000C28E */  lw         $v0, 0x20($s6)
    /* 9F760 800AF760 DEBD0208 */  j          .L800AF778
    /* 9F764 800AF764 40100200 */   sll       $v0, $v0, 1
  .L800AF768:
    /* 9F768 800AF768 2000C28E */  lw         $v0, 0x20($s6)
    /* 9F76C 800AF76C 00000000 */  nop
    /* 9F770 800AF770 23100200 */  negu       $v0, $v0
    /* 9F774 800AF774 40100200 */  sll        $v0, $v0, 1
  .L800AF778:
    /* 9F778 800AF778 1C00A2AF */  sw         $v0, 0x1C($sp)
    /* 9F77C 800AF77C 2138A002 */  addu       $a3, $s5, $zero
    /* 9F780 800AF780 3800A68F */  lw         $a2, 0x38($sp)
    /* 9F784 800AF784 08000224 */  addiu      $v0, $zero, 0x8
    /* 9F788 800AF788 2000A0AF */  sw         $zero, 0x20($sp)
    /* 9F78C 800AF78C 2400BEAF */  sw         $fp, 0x24($sp)
    /* 9F790 800AF790 2800B3AF */  sw         $s3, 0x28($sp)
    /* 9F794 800AF794 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 9F798 800AF798 919A020C */  jal        DrawSpinner__FiiUcUcUciiibiT8T8Uc
    /* 9F79C 800AF79C 3000A2AF */   sw        $v0, 0x30($sp)
    /* 9F7A0 800AF7A0 02001026 */  addiu      $s0, $s0, 0x2
    /* 9F7A4 800AF7A4 01003126 */  addiu      $s1, $s1, 0x1
    /* 9F7A8 800AF7A8 0800222A */  slti       $v0, $s1, 0x8
    /* 9F7AC 800AF7AC DEFF4014 */  bnez       $v0, .L800AF728
    /* 9F7B0 800AF7B0 03005226 */   addiu     $s2, $s2, 0x3
    /* 9F7B4 800AF7B4 2000C28E */  lw         $v0, 0x20($s6)
    /* 9F7B8 800AF7B8 00000000 */  nop
    /* 9F7BC 800AF7BC 01004224 */  addiu      $v0, $v0, 0x1
    /* 9F7C0 800AF7C0 2000C2AE */  sw         $v0, 0x20($s6)
    /* 9F7C4 800AF7C4 6400BF8F */  lw         $ra, 0x64($sp)
    /* 9F7C8 800AF7C8 6000BE8F */  lw         $fp, 0x60($sp)
    /* 9F7CC 800AF7CC 5C00B78F */  lw         $s7, 0x5C($sp)
    /* 9F7D0 800AF7D0 5800B68F */  lw         $s6, 0x58($sp)
    /* 9F7D4 800AF7D4 5400B58F */  lw         $s5, 0x54($sp)
    /* 9F7D8 800AF7D8 5000B48F */  lw         $s4, 0x50($sp)
    /* 9F7DC 800AF7DC 4C00B38F */  lw         $s3, 0x4C($sp)
    /* 9F7E0 800AF7E0 4800B28F */  lw         $s2, 0x48($sp)
    /* 9F7E4 800AF7E4 4400B18F */  lw         $s1, 0x44($sp)
    /* 9F7E8 800AF7E8 4000B08F */  lw         $s0, 0x40($sp)
    /* 9F7EC 800AF7EC 6800BD27 */  addiu      $sp, $sp, 0x68
    /* 9F7F0 800AF7F0 0800E003 */  jr         $ra
    /* 9F7F4 800AF7F4 00000000 */   nop
endlabel DrawArrow__11SpellTargetii
