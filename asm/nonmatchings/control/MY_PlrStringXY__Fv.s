.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MY_PlrStringXY__Fv, 0x710

glabel MY_PlrStringXY__Fv
    /* 236D8 800336D8 E00E838F */  lw         $v1, %gp_rel(D_8011B660)($gp)
    /* 236DC 800336DC 88FFBD27 */  addiu      $sp, $sp, -0x78
    /* 236E0 800336E0 7400BFAF */  sw         $ra, 0x74($sp)
    /* 236E4 800336E4 7000BEAF */  sw         $fp, 0x70($sp)
    /* 236E8 800336E8 6C00B7AF */  sw         $s7, 0x6C($sp)
    /* 236EC 800336EC 6800B6AF */  sw         $s6, 0x68($sp)
    /* 236F0 800336F0 6400B5AF */  sw         $s5, 0x64($sp)
    /* 236F4 800336F4 6000B4AF */  sw         $s4, 0x60($sp)
    /* 236F8 800336F8 5C00B3AF */  sw         $s3, 0x5C($sp)
    /* 236FC 800336FC 5800B2AF */  sw         $s2, 0x58($sp)
    /* 23700 80033700 5400B1AF */  sw         $s1, 0x54($sp)
    /* 23704 80033704 5000B0AF */  sw         $s0, 0x50($sp)
    /* 23708 80033708 3000A0A3 */  sb         $zero, 0x30($sp)
    /* 2370C 8003370C 3800A0A3 */  sb         $zero, 0x38($sp)
    /* 23710 80033710 4000A0A3 */  sb         $zero, 0x40($sp)
    /* 23714 80033714 80100300 */  sll        $v0, $v1, 2
    /* 23718 80033718 21104300 */  addu       $v0, $v0, $v1
    /* 2371C 8003371C C0100200 */  sll        $v0, $v0, 3
    /* 23720 80033720 0D80033C */  lui        $v1, %hi(CS_Tab)
    /* 23724 80033724 B0E36324 */  addiu      $v1, $v1, %lo(CS_Tab)
    /* 23728 80033728 21B04300 */  addu       $s6, $v0, $v1
    /* 2372C 8003372C 2700C382 */  lb         $v1, 0x27($s6)
    /* 23730 80033730 01000224 */  addiu      $v0, $zero, 0x1
    /* 23734 80033734 1A006210 */  beq        $v1, $v0, .L800337A0
    /* 23738 80033738 02006228 */   slti      $v0, $v1, 0x2
    /* 2373C 8003373C 05004010 */  beqz       $v0, .L80033754
    /* 23740 80033740 00000000 */   nop
    /* 23744 80033744 0A006010 */  beqz       $v1, .L80033770
    /* 23748 80033748 00000000 */   nop
    /* 2374C 8003374C 0CCE0008 */  j          .L80033830
    /* 23750 80033750 00000000 */   nop
  .L80033754:
    /* 23754 80033754 02000224 */  addiu      $v0, $zero, 0x2
    /* 23758 80033758 1D006210 */  beq        $v1, $v0, .L800337D0
    /* 2375C 8003375C 03000224 */   addiu     $v0, $zero, 0x3
    /* 23760 80033760 27006210 */  beq        $v1, $v0, .L80033800
    /* 23764 80033764 00000000 */   nop
    /* 23768 80033768 0CCE0008 */  j          .L80033830
    /* 2376C 8003376C 00000000 */   nop
  .L80033770:
    /* 23770 80033770 1280083C */  lui        $t0, %hi(WHITER)
    /* 23774 80033774 D1AB0891 */  lbu        $t0, %lo(WHITER)($t0)
    /* 23778 80033778 00000000 */  nop
    /* 2377C 8003377C 3000A8A3 */  sb         $t0, 0x30($sp)
    /* 23780 80033780 1280083C */  lui        $t0, %hi(WHITEG)
    /* 23784 80033784 D2AB0891 */  lbu        $t0, %lo(WHITEG)($t0)
    /* 23788 80033788 00000000 */  nop
    /* 2378C 8003378C 3800A8A3 */  sb         $t0, 0x38($sp)
    /* 23790 80033790 1280083C */  lui        $t0, %hi(WHITEB)
    /* 23794 80033794 D3AB0891 */  lbu        $t0, %lo(WHITEB)($t0)
    /* 23798 80033798 0CCE0008 */  j          .L80033830
    /* 2379C 8003379C 4000A8A3 */   sb        $t0, 0x40($sp)
  .L800337A0:
    /* 237A0 800337A0 1280083C */  lui        $t0, %hi(BLUER)
    /* 237A4 800337A4 D4AB0891 */  lbu        $t0, %lo(BLUER)($t0)
    /* 237A8 800337A8 00000000 */  nop
    /* 237AC 800337AC 3000A8A3 */  sb         $t0, 0x30($sp)
    /* 237B0 800337B0 1280083C */  lui        $t0, %hi(BLUEG)
    /* 237B4 800337B4 D5AB0891 */  lbu        $t0, %lo(BLUEG)($t0)
    /* 237B8 800337B8 00000000 */  nop
    /* 237BC 800337BC 3800A8A3 */  sb         $t0, 0x38($sp)
    /* 237C0 800337C0 1280083C */  lui        $t0, %hi(BLUEB)
    /* 237C4 800337C4 D6AB0891 */  lbu        $t0, %lo(BLUEB)($t0)
    /* 237C8 800337C8 0CCE0008 */  j          .L80033830
    /* 237CC 800337CC 4000A8A3 */   sb        $t0, 0x40($sp)
  .L800337D0:
    /* 237D0 800337D0 1280083C */  lui        $t0, %hi(REDR)
    /* 237D4 800337D4 D7AB0891 */  lbu        $t0, %lo(REDR)($t0)
    /* 237D8 800337D8 00000000 */  nop
    /* 237DC 800337DC 3000A8A3 */  sb         $t0, 0x30($sp)
    /* 237E0 800337E0 1280083C */  lui        $t0, %hi(REDG)
    /* 237E4 800337E4 D8AB0891 */  lbu        $t0, %lo(REDG)($t0)
    /* 237E8 800337E8 00000000 */  nop
    /* 237EC 800337EC 3800A8A3 */  sb         $t0, 0x38($sp)
    /* 237F0 800337F0 1280083C */  lui        $t0, %hi(REDB)
    /* 237F4 800337F4 D9AB0891 */  lbu        $t0, %lo(REDB)($t0)
    /* 237F8 800337F8 0CCE0008 */  j          .L80033830
    /* 237FC 800337FC 4000A8A3 */   sb        $t0, 0x40($sp)
  .L80033800:
    /* 23800 80033800 1280083C */  lui        $t0, %hi(GOLDR)
    /* 23804 80033804 DAAB0891 */  lbu        $t0, %lo(GOLDR)($t0)
    /* 23808 80033808 00000000 */  nop
    /* 2380C 8003380C 3000A8A3 */  sb         $t0, 0x30($sp)
    /* 23810 80033810 1280083C */  lui        $t0, %hi(GOLDG)
    /* 23814 80033814 DBAB0891 */  lbu        $t0, %lo(GOLDG)($t0)
    /* 23818 80033818 00000000 */  nop
    /* 2381C 8003381C 3800A8A3 */  sb         $t0, 0x38($sp)
    /* 23820 80033820 1280083C */  lui        $t0, %hi(GOLDB)
    /* 23824 80033824 DCAB0891 */  lbu        $t0, %lo(GOLDB)($t0)
    /* 23828 80033828 00000000 */  nop
    /* 2382C 8003382C 4000A8A3 */  sb         $t0, 0x40($sp)
  .L80033830:
    /* 23830 80033830 0000D78E */  lw         $s7, 0x0($s6)
    /* 23834 80033834 0400DE8E */  lw         $fp, 0x4($s6)
    /* 23838 80033838 E80E828F */  lw         $v0, %gp_rel(D_8011B668)($gp)
    /* 2383C 8003383C 0800C88E */  lw         $t0, 0x8($s6)
    /* 23840 80033840 3000F726 */  addiu      $s7, $s7, 0x30
    /* 23844 80033844 0200DE27 */  addiu      $fp, $fp, 0x2
    /* 23848 80033848 21B8E202 */  addu       $s7, $s7, $v0
    /* 2384C 8003384C 5901E006 */  bltz       $s7, .L80033DB4
    /* 23850 80033850 4800A8AF */   sw        $t0, 0x48($sp)
    /* 23854 80033854 4101E22A */  slti       $v0, $s7, 0x141
    /* 23858 80033858 56014010 */  beqz       $v0, .L80033DB4
    /* 2385C 8003385C 00000000 */   nop
    /* 23860 80033860 21000011 */  beqz       $t0, .L800338E8
    /* 23864 80033864 1800C726 */   addiu     $a3, $s6, 0x18
    /* 23868 80033868 1380103C */  lui        $s0, %hi(D_8012EA88)
    /* 2386C 8003386C 88EA1026 */  addiu      $s0, $s0, %lo(D_8012EA88)
    /* 23870 80033870 21200002 */  addu       $a0, $s0, $zero
    /* 23874 80033874 8DDD000C */  jal        SetBack__6Dialogi
    /* 23878 80033878 94000524 */   addiu     $a1, $zero, 0x94
    /* 2387C 8003387C 21200002 */  addu       $a0, $s0, $zero
    /* 23880 80033880 8FDD000C */  jal        SetBorder__6Dialogi
    /* 23884 80033884 12000524 */   addiu     $a1, $zero, 0x12
    /* 23888 80033888 1280053C */  lui        $a1, %hi(BACKR)
    /* 2388C 8003388C FAABA590 */  lbu        $a1, %lo(BACKR)($a1)
    /* 23890 80033890 1280063C */  lui        $a2, %hi(BACKG)
    /* 23894 80033894 FBABC690 */  lbu        $a2, %lo(BACKG)($a2)
    /* 23898 80033898 1280073C */  lui        $a3, %hi(BACKB)
    /* 2389C 8003389C FCABE790 */  lbu        $a3, %lo(BACKB)($a3)
    /* 238A0 800338A0 85DD000C */  jal        SetRGB__6DialogUcUcUc
    /* 238A4 800338A4 21200002 */   addu      $a0, $s0, $zero
    /* 238A8 800338A8 21200002 */  addu       $a0, $s0, $zero
    /* 238AC 800338AC 1000F126 */  addiu      $s1, $s7, 0x10
    /* 238B0 800338B0 21282002 */  addu       $a1, $s1, $zero
    /* 238B4 800338B4 2000D027 */  addiu      $s0, $fp, 0x20
    /* 238B8 800338B8 21300002 */  addu       $a2, $s0, $zero
    /* 238BC 800338BC 4800A78F */  lw         $a3, 0x48($sp)
    /* 238C0 800338C0 0B000224 */  addiu      $v0, $zero, 0xB
    /* 238C4 800338C4 B82F020C */  jal        Back__6Dialogiiii
    /* 238C8 800338C8 1000A2AF */   sw        $v0, 0x10($sp)
    /* 238CC 800338CC 4800A897 */  lhu        $t0, 0x48($sp)
    /* 238D0 800338D0 0B000224 */  addiu      $v0, $zero, 0xB
    /* 238D4 800338D4 740F91A7 */  sh         $s1, %gp_rel(CSRect)($gp)
    /* 238D8 800338D8 760F90A7 */  sh         $s0, %gp_rel(CSRect + 0x2)($gp)
    /* 238DC 800338DC 7A0F82A7 */  sh         $v0, %gp_rel(D_8011B6F8 + 0x2)($gp)
    /* 238E0 800338E0 780F88A7 */  sh         $t0, %gp_rel(D_8011B6F8)($gp)
    /* 238E4 800338E4 1800C726 */  addiu      $a3, $s6, 0x18
  .L800338E8:
    /* 238E8 800338E8 1000E010 */  beqz       $a3, .L8003392C
    /* 238EC 800338EC 21280000 */   addu      $a1, $zero, $zero
    /* 238F0 800338F0 0C80043C */  lui        $a0, %hi(MediumFont)
    /* 238F4 800338F4 D8828424 */  addiu      $a0, $a0, %lo(MediumFont)
    /* 238F8 800338F8 3000A893 */  lbu        $t0, 0x30($sp)
    /* 238FC 800338FC 09000624 */  addiu      $a2, $zero, 0x9
    /* 23900 80033900 1800A8AF */  sw         $t0, 0x18($sp)
    /* 23904 80033904 3800A893 */  lbu        $t0, 0x38($sp)
    /* 23908 80033908 01000224 */  addiu      $v0, $zero, 0x1
    /* 2390C 8003390C 1000A2AF */  sw         $v0, 0x10($sp)
    /* 23910 80033910 1C00A8AF */  sw         $t0, 0x1C($sp)
    /* 23914 80033914 4000A893 */  lbu        $t0, 0x40($sp)
    /* 23918 80033918 1280023C */  lui        $v0, %hi(CSRect)
    /* 2391C 8003391C F4B64224 */  addiu      $v0, $v0, %lo(CSRect)
    /* 23920 80033920 1400A2AF */  sw         $v0, 0x14($sp)
    /* 23924 80033924 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 23928 80033928 2000A8AF */   sw        $t0, 0x20($sp)
  .L8003392C:
    /* 2392C 8003392C 10000224 */  addiu      $v0, $zero, 0x10
    /* 23930 80033930 1280083C */  lui        $t0, %hi(WHITER)
    /* 23934 80033934 D1AB0891 */  lbu        $t0, %lo(WHITER)($t0)
    /* 23938 80033938 20000424 */  addiu      $a0, $zero, 0x20
    /* 2393C 8003393C 740F82A7 */  sh         $v0, %gp_rel(CSRect)($gp)
    /* 23940 80033940 18010224 */  addiu      $v0, $zero, 0x118
    /* 23944 80033944 3000A8A3 */  sb         $t0, 0x30($sp)
    /* 23948 80033948 1280083C */  lui        $t0, %hi(WHITEG)
    /* 2394C 8003394C D2AB0891 */  lbu        $t0, %lo(WHITEG)($t0)
    /* 23950 80033950 B0000324 */  addiu      $v1, $zero, 0xB0
    /* 23954 80033954 780F82A7 */  sh         $v0, %gp_rel(D_8011B6F8)($gp)
    /* 23958 80033958 3800A8A3 */  sb         $t0, 0x38($sp)
    /* 2395C 8003395C 1280083C */  lui        $t0, %hi(WHITEB)
    /* 23960 80033960 D3AB0891 */  lbu        $t0, %lo(WHITEB)($t0)
    /* 23964 80033964 0800E226 */  addiu      $v0, $s7, 0x8
    /* 23968 80033968 760F84A7 */  sh         $a0, %gp_rel(CSRect + 0x2)($gp)
    /* 2396C 8003396C 7A0F83A7 */  sh         $v1, %gp_rel(D_8011B6F8 + 0x2)($gp)
    /* 23970 80033970 2800A0A7 */  sh         $zero, 0x28($sp)
    /* 23974 80033974 2A00A4A7 */  sh         $a0, 0x2A($sp)
    /* 23978 80033978 2C00A2A7 */  sh         $v0, 0x2C($sp)
    /* 2397C 8003397C 2E00A3A7 */  sh         $v1, 0x2E($sp)
    /* 23980 80033980 4000A8A3 */  sb         $t0, 0x40($sp)
    /* 23984 80033984 0C00C48E */  lw         $a0, 0xC($s6)
    /* 23988 80033988 1280113C */  lui        $s1, %hi(CSRect)
    /* 2398C 8003398C F4B63126 */  addiu      $s1, $s1, %lo(CSRect)
    /* 23990 80033990 9D008010 */  beqz       $a0, .L80033C08
    /* 23994 80033994 00000000 */   nop
    /* 23998 80033998 1000C28E */  lw         $v0, 0x10($s6)
    /* 2399C 8003399C 00000000 */  nop
    /* 239A0 800339A0 2D004014 */  bnez       $v0, .L80033A58
    /* 239A4 800339A4 00000000 */   nop
    /* 239A8 800339A8 4AED010C */  jal        GetStr__Fi
    /* 239AC 800339AC 00000000 */   nop
    /* 239B0 800339B0 0C80103C */  lui        $s0, %hi(MediumFont)
    /* 239B4 800339B4 D8821026 */  addiu      $s0, $s0, %lo(MediumFont)
    /* 239B8 800339B8 21200002 */  addu       $a0, $s0, $zero
    /* 239BC 800339BC A92A020C */  jal        GetStrWidth__5CFontPc
    /* 239C0 800339C0 21284000 */   addu      $a1, $v0, $zero
    /* 239C4 800339C4 21A84000 */  addu       $s5, $v0, $zero
    /* 239C8 800339C8 0C00C48E */  lw         $a0, 0xC($s6)
    /* 239CC 800339CC 29000224 */  addiu      $v0, $zero, 0x29
    /* 239D0 800339D0 10008210 */  beq        $a0, $v0, .L80033A14
    /* 239D4 800339D4 00000000 */   nop
    /* 239D8 800339D8 4AED010C */  jal        GetStr__Fi
    /* 239DC 800339DC 00000000 */   nop
    /* 239E0 800339E0 21200002 */  addu       $a0, $s0, $zero
    /* 239E4 800339E4 2328F502 */  subu       $a1, $s7, $s5
    /* 239E8 800339E8 3000A893 */  lbu        $t0, 0x30($sp)
    /* 239EC 800339EC FAFFA524 */  addiu      $a1, $a1, -0x6
    /* 239F0 800339F0 1800A8AF */  sw         $t0, 0x18($sp)
    /* 239F4 800339F4 3800A893 */  lbu        $t0, 0x38($sp)
    /* 239F8 800339F8 0900C627 */  addiu      $a2, $fp, 0x9
    /* 239FC 800339FC 1C00A8AF */  sw         $t0, 0x1C($sp)
    /* 23A00 80033A00 4000A893 */  lbu        $t0, 0x40($sp)
    /* 23A04 80033A04 21384000 */  addu       $a3, $v0, $zero
    /* 23A08 80033A08 1000A0AF */  sw         $zero, 0x10($sp)
    /* 23A0C 80033A0C 94CE0008 */  j          .L80033A50
    /* 23A10 80033A10 1400B1AF */   sw        $s1, 0x14($sp)
  .L80033A14:
    /* 23A14 80033A14 4AED010C */  jal        GetStr__Fi
    /* 23A18 80033A18 29000424 */   addiu     $a0, $zero, 0x29
    /* 23A1C 80033A1C 21200002 */  addu       $a0, $s0, $zero
    /* 23A20 80033A20 FAFFE526 */  addiu      $a1, $s7, -0x6
    /* 23A24 80033A24 0900C627 */  addiu      $a2, $fp, 0x9
    /* 23A28 80033A28 3000A893 */  lbu        $t0, 0x30($sp)
    /* 23A2C 80033A2C 21384000 */  addu       $a3, $v0, $zero
    /* 23A30 80033A30 1800A8AF */  sw         $t0, 0x18($sp)
    /* 23A34 80033A34 3800A893 */  lbu        $t0, 0x38($sp)
    /* 23A38 80033A38 02000224 */  addiu      $v0, $zero, 0x2
    /* 23A3C 80033A3C 1000A2AF */  sw         $v0, 0x10($sp)
    /* 23A40 80033A40 1C00A8AF */  sw         $t0, 0x1C($sp)
    /* 23A44 80033A44 4000A893 */  lbu        $t0, 0x40($sp)
    /* 23A48 80033A48 2800A227 */  addiu      $v0, $sp, 0x28
    /* 23A4C 80033A4C 1400A2AF */  sw         $v0, 0x14($sp)
  .L80033A50:
    /* 23A50 80033A50 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 23A54 80033A54 2000A8AF */   sw        $t0, 0x20($sp)
  .L80033A58:
    /* 23A58 80033A58 0C00C28E */  lw         $v0, 0xC($s6)
    /* 23A5C 80033A5C 00000000 */  nop
    /* 23A60 80033A60 69004010 */  beqz       $v0, .L80033C08
    /* 23A64 80033A64 00000000 */   nop
    /* 23A68 80033A68 1000C48E */  lw         $a0, 0x10($s6)
    /* 23A6C 80033A6C 00000000 */  nop
    /* 23A70 80033A70 65008010 */  beqz       $a0, .L80033C08
    /* 23A74 80033A74 00000000 */   nop
    /* 23A78 80033A78 E00E828F */  lw         $v0, %gp_rel(D_8011B660)($gp)
    /* 23A7C 80033A7C 00000000 */  nop
    /* 23A80 80033A80 F5FF4224 */  addiu      $v0, $v0, -0xB
    /* 23A84 80033A84 0300422C */  sltiu      $v0, $v0, 0x3
    /* 23A88 80033A88 30004010 */  beqz       $v0, .L80033B4C
    /* 23A8C 80033A8C 00000000 */   nop
    /* 23A90 80033A90 4AED010C */  jal        GetStr__Fi
    /* 23A94 80033A94 00000000 */   nop
    /* 23A98 80033A98 0C80113C */  lui        $s1, %hi(MediumFont)
    /* 23A9C 80033A9C D8823126 */  addiu      $s1, $s1, %lo(MediumFont)
    /* 23AA0 80033AA0 21202002 */  addu       $a0, $s1, $zero
    /* 23AA4 80033AA4 A92A020C */  jal        GetStrWidth__5CFontPc
    /* 23AA8 80033AA8 21284000 */   addu      $a1, $v0, $zero
    /* 23AAC 80033AAC 1000C48E */  lw         $a0, 0x10($s6)
    /* 23AB0 80033AB0 4AED010C */  jal        GetStr__Fi
    /* 23AB4 80033AB4 00000000 */   nop
    /* 23AB8 80033AB8 21202002 */  addu       $a0, $s1, $zero
    /* 23ABC 80033ABC 0D00C627 */  addiu      $a2, $fp, 0xD
    /* 23AC0 80033AC0 21384000 */  addu       $a3, $v0, $zero
    /* 23AC4 80033AC4 4800A88F */  lw         $t0, 0x48($sp)
    /* 23AC8 80033AC8 3000B493 */  lbu        $s4, 0x30($sp)
    /* 23ACC 80033ACC 3800B393 */  lbu        $s3, 0x38($sp)
    /* 23AD0 80033AD0 4000B293 */  lbu        $s2, 0x40($sp)
    /* 23AD4 80033AD4 1280153C */  lui        $s5, %hi(CSRect)
    /* 23AD8 80033AD8 F4B6B526 */  addiu      $s5, $s5, %lo(CSRect)
    /* 23ADC 80033ADC 1000A0AF */  sw         $zero, 0x10($sp)
    /* 23AE0 80033AE0 1400B5AF */  sw         $s5, 0x14($sp)
    /* 23AE4 80033AE4 2180E802 */  addu       $s0, $s7, $t0
    /* 23AE8 80033AE8 05001026 */  addiu      $s0, $s0, 0x5
    /* 23AEC 80033AEC 21280002 */  addu       $a1, $s0, $zero
    /* 23AF0 80033AF0 1800B4AF */  sw         $s4, 0x18($sp)
    /* 23AF4 80033AF4 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 23AF8 80033AF8 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 23AFC 80033AFC 2000B2AF */   sw        $s2, 0x20($sp)
    /* 23B00 80033B00 0C00C48E */  lw         $a0, 0xC($s6)
    /* 23B04 80033B04 4AED010C */  jal        GetStr__Fi
    /* 23B08 80033B08 00000000 */   nop
    /* 23B0C 80033B0C 21202002 */  addu       $a0, $s1, $zero
    /* 23B10 80033B10 A92A020C */  jal        GetStrWidth__5CFontPc
    /* 23B14 80033B14 21284000 */   addu      $a1, $v0, $zero
    /* 23B18 80033B18 0C00C48E */  lw         $a0, 0xC($s6)
    /* 23B1C 80033B1C 4AED010C */  jal        GetStr__Fi
    /* 23B20 80033B20 00000000 */   nop
    /* 23B24 80033B24 21202002 */  addu       $a0, $s1, $zero
    /* 23B28 80033B28 21280002 */  addu       $a1, $s0, $zero
    /* 23B2C 80033B2C 2130C003 */  addu       $a2, $fp, $zero
    /* 23B30 80033B30 21384000 */  addu       $a3, $v0, $zero
    /* 23B34 80033B34 1000A0AF */  sw         $zero, 0x10($sp)
    /* 23B38 80033B38 1400B5AF */  sw         $s5, 0x14($sp)
    /* 23B3C 80033B3C 1800B4AF */  sw         $s4, 0x18($sp)
    /* 23B40 80033B40 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 23B44 80033B44 00CF0008 */  j          .L80033C00
    /* 23B48 80033B48 2000B2AF */   sw        $s2, 0x20($sp)
  .L80033B4C:
    /* 23B4C 80033B4C 4AED010C */  jal        GetStr__Fi
    /* 23B50 80033B50 00000000 */   nop
    /* 23B54 80033B54 0C80103C */  lui        $s0, %hi(MediumFont)
    /* 23B58 80033B58 D8821026 */  addiu      $s0, $s0, %lo(MediumFont)
    /* 23B5C 80033B5C 21200002 */  addu       $a0, $s0, $zero
    /* 23B60 80033B60 A92A020C */  jal        GetStrWidth__5CFontPc
    /* 23B64 80033B64 21284000 */   addu      $a1, $v0, $zero
    /* 23B68 80033B68 1000C48E */  lw         $a0, 0x10($s6)
    /* 23B6C 80033B6C 4AED010C */  jal        GetStr__Fi
    /* 23B70 80033B70 21A84000 */   addu      $s5, $v0, $zero
    /* 23B74 80033B74 21200002 */  addu       $a0, $s0, $zero
    /* 23B78 80033B78 2328F502 */  subu       $a1, $s7, $s5
    /* 23B7C 80033B7C E2FFA524 */  addiu      $a1, $a1, -0x1E
    /* 23B80 80033B80 0D00C627 */  addiu      $a2, $fp, 0xD
    /* 23B84 80033B84 21384000 */  addu       $a3, $v0, $zero
    /* 23B88 80033B88 3000B393 */  lbu        $s3, 0x30($sp)
    /* 23B8C 80033B8C 3800B293 */  lbu        $s2, 0x38($sp)
    /* 23B90 80033B90 4000B193 */  lbu        $s1, 0x40($sp)
    /* 23B94 80033B94 1280143C */  lui        $s4, %hi(CSRect)
    /* 23B98 80033B98 F4B69426 */  addiu      $s4, $s4, %lo(CSRect)
    /* 23B9C 80033B9C 1000A0AF */  sw         $zero, 0x10($sp)
    /* 23BA0 80033BA0 1400B4AF */  sw         $s4, 0x14($sp)
    /* 23BA4 80033BA4 1800B3AF */  sw         $s3, 0x18($sp)
    /* 23BA8 80033BA8 1C00B2AF */  sw         $s2, 0x1C($sp)
    /* 23BAC 80033BAC 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 23BB0 80033BB0 2000B1AF */   sw        $s1, 0x20($sp)
    /* 23BB4 80033BB4 0C00C48E */  lw         $a0, 0xC($s6)
    /* 23BB8 80033BB8 4AED010C */  jal        GetStr__Fi
    /* 23BBC 80033BBC 00000000 */   nop
    /* 23BC0 80033BC0 21200002 */  addu       $a0, $s0, $zero
    /* 23BC4 80033BC4 A92A020C */  jal        GetStrWidth__5CFontPc
    /* 23BC8 80033BC8 21284000 */   addu      $a1, $v0, $zero
    /* 23BCC 80033BCC 0C00C48E */  lw         $a0, 0xC($s6)
    /* 23BD0 80033BD0 4AED010C */  jal        GetStr__Fi
    /* 23BD4 80033BD4 21A84000 */   addu      $s5, $v0, $zero
    /* 23BD8 80033BD8 21200002 */  addu       $a0, $s0, $zero
    /* 23BDC 80033BDC 2328F502 */  subu       $a1, $s7, $s5
    /* 23BE0 80033BE0 F2FFA524 */  addiu      $a1, $a1, -0xE
    /* 23BE4 80033BE4 2130C003 */  addu       $a2, $fp, $zero
    /* 23BE8 80033BE8 21384000 */  addu       $a3, $v0, $zero
    /* 23BEC 80033BEC 1000A0AF */  sw         $zero, 0x10($sp)
    /* 23BF0 80033BF0 1400B4AF */  sw         $s4, 0x14($sp)
    /* 23BF4 80033BF4 1800B3AF */  sw         $s3, 0x18($sp)
    /* 23BF8 80033BF8 1C00B2AF */  sw         $s2, 0x1C($sp)
    /* 23BFC 80033BFC 2000B1AF */  sw         $s1, 0x20($sp)
  .L80033C00:
    /* 23C00 80033C00 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 23C04 80033C04 00000000 */   nop
  .L80033C08:
    /* 23C08 80033C08 1400C48E */  lw         $a0, 0x14($s6)
    /* 23C0C 80033C0C 00000000 */  nop
    /* 23C10 80033C10 68008010 */  beqz       $a0, .L80033DB4
    /* 23C14 80033C14 41000224 */   addiu     $v0, $zero, 0x41
    /* 23C18 80033C18 25008214 */  bne        $a0, $v0, .L80033CB0
    /* 23C1C 80033C1C C2020224 */   addiu     $v0, $zero, 0x2C2
    /* 23C20 80033C20 4AED010C */  jal        GetStr__Fi
    /* 23C24 80033C24 41000424 */   addiu     $a0, $zero, 0x41
    /* 23C28 80033C28 0C80103C */  lui        $s0, %hi(MediumFont)
    /* 23C2C 80033C2C D8821026 */  addiu      $s0, $s0, %lo(MediumFont)
    /* 23C30 80033C30 21200002 */  addu       $a0, $s0, $zero
    /* 23C34 80033C34 A92A020C */  jal        GetStrWidth__5CFontPc
    /* 23C38 80033C38 21284000 */   addu      $a1, $v0, $zero
    /* 23C3C 80033C3C 21A84000 */  addu       $s5, $v0, $zero
    /* 23C40 80033C40 F0FFA226 */  addiu      $v0, $s5, -0x10
    /* 23C44 80033C44 4800A88F */  lw         $t0, 0x48($sp)
    /* 23C48 80033C48 2310E202 */  subu       $v0, $s7, $v0
    /* 23C4C 80033C4C 740F82A7 */  sh         $v0, %gp_rel(CSRect)($gp)
    /* 23C50 80033C50 0C00C227 */  addiu      $v0, $fp, 0xC
    /* 23C54 80033C54 760F82A7 */  sh         $v0, %gp_rel(CSRect + 0x2)($gp)
    /* 23C58 80033C58 21101501 */  addu       $v0, $t0, $s5
    /* 23C5C 80033C5C 780F82A7 */  sh         $v0, %gp_rel(D_8011B6F8)($gp)
    /* 23C60 80033C60 18000224 */  addiu      $v0, $zero, 0x18
    /* 23C64 80033C64 7A0F82A7 */  sh         $v0, %gp_rel(D_8011B6F8 + 0x2)($gp)
    /* 23C68 80033C68 1400C48E */  lw         $a0, 0x14($s6)
    /* 23C6C 80033C6C 4AED010C */  jal        GetStr__Fi
    /* 23C70 80033C70 00000000 */   nop
    /* 23C74 80033C74 21200002 */  addu       $a0, $s0, $zero
    /* 23C78 80033C78 21280000 */  addu       $a1, $zero, $zero
    /* 23C7C 80033C7C 0D000624 */  addiu      $a2, $zero, 0xD
    /* 23C80 80033C80 3000A893 */  lbu        $t0, 0x30($sp)
    /* 23C84 80033C84 21384000 */  addu       $a3, $v0, $zero
    /* 23C88 80033C88 1800A8AF */  sw         $t0, 0x18($sp)
    /* 23C8C 80033C8C 3800A893 */  lbu        $t0, 0x38($sp)
    /* 23C90 80033C90 02000224 */  addiu      $v0, $zero, 0x2
    /* 23C94 80033C94 1000A2AF */  sw         $v0, 0x10($sp)
    /* 23C98 80033C98 1C00A8AF */  sw         $t0, 0x1C($sp)
    /* 23C9C 80033C9C 4000A893 */  lbu        $t0, 0x40($sp)
    /* 23CA0 80033CA0 1280023C */  lui        $v0, %hi(CSRect)
    /* 23CA4 80033CA4 F4B64224 */  addiu      $v0, $v0, %lo(CSRect)
    /* 23CA8 80033CA8 6BCF0008 */  j          .L80033DAC
    /* 23CAC 80033CAC 1400A2AF */   sw        $v0, 0x14($sp)
  .L80033CB0:
    /* 23CB0 80033CB0 22008214 */  bne        $a0, $v0, .L80033D3C
    /* 23CB4 80033CB4 00000000 */   nop
    /* 23CB8 80033CB8 4AED010C */  jal        GetStr__Fi
    /* 23CBC 80033CBC C2020424 */   addiu     $a0, $zero, 0x2C2
    /* 23CC0 80033CC0 0C80103C */  lui        $s0, %hi(MediumFont)
    /* 23CC4 80033CC4 D8821026 */  addiu      $s0, $s0, %lo(MediumFont)
    /* 23CC8 80033CC8 21200002 */  addu       $a0, $s0, $zero
    /* 23CCC 80033CCC A92A020C */  jal        GetStrWidth__5CFontPc
    /* 23CD0 80033CD0 21284000 */   addu      $a1, $v0, $zero
    /* 23CD4 80033CD4 4800A88F */  lw         $t0, 0x48($sp)
    /* 23CD8 80033CD8 1000E326 */  addiu      $v1, $s7, 0x10
    /* 23CDC 80033CDC 740F83A7 */  sh         $v1, %gp_rel(CSRect)($gp)
    /* 23CE0 80033CE0 0C00C327 */  addiu      $v1, $fp, 0xC
    /* 23CE4 80033CE4 760F83A7 */  sh         $v1, %gp_rel(CSRect + 0x2)($gp)
    /* 23CE8 80033CE8 21100201 */  addu       $v0, $t0, $v0
    /* 23CEC 80033CEC 780F82A7 */  sh         $v0, %gp_rel(D_8011B6F8)($gp)
    /* 23CF0 80033CF0 18000224 */  addiu      $v0, $zero, 0x18
    /* 23CF4 80033CF4 7A0F82A7 */  sh         $v0, %gp_rel(D_8011B6F8 + 0x2)($gp)
    /* 23CF8 80033CF8 1400C48E */  lw         $a0, 0x14($s6)
    /* 23CFC 80033CFC 4AED010C */  jal        GetStr__Fi
    /* 23D00 80033D00 00000000 */   nop
    /* 23D04 80033D04 21200002 */  addu       $a0, $s0, $zero
    /* 23D08 80033D08 21280000 */  addu       $a1, $zero, $zero
    /* 23D0C 80033D0C 3000A893 */  lbu        $t0, 0x30($sp)
    /* 23D10 80033D10 0D000624 */  addiu      $a2, $zero, 0xD
    /* 23D14 80033D14 1800A8AF */  sw         $t0, 0x18($sp)
    /* 23D18 80033D18 3800A893 */  lbu        $t0, 0x38($sp)
    /* 23D1C 80033D1C 21384000 */  addu       $a3, $v0, $zero
    /* 23D20 80033D20 1C00A8AF */  sw         $t0, 0x1C($sp)
    /* 23D24 80033D24 4000A893 */  lbu        $t0, 0x40($sp)
    /* 23D28 80033D28 1280023C */  lui        $v0, %hi(CSRect)
    /* 23D2C 80033D2C F4B64224 */  addiu      $v0, $v0, %lo(CSRect)
    /* 23D30 80033D30 1000A0AF */  sw         $zero, 0x10($sp)
    /* 23D34 80033D34 6BCF0008 */  j          .L80033DAC
    /* 23D38 80033D38 1400A2AF */   sw        $v0, 0x14($sp)
  .L80033D3C:
    /* 23D3C 80033D3C 4AED010C */  jal        GetStr__Fi
    /* 23D40 80033D40 00000000 */   nop
    /* 23D44 80033D44 0C80103C */  lui        $s0, %hi(MediumFont)
    /* 23D48 80033D48 D8821026 */  addiu      $s0, $s0, %lo(MediumFont)
    /* 23D4C 80033D4C 21200002 */  addu       $a0, $s0, $zero
    /* 23D50 80033D50 A92A020C */  jal        GetStrWidth__5CFontPc
    /* 23D54 80033D54 21284000 */   addu      $a1, $v0, $zero
    /* 23D58 80033D58 1400C48E */  lw         $a0, 0x14($s6)
    /* 23D5C 80033D5C 4AED010C */  jal        GetStr__Fi
    /* 23D60 80033D60 21A84000 */   addu      $s5, $v0, $zero
    /* 23D64 80033D64 21200002 */  addu       $a0, $s0, $zero
    /* 23D68 80033D68 F9FFC627 */  addiu      $a2, $fp, -0x7
    /* 23D6C 80033D6C 21384000 */  addu       $a3, $v0, $zero
    /* 23D70 80033D70 4800A88F */  lw         $t0, 0x48($sp)
    /* 23D74 80033D74 1280023C */  lui        $v0, %hi(CSRect)
    /* 23D78 80033D78 F4B64224 */  addiu      $v0, $v0, %lo(CSRect)
    /* 23D7C 80033D7C 1000A0AF */  sw         $zero, 0x10($sp)
    /* 23D80 80033D80 1400A2AF */  sw         $v0, 0x14($sp)
    /* 23D84 80033D84 23281501 */  subu       $a1, $t0, $s5
    /* 23D88 80033D88 C21F0500 */  srl        $v1, $a1, 31
    /* 23D8C 80033D8C 3000A893 */  lbu        $t0, 0x30($sp)
    /* 23D90 80033D90 2128A300 */  addu       $a1, $a1, $v1
    /* 23D94 80033D94 1800A8AF */  sw         $t0, 0x18($sp)
    /* 23D98 80033D98 3800A893 */  lbu        $t0, 0x38($sp)
    /* 23D9C 80033D9C 43280500 */  sra        $a1, $a1, 1
    /* 23DA0 80033DA0 1C00A8AF */  sw         $t0, 0x1C($sp)
    /* 23DA4 80033DA4 4000A893 */  lbu        $t0, 0x40($sp)
    /* 23DA8 80033DA8 2128E502 */  addu       $a1, $s7, $a1
  .L80033DAC:
    /* 23DAC 80033DAC 2428020C */  jal        Print__5CFontiiPc8TXT_JUSTP4RECTUcUcUc
    /* 23DB0 80033DB0 2000A8AF */   sw        $t0, 0x20($sp)
  .L80033DB4:
    /* 23DB4 80033DB4 7400BF8F */  lw         $ra, 0x74($sp)
    /* 23DB8 80033DB8 7000BE8F */  lw         $fp, 0x70($sp)
    /* 23DBC 80033DBC 6C00B78F */  lw         $s7, 0x6C($sp)
    /* 23DC0 80033DC0 6800B68F */  lw         $s6, 0x68($sp)
    /* 23DC4 80033DC4 6400B58F */  lw         $s5, 0x64($sp)
    /* 23DC8 80033DC8 6000B48F */  lw         $s4, 0x60($sp)
    /* 23DCC 80033DCC 5C00B38F */  lw         $s3, 0x5C($sp)
    /* 23DD0 80033DD0 5800B28F */  lw         $s2, 0x58($sp)
    /* 23DD4 80033DD4 5400B18F */  lw         $s1, 0x54($sp)
    /* 23DD8 80033DD8 5000B08F */  lw         $s0, 0x50($sp)
    /* 23DDC 80033DDC 7800BD27 */  addiu      $sp, $sp, 0x78
    /* 23DE0 80033DE0 0800E003 */  jr         $ra
    /* 23DE4 80033DE4 00000000 */   nop
endlabel MY_PlrStringXY__Fv
