.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawCutScreen__Fi, 0x43C

glabel DrawCutScreen__Fi
    /* 94654 800A4654 80FFBD27 */  addiu      $sp, $sp, -0x80
    /* 94658 800A4658 2800A427 */  addiu      $a0, $sp, 0x28
    /* 9465C 800A465C 7C00BFAF */  sw         $ra, 0x7C($sp)
    /* 94660 800A4660 7800BEAF */  sw         $fp, 0x78($sp)
    /* 94664 800A4664 7400B7AF */  sw         $s7, 0x74($sp)
    /* 94668 800A4668 7000B6AF */  sw         $s6, 0x70($sp)
    /* 9466C 800A466C 6C00B5AF */  sw         $s5, 0x6C($sp)
    /* 94670 800A4670 6800B4AF */  sw         $s4, 0x68($sp)
    /* 94674 800A4674 6400B3AF */  sw         $s3, 0x64($sp)
    /* 94678 800A4678 6000B2AF */  sw         $s2, 0x60($sp)
    /* 9467C 800A467C 5C00B1AF */  sw         $s1, 0x5C($sp)
    /* 94680 800A4680 D793020C */  jal        __6Dialog_800a4f5c
    /* 94684 800A4684 5800B0AF */   sw        $s0, 0x58($sp)
    /* 94688 800A4688 F793020C */  jal        GetOverlayOtBase__7CBlocks_800a4fdc
    /* 9468C 800A468C 00011024 */   addiu     $s0, $zero, 0x100
    /* 94690 800A4690 5A020424 */  addiu      $a0, $zero, 0x25A
    /* 94694 800A4694 4AED010C */  jal        GetStr__Fi
    /* 94698 800A4698 08005324 */   addiu     $s3, $v0, 0x8
    /* 9469C 800A469C 0C80043C */  lui        $a0, %hi(MediumFont)
    /* 946A0 800A46A0 D8828424 */  addiu      $a0, $a0, %lo(MediumFont)
    /* 946A4 800A46A4 A92A020C */  jal        GetStrWidth__5CFontPc
    /* 946A8 800A46A8 21284000 */   addu      $a1, $v0, $zero
    /* 946AC 800A46AC 2800A427 */  addiu      $a0, $sp, 0x28
    /* 946B0 800A46B0 64000524 */  addiu      $a1, $zero, 0x64
    /* 946B4 800A46B4 23800202 */  subu       $s0, $s0, $v0
    /* 946B8 800A46B8 C2171000 */  srl        $v0, $s0, 31
    /* 946BC 800A46BC 21800202 */  addu       $s0, $s0, $v0
    /* 946C0 800A46C0 43801000 */  sra        $s0, $s0, 1
    /* 946C4 800A46C4 8A34020C */  jal        SetOTpos__6Dialogi
    /* 946C8 800A46C8 20001026 */   addiu     $s0, $s0, 0x20
    /* 946CC 800A46CC 0C80043C */  lui        $a0, %hi(MediumFont)
    /* 946D0 800A46D0 D8828424 */  addiu      $a0, $a0, %lo(MediumFont)
    /* 946D4 800A46D4 64000524 */  addiu      $a1, $zero, 0x64
    /* 946D8 800A46D8 E82A020C */  jal        SetOTpos__5CFonti
    /* 946DC 800A46DC 4000A2AF */   sw        $v0, 0x40($sp)
    /* 946E0 800A46E0 5A020424 */  addiu      $a0, $zero, 0x25A
    /* 946E4 800A46E4 4AED010C */  jal        GetStr__Fi
    /* 946E8 800A46E8 4800A2AF */   sw        $v0, 0x48($sp)
    /* 946EC 800A46EC 0C80043C */  lui        $a0, %hi(MediumFont)
    /* 946F0 800A46F0 D8828424 */  addiu      $a0, $a0, %lo(MediumFont)
    /* 946F4 800A46F4 21280002 */  addu       $a1, $s0, $zero
    /* 946F8 800A46F8 BC000624 */  addiu      $a2, $zero, 0xBC
    /* 946FC 800A46FC 1280083C */  lui        $t0, %hi(WHITER)
    /* 94700 800A4700 D1AB0891 */  lbu        $t0, %lo(WHITER)($t0)
    /* 94704 800A4704 1280033C */  lui        $v1, %hi(WHITEG)
    /* 94708 800A4708 D2AB6390 */  lbu        $v1, %lo(WHITEG)($v1)
    /* 9470C 800A470C 21384000 */  addu       $a3, $v0, $zero
    /* 94710 800A4710 1000A0AF */  sw         $zero, 0x10($sp)
    /* 94714 800A4714 1400A0AF */  sw         $zero, 0x14($sp)
    /* 94718 800A4718 1800A8AF */  sw         $t0, 0x18($sp)
    /* 9471C 800A471C 1C00A3AF */  sw         $v1, 0x1C($sp)
    /* 94720 800A4720 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 94724 800A4724 2000A3AF */   sw        $v1, 0x20($sp)
    /* 94728 800A4728 2800A427 */  addiu      $a0, $sp, 0x28
    /* 9472C 800A472C C993020C */  jal        SetBack__6Dialogi_800a4f24
    /* 94730 800A4730 94000524 */   addiu     $a1, $zero, 0x94
    /* 94734 800A4734 2800A427 */  addiu      $a0, $sp, 0x28
    /* 94738 800A4738 CB93020C */  jal        SetBorder__6Dialogi_800a4f2c
    /* 9473C 800A473C 12000524 */   addiu     $a1, $zero, 0x12
    /* 94740 800A4740 1280053C */  lui        $a1, %hi(BORDERR)
    /* 94744 800A4744 F7ABA590 */  lbu        $a1, %lo(BORDERR)($a1)
    /* 94748 800A4748 1280063C */  lui        $a2, %hi(BORDERG)
    /* 9474C 800A474C F8ABC690 */  lbu        $a2, %lo(BORDERG)($a2)
    /* 94750 800A4750 1280073C */  lui        $a3, %hi(BORDERB)
    /* 94754 800A4754 F9ABE790 */  lbu        $a3, %lo(BORDERB)($a3)
    /* 94758 800A4758 C193020C */  jal        SetRGB__6DialogUcUcUc_800a4f04
    /* 9475C 800A475C 2800A427 */   addiu     $a0, $sp, 0x28
    /* 94760 800A4760 2800A427 */  addiu      $a0, $sp, 0x28
    /* 94764 800A4764 20000524 */  addiu      $a1, $zero, 0x20
    /* 94768 800A4768 C8000624 */  addiu      $a2, $zero, 0xC8
    /* 9476C 800A476C 00010724 */  addiu      $a3, $zero, 0x100
    /* 94770 800A4770 08000224 */  addiu      $v0, $zero, 0x8
    /* 94774 800A4774 B82F020C */  jal        Back__6Dialogiiii
    /* 94778 800A4778 1000A2AF */   sw        $v0, 0x10($sp)
    /* 9477C 800A477C 6C1F9597 */  lhu        $s5, %gp_rel(D_8011C6EC)($gp)
    /* 94780 800A4780 00000000 */  nop
    /* 94784 800A4784 0001A22E */  sltiu      $v0, $s5, 0x100
    /* 94788 800A4788 03004014 */  bnez       $v0, .L800A4798
    /* 9478C 800A478C 42B01500 */   srl       $s6, $s5, 1
    /* 94790 800A4790 00011524 */  addiu      $s5, $zero, 0x100
    /* 94794 800A4794 42B01500 */  srl        $s6, $s5, 1
  .L800A4798:
    /* 94798 800A4798 80000224 */  addiu      $v0, $zero, 0x80
    /* 9479C 800A479C 23F05600 */  subu       $fp, $v0, $s6
    /* 947A0 800A47A0 3800B427 */  addiu      $s4, $sp, 0x38
    /* 947A4 800A47A4 8E93020C */  jal        PRIM_GetPrim__FPP7POLY_G4_800a4e38
    /* 947A8 800A47A8 21208002 */   addu      $a0, $s4, $zero
    /* 947AC 800A47AC 3800A28F */  lw         $v0, 0x38($sp)
    /* 947B0 800A47B0 08000924 */  addiu      $t1, $zero, 0x8
    /* 947B4 800A47B4 030049A0 */  sb         $t1, 0x3($v0)
    /* 947B8 800A47B8 3800A28F */  lw         $v0, 0x38($sp)
    /* 947BC 800A47BC 38000924 */  addiu      $t1, $zero, 0x38
    /* 947C0 800A47C0 070049A0 */  sb         $t1, 0x7($v0)
    /* 947C4 800A47C4 3800A38F */  lw         $v1, 0x38($sp)
    /* 947C8 800A47C8 00000000 */  nop
    /* 947CC 800A47CC 07006290 */  lbu        $v0, 0x7($v1)
    /* 947D0 800A47D0 00000000 */  nop
    /* 947D4 800A47D4 02004234 */  ori        $v0, $v0, 0x2
    /* 947D8 800A47D8 070062A0 */  sb         $v0, 0x7($v1)
    /* 947DC 800A47DC 3800A38F */  lw         $v1, 0x38($sp)
    /* 947E0 800A47E0 00000000 */  nop
    /* 947E4 800A47E4 07006290 */  lbu        $v0, 0x7($v1)
    /* 947E8 800A47E8 00000000 */  nop
    /* 947EC 800A47EC FE004230 */  andi       $v0, $v0, 0xFE
    /* 947F0 800A47F0 070062A0 */  sb         $v0, 0x7($v1)
    /* 947F4 800A47F4 3800A28F */  lw         $v0, 0x38($sp)
    /* 947F8 800A47F8 40000924 */  addiu      $t1, $zero, 0x40
    /* 947FC 800A47FC 040049A0 */  sb         $t1, 0x4($v0)
    /* 94800 800A4800 3800A28F */  lw         $v0, 0x38($sp)
    /* 94804 800A4804 FF00C633 */  andi       $a2, $fp, 0xFF
    /* 94808 800A4808 050040A0 */  sb         $zero, 0x5($v0)
    /* 9480C 800A480C 3800A28F */  lw         $v0, 0x38($sp)
    /* 94810 800A4810 42300600 */  srl        $a2, $a2, 1
    /* 94814 800A4814 060040A0 */  sb         $zero, 0x6($v0)
    /* 94818 800A4818 3800A28F */  lw         $v0, 0x38($sp)
    /* 9481C 800A481C FF00D732 */  andi       $s7, $s6, 0xFF
    /* 94820 800A4820 0C0046A0 */  sb         $a2, 0xC($v0)
    /* 94824 800A4824 3800A28F */  lw         $v0, 0x38($sp)
    /* 94828 800A4828 42B81700 */  srl        $s7, $s7, 1
    /* 9482C 800A482C 0D0057A0 */  sb         $s7, 0xD($v0)
    /* 94830 800A4830 3800A28F */  lw         $v0, 0x38($sp)
    /* 94834 800A4834 00000000 */  nop
    /* 94838 800A4838 0E0040A0 */  sb         $zero, 0xE($v0)
    /* 9483C 800A483C 3800A28F */  lw         $v0, 0x38($sp)
    /* 94840 800A4840 FF00123C */  lui        $s2, (0xFFFFFF >> 16)
    /* 94844 800A4844 80000924 */  addiu      $t1, $zero, 0x80
    /* 94848 800A4848 140049A0 */  sb         $t1, 0x14($v0)
    /* 9484C 800A484C 3800A28F */  lw         $v0, 0x38($sp)
    /* 94850 800A4850 FFFF5236 */  ori        $s2, $s2, (0xFFFFFF & 0xFFFF)
    /* 94854 800A4854 150040A0 */  sb         $zero, 0x15($v0)
    /* 94858 800A4858 3800A28F */  lw         $v0, 0x38($sp)
    /* 9485C 800A485C 2000B526 */  addiu      $s5, $s5, 0x20
    /* 94860 800A4860 160040A0 */  sb         $zero, 0x16($v0)
    /* 94864 800A4864 3800A28F */  lw         $v0, 0x38($sp)
    /* 94868 800A4868 CC001124 */  addiu      $s1, $zero, 0xCC
    /* 9486C 800A486C 1C005EA0 */  sb         $fp, 0x1C($v0)
    /* 94870 800A4870 3800A28F */  lw         $v0, 0x38($sp)
    /* 94874 800A4874 80801300 */  sll        $s0, $s3, 2
    /* 94878 800A4878 1D0056A0 */  sb         $s6, 0x1D($v0)
    /* 9487C 800A487C 3800A28F */  lw         $v0, 0x38($sp)
    /* 94880 800A4880 00FF133C */  lui        $s3, (0xFF000000 >> 16)
    /* 94884 800A4884 1E0040A0 */  sb         $zero, 0x1E($v0)
    /* 94888 800A4888 C8000224 */  addiu      $v0, $zero, 0xC8
    /* 9488C 800A488C 3800A38F */  lw         $v1, 0x38($sp)
    /* 94890 800A4890 1280053C */  lui        $a1, %hi(ThisOt)
    /* 94894 800A4894 B4AAA58C */  lw         $a1, %lo(ThisOt)($a1)
    /* 94898 800A4898 20000924 */  addiu      $t1, $zero, 0x20
    /* 9489C 800A489C 080069A4 */  sh         $t1, 0x8($v1)
    /* 948A0 800A48A0 0000648C */  lw         $a0, 0x0($v1)
    /* 948A4 800A48A4 21280502 */  addu       $a1, $s0, $a1
    /* 948A8 800A48A8 0A0062A4 */  sh         $v0, 0xA($v1)
    /* 948AC 800A48AC 100075A4 */  sh         $s5, 0x10($v1)
    /* 948B0 800A48B0 120062A4 */  sh         $v0, 0x12($v1)
    /* 948B4 800A48B4 180069A4 */  sh         $t1, 0x18($v1)
    /* 948B8 800A48B8 1A0071A4 */  sh         $s1, 0x1A($v1)
    /* 948BC 800A48BC 200075A4 */  sh         $s5, 0x20($v1)
    /* 948C0 800A48C0 220071A4 */  sh         $s1, 0x22($v1)
    /* 948C4 800A48C4 0000A28C */  lw         $v0, 0x0($a1)
    /* 948C8 800A48C8 24209300 */  and        $a0, $a0, $s3
    /* 948CC 800A48CC 24105200 */  and        $v0, $v0, $s2
    /* 948D0 800A48D0 25208200 */  or         $a0, $a0, $v0
    /* 948D4 800A48D4 000064AC */  sw         $a0, 0x0($v1)
    /* 948D8 800A48D8 21208002 */  addu       $a0, $s4, $zero
    /* 948DC 800A48DC 0000A28C */  lw         $v0, 0x0($a1)
    /* 948E0 800A48E0 24187200 */  and        $v1, $v1, $s2
    /* 948E4 800A48E4 24105300 */  and        $v0, $v0, $s3
    /* 948E8 800A48E8 25104300 */  or         $v0, $v0, $v1
    /* 948EC 800A48EC 0000A2AC */  sw         $v0, 0x0($a1)
    /* 948F0 800A48F0 8E93020C */  jal        PRIM_GetPrim__FPP7POLY_G4_800a4e38
    /* 948F4 800A48F4 5000A6AF */   sw        $a2, 0x50($sp)
    /* 948F8 800A48F8 3800A28F */  lw         $v0, 0x38($sp)
    /* 948FC 800A48FC 08000924 */  addiu      $t1, $zero, 0x8
    /* 94900 800A4900 030049A0 */  sb         $t1, 0x3($v0)
    /* 94904 800A4904 3800A28F */  lw         $v0, 0x38($sp)
    /* 94908 800A4908 38000924 */  addiu      $t1, $zero, 0x38
    /* 9490C 800A490C 070049A0 */  sb         $t1, 0x7($v0)
    /* 94910 800A4910 3800A38F */  lw         $v1, 0x38($sp)
    /* 94914 800A4914 00000000 */  nop
    /* 94918 800A4918 07006290 */  lbu        $v0, 0x7($v1)
    /* 9491C 800A491C 00000000 */  nop
    /* 94920 800A4920 02004234 */  ori        $v0, $v0, 0x2
    /* 94924 800A4924 070062A0 */  sb         $v0, 0x7($v1)
    /* 94928 800A4928 3800A38F */  lw         $v1, 0x38($sp)
    /* 9492C 800A492C 00000000 */  nop
    /* 94930 800A4930 07006290 */  lbu        $v0, 0x7($v1)
    /* 94934 800A4934 00000000 */  nop
    /* 94938 800A4938 FE004230 */  andi       $v0, $v0, 0xFE
    /* 9493C 800A493C 070062A0 */  sb         $v0, 0x7($v1)
    /* 94940 800A4940 3800A28F */  lw         $v0, 0x38($sp)
    /* 94944 800A4944 80000924 */  addiu      $t1, $zero, 0x80
    /* 94948 800A4948 040049A0 */  sb         $t1, 0x4($v0)
    /* 9494C 800A494C 3800A28F */  lw         $v0, 0x38($sp)
    /* 94950 800A4950 00000000 */  nop
    /* 94954 800A4954 050040A0 */  sb         $zero, 0x5($v0)
    /* 94958 800A4958 3800A28F */  lw         $v0, 0x38($sp)
    /* 9495C 800A495C 00000000 */  nop
    /* 94960 800A4960 060040A0 */  sb         $zero, 0x6($v0)
    /* 94964 800A4964 3800A28F */  lw         $v0, 0x38($sp)
    /* 94968 800A4968 00000000 */  nop
    /* 9496C 800A496C 0C005EA0 */  sb         $fp, 0xC($v0)
    /* 94970 800A4970 3800A28F */  lw         $v0, 0x38($sp)
    /* 94974 800A4974 00000000 */  nop
    /* 94978 800A4978 0D0056A0 */  sb         $s6, 0xD($v0)
    /* 9497C 800A497C 3800A28F */  lw         $v0, 0x38($sp)
    /* 94980 800A4980 00000000 */  nop
    /* 94984 800A4984 0E0040A0 */  sb         $zero, 0xE($v0)
    /* 94988 800A4988 3800A28F */  lw         $v0, 0x38($sp)
    /* 9498C 800A498C 40000924 */  addiu      $t1, $zero, 0x40
    /* 94990 800A4990 140049A0 */  sb         $t1, 0x14($v0)
    /* 94994 800A4994 3800A28F */  lw         $v0, 0x38($sp)
    /* 94998 800A4998 00000000 */  nop
    /* 9499C 800A499C 150040A0 */  sb         $zero, 0x15($v0)
    /* 949A0 800A49A0 3800A28F */  lw         $v0, 0x38($sp)
    /* 949A4 800A49A4 00000000 */  nop
    /* 949A8 800A49A8 160040A0 */  sb         $zero, 0x16($v0)
    /* 949AC 800A49AC 3800A28F */  lw         $v0, 0x38($sp)
    /* 949B0 800A49B0 5000A68F */  lw         $a2, 0x50($sp)
    /* 949B4 800A49B4 00000000 */  nop
    /* 949B8 800A49B8 1C0046A0 */  sb         $a2, 0x1C($v0)
    /* 949BC 800A49BC 3800A28F */  lw         $v0, 0x38($sp)
    /* 949C0 800A49C0 00000000 */  nop
    /* 949C4 800A49C4 1D0057A0 */  sb         $s7, 0x1D($v0)
    /* 949C8 800A49C8 3800A28F */  lw         $v0, 0x38($sp)
    /* 949CC 800A49CC 0C80043C */  lui        $a0, %hi(MediumFont)
    /* 949D0 800A49D0 D8828424 */  addiu      $a0, $a0, %lo(MediumFont)
    /* 949D4 800A49D4 1E0040A0 */  sb         $zero, 0x1E($v0)
    /* 949D8 800A49D8 D0000224 */  addiu      $v0, $zero, 0xD0
    /* 949DC 800A49DC 3800A38F */  lw         $v1, 0x38($sp)
    /* 949E0 800A49E0 1280063C */  lui        $a2, %hi(ThisOt)
    /* 949E4 800A49E4 B4AAC68C */  lw         $a2, %lo(ThisOt)($a2)
    /* 949E8 800A49E8 20000924 */  addiu      $t1, $zero, 0x20
    /* 949EC 800A49EC 080069A4 */  sh         $t1, 0x8($v1)
    /* 949F0 800A49F0 0000658C */  lw         $a1, 0x0($v1)
    /* 949F4 800A49F4 21800602 */  addu       $s0, $s0, $a2
    /* 949F8 800A49F8 0A0071A4 */  sh         $s1, 0xA($v1)
    /* 949FC 800A49FC 100075A4 */  sh         $s5, 0x10($v1)
    /* 94A00 800A4A00 120071A4 */  sh         $s1, 0x12($v1)
    /* 94A04 800A4A04 180069A4 */  sh         $t1, 0x18($v1)
    /* 94A08 800A4A08 1A0062A4 */  sh         $v0, 0x1A($v1)
    /* 94A0C 800A4A0C 200075A4 */  sh         $s5, 0x20($v1)
    /* 94A10 800A4A10 220062A4 */  sh         $v0, 0x22($v1)
    /* 94A14 800A4A14 0000028E */  lw         $v0, 0x0($s0)
    /* 94A18 800A4A18 2428B300 */  and        $a1, $a1, $s3
    /* 94A1C 800A4A1C 24105200 */  and        $v0, $v0, $s2
    /* 94A20 800A4A20 2528A200 */  or         $a1, $a1, $v0
    /* 94A24 800A4A24 000065AC */  sw         $a1, 0x0($v1)
    /* 94A28 800A4A28 24187200 */  and        $v1, $v1, $s2
    /* 94A2C 800A4A2C 0000028E */  lw         $v0, 0x0($s0)
    /* 94A30 800A4A30 4800A58F */  lw         $a1, 0x48($sp)
    /* 94A34 800A4A34 24105300 */  and        $v0, $v0, $s3
    /* 94A38 800A4A38 25104300 */  or         $v0, $v0, $v1
    /* 94A3C 800A4A3C E82A020C */  jal        SetOTpos__5CFonti
    /* 94A40 800A4A40 000002AE */   sw        $v0, 0x0($s0)
    /* 94A44 800A4A44 4000A58F */  lw         $a1, 0x40($sp)
    /* 94A48 800A4A48 8A34020C */  jal        SetOTpos__6Dialogi
    /* 94A4C 800A4A4C 2800A427 */   addiu     $a0, $sp, 0x28
    /* 94A50 800A4A50 2800A427 */  addiu      $a0, $sp, 0x28
    /* 94A54 800A4A54 CD93020C */  jal        ___6Dialog_800a4f34
    /* 94A58 800A4A58 02000524 */   addiu     $a1, $zero, 0x2
    /* 94A5C 800A4A5C 7C00BF8F */  lw         $ra, 0x7C($sp)
    /* 94A60 800A4A60 7800BE8F */  lw         $fp, 0x78($sp)
    /* 94A64 800A4A64 7400B78F */  lw         $s7, 0x74($sp)
    /* 94A68 800A4A68 7000B68F */  lw         $s6, 0x70($sp)
    /* 94A6C 800A4A6C 6C00B58F */  lw         $s5, 0x6C($sp)
    /* 94A70 800A4A70 6800B48F */  lw         $s4, 0x68($sp)
    /* 94A74 800A4A74 6400B38F */  lw         $s3, 0x64($sp)
    /* 94A78 800A4A78 6000B28F */  lw         $s2, 0x60($sp)
    /* 94A7C 800A4A7C 5C00B18F */  lw         $s1, 0x5C($sp)
    /* 94A80 800A4A80 5800B08F */  lw         $s0, 0x58($sp)
    /* 94A84 800A4A84 8000BD27 */  addiu      $sp, $sp, 0x80
    /* 94A88 800A4A88 0800E003 */  jr         $ra
    /* 94A8C 800A4A8C 00000000 */   nop
endlabel DrawCutScreen__Fi
