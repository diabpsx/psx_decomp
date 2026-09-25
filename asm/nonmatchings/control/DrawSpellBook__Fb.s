.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawSpellBook__Fb, 0xBA8

glabel DrawSpellBook__Fb
    /* 266D8 800366D8 90FFBD27 */  addiu      $sp, $sp, -0x70
    /* 266DC 800366DC 4800B0AF */  sw         $s0, 0x48($sp)
    /* 266E0 800366E0 21808000 */  addu       $s0, $a0, $zero
    /* 266E4 800366E4 21200000 */  addu       $a0, $zero, $zero
    /* 266E8 800366E8 6C00BFAF */  sw         $ra, 0x6C($sp)
    /* 266EC 800366EC 6800BEAF */  sw         $fp, 0x68($sp)
    /* 266F0 800366F0 6400B7AF */  sw         $s7, 0x64($sp)
    /* 266F4 800366F4 6000B6AF */  sw         $s6, 0x60($sp)
    /* 266F8 800366F8 5C00B5AF */  sw         $s5, 0x5C($sp)
    /* 266FC 800366FC 5800B4AF */  sw         $s4, 0x58($sp)
    /* 26700 80036700 5400B3AF */  sw         $s3, 0x54($sp)
    /* 26704 80036704 5000B2AF */  sw         $s2, 0x50($sp)
    /* 26708 80036708 E16E020C */  jal        GLUE_SetShowGameScreenFlag__Fb
    /* 2670C 8003670C 4C00B1AF */   sw        $s1, 0x4C($sp)
    /* 26710 80036710 EC6E020C */  jal        GLUE_SetShowPanelFlag__Fb
    /* 26714 80036714 21200000 */   addu      $a0, $zero, $zero
    /* 26718 80036718 896E020C */  jal        GLUE_SuspendGame__Fv
    /* 2671C 8003671C 00000000 */   nop
    /* 26720 80036720 CA020012 */  beqz       $s0, .L8003724C
    /* 26724 80036724 00000000 */   nop
    /* 26728 80036728 349A020C */  jal        PrintSelectBack__FUs
    /* 2672C 8003672C E6040424 */   addiu     $a0, $zero, 0x4E6
    /* 26730 80036730 1280033C */  lui        $v1, %hi(myplr)
    /* 26734 80036734 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 26738 80036738 00000000 */  nop
    /* 2673C 8003673C 40100300 */  sll        $v0, $v1, 1
    /* 26740 80036740 21104300 */  addu       $v0, $v0, $v1
    /* 26744 80036744 80100200 */  sll        $v0, $v0, 2
    /* 26748 80036748 21104300 */  addu       $v0, $v0, $v1
    /* 2674C 8003674C 00110200 */  sll        $v0, $v0, 4
    /* 26750 80036750 23104300 */  subu       $v0, $v0, $v1
    /* 26754 80036754 80100200 */  sll        $v0, $v0, 2
    /* 26758 80036758 21104300 */  addu       $v0, $v0, $v1
    /* 2675C 8003675C C0100200 */  sll        $v0, $v0, 3
    /* 26760 80036760 0E80013C */  lui        $at, %hi(plr + 0xF6)
    /* 26764 80036764 21082200 */  addu       $at, $at, $v0
    /* 26768 80036768 2EA62380 */  lb         $v1, %lo(plr + 0xF6)($at)
    /* 2676C 8003676C 00000000 */  nop
    /* 26770 80036770 03006014 */  bnez       $v1, .L80036780
    /* 26774 80036774 01000224 */   addiu     $v0, $zero, 0x1
    /* 26778 80036778 E7D90008 */  j          .L8003679C
    /* 2677C 8003677C 1A000224 */   addiu     $v0, $zero, 0x1A
  .L80036780:
    /* 26780 80036780 03006214 */  bne        $v1, $v0, .L80036790
    /* 26784 80036784 02000224 */   addiu     $v0, $zero, 0x2
    /* 26788 80036788 E7D90008 */  j          .L8003679C
    /* 2678C 8003678C 1C000224 */   addiu     $v0, $zero, 0x1C
  .L80036790:
    /* 26790 80036790 05006214 */  bne        $v1, $v0, .L800367A8
    /* 26794 80036794 2E001624 */   addiu     $s6, $zero, 0x2E
    /* 26798 80036798 1B000224 */  addiu      $v0, $zero, 0x1B
  .L8003679C:
    /* 2679C 8003679C 0D80013C */  lui        $at, %hi(SpellPages)
    /* 267A0 800367A0 4CE322AC */  sw         $v0, %lo(SpellPages)($at)
    /* 267A4 800367A4 2E001624 */  addiu      $s6, $zero, 0x2E
  .L800367A8:
    /* 267A8 800367A8 18001224 */  addiu      $s2, $zero, 0x18
    /* 267AC 800367AC C2001524 */  addiu      $s5, $zero, 0xC2
    /* 267B0 800367B0 1380103C */  lui        $s0, %hi(D_8012EA88)
    /* 267B4 800367B4 88EA1026 */  addiu      $s0, $s0, %lo(D_8012EA88)
    /* 267B8 800367B8 21200002 */  addu       $a0, $s0, $zero
    /* 267BC 800367BC 8DDD000C */  jal        SetBack__6Dialogi
    /* 267C0 800367C0 94000524 */   addiu     $a1, $zero, 0x94
    /* 267C4 800367C4 21200002 */  addu       $a0, $s0, $zero
    /* 267C8 800367C8 8FDD000C */  jal        SetBorder__6Dialogi
    /* 267CC 800367CC 12000524 */   addiu     $a1, $zero, 0x12
    /* 267D0 800367D0 21980000 */  addu       $s3, $zero, $zero
    /* 267D4 800367D4 21A00002 */  addu       $s4, $s0, $zero
    /* 267D8 800367D8 12801E3C */  lui        $fp, %hi(CSRect)
    /* 267DC 800367DC F4B6DE27 */  addiu      $fp, $fp, %lo(CSRect)
    /* 267E0 800367E0 09001724 */  addiu      $s7, $zero, 0x9
    /* 267E4 800367E4 21208002 */  addu       $a0, $s4, $zero
  .L800367E8:
    /* 267E8 800367E8 1280053C */  lui        $a1, %hi(BACKR)
    /* 267EC 800367EC FAABA590 */  lbu        $a1, %lo(BACKR)($a1)
    /* 267F0 800367F0 1280063C */  lui        $a2, %hi(BACKG)
    /* 267F4 800367F4 FBABC690 */  lbu        $a2, %lo(BACKG)($a2)
    /* 267F8 800367F8 1280073C */  lui        $a3, %hi(BACKB)
    /* 267FC 800367FC FCABE790 */  lbu        $a3, %lo(BACKB)($a3)
    /* 26800 80036800 42280500 */  srl        $a1, $a1, 1
    /* 26804 80036804 42300600 */  srl        $a2, $a2, 1
    /* 26808 80036808 85DD000C */  jal        SetRGB__6DialogUcUcUc
    /* 2680C 8003680C 42380700 */   srl       $a3, $a3, 1
    /* 26810 80036810 940F828F */  lw         $v0, %gp_rel(sbooktab)($gp)
    /* 26814 80036814 00000000 */  nop
    /* 26818 80036818 07006216 */  bne        $s3, $v0, .L80036838
    /* 2681C 8003681C 40001124 */   addiu     $s1, $zero, 0x40
    /* 26820 80036820 21208002 */  addu       $a0, $s4, $zero
    /* 26824 80036824 FF000524 */  addiu      $a1, $zero, 0xFF
    /* 26828 80036828 FF000624 */  addiu      $a2, $zero, 0xFF
    /* 2682C 8003682C 85DD000C */  jal        SetRGB__6DialogUcUcUc
    /* 26830 80036830 FF000724 */   addiu     $a3, $zero, 0xFF
    /* 26834 80036834 FFFF1124 */  addiu      $s1, $zero, -0x1
  .L80036838:
    /* 26838 80036838 21208002 */  addu       $a0, $s4, $zero
    /* 2683C 8003683C 21284002 */  addu       $a1, $s2, $zero
    /* 26840 80036840 2130A002 */  addu       $a2, $s5, $zero
    /* 26844 80036844 2138C002 */  addu       $a3, $s6, $zero
    /* 26848 80036848 740F92A7 */  sh         $s2, %gp_rel(CSRect)($gp)
    /* 2684C 8003684C 760F95A7 */  sh         $s5, %gp_rel(CSRect + 0x2)($gp)
    /* 26850 80036850 780F96A7 */  sh         $s6, %gp_rel(D_8011B6F8)($gp)
    /* 26854 80036854 7A0F97A7 */  sh         $s7, %gp_rel(D_8011B6F8 + 0x2)($gp)
    /* 26858 80036858 B82F020C */  jal        Back__6Dialogiiii
    /* 2685C 8003685C 1000B7AF */   sw        $s7, 0x10($sp)
    /* 26860 80036860 2800A427 */  addiu      $a0, $sp, 0x28
    /* 26864 80036864 1280053C */  lui        $a1, %hi(D_8011B6A8)
    /* 26868 80036868 A8B6A524 */  addiu      $a1, $a1, %lo(D_8011B6A8)
    /* 2686C 8003686C 01007026 */  addiu      $s0, $s3, 0x1
    /* 26870 80036870 9767000C */  jal        sprintf
    /* 26874 80036874 21300002 */   addu      $a2, $s0, $zero
    /* 26878 80036878 0C80043C */  lui        $a0, %hi(MediumFont)
    /* 2687C 8003687C D8828424 */  addiu      $a0, $a0, %lo(MediumFont)
    /* 26880 80036880 21280000 */  addu       $a1, $zero, $zero
    /* 26884 80036884 08000624 */  addiu      $a2, $zero, 0x8
    /* 26888 80036888 2800A727 */  addiu      $a3, $sp, 0x28
    /* 2688C 8003688C 01000224 */  addiu      $v0, $zero, 0x1
    /* 26890 80036890 1000A2AF */  sw         $v0, 0x10($sp)
    /* 26894 80036894 FF002232 */  andi       $v0, $s1, 0xFF
    /* 26898 80036898 1400BEAF */  sw         $fp, 0x14($sp)
    /* 2689C 8003689C 1800A2AF */  sw         $v0, 0x18($sp)
    /* 268A0 800368A0 1C00A2AF */  sw         $v0, 0x1C($sp)
    /* 268A4 800368A4 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 268A8 800368A8 2000A2AF */   sw        $v0, 0x20($sp)
    /* 268AC 800368AC 0A004226 */  addiu      $v0, $s2, 0xA
    /* 268B0 800368B0 21905600 */  addu       $s2, $v0, $s6
    /* 268B4 800368B4 21980002 */  addu       $s3, $s0, $zero
    /* 268B8 800368B8 0500622A */  slti       $v0, $s3, 0x5
    /* 268BC 800368BC CAFF4014 */  bnez       $v0, .L800367E8
    /* 268C0 800368C0 21208002 */   addu      $a0, $s4, $zero
    /* 268C4 800368C4 1280023C */  lui        $v0, %hi(BACKR)
    /* 268C8 800368C8 FAAB4290 */  lbu        $v0, %lo(BACKR)($v0)
    /* 268CC 800368CC AAAA033C */  lui        $v1, (0xAAAAAAAB >> 16)
    /* 268D0 800368D0 ABAA6334 */  ori        $v1, $v1, (0xAAAAAAAB & 0xFFFF)
    /* 268D4 800368D4 19004300 */  multu      $v0, $v1
    /* 268D8 800368D8 10280000 */  mfhi       $a1
    /* 268DC 800368DC 1280023C */  lui        $v0, %hi(BACKG)
    /* 268E0 800368E0 FBAB4290 */  lbu        $v0, %lo(BACKG)($v0)
    /* 268E4 800368E4 00000000 */  nop
    /* 268E8 800368E8 19004300 */  multu      $v0, $v1
    /* 268EC 800368EC 10300000 */  mfhi       $a2
    /* 268F0 800368F0 1280023C */  lui        $v0, %hi(BACKB)
    /* 268F4 800368F4 FCAB4290 */  lbu        $v0, %lo(BACKB)($v0)
    /* 268F8 800368F8 00000000 */  nop
    /* 268FC 800368FC 19004300 */  multu      $v0, $v1
    /* 26900 80036900 26001524 */  addiu      $s5, $zero, 0x26
    /* 26904 80036904 14001E24 */  addiu      $fp, $zero, 0x14
    /* 26908 80036908 2E001724 */  addiu      $s7, $zero, 0x2E
    /* 2690C 8003690C FE00A530 */  andi       $a1, $a1, 0xFE
    /* 26910 80036910 FE00C630 */  andi       $a2, $a2, 0xFE
    /* 26914 80036914 10180000 */  mfhi       $v1
    /* 26918 80036918 85DD000C */  jal        SetRGB__6DialogUcUcUc
    /* 2691C 8003691C FE006730 */   andi      $a3, $v1, 0xFE
    /* 26920 80036920 21208002 */  addu       $a0, $s4, $zero
    /* 26924 80036924 8DDD000C */  jal        SetBack__6Dialogi
    /* 26928 80036928 94000524 */   addiu     $a1, $zero, 0x94
    /* 2692C 8003692C 21208002 */  addu       $a0, $s4, $zero
    /* 26930 80036930 8FDD000C */  jal        SetBorder__6Dialogi
    /* 26934 80036934 12000524 */   addiu     $a1, $zero, 0x12
    /* 26938 80036938 1280033C */  lui        $v1, %hi(myplr)
    /* 2693C 8003693C 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 26940 80036940 01001324 */  addiu      $s3, $zero, 0x1
    /* 26944 80036944 40100300 */  sll        $v0, $v1, 1
    /* 26948 80036948 21104300 */  addu       $v0, $v0, $v1
    /* 2694C 8003694C 80100200 */  sll        $v0, $v0, 2
    /* 26950 80036950 21104300 */  addu       $v0, $v0, $v1
    /* 26954 80036954 00110200 */  sll        $v0, $v0, 4
    /* 26958 80036958 23104300 */  subu       $v0, $v0, $v1
    /* 2695C 8003695C 80100200 */  sll        $v0, $v0, 2
    /* 26960 80036960 21104300 */  addu       $v0, $v0, $v1
    /* 26964 80036964 C0100200 */  sll        $v0, $v0, 3
    /* 26968 80036968 0E80013C */  lui        $at, %hi(plr + 0x19B0)
    /* 2696C 8003696C 21082200 */  addu       $at, $at, $v0
    /* 26970 80036970 E8BE248C */  lw         $a0, %lo(plr + 0x19B0)($at)
    /* 26974 80036974 0E80013C */  lui        $at, %hi(plr + 0x19B4)
    /* 26978 80036978 21082200 */  addu       $at, $at, $v0
    /* 2697C 8003697C ECBE258C */  lw         $a1, %lo(plr + 0x19B4)($at)
    /* 26980 80036980 0E80013C */  lui        $at, %hi(plr + 0xB8)
    /* 26984 80036984 21082200 */  addu       $at, $at, $v0
    /* 26988 80036988 F0A5268C */  lw         $a2, %lo(plr + 0xB8)($at)
    /* 2698C 8003698C 0E80013C */  lui        $at, %hi(plr + 0xBC)
    /* 26990 80036990 21082200 */  addu       $at, $at, $v0
    /* 26994 80036994 F4A5278C */  lw         $a3, %lo(plr + 0xBC)($at)
    /* 26998 80036998 0E80013C */  lui        $at, %hi(plr + 0xC4)
    /* 2699C 8003699C 21082200 */  addu       $at, $at, $v0
    /* 269A0 800369A0 FCA5238C */  lw         $v1, %lo(plr + 0xC4)($at)
    /* 269A4 800369A4 0E80013C */  lui        $at, %hi(plr + 0xC0)
    /* 269A8 800369A8 21082200 */  addu       $at, $at, $v0
    /* 269AC 800369AC F8A5228C */  lw         $v0, %lo(plr + 0xC0)($at)
    /* 269B0 800369B0 2528A700 */  or         $a1, $a1, $a3
    /* 269B4 800369B4 25208600 */  or         $a0, $a0, $a2
    /* 269B8 800369B8 2528A300 */  or         $a1, $a1, $v1
    /* 269BC 800369BC 25208200 */  or         $a0, $a0, $v0
    /* 269C0 800369C0 3800A4AF */  sw         $a0, 0x38($sp)
    /* 269C4 800369C4 3C00A5AF */  sw         $a1, 0x3C($sp)
  .L800369C8:
    /* 269C8 800369C8 1380043C */  lui        $a0, %hi(D_8012EA88)
    /* 269CC 800369CC 88EA8424 */  addiu      $a0, $a0, %lo(D_8012EA88)
    /* 269D0 800369D0 2F000524 */  addiu      $a1, $zero, 0x2F
    /* 269D4 800369D4 0600B026 */  addiu      $s0, $s5, 0x6
    /* 269D8 800369D8 21300002 */  addu       $a2, $s0, $zero
    /* 269DC 800369DC FC000724 */  addiu      $a3, $zero, 0xFC
    /* 269E0 800369E0 18000224 */  addiu      $v0, $zero, 0x18
    /* 269E4 800369E4 B82F020C */  jal        Back__6Dialogiiii
    /* 269E8 800369E8 1000A2AF */   sw        $v0, 0x10($sp)
    /* 269EC 800369EC 2F000224 */  addiu      $v0, $zero, 0x2F
    /* 269F0 800369F0 740F82A7 */  sh         $v0, %gp_rel(CSRect)($gp)
    /* 269F4 800369F4 FC000224 */  addiu      $v0, $zero, 0xFC
    /* 269F8 800369F8 780F82A7 */  sh         $v0, %gp_rel(D_8011B6F8)($gp)
    /* 269FC 800369FC 18000224 */  addiu      $v0, $zero, 0x18
    /* 26A00 80036A00 940F838F */  lw         $v1, %gp_rel(sbooktab)($gp)
    /* 26A04 80036A04 0D80043C */  lui        $a0, %hi(SpellPages)
    /* 26A08 80036A08 4CE38424 */  addiu      $a0, $a0, %lo(SpellPages)
    /* 26A0C 80036A0C 760F90A7 */  sh         $s0, %gp_rel(CSRect + 0x2)($gp)
    /* 26A10 80036A10 7A0F82A7 */  sh         $v0, %gp_rel(D_8011B6F8 + 0x2)($gp)
    /* 26A14 80036A14 80100300 */  sll        $v0, $v1, 2
    /* 26A18 80036A18 21104300 */  addu       $v0, $v0, $v1
    /* 26A1C 80036A1C 80100200 */  sll        $v0, $v0, 2
    /* 26A20 80036A20 21104400 */  addu       $v0, $v0, $a0
    /* 26A24 80036A24 80181300 */  sll        $v1, $s3, 2
    /* 26A28 80036A28 21186200 */  addu       $v1, $v1, $v0
    /* 26A2C 80036A2C FCFF728C */  lw         $s2, -0x4($v1)
    /* 26A30 80036A30 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 26A34 80036A34 11014212 */  beq        $s2, $v0, .L80036E7C
    /* 26A38 80036A38 80001624 */   addiu     $s6, $zero, 0x80
    /* 26A3C 80036A3C 3800AC8F */  lw         $t4, 0x38($sp)
    /* 26A40 80036A40 3C00AD8F */  lw         $t5, 0x3C($sp)
    /* 26A44 80036A44 FFFF4226 */  addiu      $v0, $s2, -0x1
    /* 26A48 80036A48 80260200 */  sll        $a0, $v0, 26
    /* 26A4C 80036A4C 04008104 */  bgez       $a0, .L80036A60
    /* 26A50 80036A50 00000000 */   nop
    /* 26A54 80036A54 06504D00 */  srlv       $t2, $t5, $v0
    /* 26A58 80036A58 07000104 */  bgez       $zero, .L80036A78
    /* 26A5C 80036A5C 21580000 */   addu      $t3, $zero, $zero
  .L80036A60:
    /* 26A60 80036A60 04008010 */  beqz       $a0, .L80036A74
    /* 26A64 80036A64 06504C00 */   srlv      $t2, $t4, $v0
    /* 26A68 80036A68 23200200 */  negu       $a0, $v0
    /* 26A6C 80036A6C 04208D00 */  sllv       $a0, $t5, $a0
    /* 26A70 80036A70 25504401 */  or         $t2, $t2, $a0
  .L80036A74:
    /* 26A74 80036A74 06584D00 */  srlv       $t3, $t5, $v0
  .L80036A78:
    /* 26A78 80036A78 21104001 */  addu       $v0, $t2, $zero
    /* 26A7C 80036A7C 21186001 */  addu       $v1, $t3, $zero
    /* 26A80 80036A80 00000B24 */  addiu      $t3, $zero, 0x0
    /* 26A84 80036A84 01000A24 */  addiu      $t2, $zero, 0x1
    /* 26A88 80036A88 24186B00 */  and        $v1, $v1, $t3
    /* 26A8C 80036A8C 24104A00 */  and        $v0, $v0, $t2
    /* 26A90 80036A90 FA004010 */  beqz       $v0, .L80036E7C
    /* 26A94 80036A94 21204002 */   addu      $a0, $s2, $zero
    /* 26A98 80036A98 1ED9000C */  jal        GetSBookTrans__FiUc
    /* 26A9C 80036A9C 01000524 */   addiu     $a1, $zero, 0x1
    /* 26AA0 80036AA0 00160200 */  sll        $v0, $v0, 24
    /* 26AA4 80036AA4 4EC3000C */  jal        SetSpellTrans__Fc
    /* 26AA8 80036AA8 03260200 */   sra       $a0, $v0, 24
    /* 26AAC 80036AAC 1280023C */  lui        $v0, %hi(options_pad)
    /* 26AB0 80036AB0 50B2428C */  lw         $v0, %lo(options_pad)($v0)
    /* 26AB4 80036AB4 00000000 */  nop
    /* 26AB8 80036AB8 80180200 */  sll        $v1, $v0, 2
    /* 26ABC 80036ABC 1280013C */  lui        $at, %hi(D_8011C78C)
    /* 26AC0 80036AC0 21082300 */  addu       $at, $at, $v1
    /* 26AC4 80036AC4 8CC7228C */  lw         $v0, %lo(D_8011C78C)($at)
    /* 26AC8 80036AC8 00000000 */  nop
    /* 26ACC 80036ACC 1D004216 */  bne        $s2, $v0, .L80036B44
    /* 26AD0 80036AD0 00000000 */   nop
    /* 26AD4 80036AD4 1280013C */  lui        $at, %hi(cur_spel)
    /* 26AD8 80036AD8 21082300 */  addu       $at, $at, $v1
    /* 26ADC 80036ADC 18B7228C */  lw         $v0, %lo(cur_spel)($at)
    /* 26AE0 80036AE0 00000000 */  nop
    /* 26AE4 80036AE4 01004224 */  addiu      $v0, $v0, 0x1
    /* 26AE8 80036AE8 0C006216 */  bne        $s3, $v0, .L80036B1C
    /* 26AEC 80036AEC 2120C003 */   addu      $a0, $fp, $zero
    /* 26AF0 80036AF0 FF001624 */  addiu      $s6, $zero, 0xFF
    /* 26AF4 80036AF4 2128E002 */  addu       $a1, $s7, $zero
    /* 26AF8 80036AF8 21300000 */  addu       $a2, $zero, $zero
    /* 26AFC 80036AFC 0D80013C */  lui        $at, %hi(SpellITbl)
    /* 26B00 80036B00 21083200 */  addu       $at, $at, $s2
    /* 26B04 80036B04 24E32780 */  lb         $a3, %lo(SpellITbl)($at)
    /* 26B08 80036B08 01000B24 */  addiu      $t3, $zero, 0x1
    /* 26B0C 80036B0C 01000C24 */  addiu      $t4, $zero, 0x1
  .L80036B10:
    /* 26B10 80036B10 1000ABAF */  sw         $t3, 0x10($sp)
    /* 26B14 80036B14 E9DA0008 */  j          .L80036BA4
    /* 26B18 80036B18 1400ACAF */   sw        $t4, 0x14($sp)
  .L80036B1C:
    /* 26B1C 80036B1C 2128E002 */  addu       $a1, $s7, $zero
    /* 26B20 80036B20 01000624 */  addiu      $a2, $zero, 0x1
    /* 26B24 80036B24 02000224 */  addiu      $v0, $zero, 0x2
    /* 26B28 80036B28 0D80013C */  lui        $at, %hi(SpellITbl)
    /* 26B2C 80036B2C 21083200 */  addu       $at, $at, $s2
    /* 26B30 80036B30 24E32780 */  lb         $a3, %lo(SpellITbl)($at)
    /* 26B34 80036B34 01000D24 */  addiu      $t5, $zero, 0x1
    /* 26B38 80036B38 1000A2AF */  sw         $v0, 0x10($sp)
    /* 26B3C 80036B3C E9DA0008 */  j          .L80036BA4
    /* 26B40 80036B40 1400ADAF */   sw        $t5, 0x14($sp)
  .L80036B44:
    /* 26B44 80036B44 1280013C */  lui        $at, %hi(cur_spel)
    /* 26B48 80036B48 21082300 */  addu       $at, $at, $v1
    /* 26B4C 80036B4C 18B7228C */  lw         $v0, %lo(cur_spel)($at)
    /* 26B50 80036B50 00000000 */  nop
    /* 26B54 80036B54 01004224 */  addiu      $v0, $v0, 0x1
    /* 26B58 80036B58 0A006216 */  bne        $s3, $v0, .L80036B84
    /* 26B5C 80036B5C 2120C003 */   addu      $a0, $fp, $zero
    /* 26B60 80036B60 FF001624 */  addiu      $s6, $zero, 0xFF
    /* 26B64 80036B64 2128E002 */  addu       $a1, $s7, $zero
    /* 26B68 80036B68 21300000 */  addu       $a2, $zero, $zero
    /* 26B6C 80036B6C 0D80013C */  lui        $at, %hi(SpellITbl)
    /* 26B70 80036B70 21083200 */  addu       $at, $at, $s2
    /* 26B74 80036B74 24E32780 */  lb         $a3, %lo(SpellITbl)($at)
    /* 26B78 80036B78 01000A24 */  addiu      $t2, $zero, 0x1
    /* 26B7C 80036B7C E8DA0008 */  j          .L80036BA0
    /* 26B80 80036B80 1000AAAF */   sw        $t2, 0x10($sp)
  .L80036B84:
    /* 26B84 80036B84 2128E002 */  addu       $a1, $s7, $zero
    /* 26B88 80036B88 01000624 */  addiu      $a2, $zero, 0x1
    /* 26B8C 80036B8C 0D80013C */  lui        $at, %hi(SpellITbl)
    /* 26B90 80036B90 21083200 */  addu       $at, $at, $s2
    /* 26B94 80036B94 24E32780 */  lb         $a3, %lo(SpellITbl)($at)
    /* 26B98 80036B98 02000224 */  addiu      $v0, $zero, 0x2
    /* 26B9C 80036B9C 1000A2AF */  sw         $v0, 0x10($sp)
  .L80036BA0:
    /* 26BA0 80036BA0 1400A0AF */  sw         $zero, 0x14($sp)
  .L80036BA4:
    /* 26BA4 80036BA4 6DC0000C */  jal        DrawSpellCel__FllUclUcc
    /* 26BA8 80036BA8 00000000 */   nop
    /* 26BAC 80036BAC 21204002 */  addu       $a0, $s2, $zero
    /* 26BB0 80036BB0 1ED9000C */  jal        GetSBookTrans__FiUc
    /* 26BB4 80036BB4 21280000 */   addu      $a1, $zero, $zero
    /* 26BB8 80036BB8 40181200 */  sll        $v1, $s2, 1
    /* 26BBC 80036BBC 21187200 */  addu       $v1, $v1, $s2
    /* 26BC0 80036BC0 80180300 */  sll        $v1, $v1, 2
    /* 26BC4 80036BC4 21187200 */  addu       $v1, $v1, $s2
    /* 26BC8 80036BC8 80180300 */  sll        $v1, $v1, 2
    /* 26BCC 80036BCC 0E80013C */  lui        $at, %hi(spelldata + 0x4)
    /* 26BD0 80036BD0 21082300 */  addu       $at, $at, $v1
    /* 26BD4 80036BD4 84DB248C */  lw         $a0, %lo(spelldata + 0x4)($at)
    /* 26BD8 80036BD8 4AED010C */  jal        GetStr__Fi
    /* 26BDC 80036BDC 21A04000 */   addu      $s4, $v0, $zero
    /* 26BE0 80036BE0 21200000 */  addu       $a0, $zero, $zero
    /* 26BE4 80036BE4 09000524 */  addiu      $a1, $zero, 0x9
    /* 26BE8 80036BE8 21304002 */  addu       $a2, $s2, $zero
    /* 26BEC 80036BEC 21384000 */  addu       $a3, $v0, $zero
    /* 26BF0 80036BF0 00161400 */  sll        $v0, $s4, 24
    /* 26BF4 80036BF4 03860200 */  sra        $s0, $v0, 24
    /* 26BF8 80036BF8 0300023A */  xori       $v0, $s0, 0x3
    /* 26BFC 80036BFC 0100422C */  sltiu      $v0, $v0, 0x1
    /* 26C00 80036C00 1000B6AF */  sw         $s6, 0x10($sp)
    /* 26C04 80036C04 7CD8000C */  jal        PrintSBookStr__FiiiPCcUcUc
    /* 26C08 80036C08 1400A2AF */   sw        $v0, 0x14($sp)
    /* 26C0C 80036C0C 05000012 */  beqz       $s0, .L80036C24
    /* 26C10 80036C10 03000224 */   addiu     $v0, $zero, 0x3
    /* 26C14 80036C14 0B000212 */  beq        $s0, $v0, .L80036C44
    /* 26C18 80036C18 00000000 */   nop
    /* 26C1C 80036C1C 25DB0008 */  j          .L80036C94
    /* 26C20 80036C20 00000000 */   nop
  .L80036C24:
    /* 26C24 80036C24 4AED010C */  jal        GetStr__Fi
    /* 26C28 80036C28 D5030424 */   addiu     $a0, $zero, 0x3D5
    /* 26C2C 80036C2C 0D80043C */  lui        $a0, %hi(tempstr)
    /* 26C30 80036C30 10EA8424 */  addiu      $a0, $a0, %lo(tempstr)
    /* 26C34 80036C34 F240000C */  jal        strcpy
    /* 26C38 80036C38 21284000 */   addu      $a1, $v0, $zero
    /* 26C3C 80036C3C 94DB0008 */  j          .L80036E50
    /* 26C40 80036C40 88000424 */   addiu     $a0, $zero, 0x88
  .L80036C44:
    /* 26C44 80036C44 4AED010C */  jal        GetStr__Fi
    /* 26C48 80036C48 FE040424 */   addiu     $a0, $zero, 0x4FE
    /* 26C4C 80036C4C 1280053C */  lui        $a1, %hi(myplr)
    /* 26C50 80036C50 08BAA58C */  lw         $a1, %lo(myplr)($a1)
    /* 26C54 80036C54 0D80043C */  lui        $a0, %hi(tempstr)
    /* 26C58 80036C58 10EA8424 */  addiu      $a0, $a0, %lo(tempstr)
    /* 26C5C 80036C5C 40180500 */  sll        $v1, $a1, 1
    /* 26C60 80036C60 21186500 */  addu       $v1, $v1, $a1
    /* 26C64 80036C64 80180300 */  sll        $v1, $v1, 2
    /* 26C68 80036C68 21186500 */  addu       $v1, $v1, $a1
    /* 26C6C 80036C6C 00190300 */  sll        $v1, $v1, 4
    /* 26C70 80036C70 23186500 */  subu       $v1, $v1, $a1
    /* 26C74 80036C74 80180300 */  sll        $v1, $v1, 2
    /* 26C78 80036C78 21186500 */  addu       $v1, $v1, $a1
    /* 26C7C 80036C7C C0180300 */  sll        $v1, $v1, 3
    /* 26C80 80036C80 0E80013C */  lui        $at, %hi(plr + 0x3A9)
    /* 26C84 80036C84 21082300 */  addu       $at, $at, $v1
    /* 26C88 80036C88 E1A82690 */  lbu        $a2, %lo(plr + 0x3A9)($at)
    /* 26C8C 80036C8C 91DB0008 */  j          .L80036E44
    /* 26C90 80036C90 21284000 */   addu      $a1, $v0, $zero
  .L80036C94:
    /* 26C94 80036C94 1280043C */  lui        $a0, %hi(myplr)
    /* 26C98 80036C98 08BA848C */  lw         $a0, %lo(myplr)($a0)
    /* 26C9C 80036C9C 15DC010C */  jal        GetManaAmount__Fii
    /* 26CA0 80036CA0 21284002 */   addu      $a1, $s2, $zero
    /* 26CA4 80036CA4 83890200 */  sra        $s1, $v0, 6
    /* 26CA8 80036CA8 21204002 */  addu       $a0, $s2, $zero
    /* 26CAC 80036CAC 3000A527 */  addiu      $a1, $sp, 0x30
    /* 26CB0 80036CB0 01E7040C */  jal        func_80139C04
    /* 26CB4 80036CB4 3400A627 */   addiu     $a2, $sp, 0x34
    /* 26CB8 80036CB8 3000A38F */  lw         $v1, 0x30($sp)
    /* 26CBC 80036CBC FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 26CC0 80036CC0 14006210 */  beq        $v1, $v0, .L80036D14
    /* 26CC4 80036CC4 00000000 */   nop
    /* 26CC8 80036CC8 4AED010C */  jal        GetStr__Fi
    /* 26CCC 80036CCC 7A020424 */   addiu     $a0, $zero, 0x27A
    /* 26CD0 80036CD0 E1000424 */  addiu      $a0, $zero, 0xE1
    /* 26CD4 80036CD4 4AED010C */  jal        GetStr__Fi
    /* 26CD8 80036CD8 21804000 */   addu      $s0, $v0, $zero
    /* 26CDC 80036CDC 0D80043C */  lui        $a0, %hi(tempstr)
    /* 26CE0 80036CE0 10EA8424 */  addiu      $a0, $a0, %lo(tempstr)
    /* 26CE4 80036CE4 1180053C */  lui        $a1, %hi(D_801110D4)
    /* 26CE8 80036CE8 D410A524 */  addiu      $a1, $a1, %lo(D_801110D4)
    /* 26CEC 80036CEC 1000A2AF */  sw         $v0, 0x10($sp)
    /* 26CF0 80036CF0 3000A28F */  lw         $v0, 0x30($sp)
    /* 26CF4 80036CF4 21300002 */  addu       $a2, $s0, $zero
    /* 26CF8 80036CF8 1400A2AF */  sw         $v0, 0x14($sp)
    /* 26CFC 80036CFC 3400A28F */  lw         $v0, 0x34($sp)
    /* 26D00 80036D00 21382002 */  addu       $a3, $s1, $zero
    /* 26D04 80036D04 9767000C */  jal        sprintf
    /* 26D08 80036D08 1800A2AF */   sw        $v0, 0x18($sp)
    /* 26D0C 80036D0C 53DB0008 */  j          .L80036D4C
    /* 26D10 80036D10 24000224 */   addiu     $v0, $zero, 0x24
  .L80036D14:
    /* 26D14 80036D14 4AED010C */  jal        GetStr__Fi
    /* 26D18 80036D18 7A020424 */   addiu     $a0, $zero, 0x27A
    /* 26D1C 80036D1C E1000424 */  addiu      $a0, $zero, 0xE1
    /* 26D20 80036D20 4AED010C */  jal        GetStr__Fi
    /* 26D24 80036D24 21804000 */   addu      $s0, $v0, $zero
    /* 26D28 80036D28 1000A2AF */  sw         $v0, 0x10($sp)
    /* 26D2C 80036D2C 0D80043C */  lui        $a0, %hi(tempstr)
    /* 26D30 80036D30 10EA8424 */  addiu      $a0, $a0, %lo(tempstr)
    /* 26D34 80036D34 1180053C */  lui        $a1, %hi(D_801110E8)
    /* 26D38 80036D38 E810A524 */  addiu      $a1, $a1, %lo(D_801110E8)
    /* 26D3C 80036D3C 21300002 */  addu       $a2, $s0, $zero
    /* 26D40 80036D40 9767000C */  jal        sprintf
    /* 26D44 80036D44 21382002 */   addu      $a3, $s1, $zero
    /* 26D48 80036D48 24000224 */  addiu      $v0, $zero, 0x24
  .L80036D4C:
    /* 26D4C 80036D4C 09004216 */  bne        $s2, $v0, .L80036D74
    /* 26D50 80036D50 21200000 */   addu      $a0, $zero, $zero
    /* 26D54 80036D54 4AED010C */  jal        GetStr__Fi
    /* 26D58 80036D58 7C020424 */   addiu     $a0, $zero, 0x27C
    /* 26D5C 80036D5C 0D80043C */  lui        $a0, %hi(tempstr)
    /* 26D60 80036D60 10EA8424 */  addiu      $a0, $a0, %lo(tempstr)
    /* 26D64 80036D64 21284000 */  addu       $a1, $v0, $zero
    /* 26D68 80036D68 9767000C */  jal        sprintf
    /* 26D6C 80036D6C 21302002 */   addu      $a2, $s1, $zero
    /* 26D70 80036D70 21200000 */  addu       $a0, $zero, $zero
  .L80036D74:
    /* 26D74 80036D74 14000524 */  addiu      $a1, $zero, 0x14
    /* 26D78 80036D78 21304002 */  addu       $a2, $s2, $zero
    /* 26D7C 80036D7C 0D80073C */  lui        $a3, %hi(tempstr)
    /* 26D80 80036D80 10EAE724 */  addiu      $a3, $a3, %lo(tempstr)
    /* 26D84 80036D84 00161400 */  sll        $v0, $s4, 24
    /* 26D88 80036D88 03160200 */  sra        $v0, $v0, 24
    /* 26D8C 80036D8C 03004238 */  xori       $v0, $v0, 0x3
    /* 26D90 80036D90 0100422C */  sltiu      $v0, $v0, 0x1
    /* 26D94 80036D94 1000B6AF */  sw         $s6, 0x10($sp)
    /* 26D98 80036D98 7CD8000C */  jal        PrintSBookStr__FiiiPCcUcUc
    /* 26D9C 80036D9C 1400A2AF */   sw        $v0, 0x14($sp)
    /* 26DA0 80036DA0 1280033C */  lui        $v1, %hi(myplr)
    /* 26DA4 80036DA4 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 26DA8 80036DA8 00000000 */  nop
    /* 26DAC 80036DAC 40100300 */  sll        $v0, $v1, 1
    /* 26DB0 80036DB0 21104300 */  addu       $v0, $v0, $v1
    /* 26DB4 80036DB4 80100200 */  sll        $v0, $v0, 2
    /* 26DB8 80036DB8 21104300 */  addu       $v0, $v0, $v1
    /* 26DBC 80036DBC 00110200 */  sll        $v0, $v0, 4
    /* 26DC0 80036DC0 23104300 */  subu       $v0, $v0, $v1
    /* 26DC4 80036DC4 80100200 */  sll        $v0, $v0, 2
    /* 26DC8 80036DC8 21104300 */  addu       $v0, $v0, $v1
    /* 26DCC 80036DCC C0100200 */  sll        $v0, $v0, 3
    /* 26DD0 80036DD0 0E80033C */  lui        $v1, %hi(plr + 0x71)
    /* 26DD4 80036DD4 A9A56324 */  addiu      $v1, $v1, %lo(plr + 0x71)
    /* 26DD8 80036DD8 21184300 */  addu       $v1, $v0, $v1
    /* 26DDC 80036DDC 21187200 */  addu       $v1, $v1, $s2
    /* 26DE0 80036DE0 00006380 */  lb         $v1, 0x0($v1)
    /* 26DE4 80036DE4 0E80013C */  lui        $at, %hi(plr + 0x19C0)
    /* 26DE8 80036DE8 21082200 */  addu       $at, $at, $v0
    /* 26DEC 80036DEC F8BE2280 */  lb         $v0, %lo(plr + 0x19C0)($at)
    /* 26DF0 80036DF0 00000000 */  nop
    /* 26DF4 80036DF4 21886200 */  addu       $s1, $v1, $v0
    /* 26DF8 80036DF8 02002106 */  bgez       $s1, .L80036E04
    /* 26DFC 80036DFC 00000000 */   nop
    /* 26E00 80036E00 21880000 */  addu       $s1, $zero, $zero
  .L80036E04:
    /* 26E04 80036E04 09002016 */  bnez       $s1, .L80036E2C
    /* 26E08 80036E08 00000000 */   nop
    /* 26E0C 80036E0C 4AED010C */  jal        GetStr__Fi
    /* 26E10 80036E10 F8030424 */   addiu     $a0, $zero, 0x3F8
    /* 26E14 80036E14 0D80043C */  lui        $a0, %hi(tempstr)
    /* 26E18 80036E18 10EA8424 */  addiu      $a0, $a0, %lo(tempstr)
    /* 26E1C 80036E1C 9767000C */  jal        sprintf
    /* 26E20 80036E20 21284000 */   addu      $a1, $v0, $zero
    /* 26E24 80036E24 94DB0008 */  j          .L80036E50
    /* 26E28 80036E28 88000424 */   addiu     $a0, $zero, 0x88
  .L80036E2C:
    /* 26E2C 80036E2C 4AED010C */  jal        GetStr__Fi
    /* 26E30 80036E30 F9030424 */   addiu     $a0, $zero, 0x3F9
    /* 26E34 80036E34 0D80043C */  lui        $a0, %hi(tempstr)
    /* 26E38 80036E38 10EA8424 */  addiu      $a0, $a0, %lo(tempstr)
    /* 26E3C 80036E3C 21284000 */  addu       $a1, $v0, $zero
    /* 26E40 80036E40 21302002 */  addu       $a2, $s1, $zero
  .L80036E44:
    /* 26E44 80036E44 9767000C */  jal        sprintf
    /* 26E48 80036E48 00000000 */   nop
    /* 26E4C 80036E4C 88000424 */  addiu      $a0, $zero, 0x88
  .L80036E50:
    /* 26E50 80036E50 09000524 */  addiu      $a1, $zero, 0x9
    /* 26E54 80036E54 21304002 */  addu       $a2, $s2, $zero
    /* 26E58 80036E58 0D80073C */  lui        $a3, %hi(tempstr)
    /* 26E5C 80036E5C 10EAE724 */  addiu      $a3, $a3, %lo(tempstr)
    /* 26E60 80036E60 00161400 */  sll        $v0, $s4, 24
    /* 26E64 80036E64 03160200 */  sra        $v0, $v0, 24
    /* 26E68 80036E68 03004238 */  xori       $v0, $v0, 0x3
    /* 26E6C 80036E6C 0100422C */  sltiu      $v0, $v0, 0x1
    /* 26E70 80036E70 1000B6AF */  sw         $s6, 0x10($sp)
    /* 26E74 80036E74 7CD8000C */  jal        PrintSBookStr__FiiiPCcUcUc
    /* 26E78 80036E78 1400A2AF */   sw        $v0, 0x14($sp)
  .L80036E7C:
    /* 26E7C 80036E7C 1E00B526 */  addiu      $s5, $s5, 0x1E
    /* 26E80 80036E80 01007326 */  addiu      $s3, $s3, 0x1
    /* 26E84 80036E84 0600622A */  slti       $v0, $s3, 0x6
    /* 26E88 80036E88 CFFE4014 */  bnez       $v0, .L800369C8
    /* 26E8C 80036E8C 1E00F726 */   addiu     $s7, $s7, 0x1E
    /* 26E90 80036E90 16001224 */  addiu      $s2, $zero, 0x16
    /* 26E94 80036E94 30001524 */  addiu      $s5, $zero, 0x30
    /* 26E98 80036E98 21980000 */  addu       $s3, $zero, $zero
    /* 26E9C 80036E9C 1280103C */  lui        $s0, %hi(cur_spel)
    /* 26EA0 80036EA0 18B71026 */  addiu      $s0, $s0, %lo(cur_spel)
  .L80036EA4:
    /* 26EA4 80036EA4 1280023C */  lui        $v0, %hi(options_pad)
    /* 26EA8 80036EA8 50B2428C */  lw         $v0, %lo(options_pad)($v0)
    /* 26EAC 80036EAC 00000000 */  nop
    /* 26EB0 80036EB0 80100200 */  sll        $v0, $v0, 2
    /* 26EB4 80036EB4 21105000 */  addu       $v0, $v0, $s0
    /* 26EB8 80036EB8 0000428C */  lw         $v0, 0x0($v0)
    /* 26EBC 80036EBC 00000000 */  nop
    /* 26EC0 80036EC0 06006216 */  bne        $s3, $v0, .L80036EDC
    /* 26EC4 80036EC4 FF000524 */   addiu     $a1, $zero, 0xFF
    /* 26EC8 80036EC8 1380043C */  lui        $a0, %hi(D_8012EA88)
    /* 26ECC 80036ECC 88EA8424 */  addiu      $a0, $a0, %lo(D_8012EA88)
    /* 26ED0 80036ED0 FF000624 */  addiu      $a2, $zero, 0xFF
    /* 26ED4 80036ED4 C2DB0008 */  j          .L80036F08
    /* 26ED8 80036ED8 FF000724 */   addiu     $a3, $zero, 0xFF
  .L80036EDC:
    /* 26EDC 80036EDC 1380043C */  lui        $a0, %hi(D_8012EA88)
    /* 26EE0 80036EE0 88EA8424 */  addiu      $a0, $a0, %lo(D_8012EA88)
    /* 26EE4 80036EE4 1280053C */  lui        $a1, %hi(BACKR)
    /* 26EE8 80036EE8 FAABA590 */  lbu        $a1, %lo(BACKR)($a1)
    /* 26EEC 80036EEC 1280063C */  lui        $a2, %hi(BACKG)
    /* 26EF0 80036EF0 FBABC690 */  lbu        $a2, %lo(BACKG)($a2)
    /* 26EF4 80036EF4 1280073C */  lui        $a3, %hi(BACKB)
    /* 26EF8 80036EF8 FCABE790 */  lbu        $a3, %lo(BACKB)($a3)
    /* 26EFC 80036EFC 42280500 */  srl        $a1, $a1, 1
    /* 26F00 80036F00 42300600 */  srl        $a2, $a2, 1
    /* 26F04 80036F04 42380700 */  srl        $a3, $a3, 1
  .L80036F08:
    /* 26F08 80036F08 85DD000C */  jal        SetRGB__6DialogUcUcUc
    /* 26F0C 80036F0C 01007326 */   addiu     $s3, $s3, 0x1
    /* 26F10 80036F10 0F000224 */  addiu      $v0, $zero, 0xF
    /* 26F14 80036F14 1000A2AF */  sw         $v0, 0x10($sp)
    /* 26F18 80036F18 1380043C */  lui        $a0, %hi(D_8012EA88)
    /* 26F1C 80036F1C 88EA8424 */  addiu      $a0, $a0, %lo(D_8012EA88)
    /* 26F20 80036F20 21284002 */  addu       $a1, $s2, $zero
    /* 26F24 80036F24 2130A002 */  addu       $a2, $s5, $zero
    /* 26F28 80036F28 B82F020C */  jal        Back__6Dialogiiii
    /* 26F2C 80036F2C 10000724 */   addiu     $a3, $zero, 0x10
    /* 26F30 80036F30 0500622A */  slti       $v0, $s3, 0x5
    /* 26F34 80036F34 DBFF4014 */  bnez       $v0, .L80036EA4
    /* 26F38 80036F38 1E00B526 */   addiu     $s5, $s5, 0x1E
    /* 26F3C 80036F3C 1380103C */  lui        $s0, %hi(D_8012EA88)
    /* 26F40 80036F40 88EA1026 */  addiu      $s0, $s0, %lo(D_8012EA88)
    /* 26F44 80036F44 21200002 */  addu       $a0, $s0, $zero
    /* 26F48 80036F48 8DDD000C */  jal        SetBack__6Dialogi
    /* 26F4C 80036F4C 05000524 */   addiu     $a1, $zero, 0x5
    /* 26F50 80036F50 21200002 */  addu       $a0, $s0, $zero
    /* 26F54 80036F54 8FDD000C */  jal        SetBorder__6Dialogi
    /* 26F58 80036F58 12000524 */   addiu     $a1, $zero, 0x12
    /* 26F5C 80036F5C 1280053C */  lui        $a1, %hi(BORDERR)
    /* 26F60 80036F60 F7ABA590 */  lbu        $a1, %lo(BORDERR)($a1)
    /* 26F64 80036F64 1280063C */  lui        $a2, %hi(BORDERG)
    /* 26F68 80036F68 F8ABC690 */  lbu        $a2, %lo(BORDERG)($a2)
    /* 26F6C 80036F6C 1280073C */  lui        $a3, %hi(BORDERB)
    /* 26F70 80036F70 F9ABE790 */  lbu        $a3, %lo(BORDERB)($a3)
    /* 26F74 80036F74 85DD000C */  jal        SetRGB__6DialogUcUcUc
    /* 26F78 80036F78 21200002 */   addu      $a0, $s0, $zero
    /* 26F7C 80036F7C 21200002 */  addu       $a0, $s0, $zero
    /* 26F80 80036F80 0E000524 */  addiu      $a1, $zero, 0xE
    /* 26F84 80036F84 16000624 */  addiu      $a2, $zero, 0x16
    /* 26F88 80036F88 24010724 */  addiu      $a3, $zero, 0x124
    /* 26F8C 80036F8C 0E000224 */  addiu      $v0, $zero, 0xE
    /* 26F90 80036F90 740F82A7 */  sh         $v0, %gp_rel(CSRect)($gp)
    /* 26F94 80036F94 16000224 */  addiu      $v0, $zero, 0x16
    /* 26F98 80036F98 760F82A7 */  sh         $v0, %gp_rel(CSRect + 0x2)($gp)
    /* 26F9C 80036F9C 24010224 */  addiu      $v0, $zero, 0x124
    /* 26FA0 80036FA0 780F82A7 */  sh         $v0, %gp_rel(D_8011B6F8)($gp)
    /* 26FA4 80036FA4 BC000224 */  addiu      $v0, $zero, 0xBC
    /* 26FA8 80036FA8 7A0F82A7 */  sh         $v0, %gp_rel(D_8011B6F8 + 0x2)($gp)
    /* 26FAC 80036FAC BC000224 */  addiu      $v0, $zero, 0xBC
    /* 26FB0 80036FB0 B82F020C */  jal        Back__6Dialogiiii
    /* 26FB4 80036FB4 1000A2AF */   sw        $v0, 0x10($sp)
    /* 26FB8 80036FB8 4AED010C */  jal        GetStr__Fi
    /* 26FBC 80036FBC F7030424 */   addiu     $a0, $zero, 0x3F7
    /* 26FC0 80036FC0 0C80043C */  lui        $a0, %hi(MediumFont)
    /* 26FC4 80036FC4 D8828424 */  addiu      $a0, $a0, %lo(MediumFont)
    /* 26FC8 80036FC8 21280000 */  addu       $a1, $zero, $zero
    /* 26FCC 80036FCC 0E000624 */  addiu      $a2, $zero, 0xE
    /* 26FD0 80036FD0 21384000 */  addu       $a3, $v0, $zero
    /* 26FD4 80036FD4 1280033C */  lui        $v1, %hi(BLUER)
    /* 26FD8 80036FD8 D4AB6390 */  lbu        $v1, %lo(BLUER)($v1)
    /* 26FDC 80036FDC 1280083C */  lui        $t0, %hi(BLUEG)
    /* 26FE0 80036FE0 D5AB0891 */  lbu        $t0, %lo(BLUEG)($t0)
    /* 26FE4 80036FE4 1280093C */  lui        $t1, %hi(BLUEB)
    /* 26FE8 80036FE8 D6AB2991 */  lbu        $t1, %lo(BLUEB)($t1)
    /* 26FEC 80036FEC 01000224 */  addiu      $v0, $zero, 0x1
    /* 26FF0 80036FF0 1000A2AF */  sw         $v0, 0x10($sp)
    /* 26FF4 80036FF4 1280023C */  lui        $v0, %hi(CSRect)
    /* 26FF8 80036FF8 F4B64224 */  addiu      $v0, $v0, %lo(CSRect)
    /* 26FFC 80036FFC 1400A2AF */  sw         $v0, 0x14($sp)
    /* 27000 80037000 1800A3AF */  sw         $v1, 0x18($sp)
    /* 27004 80037004 1C00A8AF */  sw         $t0, 0x1C($sp)
    /* 27008 80037008 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 2700C 8003700C 2000A9AF */   sw        $t1, 0x20($sp)
    /* 27010 80037010 1280043C */  lui        $a0, %hi(options_pad)
    /* 27014 80037014 50B2848C */  lw         $a0, %lo(options_pad)($a0)
    /* 27018 80037018 FD25020C */  jal        PAD_GetPad__FiUc
    /* 2701C 8003701C 21280000 */   addu      $a1, $zero, $zero
    /* 27020 80037020 21804000 */  addu       $s0, $v0, $zero
    /* 27024 80037024 21200002 */  addu       $a0, $s0, $zero
    /* 27028 80037028 1280023C */  lui        $v0, %hi(options_pad)
    /* 2702C 8003702C 50B2428C */  lw         $v0, %lo(options_pad)($v0)
    /* 27030 80037030 940F928F */  lw         $s2, %gp_rel(sbooktab)($gp)
    /* 27034 80037034 80100200 */  sll        $v0, $v0, 2
    /* 27038 80037038 1280013C */  lui        $at, %hi(cur_spel)
    /* 2703C 8003703C 21082200 */  addu       $at, $at, $v0
    /* 27040 80037040 18B7338C */  lw         $s3, %lo(cur_spel)($at)
    /* 27044 80037044 83DD000C */  jal        SetPadTick__4CPadUs
    /* 27048 80037048 0A000524 */   addiu     $a1, $zero, 0xA
    /* 2704C 8003704C 21200002 */  addu       $a0, $s0, $zero
    /* 27050 80037050 81DD000C */  jal        SetPadTickMask__4CPadUs
    /* 27054 80037054 0F000524 */   addiu     $a1, $zero, 0xF
    /* 27058 80037058 6DDD000C */  jal        GetTick__C4CPad
    /* 2705C 8003705C 21200002 */   addu      $a0, $s0, $zero
    /* 27060 80037060 1280113C */  lui        $s1, %hi(cur_spel)
    /* 27064 80037064 18B73126 */  addiu      $s1, $s1, %lo(cur_spel)
    /* 27068 80037068 01004230 */  andi       $v0, $v0, 0x1
    /* 2706C 8003706C 0A004010 */  beqz       $v0, .L80037098
    /* 27070 80037070 00000000 */   nop
    /* 27074 80037074 1280033C */  lui        $v1, %hi(options_pad)
    /* 27078 80037078 50B2638C */  lw         $v1, %lo(options_pad)($v1)
    /* 2707C 8003707C 00000000 */  nop
    /* 27080 80037080 80180300 */  sll        $v1, $v1, 2
    /* 27084 80037084 21187100 */  addu       $v1, $v1, $s1
    /* 27088 80037088 0000628C */  lw         $v0, 0x0($v1)
    /* 2708C 8003708C 00000000 */  nop
    /* 27090 80037090 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 27094 80037094 000062AC */  sw         $v0, 0x0($v1)
  .L80037098:
    /* 27098 80037098 6DDD000C */  jal        GetTick__C4CPad
    /* 2709C 8003709C 21200002 */   addu      $a0, $s0, $zero
    /* 270A0 800370A0 02004230 */  andi       $v0, $v0, 0x2
    /* 270A4 800370A4 0A004010 */  beqz       $v0, .L800370D0
    /* 270A8 800370A8 00000000 */   nop
    /* 270AC 800370AC 1280033C */  lui        $v1, %hi(options_pad)
    /* 270B0 800370B0 50B2638C */  lw         $v1, %lo(options_pad)($v1)
    /* 270B4 800370B4 00000000 */  nop
    /* 270B8 800370B8 80180300 */  sll        $v1, $v1, 2
    /* 270BC 800370BC 21187100 */  addu       $v1, $v1, $s1
    /* 270C0 800370C0 0000628C */  lw         $v0, 0x0($v1)
    /* 270C4 800370C4 00000000 */  nop
    /* 270C8 800370C8 01004224 */  addiu      $v0, $v0, 0x1
    /* 270CC 800370CC 000062AC */  sw         $v0, 0x0($v1)
  .L800370D0:
    /* 270D0 800370D0 1280023C */  lui        $v0, %hi(options_pad)
    /* 270D4 800370D4 50B2428C */  lw         $v0, %lo(options_pad)($v0)
    /* 270D8 800370D8 00000000 */  nop
    /* 270DC 800370DC 80100200 */  sll        $v0, $v0, 2
    /* 270E0 800370E0 21185100 */  addu       $v1, $v0, $s1
    /* 270E4 800370E4 0000628C */  lw         $v0, 0x0($v1)
    /* 270E8 800370E8 00000000 */  nop
    /* 270EC 800370EC 02004104 */  bgez       $v0, .L800370F8
    /* 270F0 800370F0 04000224 */   addiu     $v0, $zero, 0x4
    /* 270F4 800370F4 000062AC */  sw         $v0, 0x0($v1)
  .L800370F8:
    /* 270F8 800370F8 1280023C */  lui        $v0, %hi(options_pad)
    /* 270FC 800370FC 50B2428C */  lw         $v0, %lo(options_pad)($v0)
    /* 27100 80037100 00000000 */  nop
    /* 27104 80037104 80100200 */  sll        $v0, $v0, 2
    /* 27108 80037108 21185100 */  addu       $v1, $v0, $s1
    /* 2710C 8003710C 0000628C */  lw         $v0, 0x0($v1)
    /* 27110 80037110 00000000 */  nop
    /* 27114 80037114 05004228 */  slti       $v0, $v0, 0x5
    /* 27118 80037118 02004014 */  bnez       $v0, .L80037124
    /* 2711C 8003711C 00000000 */   nop
    /* 27120 80037120 000060AC */  sw         $zero, 0x0($v1)
  .L80037124:
    /* 27124 80037124 6DDD000C */  jal        GetTick__C4CPad
    /* 27128 80037128 21200002 */   addu      $a0, $s0, $zero
    /* 2712C 8003712C 04004230 */  andi       $v0, $v0, 0x4
    /* 27130 80037130 05004010 */  beqz       $v0, .L80037148
    /* 27134 80037134 00000000 */   nop
    /* 27138 80037138 940F828F */  lw         $v0, %gp_rel(sbooktab)($gp)
    /* 2713C 8003713C 00000000 */  nop
    /* 27140 80037140 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 27144 80037144 940F82AF */  sw         $v0, %gp_rel(sbooktab)($gp)
  .L80037148:
    /* 27148 80037148 6DDD000C */  jal        GetTick__C4CPad
    /* 2714C 8003714C 21200002 */   addu      $a0, $s0, $zero
    /* 27150 80037150 08004230 */  andi       $v0, $v0, 0x8
    /* 27154 80037154 05004010 */  beqz       $v0, .L8003716C
    /* 27158 80037158 00000000 */   nop
    /* 2715C 8003715C 940F828F */  lw         $v0, %gp_rel(sbooktab)($gp)
    /* 27160 80037160 00000000 */  nop
    /* 27164 80037164 01004224 */  addiu      $v0, $v0, 0x1
    /* 27168 80037168 940F82AF */  sw         $v0, %gp_rel(sbooktab)($gp)
  .L8003716C:
    /* 2716C 8003716C 940F828F */  lw         $v0, %gp_rel(sbooktab)($gp)
    /* 27170 80037170 00000000 */  nop
    /* 27174 80037174 06004104 */  bgez       $v0, .L80037190
    /* 27178 80037178 05004228 */   slti      $v0, $v0, 0x5
    /* 2717C 8003717C 04000224 */  addiu      $v0, $zero, 0x4
    /* 27180 80037180 940F82AF */  sw         $v0, %gp_rel(sbooktab)($gp)
    /* 27184 80037184 940F828F */  lw         $v0, %gp_rel(sbooktab)($gp)
    /* 27188 80037188 00000000 */  nop
    /* 2718C 8003718C 05004228 */  slti       $v0, $v0, 0x5
  .L80037190:
    /* 27190 80037190 02004014 */  bnez       $v0, .L8003719C
    /* 27194 80037194 00000000 */   nop
    /* 27198 80037198 940F80AF */  sw         $zero, %gp_rel(sbooktab)($gp)
  .L8003719C:
    /* 2719C 8003719C 940F828F */  lw         $v0, %gp_rel(sbooktab)($gp)
    /* 271A0 800371A0 00000000 */  nop
    /* 271A4 800371A4 03004212 */  beq        $s2, $v0, .L800371B4
    /* 271A8 800371A8 00000000 */   nop
    /* 271AC 800371AC C6F5000C */  jal        PlaySFX__Fi
    /* 271B0 800371B0 32000424 */   addiu     $a0, $zero, 0x32
  .L800371B4:
    /* 271B4 800371B4 1280023C */  lui        $v0, %hi(options_pad)
    /* 271B8 800371B8 50B2428C */  lw         $v0, %lo(options_pad)($v0)
    /* 271BC 800371BC 00000000 */  nop
    /* 271C0 800371C0 80100200 */  sll        $v0, $v0, 2
    /* 271C4 800371C4 21105100 */  addu       $v0, $v0, $s1
    /* 271C8 800371C8 0000428C */  lw         $v0, 0x0($v0)
    /* 271CC 800371CC 00000000 */  nop
    /* 271D0 800371D0 04006212 */  beq        $s3, $v0, .L800371E4
    /* 271D4 800371D4 21880000 */   addu      $s1, $zero, $zero
    /* 271D8 800371D8 C6F5000C */  jal        PlaySFX__Fi
    /* 271DC 800371DC 32000424 */   addiu     $a0, $zero, 0x32
    /* 271E0 800371E0 21880000 */  addu       $s1, $zero, $zero
  .L800371E4:
    /* 271E4 800371E4 77DD000C */  jal        GetDown__C4CPad
    /* 271E8 800371E8 21200002 */   addu      $a0, $s0, $zero
    /* 271EC 800371EC 00014230 */  andi       $v0, $v0, 0x100
    /* 271F0 800371F0 06004014 */  bnez       $v0, .L8003720C
    /* 271F4 800371F4 00000000 */   nop
    /* 271F8 800371F8 77DD000C */  jal        GetDown__C4CPad
    /* 271FC 800371FC 21200002 */   addu      $a0, $s0, $zero
    /* 27200 80037200 20004230 */  andi       $v0, $v0, 0x20
    /* 27204 80037204 02004010 */  beqz       $v0, .L80037210
    /* 27208 80037208 00000000 */   nop
  .L8003720C:
    /* 2720C 8003720C 01001124 */  addiu      $s1, $zero, 0x1
  .L80037210:
    /* 27210 80037210 0E002012 */  beqz       $s1, .L8003724C
    /* 27214 80037214 00000000 */   nop
    /* 27218 80037218 C6F5000C */  jal        PlaySFX__Fi
    /* 2721C 8003721C 33000424 */   addiu     $a0, $zero, 0x33
    /* 27220 80037220 1280023C */  lui        $v0, %hi(optionsflag)
    /* 27224 80037224 48B2428C */  lw         $v0, %lo(optionsflag)($v0)
    /* 27228 80037228 460F80A3 */  sb         $zero, %gp_rel(sbookflag)($gp)
    /* 2722C 8003722C 07004010 */  beqz       $v0, .L8003724C
    /* 27230 80037230 01000224 */   addiu     $v0, $zero, 0x1
    /* 27234 80037234 1280013C */  lui        $at, %hi(cmenu)
    /* 27238 80037238 3CB222AC */  sw         $v0, %lo(cmenu)($at)
    /* 2723C 8003723C E16E020C */  jal        GLUE_SetShowGameScreenFlag__Fb
    /* 27240 80037240 01000424 */   addiu     $a0, $zero, 0x1
    /* 27244 80037244 EC6E020C */  jal        GLUE_SetShowPanelFlag__Fb
    /* 27248 80037248 21200000 */   addu      $a0, $zero, $zero
  .L8003724C:
    /* 2724C 8003724C 6C00BF8F */  lw         $ra, 0x6C($sp)
    /* 27250 80037250 6800BE8F */  lw         $fp, 0x68($sp)
    /* 27254 80037254 6400B78F */  lw         $s7, 0x64($sp)
    /* 27258 80037258 6000B68F */  lw         $s6, 0x60($sp)
    /* 2725C 8003725C 5C00B58F */  lw         $s5, 0x5C($sp)
    /* 27260 80037260 5800B48F */  lw         $s4, 0x58($sp)
    /* 27264 80037264 5400B38F */  lw         $s3, 0x54($sp)
    /* 27268 80037268 5000B28F */  lw         $s2, 0x50($sp)
    /* 2726C 8003726C 4C00B18F */  lw         $s1, 0x4C($sp)
    /* 27270 80037270 4800B08F */  lw         $s0, 0x48($sp)
    /* 27274 80037274 7000BD27 */  addiu      $sp, $sp, 0x70
    /* 27278 80037278 0800E003 */  jr         $ra
    /* 2727C 8003727C 00000000 */   nop
endlabel DrawSpellBook__Fb
