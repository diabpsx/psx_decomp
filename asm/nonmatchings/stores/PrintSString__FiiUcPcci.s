.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PrintSString__FiiUcPcci, 0x4A8

glabel PrintSString__FiiUcPcci
    /* 5979C 8006979C 70FFBD27 */  addiu      $sp, $sp, -0x90
    /* 597A0 800697A0 6800B0AF */  sw         $s0, 0x68($sp)
    /* 597A4 800697A4 A000B093 */  lbu        $s0, 0xA0($sp)
    /* 597A8 800697A8 8400B7AF */  sw         $s7, 0x84($sp)
    /* 597AC 800697AC A400B78F */  lw         $s7, 0xA4($sp)
    /* 597B0 800697B0 3C218297 */  lhu        $v0, %gp_rel(D_8011C8BC)($gp)
    /* 597B4 800697B4 34218397 */  lhu        $v1, %gp_rel(D_8011C8B4)($gp)
    /* 597B8 800697B8 8000B6AF */  sw         $s6, 0x80($sp)
    /* 597BC 800697BC 21B08000 */  addu       $s6, $a0, $zero
    /* 597C0 800697C0 7800B4AF */  sw         $s4, 0x78($sp)
    /* 597C4 800697C4 21A0A000 */  addu       $s4, $a1, $zero
    /* 597C8 800697C8 7C00B5AF */  sw         $s5, 0x7C($sp)
    /* 597CC 800697CC 8C00BFAF */  sw         $ra, 0x8C($sp)
    /* 597D0 800697D0 8800BEAF */  sw         $fp, 0x88($sp)
    /* 597D4 800697D4 7400B3AF */  sw         $s3, 0x74($sp)
    /* 597D8 800697D8 7000B2AF */  sw         $s2, 0x70($sp)
    /* 597DC 800697DC 6C00B1AF */  sw         $s1, 0x6C($sp)
    /* 597E0 800697E0 6C1380AF */  sw         $zero, %gp_rel(SWrapCount)($gp)
    /* 597E4 800697E4 5800A6A3 */  sb         $a2, 0x58($sp)
    /* 597E8 800697E8 21187600 */  addu       $v1, $v1, $s6
    /* 597EC 800697EC 342183A7 */  sh         $v1, %gp_rel(D_8011C8B4)($gp)
    /* 597F0 800697F0 26218383 */  lb         $v1, %gp_rel(D_8011C8A6)($gp)
    /* 597F4 800697F4 21105600 */  addu       $v0, $v0, $s6
    /* 597F8 800697F8 3C2182A7 */  sh         $v0, %gp_rel(D_8011C8BC)($gp)
    /* 597FC 800697FC 01000224 */  addiu      $v0, $zero, 0x1
    /* 59800 80069800 11006210 */  beq        $v1, $v0, .L80069848
    /* 59804 80069804 21A8E000 */   addu      $s5, $a3, $zero
    /* 59808 80069808 02006228 */  slti       $v0, $v1, 0x2
    /* 5980C 8006980C 05004010 */  beqz       $v0, .L80069824
    /* 59810 80069810 00000000 */   nop
    /* 59814 80069814 08006010 */  beqz       $v1, .L80069838
    /* 59818 80069818 00000000 */   nop
    /* 5981C 8006981C 19A60108 */  j          .L80069864
    /* 59820 80069820 00000000 */   nop
  .L80069824:
    /* 59824 80069824 02000224 */  addiu      $v0, $zero, 0x2
    /* 59828 80069828 0B006210 */  beq        $v1, $v0, .L80069858
    /* 5982C 8006982C 00000000 */   nop
    /* 59830 80069830 19A60108 */  j          .L80069864
    /* 59834 80069834 00000000 */   nop
  .L80069838:
    /* 59838 80069838 0E80023C */  lui        $v0, %hi(SStringYNorm)
    /* 5983C 8006983C 14E34224 */  addiu      $v0, $v0, %lo(SStringYNorm)
    /* 59840 80069840 18A60108 */  j          .L80069860
    /* 59844 80069844 00000000 */   nop
  .L80069848:
    /* 59848 80069848 0E80023C */  lui        $v0, %hi(SStringYBuy0)
    /* 5984C 8006984C 64E34224 */  addiu      $v0, $v0, %lo(SStringYBuy0)
    /* 59850 80069850 18A60108 */  j          .L80069860
    /* 59854 80069854 00000000 */   nop
  .L80069858:
    /* 59858 80069858 0E80023C */  lui        $v0, %hi(SStringYBuy1)
    /* 5985C 8006985C B4E34224 */  addiu      $v0, $v0, %lo(SStringYBuy1)
  .L80069860:
    /* 59860 80069860 241382AF */  sw         $v0, %gp_rel(SStringY)($gp)
  .L80069864:
    /* 59864 80069864 044F020C */  jal        GM_UseTexData__Fi
    /* 59868 80069868 21200000 */   addu      $a0, $zero, $zero
    /* 5986C 8006986C 0500822A */  slti       $v0, $s4, 0x5
    /* 59870 80069870 02004014 */  bnez       $v0, .L8006987C
    /* 59874 80069874 00000000 */   nop
    /* 59878 80069878 FFFF9426 */  addiu      $s4, $s4, -0x1
  .L8006987C:
    /* 5987C 8006987C 0421828F */  lw         $v0, %gp_rel(D_8011C884)($gp)
    /* 59880 80069880 00000000 */  nop
    /* 59884 80069884 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 59888 80069888 07005414 */  bne        $v0, $s4, .L800698A8
    /* 5988C 8006988C 00161000 */   sll       $v0, $s0, 24
    /* 59890 80069890 03160200 */  sra        $v0, $v0, 24
    /* 59894 80069894 03004238 */  xori       $v0, $v0, 0x3
    /* 59898 80069898 2B100200 */  sltu       $v0, $zero, $v0
    /* 5989C 8006989C 23100200 */  negu       $v0, $v0
    /* 598A0 800698A0 03005030 */  andi       $s0, $v0, 0x3
    /* 598A4 800698A4 00161000 */  sll        $v0, $s0, 24
  .L800698A8:
    /* 598A8 800698A8 031E0200 */  sra        $v1, $v0, 24
    /* 598AC 800698AC 01000224 */  addiu      $v0, $zero, 0x1
    /* 598B0 800698B0 14006210 */  beq        $v1, $v0, .L80069904
    /* 598B4 800698B4 02006228 */   slti      $v0, $v1, 0x2
    /* 598B8 800698B8 05004010 */  beqz       $v0, .L800698D0
    /* 598BC 800698BC 00000000 */   nop
    /* 598C0 800698C0 08006010 */  beqz       $v1, .L800698E4
    /* 598C4 800698C4 00000000 */   nop
    /* 598C8 800698C8 51A60108 */  j          .L80069944
    /* 598CC 800698CC 00000000 */   nop
  .L800698D0:
    /* 598D0 800698D0 02000224 */  addiu      $v0, $zero, 0x2
    /* 598D4 800698D4 13006210 */  beq        $v1, $v0, .L80069924
    /* 598D8 800698D8 00000000 */   nop
    /* 598DC 800698DC 51A60108 */  j          .L80069944
    /* 598E0 800698E0 00000000 */   nop
  .L800698E4:
    /* 598E4 800698E4 1280133C */  lui        $s3, %hi(WHITER)
    /* 598E8 800698E8 D1AB7392 */  lbu        $s3, %lo(WHITER)($s3)
    /* 598EC 800698EC 1280123C */  lui        $s2, %hi(WHITEG)
    /* 598F0 800698F0 D2AB5292 */  lbu        $s2, %lo(WHITEG)($s2)
    /* 598F4 800698F4 1280113C */  lui        $s1, %hi(WHITEB)
    /* 598F8 800698F8 D3AB3192 */  lbu        $s1, %lo(WHITEB)($s1)
    /* 598FC 800698FC 58A60108 */  j          .L80069960
    /* 59900 80069900 80181400 */   sll       $v1, $s4, 2
  .L80069904:
    /* 59904 80069904 1280133C */  lui        $s3, %hi(BLUER)
    /* 59908 80069908 D4AB7392 */  lbu        $s3, %lo(BLUER)($s3)
    /* 5990C 8006990C 1280123C */  lui        $s2, %hi(BLUEG)
    /* 59910 80069910 D5AB5292 */  lbu        $s2, %lo(BLUEG)($s2)
    /* 59914 80069914 1280113C */  lui        $s1, %hi(BLUEB)
    /* 59918 80069918 D6AB3192 */  lbu        $s1, %lo(BLUEB)($s1)
    /* 5991C 8006991C 58A60108 */  j          .L80069960
    /* 59920 80069920 80181400 */   sll       $v1, $s4, 2
  .L80069924:
    /* 59924 80069924 1280133C */  lui        $s3, %hi(REDR)
    /* 59928 80069928 D7AB7392 */  lbu        $s3, %lo(REDR)($s3)
    /* 5992C 8006992C 1280123C */  lui        $s2, %hi(REDG)
    /* 59930 80069930 D8AB5292 */  lbu        $s2, %lo(REDG)($s2)
    /* 59934 80069934 1280113C */  lui        $s1, %hi(REDB)
    /* 59938 80069938 D9AB3192 */  lbu        $s1, %lo(REDB)($s1)
    /* 5993C 8006993C 58A60108 */  j          .L80069960
    /* 59940 80069940 80181400 */   sll       $v1, $s4, 2
  .L80069944:
    /* 59944 80069944 1280133C */  lui        $s3, %hi(GOLDR)
    /* 59948 80069948 DAAB7392 */  lbu        $s3, %lo(GOLDR)($s3)
    /* 5994C 8006994C 1280123C */  lui        $s2, %hi(GOLDG)
    /* 59950 80069950 DBAB5292 */  lbu        $s2, %lo(GOLDG)($s2)
    /* 59954 80069954 1280113C */  lui        $s1, %hi(GOLDB)
    /* 59958 80069958 DCAB3192 */  lbu        $s1, %lo(GOLDB)($s1)
    /* 5995C 8006995C 80181400 */  sll        $v1, $s4, 2
  .L80069960:
    /* 59960 80069960 1280083C */  lui        $t0, %hi(D_8011C8B6)
    /* 59964 80069964 B6C80825 */  addiu      $t0, $t0, %lo(D_8011C8B6)
    /* 59968 80069968 2413828F */  lw         $v0, %gp_rel(SStringY)($gp)
    /* 5996C 8006996C 36218487 */  lh         $a0, %gp_rel(D_8011C8B6)($gp)
    /* 59970 80069970 21186200 */  addu       $v1, $v1, $v0
    /* 59974 80069974 C0101400 */  sll        $v0, $s4, 3
    /* 59978 80069978 21105400 */  addu       $v0, $v0, $s4
    /* 5997C 8006997C 80100200 */  sll        $v0, $v0, 2
    /* 59980 80069980 23105400 */  subu       $v0, $v0, $s4
    /* 59984 80069984 80100200 */  sll        $v0, $v0, 2
    /* 59988 80069988 1380013C */  lui        $at, %hi(D_8012EE49)
    /* 5998C 8006998C 21082200 */  addu       $at, $at, $v0
    /* 59990 80069990 49EE2680 */  lb         $a2, %lo(D_8012EE49)($at)
    /* 59994 80069994 0000658C */  lw         $a1, 0x0($v1)
    /* 59998 80069998 3E218297 */  lhu        $v0, %gp_rel(D_8011C8BE)($gp)
    /* 5999C 8006999C 3A218397 */  lhu        $v1, %gp_rel(D_8011C8BA)($gp)
    /* 599A0 800699A0 FCFF4224 */  addiu      $v0, $v0, -0x4
    /* 599A4 800699A4 3E2182A7 */  sh         $v0, %gp_rel(D_8011C8BE)($gp)
    /* 599A8 800699A8 FCFF8224 */  addiu      $v0, $a0, -0x4
    /* 599AC 800699AC 04006324 */  addiu      $v1, $v1, 0x4
    /* 599B0 800699B0 2180A600 */  addu       $s0, $a1, $a2
    /* 599B4 800699B4 21F00402 */  addu       $fp, $s0, $a0
    /* 599B8 800699B8 362182A7 */  sh         $v0, %gp_rel(D_8011C8B6)($gp)
    /* 599BC 800699BC 42218297 */  lhu        $v0, %gp_rel(D_8011C8C2)($gp)
    /* 599C0 800699C0 3A2183A7 */  sh         $v1, %gp_rel(D_8011C8BA)($gp)
    /* 599C4 800699C4 04004224 */  addiu      $v0, $v0, 0x4
    /* 599C8 800699C8 422182A7 */  sh         $v0, %gp_rel(D_8011C8C2)($gp)
    /* 599CC 800699CC 5800A293 */  lbu        $v0, 0x58($sp)
    /* 599D0 800699D0 1280033C */  lui        $v1, %hi(D_8011C8BE)
    /* 599D4 800699D4 BEC86324 */  addiu      $v1, $v1, %lo(D_8011C8BE)
    /* 599D8 800699D8 13004010 */  beqz       $v0, .L80069A28
    /* 599DC 800699DC 03001026 */   addiu     $s0, $s0, 0x3
    /* 599E0 800699E0 0900E006 */  bltz       $s7, .L80069A08
    /* 599E4 800699E4 21280000 */   addu      $a1, $zero, $zero
    /* 599E8 800699E8 0C80043C */  lui        $a0, %hi(MediumFont)
    /* 599EC 800699EC D8828424 */  addiu      $a0, $a0, %lo(MediumFont)
    /* 599F0 800699F0 21300002 */  addu       $a2, $s0, $zero
    /* 599F4 800699F4 2138A002 */  addu       $a3, $s5, $zero
    /* 599F8 800699F8 01000224 */  addiu      $v0, $zero, 0x1
    /* 599FC 800699FC 1000A2AF */  sw         $v0, 0x10($sp)
    /* 59A00 80069A00 98A60108 */  j          .L80069A60
    /* 59A04 80069A04 FEFF6224 */   addiu     $v0, $v1, -0x2
  .L80069A08:
    /* 59A08 80069A08 0C80043C */  lui        $a0, %hi(MediumFont)
    /* 59A0C 80069A0C D8828424 */  addiu      $a0, $a0, %lo(MediumFont)
    /* 59A10 80069A10 21300002 */  addu       $a2, $s0, $zero
    /* 59A14 80069A14 2138A002 */  addu       $a3, $s5, $zero
    /* 59A18 80069A18 01000224 */  addiu      $v0, $zero, 0x1
    /* 59A1C 80069A1C 1000A2AF */  sw         $v0, 0x10($sp)
    /* 59A20 80069A20 98A60108 */  j          .L80069A60
    /* 59A24 80069A24 FEFF0225 */   addiu     $v0, $t0, -0x2
  .L80069A28:
    /* 59A28 80069A28 0700E006 */  bltz       $s7, .L80069A48
    /* 59A2C 80069A2C 21280000 */   addu      $a1, $zero, $zero
    /* 59A30 80069A30 0C80043C */  lui        $a0, %hi(MediumFont)
    /* 59A34 80069A34 D8828424 */  addiu      $a0, $a0, %lo(MediumFont)
    /* 59A38 80069A38 21300002 */  addu       $a2, $s0, $zero
    /* 59A3C 80069A3C 2138A002 */  addu       $a3, $s5, $zero
    /* 59A40 80069A40 97A60108 */  j          .L80069A5C
    /* 59A44 80069A44 FEFF6224 */   addiu     $v0, $v1, -0x2
  .L80069A48:
    /* 59A48 80069A48 0C80043C */  lui        $a0, %hi(MediumFont)
    /* 59A4C 80069A4C D8828424 */  addiu      $a0, $a0, %lo(MediumFont)
    /* 59A50 80069A50 21300002 */  addu       $a2, $s0, $zero
    /* 59A54 80069A54 2138A002 */  addu       $a3, $s5, $zero
    /* 59A58 80069A58 FEFF0225 */  addiu      $v0, $t0, -0x2
  .L80069A5C:
    /* 59A5C 80069A5C 1000A0AF */  sw         $zero, 0x10($sp)
  .L80069A60:
    /* 59A60 80069A60 1400A2AF */  sw         $v0, 0x14($sp)
    /* 59A64 80069A64 1800B3AF */  sw         $s3, 0x18($sp)
    /* 59A68 80069A68 1C00B2AF */  sw         $s2, 0x1C($sp)
    /* 59A6C 80069A6C 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 59A70 80069A70 2000B1AF */   sw        $s1, 0x20($sp)
    /* 59A74 80069A74 6C1382AF */  sw         $v0, %gp_rel(SWrapCount)($gp)
    /* 59A78 80069A78 0421828F */  lw         $v0, %gp_rel(D_8011C884)($gp)
    /* 59A7C 80069A7C 00000000 */  nop
    /* 59A80 80069A80 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 59A84 80069A84 16005414 */  bne        $v0, $s4, .L80069AE0
    /* 59A88 80069A88 2128C003 */   addu      $a1, $fp, $zero
    /* 59A8C 80069A8C A0000624 */  addiu      $a2, $zero, 0xA0
    /* 59A90 80069A90 40000724 */  addiu      $a3, $zero, 0x40
    /* 59A94 80069A94 F0000224 */  addiu      $v0, $zero, 0xF0
    /* 59A98 80069A98 1000A2AF */  sw         $v0, 0x10($sp)
    /* 59A9C 80069A9C 20000224 */  addiu      $v0, $zero, 0x20
    /* 59AA0 80069AA0 1400A2AF */  sw         $v0, 0x14($sp)
    /* 59AA4 80069AA4 40000224 */  addiu      $v0, $zero, 0x40
    /* 59AA8 80069AA8 0C80043C */  lui        $a0, %hi(MediumFont + 0x208)
    /* 59AAC 80069AAC E084848C */  lw         $a0, %lo(MediumFont + 0x208)($a0)
    /* 59AB0 80069AB0 01000324 */  addiu      $v1, $zero, 0x1
    /* 59AB4 80069AB4 1800A2AF */  sw         $v0, 0x18($sp)
    /* 59AB8 80069AB8 FFFF0234 */  ori        $v0, $zero, 0xFFFF
    /* 59ABC 80069ABC 2400A2AF */  sw         $v0, 0x24($sp)
    /* 59AC0 80069AC0 08000224 */  addiu      $v0, $zero, 0x8
    /* 59AC4 80069AC4 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 59AC8 80069AC8 2000A3AF */  sw         $v1, 0x20($sp)
    /* 59ACC 80069ACC 2800A3AF */  sw         $v1, 0x28($sp)
    /* 59AD0 80069AD0 2C00A0AF */  sw         $zero, 0x2C($sp)
    /* 59AD4 80069AD4 3000A2AF */  sw         $v0, 0x30($sp)
    /* 59AD8 80069AD8 919A020C */  jal        DrawSpinner__FiiUcUcUciiibiT8T8Uc
    /* 59ADC 80069ADC F8FF8424 */   addiu     $a0, $a0, -0x8
  .L80069AE0:
    /* 59AE0 80069AE0 1C00E01A */  blez       $s7, .L80069B54
    /* 59AE4 80069AE4 00000000 */   nop
    /* 59AE8 80069AE8 4AED010C */  jal        GetStr__Fi
    /* 59AEC 80069AEC FD040424 */   addiu     $a0, $zero, 0x4FD
    /* 59AF0 80069AF0 3800A427 */  addiu      $a0, $sp, 0x38
    /* 59AF4 80069AF4 21284000 */  addu       $a1, $v0, $zero
    /* 59AF8 80069AF8 9767000C */  jal        sprintf
    /* 59AFC 80069AFC 2130E002 */   addu      $a2, $s7, $zero
    /* 59B00 80069B00 0C80043C */  lui        $a0, %hi(MediumFont)
    /* 59B04 80069B04 D8828424 */  addiu      $a0, $a0, %lo(MediumFont)
    /* 59B08 80069B08 21280000 */  addu       $a1, $zero, $zero
    /* 59B0C 80069B0C 21300002 */  addu       $a2, $s0, $zero
    /* 59B10 80069B10 38218397 */  lhu        $v1, %gp_rel(D_8011C8B8)($gp)
    /* 59B14 80069B14 02000224 */  addiu      $v0, $zero, 0x2
    /* 59B18 80069B18 1000A2AF */  sw         $v0, 0x10($sp)
    /* 59B1C 80069B1C 1280023C */  lui        $v0, %hi(D_8011C8B4)
    /* 59B20 80069B20 B4C84224 */  addiu      $v0, $v0, %lo(D_8011C8B4)
    /* 59B24 80069B24 1400A2AF */  sw         $v0, 0x14($sp)
    /* 59B28 80069B28 1800B3AF */  sw         $s3, 0x18($sp)
    /* 59B2C 80069B2C 1C00B2AF */  sw         $s2, 0x1C($sp)
    /* 59B30 80069B30 2000B1AF */  sw         $s1, 0x20($sp)
    /* 59B34 80069B34 E4FF6324 */  addiu      $v1, $v1, -0x1C
    /* 59B38 80069B38 382183A7 */  sh         $v1, %gp_rel(D_8011C8B8)($gp)
    /* 59B3C 80069B3C 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 59B40 80069B40 3800A727 */   addiu     $a3, $sp, 0x38
    /* 59B44 80069B44 38218297 */  lhu        $v0, %gp_rel(D_8011C8B8)($gp)
    /* 59B48 80069B48 00000000 */  nop
    /* 59B4C 80069B4C 1C004224 */  addiu      $v0, $v0, 0x1C
    /* 59B50 80069B50 382182A7 */  sh         $v0, %gp_rel(D_8011C8B8)($gp)
  .L80069B54:
    /* 59B54 80069B54 0421828F */  lw         $v0, %gp_rel(D_8011C884)($gp)
    /* 59B58 80069B58 00000000 */  nop
    /* 59B5C 80069B5C FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 59B60 80069B60 16005414 */  bne        $v0, $s4, .L80069BBC
    /* 59B64 80069B64 2128C003 */   addu      $a1, $fp, $zero
    /* 59B68 80069B68 A0000624 */  addiu      $a2, $zero, 0xA0
    /* 59B6C 80069B6C 40000724 */  addiu      $a3, $zero, 0x40
    /* 59B70 80069B70 F0000224 */  addiu      $v0, $zero, 0xF0
    /* 59B74 80069B74 1000A2AF */  sw         $v0, 0x10($sp)
    /* 59B78 80069B78 20000224 */  addiu      $v0, $zero, 0x20
    /* 59B7C 80069B7C 1400A2AF */  sw         $v0, 0x14($sp)
    /* 59B80 80069B80 40000224 */  addiu      $v0, $zero, 0x40
    /* 59B84 80069B84 0C80043C */  lui        $a0, %hi(MediumFont + 0x20C)
    /* 59B88 80069B88 E484848C */  lw         $a0, %lo(MediumFont + 0x20C)($a0)
    /* 59B8C 80069B8C 01000324 */  addiu      $v1, $zero, 0x1
    /* 59B90 80069B90 1800A2AF */  sw         $v0, 0x18($sp)
    /* 59B94 80069B94 FFFF0234 */  ori        $v0, $zero, 0xFFFF
    /* 59B98 80069B98 2400A2AF */  sw         $v0, 0x24($sp)
    /* 59B9C 80069B9C 08000224 */  addiu      $v0, $zero, 0x8
    /* 59BA0 80069BA0 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 59BA4 80069BA4 2000A3AF */  sw         $v1, 0x20($sp)
    /* 59BA8 80069BA8 2800A3AF */  sw         $v1, 0x28($sp)
    /* 59BAC 80069BAC 2C00A0AF */  sw         $zero, 0x2C($sp)
    /* 59BB0 80069BB0 3000A2AF */  sw         $v0, 0x30($sp)
    /* 59BB4 80069BB4 919A020C */  jal        DrawSpinner__FiiUcUcUciiibiT8T8Uc
    /* 59BB8 80069BB8 04008424 */   addiu     $a0, $a0, 0x4
  .L80069BBC:
    /* 59BBC 80069BBC 0E80023C */  lui        $v0, %hi(SStringYNorm)
    /* 59BC0 80069BC0 14E34224 */  addiu      $v0, $v0, %lo(SStringYNorm)
    /* 59BC4 80069BC4 241382AF */  sw         $v0, %gp_rel(SStringY)($gp)
    /* 59BC8 80069BC8 3C218297 */  lhu        $v0, %gp_rel(D_8011C8BC)($gp)
    /* 59BCC 80069BCC 34218397 */  lhu        $v1, %gp_rel(D_8011C8B4)($gp)
    /* 59BD0 80069BD0 23105600 */  subu       $v0, $v0, $s6
    /* 59BD4 80069BD4 3C2182A7 */  sh         $v0, %gp_rel(D_8011C8BC)($gp)
    /* 59BD8 80069BD8 3E218297 */  lhu        $v0, %gp_rel(D_8011C8BE)($gp)
    /* 59BDC 80069BDC 23187600 */  subu       $v1, $v1, $s6
    /* 59BE0 80069BE0 342183A7 */  sh         $v1, %gp_rel(D_8011C8B4)($gp)
    /* 59BE4 80069BE4 36218397 */  lhu        $v1, %gp_rel(D_8011C8B6)($gp)
    /* 59BE8 80069BE8 04004224 */  addiu      $v0, $v0, 0x4
    /* 59BEC 80069BEC 3E2182A7 */  sh         $v0, %gp_rel(D_8011C8BE)($gp)
    /* 59BF0 80069BF0 42218297 */  lhu        $v0, %gp_rel(D_8011C8C2)($gp)
    /* 59BF4 80069BF4 04006324 */  addiu      $v1, $v1, 0x4
    /* 59BF8 80069BF8 362183A7 */  sh         $v1, %gp_rel(D_8011C8B6)($gp)
    /* 59BFC 80069BFC 3A218397 */  lhu        $v1, %gp_rel(D_8011C8BA)($gp)
    /* 59C00 80069C00 FCFF4224 */  addiu      $v0, $v0, -0x4
    /* 59C04 80069C04 FCFF6324 */  addiu      $v1, $v1, -0x4
    /* 59C08 80069C08 422182A7 */  sh         $v0, %gp_rel(D_8011C8C2)($gp)
    /* 59C0C 80069C0C 3A2183A7 */  sh         $v1, %gp_rel(D_8011C8BA)($gp)
    /* 59C10 80069C10 8C00BF8F */  lw         $ra, 0x8C($sp)
    /* 59C14 80069C14 8800BE8F */  lw         $fp, 0x88($sp)
    /* 59C18 80069C18 8400B78F */  lw         $s7, 0x84($sp)
    /* 59C1C 80069C1C 8000B68F */  lw         $s6, 0x80($sp)
    /* 59C20 80069C20 7C00B58F */  lw         $s5, 0x7C($sp)
    /* 59C24 80069C24 7800B48F */  lw         $s4, 0x78($sp)
    /* 59C28 80069C28 7400B38F */  lw         $s3, 0x74($sp)
    /* 59C2C 80069C2C 7000B28F */  lw         $s2, 0x70($sp)
    /* 59C30 80069C30 6C00B18F */  lw         $s1, 0x6C($sp)
    /* 59C34 80069C34 6800B08F */  lw         $s0, 0x68($sp)
    /* 59C38 80069C38 9000BD27 */  addiu      $sp, $sp, 0x90
    /* 59C3C 80069C3C 0800E003 */  jr         $ra
    /* 59C40 80069C40 00000000 */   nop
endlabel PrintSString__FiiUcPcci
