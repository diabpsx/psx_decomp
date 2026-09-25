.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ReadPad__Fi, 0x188

glabel ReadPad__Fi
    /* 7463C 8008463C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 74640 80084640 1400B1AF */  sw         $s1, 0x14($sp)
    /* 74644 80084644 21888000 */  addu       $s1, $a0, $zero
    /* 74648 80084648 0D80053C */  lui        $a1, %hi(FeNewP1NameMenu)
    /* 7464C 8008464C F0D6A524 */  addiu      $a1, $a1, %lo(FeNewP1NameMenu)
    /* 74650 80084650 0D80063C */  lui        $a2, %hi(FeNewP1ClassMenu)
    /* 74654 80084654 D4D6C624 */  addiu      $a2, $a2, %lo(FeNewP1ClassMenu)
    /* 74658 80084658 0D80073C */  lui        $a3, %hi(FeNewP2NameMenu)
    /* 7465C 8008465C 28D7E724 */  addiu      $a3, $a3, %lo(FeNewP2NameMenu)
    /* 74660 80084660 0D80083C */  lui        $t0, %hi(FeNewP2ClassMenu)
    /* 74664 80084664 0CD70825 */  addiu      $t0, $t0, %lo(FeNewP2ClassMenu)
    /* 74668 80084668 8C03838F */  lw         $v1, %gp_rel(DaveDebCount)($gp)
    /* 7466C 8008466C 1280043C */  lui        $a0, %hi(FeCurMenu)
    /* 74670 80084670 94B3848C */  lw         $a0, %lo(FeCurMenu)($a0)
    /* 74674 80084674 0D80093C */  lui        $t1, %hi(FeDifficultyMenu)
    /* 74678 80084678 44D72925 */  addiu      $t1, $t1, %lo(FeDifficultyMenu)
    /* 7467C 8008467C 1800BFAF */  sw         $ra, 0x18($sp)
    /* 74680 80084680 1000B0AF */  sw         $s0, 0x10($sp)
    /* 74684 80084684 01006224 */  addiu      $v0, $v1, 0x1
    /* 74688 80084688 10006328 */  slti       $v1, $v1, 0x10
    /* 7468C 8008468C 8C0382AF */  sw         $v0, %gp_rel(DaveDebCount)($gp)
    /* 74690 80084690 05006014 */  bnez       $v1, .L800846A8
    /* 74694 80084694 00000000 */   nop
    /* 74698 80084698 94038297 */  lhu        $v0, %gp_rel(DavesPadDeb)($gp)
    /* 7469C 8008469C 8C0380AF */  sw         $zero, %gp_rel(DaveDebCount)($gp)
    /* 746A0 800846A0 F0FF4230 */  andi       $v0, $v0, 0xFFF0
    /* 746A4 800846A4 940382A7 */  sh         $v0, %gp_rel(DavesPadDeb)($gp)
  .L800846A8:
    /* 746A8 800846A8 1280023C */  lui        $v0, %hi(CDWAIT)
    /* 746AC 800846AC ECAD428C */  lw         $v0, %lo(CDWAIT)($v0)
    /* 746B0 800846B0 00000000 */  nop
    /* 746B4 800846B4 3D004014 */  bnez       $v0, .L800847AC
    /* 746B8 800846B8 00000000 */   nop
    /* 746BC 800846BC 1280023C */  lui        $v0, %hi(FeFlag)
    /* 746C0 800846C0 74B34290 */  lbu        $v0, %lo(FeFlag)($v0)
    /* 746C4 800846C4 00000000 */  nop
    /* 746C8 800846C8 26004010 */  beqz       $v0, .L80084764
    /* 746CC 800846CC 00000000 */   nop
    /* 746D0 800846D0 03008510 */  beq        $a0, $a1, .L800846E0
    /* 746D4 800846D4 00000000 */   nop
    /* 746D8 800846D8 03008614 */  bne        $a0, $a2, .L800846E8
    /* 746DC 800846DC 00000000 */   nop
  .L800846E0:
    /* 746E0 800846E0 BF110208 */  j          .L800846FC
    /* 746E4 800846E4 21200000 */   addu      $a0, $zero, $zero
  .L800846E8:
    /* 746E8 800846E8 03008710 */  beq        $a0, $a3, .L800846F8
    /* 746EC 800846EC 00000000 */   nop
    /* 746F0 800846F0 10008814 */  bne        $a0, $t0, .L80084734
    /* 746F4 800846F4 00000000 */   nop
  .L800846F8:
    /* 746F8 800846F8 01000424 */  addiu      $a0, $zero, 0x1
  .L800846FC:
    /* 746FC 800846FC FD25020C */  jal        PAD_GetPad__FiUc
    /* 74700 80084700 21280000 */   addu      $a1, $zero, $zero
    /* 74704 80084704 21804000 */  addu       $s0, $v0, $zero
    /* 74708 80084708 1016020C */  jal        CheckActive__4CPad
    /* 7470C 8008470C 21200002 */   addu      $a0, $s0, $zero
    /* 74710 80084710 FF004230 */  andi       $v0, $v0, 0xFF
    /* 74714 80084714 19004014 */  bnez       $v0, .L8008477C
    /* 74718 80084718 00000000 */   nop
    /* 7471C 8008471C 920380A7 */  sh         $zero, %gp_rel(DavesPad)($gp)
    /* 74720 80084720 940380A7 */  sh         $zero, %gp_rel(DavesPadDeb)($gp)
    /* 74724 80084724 B426020C */  jal        Flush__4CPad
    /* 74728 80084728 21200002 */   addu      $a0, $s0, $zero
    /* 7472C 8008472C EB110208 */  j          .L800847AC
    /* 74730 80084730 00000000 */   nop
  .L80084734:
    /* 74734 80084734 08008914 */  bne        $a0, $t1, .L80084758
    /* 74738 80084738 00000000 */   nop
    /* 7473C 8008473C 1280023C */  lui        $v0, %hi(FePlayerNo)
    /* 74740 80084740 78B3428C */  lw         $v0, %lo(FePlayerNo)($v0)
    /* 74744 80084744 00000000 */  nop
    /* 74748 80084748 03004014 */  bnez       $v0, .L80084758
    /* 7474C 8008474C 00000000 */   nop
    /* 74750 80084750 DB110208 */  j          .L8008476C
    /* 74754 80084754 21200000 */   addu      $a0, $zero, $zero
  .L80084758:
    /* 74758 80084758 21200000 */  addu       $a0, $zero, $zero
    /* 7475C 8008475C DC110208 */  j          .L80084770
    /* 74760 80084760 01000524 */   addiu     $a1, $zero, 0x1
  .L80084764:
    /* 74764 80084764 1280043C */  lui        $a0, %hi(options_pad)
    /* 74768 80084768 50B2848C */  lw         $a0, %lo(options_pad)($a0)
  .L8008476C:
    /* 7476C 8008476C 21280000 */  addu       $a1, $zero, $zero
  .L80084770:
    /* 74770 80084770 FD25020C */  jal        PAD_GetPad__FiUc
    /* 74774 80084774 00000000 */   nop
    /* 74778 80084778 21804000 */  addu       $s0, $v0, $zero
  .L8008477C:
    /* 7477C 8008477C 0616020C */  jal        GetCur__C4CPad_80085818
    /* 74780 80084780 21200002 */   addu      $a0, $s0, $zero
    /* 74784 80084784 FFFF4230 */  andi       $v0, $v0, 0xFFFF
    /* 74788 80084788 94038397 */  lhu        $v1, %gp_rel(DavesPadDeb)($gp)
    /* 7478C 8008478C 24205100 */  and        $a0, $v0, $s1
    /* 74790 80084790 940384A7 */  sh         $a0, %gp_rel(DavesPadDeb)($gp)
    /* 74794 80084794 27180300 */  nor        $v1, $zero, $v1
    /* 74798 80084798 24184300 */  and        $v1, $v0, $v1
    /* 7479C 8008479C 920383A7 */  sh         $v1, %gp_rel(DavesPad)($gp)
    /* 747A0 800847A0 02004014 */  bnez       $v0, .L800847AC
    /* 747A4 800847A4 00000000 */   nop
    /* 747A8 800847A8 8C0380AF */  sw         $zero, %gp_rel(DaveDebCount)($gp)
  .L800847AC:
    /* 747AC 800847AC 1800BF8F */  lw         $ra, 0x18($sp)
    /* 747B0 800847B0 1400B18F */  lw         $s1, 0x14($sp)
    /* 747B4 800847B4 1000B08F */  lw         $s0, 0x10($sp)
    /* 747B8 800847B8 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 747BC 800847BC 0800E003 */  jr         $ra
    /* 747C0 800847C0 00000000 */   nop
endlabel ReadPad__Fi
