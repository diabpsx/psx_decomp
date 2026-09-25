.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CheckNewPath__FP12PlayerStruct, 0x4C0

glabel CheckNewPath__FP12PlayerStruct
    /* 546A8 800646A8 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 546AC 800646AC 2800B2AF */  sw         $s2, 0x28($sp)
    /* 546B0 800646B0 21908000 */  addu       $s2, $a0, $zero
    /* 546B4 800646B4 2C00BFAF */  sw         $ra, 0x2C($sp)
    /* 546B8 800646B8 2400B1AF */  sw         $s1, 0x24($sp)
    /* 546BC 800646BC 2000B0AF */  sw         $s0, 0x20($sp)
    /* 546C0 800646C0 04004482 */  lb         $a0, 0x4($s2)
    /* 546C4 800646C4 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 546C8 800646C8 20018214 */  bne        $a0, $v0, .L80064B4C
    /* 546CC 800646CC 00000000 */   nop
    /* 546D0 800646D0 1E004282 */  lb         $v0, 0x1E($s2)
    /* 546D4 800646D4 00000000 */  nop
    /* 546D8 800646D8 1C014410 */  beq        $v0, $a0, .L80064B4C
    /* 546DC 800646DC 21184000 */   addu      $v1, $v0, $zero
    /* 546E0 800646E0 F7FF6224 */  addiu      $v0, $v1, -0x9
    /* 546E4 800646E4 00160200 */  sll        $v0, $v0, 24
    /* 546E8 800646E8 031E0200 */  sra        $v1, $v0, 24
    /* 546EC 800646EC 1200622C */  sltiu      $v0, $v1, 0x12
    /* 546F0 800646F0 14014010 */  beqz       $v0, .L80064B44
    /* 546F4 800646F4 80100300 */   sll       $v0, $v1, 2
    /* 546F8 800646F8 1180013C */  lui        $at, %hi(jtbl_8011786C)
    /* 546FC 800646FC 21082200 */  addu       $at, $at, $v0
    /* 54700 80064700 6C78228C */  lw         $v0, %lo(jtbl_8011786C)($at)
    /* 54704 80064704 00000000 */  nop
    /* 54708 80064708 08004000 */  jr         $v0
    /* 5470C 8006470C 00000000 */   nop
  jlabel .L80064710
    /* 54710 80064710 30004486 */  lh         $a0, 0x30($s2)
    /* 54714 80064714 32004586 */  lh         $a1, 0x32($s2)
    /* 54718 80064718 1F004682 */  lb         $a2, 0x1F($s2)
    /* 5471C 8006471C 20004782 */  lb         $a3, 0x20($s2)
    /* 54720 80064720 8AF6000C */  jal        GetDirection__Fiiii
    /* 54724 80064724 00000000 */   nop
    /* 54728 80064728 21204002 */  addu       $a0, $s2, $zero
    /* 5472C 8006472C D983010C */  jal        StartAttack__FP12PlayerStructi
    /* 54730 80064730 21284000 */   addu      $a1, $v0, $zero
    /* 54734 80064734 D2920108 */  j          .L80064B48
    /* 54738 80064738 FFFF0224 */   addiu     $v0, $zero, -0x1
  jlabel .L8006473C
    /* 5473C 8006473C 30004486 */  lh         $a0, 0x30($s2)
    /* 54740 80064740 32004586 */  lh         $a1, 0x32($s2)
    /* 54744 80064744 1F004682 */  lb         $a2, 0x1F($s2)
    /* 54748 80064748 20004782 */  lb         $a3, 0x20($s2)
    /* 5474C 8006474C 8AF6000C */  jal        GetDirection__Fiiii
    /* 54750 80064750 00000000 */   nop
    /* 54754 80064754 21204002 */  addu       $a0, $s2, $zero
    /* 54758 80064758 1F004682 */  lb         $a2, 0x1F($s2)
    /* 5475C 8006475C 20004782 */  lb         $a3, 0x20($s2)
    /* 54760 80064760 5084010C */  jal        StartSpell__FP12PlayerStructiii
    /* 54764 80064764 21284000 */   addu      $a1, $v0, $zero
    /* 54768 80064768 21004292 */  lbu        $v0, 0x21($s2)
    /* 5476C 8006476C 2C920108 */  j          .L800648B0
    /* 54770 80064770 00160200 */   sll       $v0, $v0, 24
  jlabel .L80064774
    /* 54774 80064774 0E80043C */  lui        $a0, %hi(plr)
    /* 54778 80064778 38A58424 */  addiu      $a0, $a0, %lo(plr)
    /* 5477C 8006477C 26204402 */  xor        $a0, $s2, $a0
    /* 54780 80064780 21004582 */  lb         $a1, 0x21($s2)
    /* 54784 80064784 1F004682 */  lb         $a2, 0x1F($s2)
    /* 54788 80064788 20004782 */  lb         $a3, 0x20($s2)
    /* 5478C 8006478C E99B010C */  jal        StartSpell__Fiiii
    /* 54790 80064790 2B200400 */   sltu      $a0, $zero, $a0
    /* 54794 80064794 21004392 */  lbu        $v1, 0x21($s2)
    /* 54798 80064798 22004292 */  lbu        $v0, 0x22($s2)
    /* 5479C 8006479C 001E0300 */  sll        $v1, $v1, 24
    /* 547A0 800647A0 031E0300 */  sra        $v1, $v1, 24
    /* 547A4 800647A4 00160200 */  sll        $v0, $v0, 24
    /* 547A8 800647A8 03160200 */  sra        $v0, $v0, 24
    /* 547AC 800647AC 5A0143A6 */  sh         $v1, 0x15A($s2)
    /* 547B0 800647B0 D1920108 */  j          .L80064B44
    /* 547B4 800647B4 5C0142A6 */   sh        $v0, 0x15C($s2)
  jlabel .L800647B8
    /* 547B8 800647B8 1F005182 */  lb         $s1, 0x1F($s2)
    /* 547BC 800647BC 30004486 */  lh         $a0, 0x30($s2)
    /* 547C0 800647C0 32004586 */  lh         $a1, 0x32($s2)
    /* 547C4 800647C4 40801100 */  sll        $s0, $s1, 1
    /* 547C8 800647C8 21801102 */  addu       $s0, $s0, $s1
    /* 547CC 800647CC 80801000 */  sll        $s0, $s0, 2
    /* 547D0 800647D0 21801102 */  addu       $s0, $s0, $s1
    /* 547D4 800647D4 C0801000 */  sll        $s0, $s0, 3
    /* 547D8 800647D8 1080013C */  lui        $at, %hi(monster + 0x36)
    /* 547DC 800647DC 21083000 */  addu       $at, $at, $s0
    /* 547E0 800647E0 CA532680 */  lb         $a2, %lo(monster + 0x36)($at)
    /* 547E4 800647E4 1080013C */  lui        $at, %hi(monster + 0x37)
    /* 547E8 800647E8 21083000 */  addu       $at, $at, $s0
    /* 547EC 800647EC CB532780 */  lb         $a3, %lo(monster + 0x37)($at)
    /* 547F0 800647F0 8AF6000C */  jal        GetDirection__Fiiii
    /* 547F4 800647F4 00000000 */   nop
    /* 547F8 800647F8 21884000 */  addu       $s1, $v0, $zero
    /* 547FC 800647FC 787F010C */  jal        plrind__FP12PlayerStruct
    /* 54800 80064800 21204002 */   addu      $a0, $s2, $zero
    /* 54804 80064804 1080013C */  lui        $at, %hi(monster + 0x36)
    /* 54808 80064808 21083000 */  addu       $at, $at, $s0
    /* 5480C 8006480C CA532680 */  lb         $a2, %lo(monster + 0x36)($at)
    /* 54810 80064810 1080013C */  lui        $at, %hi(monster + 0x37)
    /* 54814 80064814 21083000 */  addu       $at, $at, $s0
    /* 54818 80064818 CB532780 */  lb         $a3, %lo(monster + 0x37)($at)
    /* 5481C 8006481C 27920108 */  j          .L8006489C
    /* 54820 80064820 21204000 */   addu      $a0, $v0, $zero
  jlabel .L80064824
    /* 54824 80064824 1F005182 */  lb         $s1, 0x1F($s2)
    /* 54828 80064828 30004486 */  lh         $a0, 0x30($s2)
    /* 5482C 8006482C 32004586 */  lh         $a1, 0x32($s2)
    /* 54830 80064830 40801100 */  sll        $s0, $s1, 1
    /* 54834 80064834 21801102 */  addu       $s0, $s0, $s1
    /* 54838 80064838 80801000 */  sll        $s0, $s0, 2
    /* 5483C 8006483C 21801102 */  addu       $s0, $s0, $s1
    /* 54840 80064840 00811000 */  sll        $s0, $s0, 4
    /* 54844 80064844 23801102 */  subu       $s0, $s0, $s1
    /* 54848 80064848 80801000 */  sll        $s0, $s0, 2
    /* 5484C 8006484C 21801102 */  addu       $s0, $s0, $s1
    /* 54850 80064850 C0801000 */  sll        $s0, $s0, 3
    /* 54854 80064854 0E80013C */  lui        $at, %hi(plr + 0x30)
    /* 54858 80064858 21083000 */  addu       $at, $at, $s0
    /* 5485C 8006485C 68A52684 */  lh         $a2, %lo(plr + 0x30)($at)
    /* 54860 80064860 0E80013C */  lui        $at, %hi(plr + 0x32)
    /* 54864 80064864 21083000 */  addu       $at, $at, $s0
    /* 54868 80064868 6AA52784 */  lh         $a3, %lo(plr + 0x32)($at)
    /* 5486C 8006486C 8AF6000C */  jal        GetDirection__Fiiii
    /* 54870 80064870 00000000 */   nop
    /* 54874 80064874 21884000 */  addu       $s1, $v0, $zero
    /* 54878 80064878 787F010C */  jal        plrind__FP12PlayerStruct
    /* 5487C 8006487C 21204002 */   addu      $a0, $s2, $zero
    /* 54880 80064880 21204000 */  addu       $a0, $v0, $zero
    /* 54884 80064884 0E80013C */  lui        $at, %hi(plr + 0x30)
    /* 54888 80064888 21083000 */  addu       $at, $at, $s0
    /* 5488C 8006488C 68A52684 */  lh         $a2, %lo(plr + 0x30)($at)
    /* 54890 80064890 0E80013C */  lui        $at, %hi(plr + 0x32)
    /* 54894 80064894 21083000 */  addu       $at, $at, $s0
    /* 54898 80064898 6AA52784 */  lh         $a3, %lo(plr + 0x32)($at)
  .L8006489C:
    /* 5489C 8006489C E99B010C */  jal        StartSpell__Fiiii
    /* 548A0 800648A0 21282002 */   addu      $a1, $s1, $zero
    /* 548A4 800648A4 20004292 */  lbu        $v0, 0x20($s2)
    /* 548A8 800648A8 00000000 */  nop
    /* 548AC 800648AC 00160200 */  sll        $v0, $v0, 24
  .L800648B0:
    /* 548B0 800648B0 03160200 */  sra        $v0, $v0, 24
    /* 548B4 800648B4 D1920108 */  j          .L80064B44
    /* 548B8 800648B8 5C0142A6 */   sh        $v0, 0x15C($s2)
  jlabel .L800648BC
    /* 548BC 800648BC 1F004582 */  lb         $a1, 0x1F($s2)
    /* 548C0 800648C0 38920108 */  j          .L800648E0
    /* 548C4 800648C4 21204002 */   addu      $a0, $s2, $zero
  jlabel .L800648C8
    /* 548C8 800648C8 1F005082 */  lb         $s0, 0x1F($s2)
    /* 548CC 800648CC 21204002 */  addu       $a0, $s2, $zero
    /* 548D0 800648D0 C19A010C */  jal        TryDisarm__FP12PlayerStructi
    /* 548D4 800648D4 21280002 */   addu      $a1, $s0, $zero
    /* 548D8 800648D8 21204002 */  addu       $a0, $s2, $zero
    /* 548DC 800648DC 21280002 */  addu       $a1, $s0, $zero
  .L800648E0:
    /* 548E0 800648E0 B09A010C */  jal        OperateObject__FP12PlayerStructiUc
    /* 548E4 800648E4 21300000 */   addu      $a2, $zero, $zero
    /* 548E8 800648E8 D2920108 */  j          .L80064B48
    /* 548EC 800648EC FFFF0224 */   addiu     $v0, $zero, -0x1
  jlabel .L800648F0
    /* 548F0 800648F0 1F005082 */  lb         $s0, 0x1F($s2)
    /* 548F4 800648F4 00000000 */  nop
    /* 548F8 800648F8 40101000 */  sll        $v0, $s0, 1
    /* 548FC 800648FC 21105000 */  addu       $v0, $v0, $s0
    /* 54900 80064900 80100200 */  sll        $v0, $v0, 2
    /* 54904 80064904 23105000 */  subu       $v0, $v0, $s0
    /* 54908 80064908 80100200 */  sll        $v0, $v0, 2
    /* 5490C 8006490C 0E80013C */  lui        $at, %hi(object + 0x22)
    /* 54910 80064910 21082200 */  addu       $at, $at, $v0
    /* 54914 80064914 6E8C2380 */  lb         $v1, %lo(object + 0x22)($at)
    /* 54918 80064918 01000224 */  addiu      $v0, $zero, 0x1
    /* 5491C 8006491C 89006210 */  beq        $v1, $v0, .L80064B44
    /* 54920 80064920 21280002 */   addu      $a1, $s0, $zero
    /* 54924 80064924 21204002 */  addu       $a0, $s2, $zero
    /* 54928 80064928 B09A010C */  jal        OperateObject__FP12PlayerStructiUc
    /* 5492C 8006492C 01000624 */   addiu     $a2, $zero, 0x1
    /* 54930 80064930 D2920108 */  j          .L80064B48
    /* 54934 80064934 FFFF0224 */   addiu     $v0, $zero, -0x1
  jlabel .L80064938
    /* 54938 80064938 1F005182 */  lb         $s1, 0x1F($s2)
    /* 5493C 8006493C 00000000 */  nop
    /* 54940 80064940 C0101100 */  sll        $v0, $s1, 3
    /* 54944 80064944 23105100 */  subu       $v0, $v0, $s1
    /* 54948 80064948 80100200 */  sll        $v0, $v0, 2
    /* 5494C 8006494C 23105100 */  subu       $v0, $v0, $s1
    /* 54950 80064950 80800200 */  sll        $s0, $v0, 2
    /* 54954 80064954 30004286 */  lh         $v0, 0x30($s2)
    /* 54958 80064958 0D80013C */  lui        $at, %hi(item + 0x52)
    /* 5495C 8006495C 21083000 */  addu       $at, $at, $s0
    /* 54960 80064960 A61D2480 */  lb         $a0, %lo(item + 0x52)($at)
    /* 54964 80064964 6D41000C */  jal        abs
    /* 54968 80064968 23204400 */   subu      $a0, $v0, $a0
    /* 5496C 8006496C 32004286 */  lh         $v0, 0x32($s2)
    /* 54970 80064970 0D80013C */  lui        $at, %hi(item + 0x53)
    /* 54974 80064974 21083000 */  addu       $at, $at, $s0
    /* 54978 80064978 A71D2480 */  lb         $a0, %lo(item + 0x53)($at)
    /* 5497C 8006497C 6D41000C */  jal        abs
    /* 54980 80064980 23204400 */   subu      $a0, $v0, $a0
    /* 54984 80064984 0D80013C */  lui        $at, %hi(item + 0x5E)
    /* 54988 80064988 21083000 */  addu       $at, $at, $s0
    /* 5498C 8006498C B21D2280 */  lb         $v0, %lo(item + 0x5E)($at)
    /* 54990 80064990 00000000 */  nop
    /* 54994 80064994 6C004014 */  bnez       $v0, .L80064B48
    /* 54998 80064998 FFFF0224 */   addiu     $v0, $zero, -0x1
    /* 5499C 8006499C 01000424 */  addiu      $a0, $zero, 0x1
    /* 549A0 800649A0 27000524 */  addiu      $a1, $zero, 0x27
    /* 549A4 800649A4 88128693 */  lbu        $a2, %gp_rel(myplr)($gp)
    /* 549A8 800649A8 FF002232 */  andi       $v0, $s1, 0xFF
    /* 549AC 800649AC 1000A2AF */  sw         $v0, 0x10($sp)
    /* 549B0 800649B0 4F3E010C */  jal        NetSendCmdGItem__FUcUcUcUcUc
    /* 549B4 800649B4 2138C000 */   addu      $a3, $a2, $zero
    /* 549B8 800649B8 01000224 */  addiu      $v0, $zero, 0x1
    /* 549BC 800649BC 0D80013C */  lui        $at, %hi(item + 0x5E)
    /* 549C0 800649C0 21083000 */  addu       $at, $at, $s0
    /* 549C4 800649C4 B21D22A0 */  sb         $v0, %lo(item + 0x5E)($at)
    /* 549C8 800649C8 D2920108 */  j          .L80064B48
    /* 549CC 800649CC FFFF0224 */   addiu     $v0, $zero, -0x1
  jlabel .L800649D0
    /* 549D0 800649D0 1F005182 */  lb         $s1, 0x1F($s2)
    /* 549D4 800649D4 30004286 */  lh         $v0, 0x30($s2)
    /* 549D8 800649D8 C0801100 */  sll        $s0, $s1, 3
    /* 549DC 800649DC 23801102 */  subu       $s0, $s0, $s1
    /* 549E0 800649E0 80801000 */  sll        $s0, $s0, 2
    /* 549E4 800649E4 23801102 */  subu       $s0, $s0, $s1
    /* 549E8 800649E8 80801000 */  sll        $s0, $s0, 2
    /* 549EC 800649EC 0D80013C */  lui        $at, %hi(item + 0x52)
    /* 549F0 800649F0 21083000 */  addu       $at, $at, $s0
    /* 549F4 800649F4 A61D2480 */  lb         $a0, %lo(item + 0x52)($at)
    /* 549F8 800649F8 6D41000C */  jal        abs
    /* 549FC 800649FC 23204400 */   subu      $a0, $v0, $a0
    /* 54A00 80064A00 32004286 */  lh         $v0, 0x32($s2)
    /* 54A04 80064A04 0D80013C */  lui        $at, %hi(item + 0x53)
    /* 54A08 80064A08 21083000 */  addu       $at, $at, $s0
    /* 54A0C 80064A0C A71D2480 */  lb         $a0, %lo(item + 0x53)($at)
    /* 54A10 80064A10 6D41000C */  jal        abs
    /* 54A14 80064A14 23204400 */   subu      $a0, $v0, $a0
    /* 54A18 80064A18 01000424 */  addiu      $a0, $zero, 0x1
    /* 54A1C 80064A1C 28000524 */  addiu      $a1, $zero, 0x28
    /* 54A20 80064A20 88128693 */  lbu        $a2, %gp_rel(myplr)($gp)
    /* 54A24 80064A24 FF002232 */  andi       $v0, $s1, 0xFF
    /* 54A28 80064A28 1000A2AF */  sw         $v0, 0x10($sp)
    /* 54A2C 80064A2C 4F3E010C */  jal        NetSendCmdGItem__FUcUcUcUcUc
    /* 54A30 80064A30 2138C000 */   addu      $a3, $a2, $zero
    /* 54A34 80064A34 D2920108 */  j          .L80064B48
    /* 54A38 80064A38 FFFF0224 */   addiu     $v0, $zero, -0x1
  jlabel .L80064A3C
    /* 54A3C 80064A3C 1280023C */  lui        $v0, %hi(stextflag)
    /* 54A40 80064A40 E0BA4280 */  lb         $v0, %lo(stextflag)($v0)
    /* 54A44 80064A44 00000000 */  nop
    /* 54A48 80064A48 3F004014 */  bnez       $v0, .L80064B48
    /* 54A4C 80064A4C FFFF0224 */   addiu     $v0, $zero, -0x1
    /* 54A50 80064A50 1280023C */  lui        $v0, %hi(leveltype)
    /* 54A54 80064A54 0DC14290 */  lbu        $v0, %lo(leveltype)($v0)
    /* 54A58 80064A58 1F005182 */  lb         $s1, 0x1F($s2)
    /* 54A5C 80064A5C 1F004010 */  beqz       $v0, .L80064ADC
    /* 54A60 80064A60 0F000224 */   addiu     $v0, $zero, 0xF
    /* 54A64 80064A64 1280033C */  lui        $v1, %hi(currlevel)
    /* 54A68 80064A68 0CC16390 */  lbu        $v1, %lo(currlevel)($v1)
    /* 54A6C 80064A6C 00000000 */  nop
    /* 54A70 80064A70 06006214 */  bne        $v1, $v0, .L80064A8C
    /* 54A74 80064A74 40101100 */   sll       $v0, $s1, 1
    /* 54A78 80064A78 1280023C */  lui        $v0, %hi(setlevel)
    /* 54A7C 80064A7C 0EC14290 */  lbu        $v0, %lo(setlevel)($v0)
    /* 54A80 80064A80 00000000 */  nop
    /* 54A84 80064A84 18004014 */  bnez       $v0, .L80064AE8
    /* 54A88 80064A88 40101100 */   sll       $v0, $s1, 1
  .L80064A8C:
    /* 54A8C 80064A8C 21105100 */  addu       $v0, $v0, $s1
    /* 54A90 80064A90 80100200 */  sll        $v0, $v0, 2
    /* 54A94 80064A94 21105100 */  addu       $v0, $v0, $s1
    /* 54A98 80064A98 C0100200 */  sll        $v0, $v0, 3
    /* 54A9C 80064A9C 1080013C */  lui        $at, %hi(monster)
    /* 54AA0 80064AA0 21082200 */  addu       $at, $at, $v0
    /* 54AA4 80064AA4 9453238C */  lw         $v1, %lo(monster)($at)
    /* 54AA8 80064AA8 00000000 */  nop
    /* 54AAC 80064AAC 0E006010 */  beqz       $v1, .L80064AE8
    /* 54AB0 80064AB0 24000224 */   addiu     $v0, $zero, 0x24
    /* 54AB4 80064AB4 0C006210 */  beq        $v1, $v0, .L80064AE8
    /* 54AB8 80064AB8 00000000 */   nop
    /* 54ABC 80064ABC 7759050C */  jal        func_801565DC
    /* 54AC0 80064AC0 21202002 */   addu      $a0, $s1, $zero
    /* 54AC4 80064AC4 787F010C */  jal        plrind__FP12PlayerStruct
    /* 54AC8 80064AC8 21204002 */   addu      $a0, $s2, $zero
    /* 54ACC 80064ACC 1280013C */  lui        $at, %hi(options_pad)
    /* 54AD0 80064AD0 50B222AC */  sw         $v0, %lo(options_pad)($at)
    /* 54AD4 80064AD4 BA920108 */  j          .L80064AE8
    /* 54AD8 80064AD8 00000000 */   nop
  .L80064ADC:
    /* 54ADC 80064ADC 21204002 */  addu       $a0, $s2, $zero
    /* 54AE0 80064AE0 CE9A010C */  jal        TalkToTowner__FP12PlayerStructi
    /* 54AE4 80064AE4 21282002 */   addu      $a1, $s1, $zero
  .L80064AE8:
    /* 54AE8 80064AE8 1280033C */  lui        $v1, %hi(options_pad)
    /* 54AEC 80064AEC 50B2638C */  lw         $v1, %lo(options_pad)($v1)
    /* 54AF0 80064AF0 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 54AF4 80064AF4 0F006214 */  bne        $v1, $v0, .L80064B34
    /* 54AF8 80064AF8 00000000 */   nop
    /* 54AFC 80064AFC 1280023C */  lui        $v0, %hi(qtextflag)
    /* 54B00 80064B00 60B94290 */  lbu        $v0, %lo(qtextflag)($v0)
    /* 54B04 80064B04 00000000 */  nop
    /* 54B08 80064B08 0A004014 */  bnez       $v0, .L80064B34
    /* 54B0C 80064B0C 00000000 */   nop
    /* 54B10 80064B10 1280023C */  lui        $v0, %hi(stextflag)
    /* 54B14 80064B14 E0BA4280 */  lb         $v0, %lo(stextflag)($v0)
    /* 54B18 80064B18 00000000 */  nop
    /* 54B1C 80064B1C 05004014 */  bnez       $v0, .L80064B34
    /* 54B20 80064B20 FFFF0224 */   addiu     $v0, $zero, -0x1
    /* 54B24 80064B24 1280013C */  lui        $at, %hi(options_pad)
    /* 54B28 80064B28 50B223AC */  sw         $v1, %lo(options_pad)($at)
    /* 54B2C 80064B2C D2920108 */  j          .L80064B48
    /* 54B30 80064B30 00000000 */   nop
  .L80064B34:
    /* 54B34 80064B34 787F010C */  jal        plrind__FP12PlayerStruct
    /* 54B38 80064B38 21204002 */   addu      $a0, $s2, $zero
    /* 54B3C 80064B3C 1280013C */  lui        $at, %hi(options_pad)
    /* 54B40 80064B40 50B222AC */  sw         $v0, %lo(options_pad)($at)
  jlabel .L80064B44
    /* 54B44 80064B44 FFFF0224 */  addiu      $v0, $zero, -0x1
  .L80064B48:
    /* 54B48 80064B48 1E0042A2 */  sb         $v0, 0x1E($s2)
  .L80064B4C:
    /* 54B4C 80064B4C 2C00BF8F */  lw         $ra, 0x2C($sp)
    /* 54B50 80064B50 2800B28F */  lw         $s2, 0x28($sp)
    /* 54B54 80064B54 2400B18F */  lw         $s1, 0x24($sp)
    /* 54B58 80064B58 2000B08F */  lw         $s0, 0x20($sp)
    /* 54B5C 80064B5C 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 54B60 80064B60 0800E003 */  jr         $ra
    /* 54B64 80064B64 00000000 */   nop
endlabel CheckNewPath__FP12PlayerStruct
