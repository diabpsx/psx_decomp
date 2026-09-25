.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PM_DoWalk__FP12PlayerStruct, 0x210

glabel PM_DoWalk__FP12PlayerStruct
    /* 52618 80062618 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 5261C 8006261C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 52620 80062620 21808000 */  addu       $s0, $a0, $zero
    /* 52624 80062624 03000224 */  addiu      $v0, $zero, 0x3
    /* 52628 80062628 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 5262C 8006262C 1800B2AF */  sw         $s2, 0x18($sp)
    /* 52630 80062630 1400B1AF */  sw         $s1, 0x14($sp)
    /* 52634 80062634 2800118E */  lw         $s1, 0x28($s0)
    /* 52638 80062638 5400048E */  lw         $a0, 0x54($s0)
    /* 5263C 8006263C 2C00128E */  lw         $s2, 0x2C($s0)
    /* 52640 80062640 0C008210 */  beq        $a0, $v0, .L80062674
    /* 52644 80062644 08000224 */   addiu     $v0, $zero, 0x8
    /* 52648 80062648 9401038E */  lw         $v1, 0x194($s0)
    /* 5264C 8006264C 00000000 */  nop
    /* 52650 80062650 06006214 */  bne        $v1, $v0, .L8006266C
    /* 52654 80062654 04000224 */   addiu     $v0, $zero, 0x4
    /* 52658 80062658 07000224 */  addiu      $v0, $zero, 0x7
    /* 5265C 8006265C 05008210 */  beq        $a0, $v0, .L80062674
    /* 52660 80062660 21280000 */   addu      $a1, $zero, $zero
    /* 52664 80062664 A2890108 */  j          .L80062688
    /* 52668 80062668 00000000 */   nop
  .L8006266C:
    /* 5266C 8006266C 06008214 */  bne        $a0, $v0, .L80062688
    /* 52670 80062670 21280000 */   addu      $a1, $zero, $zero
  .L80062674:
    /* 52674 80062674 30000586 */  lh         $a1, 0x30($s0)
    /* 52678 80062678 32000686 */  lh         $a2, 0x32($s0)
    /* 5267C 8006267C E1F5000C */  jal        PlaySfxLoc__Fiii
    /* 52680 80062680 21200000 */   addu      $a0, $zero, $zero
    /* 52684 80062684 21280000 */  addu       $a1, $zero, $zero
  .L80062688:
    /* 52688 80062688 5B000482 */  lb         $a0, 0x5B($s0)
    /* 5268C 8006268C EE34010C */  jal        ChangeLightOff__Fiii
    /* 52690 80062690 21300000 */   addu      $a2, $zero, $zero
    /* 52694 80062694 21200002 */  addu       $a0, $s0, $zero
    /* 52698 80062698 56010386 */  lh         $v1, 0x156($s0)
    /* 5269C 8006269C 2800028E */  lw         $v0, 0x28($s0)
    /* 526A0 800626A0 2C00068E */  lw         $a2, 0x2C($s0)
    /* 526A4 800626A4 21104300 */  addu       $v0, $v0, $v1
    /* 526A8 800626A8 280002AE */  sw         $v0, 0x28($s0)
    /* 526AC 800626AC 58010286 */  lh         $v0, 0x158($s0)
    /* 526B0 800626B0 2800058E */  lw         $a1, 0x28($s0)
    /* 526B4 800626B4 2130C200 */  addu       $a2, $a2, $v0
    /* 526B8 800626B8 E899010C */  jal        WorldToOffset__FP12PlayerStructii
    /* 526BC 800626BC 2C0006AE */   sw        $a2, 0x2C($s0)
    /* 526C0 800626C0 30000586 */  lh         $a1, 0x30($s0)
    /* 526C4 800626C4 32000686 */  lh         $a2, 0x32($s0)
    /* 526C8 800626C8 1D95010C */  jal        PosOkPlayer__FP12PlayerStructii
    /* 526CC 800626CC 21200002 */   addu      $a0, $s0, $zero
    /* 526D0 800626D0 FF004230 */  andi       $v0, $v0, 0xFF
    /* 526D4 800626D4 13004014 */  bnez       $v0, .L80062724
    /* 526D8 800626D8 21200002 */   addu      $a0, $s0, $zero
    /* 526DC 800626DC 21282002 */  addu       $a1, $s1, $zero
    /* 526E0 800626E0 E899010C */  jal        WorldToOffset__FP12PlayerStructii
    /* 526E4 800626E4 21304002 */   addu      $a2, $s2, $zero
    /* 526E8 800626E8 04000382 */  lb         $v1, 0x4($s0)
    /* 526EC 800626EC FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 526F0 800626F0 05006210 */  beq        $v1, $v0, .L80062708
    /* 526F4 800626F4 00000000 */   nop
    /* 526F8 800626F8 A783010C */  jal        StartWalkStand__FP12PlayerStruct
    /* 526FC 800626FC 21200002 */   addu      $a0, $s0, $zero
    /* 52700 80062700 C5890108 */  j          .L80062714
    /* 52704 80062704 00000000 */   nop
  .L80062708:
    /* 52708 80062708 5A010586 */  lh         $a1, 0x15A($s0)
    /* 5270C 8006270C 8483010C */  jal        StartStand__FP12PlayerStructi
    /* 52710 80062710 21200002 */   addu      $a0, $s0, $zero
  .L80062714:
    /* 52714 80062714 8E7F010C */  jal        ClearPlrPVars__FP12PlayerStruct
    /* 52718 80062718 21200002 */   addu      $a0, $s0, $zero
    /* 5271C 8006271C 038A0108 */  j          .L8006280C
    /* 52720 80062720 01000224 */   addiu     $v0, $zero, 0x1
  .L80062724:
    /* 52724 80062724 0E80023C */  lui        $v0, %hi(plr + 0x1D)
    /* 52728 80062728 55A54290 */  lbu        $v0, %lo(plr + 0x1D)($v0)
    /* 5272C 8006272C 00000000 */  nop
    /* 52730 80062730 29004010 */  beqz       $v0, .L800627D8
    /* 52734 80062734 00000000 */   nop
    /* 52738 80062738 0E80023C */  lui        $v0, %hi(plr + 0x1A05)
    /* 5273C 8006273C 3DBF4290 */  lbu        $v0, %lo(plr + 0x1A05)($v0)
    /* 52740 80062740 00000000 */  nop
    /* 52744 80062744 24004010 */  beqz       $v0, .L800627D8
    /* 52748 80062748 00000000 */   nop
    /* 5274C 8006274C 0E80043C */  lui        $a0, %hi(plr + 0x28)
    /* 52750 80062750 60A5848C */  lw         $a0, %lo(plr + 0x28)($a0)
    /* 52754 80062754 0E80053C */  lui        $a1, %hi(plr + 0x2C)
    /* 52758 80062758 64A5A58C */  lw         $a1, %lo(plr + 0x2C)($a1)
    /* 5275C 8006275C 0E80063C */  lui        $a2, %hi(plr + 0x1A10)
    /* 52760 80062760 48BFC68C */  lw         $a2, %lo(plr + 0x1A10)($a2)
    /* 52764 80062764 0E80073C */  lui        $a3, %hi(plr + 0x1A14)
    /* 52768 80062768 4CBFE78C */  lw         $a3, %lo(plr + 0x1A14)($a3)
    /* 5276C 8006276C 5A89010C */  jal        ChkPlrOffsets__Fiiii
    /* 52770 80062770 00000000 */   nop
    /* 52774 80062774 FF004230 */  andi       $v0, $v0, 0xFF
    /* 52778 80062778 17004014 */  bnez       $v0, .L800627D8
    /* 5277C 8006277C 21200002 */   addu      $a0, $s0, $zero
    /* 52780 80062780 21282002 */  addu       $a1, $s1, $zero
    /* 52784 80062784 E899010C */  jal        WorldToOffset__FP12PlayerStructii
    /* 52788 80062788 21304002 */   addu      $a2, $s2, $zero
    /* 5278C 8006278C 04000382 */  lb         $v1, 0x4($s0)
    /* 52790 80062790 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 52794 80062794 05006210 */  beq        $v1, $v0, .L800627AC
    /* 52798 80062798 00000000 */   nop
    /* 5279C 8006279C A783010C */  jal        StartWalkStand__FP12PlayerStruct
    /* 527A0 800627A0 21200002 */   addu      $a0, $s0, $zero
    /* 527A4 800627A4 EE890108 */  j          .L800627B8
    /* 527A8 800627A8 00000000 */   nop
  .L800627AC:
    /* 527AC 800627AC 5A010586 */  lh         $a1, 0x15A($s0)
    /* 527B0 800627B0 8483010C */  jal        StartStand__FP12PlayerStructi
    /* 527B4 800627B4 21200002 */   addu      $a0, $s0, $zero
  .L800627B8:
    /* 527B8 800627B8 8E7F010C */  jal        ClearPlrPVars__FP12PlayerStruct
    /* 527BC 800627BC 21200002 */   addu      $a0, $s0, $zero
    /* 527C0 800627C0 5B000482 */  lb         $a0, 0x5B($s0)
    /* 527C4 800627C4 21280000 */  addu       $a1, $zero, $zero
    /* 527C8 800627C8 EE34010C */  jal        ChangeLightOff__Fiii
    /* 527CC 800627CC 21300000 */   addu      $a2, $zero, $zero
    /* 527D0 800627D0 038A0108 */  j          .L8006280C
    /* 527D4 800627D4 01000224 */   addiu     $v0, $zero, 0x1
  .L800627D8:
    /* 527D8 800627D8 CE83010C */  jal        PM_ChangeOffset__FP12PlayerStruct
    /* 527DC 800627DC 21200002 */   addu      $a0, $s0, $zero
    /* 527E0 800627E0 5B000482 */  lb         $a0, 0x5B($s0)
    /* 527E4 800627E4 30000586 */  lh         $a1, 0x30($s0)
    /* 527E8 800627E8 32000686 */  lh         $a2, 0x32($s0)
    /* 527EC 800627EC E134010C */  jal        ChangeLightXY__Fiii
    /* 527F0 800627F0 00000000 */   nop
    /* 527F4 800627F4 5C000482 */  lb         $a0, 0x5C($s0)
    /* 527F8 800627F8 30000586 */  lh         $a1, 0x30($s0)
    /* 527FC 800627FC 32000686 */  lh         $a2, 0x32($s0)
    /* 52800 80062800 B435010C */  jal        ChangeVisionXY__Fiii
    /* 52804 80062804 00000000 */   nop
    /* 52808 80062808 21100000 */  addu       $v0, $zero, $zero
  .L8006280C:
    /* 5280C 8006280C 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 52810 80062810 1800B28F */  lw         $s2, 0x18($sp)
    /* 52814 80062814 1400B18F */  lw         $s1, 0x14($sp)
    /* 52818 80062818 1000B08F */  lw         $s0, 0x10($sp)
    /* 5281C 8006281C 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 52820 80062820 0800E003 */  jr         $ra
    /* 52824 80062824 00000000 */   nop
endlabel PM_DoWalk__FP12PlayerStruct
