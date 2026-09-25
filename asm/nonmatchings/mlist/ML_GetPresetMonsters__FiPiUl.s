.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ML_GetPresetMonsters__FiPiUl, 0x1F0

glabel ML_GetPresetMonsters__FiPiUl
    /* 6D7F8 8007D7F8 1180023C */  lui        $v0, %hi(OPT_NoQuests)
    /* 6D7FC 8007D7FC F4DB428C */  lw         $v0, %lo(OPT_NoQuests)($v0)
    /* 6D800 8007D800 B0FFBD27 */  addiu      $sp, $sp, -0x50
    /* 6D804 8007D804 3C00B1AF */  sw         $s1, 0x3C($sp)
    /* 6D808 8007D808 21888000 */  addu       $s1, $a0, $zero
    /* 6D80C 8007D80C 4800B4AF */  sw         $s4, 0x48($sp)
    /* 6D810 8007D810 21A0A000 */  addu       $s4, $a1, $zero
    /* 6D814 8007D814 4400B3AF */  sw         $s3, 0x44($sp)
    /* 6D818 8007D818 2198C000 */  addu       $s3, $a2, $zero
    /* 6D81C 8007D81C 4000B2AF */  sw         $s2, 0x40($sp)
    /* 6D820 8007D820 21900000 */  addu       $s2, $zero, $zero
    /* 6D824 8007D824 4C00BFAF */  sw         $ra, 0x4C($sp)
    /* 6D828 8007D828 02004010 */  beqz       $v0, .L8007D834
    /* 6D82C 8007D82C 3800B0AF */   sw        $s0, 0x38($sp)
    /* 6D830 8007D830 21980000 */  addu       $s3, $zero, $zero
  .L8007D834:
    /* 6D834 8007D834 8CF5010C */  jal        ML_GetList__Fi
    /* 6D838 8007D838 21202002 */   addu      $a0, $s1, $zero
    /* 6D83C 8007D83C 21804000 */  addu       $s0, $v0, $zero
    /* 6D840 8007D840 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 6D844 8007D844 0F000216 */  bne        $s0, $v0, .L8007D884
    /* 6D848 8007D848 21202002 */   addu      $a0, $s1, $zero
    /* 6D84C 8007D84C B956050C */  jal        func_80155AE4
    /* 6D850 8007D850 21286002 */   addu      $a1, $s3, $zero
    /* 6D854 8007D854 21804000 */  addu       $s0, $v0, $zero
    /* 6D858 8007D858 21202002 */  addu       $a0, $s1, $zero
    /* 6D85C 8007D85C D2F5010C */  jal        ML_SetList__Fii
    /* 6D860 8007D860 21280002 */   addu      $a1, $s0, $zero
    /* 6D864 8007D864 80101100 */  sll        $v0, $s1, 2
    /* 6D868 8007D868 0D80013C */  lui        $at, %hi(glSeedTbl)
    /* 6D86C 8007D86C 21082200 */  addu       $at, $at, $v0
    /* 6D870 8007D870 5CF7248C */  lw         $a0, %lo(glSeedTbl)($at)
    /* 6D874 8007D874 B3F6000C */  jal        SetRndSeed__Fl
    /* 6D878 8007D878 00000000 */   nop
    /* 6D87C 8007D87C 23F60108 */  j          .L8007D88C
    /* 6D880 8007D880 00000000 */   nop
  .L8007D884:
    /* 6D884 8007D884 B756050C */  jal        func_80155ADC
    /* 6D888 8007D888 21280002 */   addu      $a1, $s0, $zero
  .L8007D88C:
    /* 6D88C 8007D88C 836E020C */  jal        GLUE_SetMonsterList__Fi
    /* 6D890 8007D890 21200002 */   addu      $a0, $s0, $zero
    /* 6D894 8007D894 0071020C */  jal        GLUE_GetCurrentList__Fi
    /* 6D898 8007D898 21202002 */   addu      $a0, $s1, $zero
    /* 6D89C 8007D89C 21504000 */  addu       $t2, $v0, $zero
    /* 6D8A0 8007D8A0 21480000 */  addu       $t1, $zero, $zero
    /* 6D8A4 8007D8A4 1D000B24 */  addiu      $t3, $zero, 0x1D
  .L8007D8A8:
    /* 6D8A8 8007D8A8 00004295 */  lhu        $v0, 0x0($t2)
    /* 6D8AC 8007D8AC 00000000 */  nop
    /* 6D8B0 8007D8B0 2B102201 */  sltu       $v0, $t1, $v0
    /* 6D8B4 8007D8B4 3B004010 */  beqz       $v0, .L8007D9A4
    /* 6D8B8 8007D8B8 00000000 */   nop
    /* 6D8BC 8007D8BC 0400428D */  lw         $v0, 0x4($t2)
    /* 6D8C0 8007D8C0 00000000 */  nop
    /* 6D8C4 8007D8C4 21104900 */  addu       $v0, $v0, $t1
    /* 6D8C8 8007D8C8 00004390 */  lbu        $v1, 0x0($v0)
    /* 6D8CC 8007D8CC 09000224 */  addiu      $v0, $zero, 0x9
    /* 6D8D0 8007D8D0 32006210 */  beq        $v1, $v0, .L8007D99C
    /* 6D8D4 8007D8D4 00000000 */   nop
    /* 6D8D8 8007D8D8 30006B10 */  beq        $v1, $t3, .L8007D99C
    /* 6D8DC 8007D8DC 21380000 */   addu      $a3, $zero, $zero
    /* 6D8E0 8007D8E0 21280000 */  addu       $a1, $zero, $zero
    /* 6D8E4 8007D8E4 80101200 */  sll        $v0, $s2, 2
    /* 6D8E8 8007D8E8 21405400 */  addu       $t0, $v0, $s4
  .L8007D8EC:
    /* 6D8EC 8007D8EC 6F00E228 */  slti       $v0, $a3, 0x6F
    /* 6D8F0 8007D8F0 2A004010 */  beqz       $v0, .L8007D99C
    /* 6D8F4 8007D8F4 00000000 */   nop
    /* 6D8F8 8007D8F8 0400428D */  lw         $v0, 0x4($t2)
    /* 6D8FC 8007D8FC 00000000 */  nop
    /* 6D900 8007D900 21104900 */  addu       $v0, $v0, $t1
    /* 6D904 8007D904 00004690 */  lbu        $a2, 0x0($v0)
    /* 6D908 8007D908 1180013C */  lui        $at, %hi(monsterdata)
    /* 6D90C 8007D90C 21082500 */  addu       $at, $at, $a1
    /* 6D910 8007D910 9CAB2294 */  lhu        $v0, %lo(monsterdata)($at)
    /* 6D914 8007D914 00000000 */  nop
    /* 6D918 8007D918 1D004614 */  bne        $v0, $a2, .L8007D990
    /* 6D91C 8007D91C 00000000 */   nop
    /* 6D920 8007D920 1180013C */  lui        $at, %hi(monsterdata + 0x18)
    /* 6D924 8007D924 21082500 */  addu       $at, $at, $a1
    /* 6D928 8007D928 B4AB2290 */  lbu        $v0, %lo(monsterdata + 0x18)($at)
    /* 6D92C 8007D92C 1180013C */  lui        $at, %hi(monsterdata + 0x19)
    /* 6D930 8007D930 21082500 */  addu       $at, $at, $a1
    /* 6D934 8007D934 B5AB2390 */  lbu        $v1, %lo(monsterdata + 0x19)($at)
    /* 6D938 8007D938 00160200 */  sll        $v0, $v0, 24
    /* 6D93C 8007D93C 03260200 */  sra        $a0, $v0, 24
    /* 6D940 8007D940 C2170200 */  srl        $v0, $v0, 31
    /* 6D944 8007D944 21208200 */  addu       $a0, $a0, $v0
    /* 6D948 8007D948 43200400 */  sra        $a0, $a0, 1
    /* 6D94C 8007D94C 01008424 */  addiu      $a0, $a0, 0x1
    /* 6D950 8007D950 001E0300 */  sll        $v1, $v1, 24
    /* 6D954 8007D954 03160300 */  sra        $v0, $v1, 24
    /* 6D958 8007D958 C21F0300 */  srl        $v1, $v1, 31
    /* 6D95C 8007D95C 21104300 */  addu       $v0, $v0, $v1
    /* 6D960 8007D960 43100200 */  sra        $v0, $v0, 1
    /* 6D964 8007D964 2A202402 */  slt        $a0, $s1, $a0
    /* 6D968 8007D968 04008014 */  bnez       $a0, .L8007D97C
    /* 6D96C 8007D96C 01004224 */   addiu     $v0, $v0, 0x1
    /* 6D970 8007D970 2A105100 */  slt        $v0, $v0, $s1
    /* 6D974 8007D974 03004010 */  beqz       $v0, .L8007D984
    /* 6D978 8007D978 00000000 */   nop
  .L8007D97C:
    /* 6D97C 8007D97C 0400CB14 */  bne        $a2, $t3, .L8007D990
    /* 6D980 8007D980 00000000 */   nop
  .L8007D984:
    /* 6D984 8007D984 000007AD */  sw         $a3, 0x0($t0)
    /* 6D988 8007D988 04000825 */  addiu      $t0, $t0, 0x4
    /* 6D98C 8007D98C 01005226 */  addiu      $s2, $s2, 0x1
  .L8007D990:
    /* 6D990 8007D990 3C00A524 */  addiu      $a1, $a1, 0x3C
    /* 6D994 8007D994 3BF60108 */  j          .L8007D8EC
    /* 6D998 8007D998 0100E724 */   addiu     $a3, $a3, 0x1
  .L8007D99C:
    /* 6D99C 8007D99C 2AF60108 */  j          .L8007D8A8
    /* 6D9A0 8007D9A0 01002925 */   addiu     $t1, $t1, 0x1
  .L8007D9A4:
    /* 6D9A4 8007D9A4 07004016 */  bnez       $s2, .L8007D9C4
    /* 6D9A8 8007D9A8 21104002 */   addu      $v0, $s2, $zero
    /* 6D9AC 8007D9AC 21200000 */  addu       $a0, $zero, $zero
    /* 6D9B0 8007D9B0 1280053C */  lui        $a1, %hi(D_80118D78)
    /* 6D9B4 8007D9B4 788DA524 */  addiu      $a1, $a1, %lo(D_80118D78)
    /* 6D9B8 8007D9B8 A583000C */  jal        DBG_Error
    /* 6D9BC 8007D9BC D7000624 */   addiu     $a2, $zero, 0xD7
    /* 6D9C0 8007D9C0 21104002 */  addu       $v0, $s2, $zero
  .L8007D9C4:
    /* 6D9C4 8007D9C4 4C00BF8F */  lw         $ra, 0x4C($sp)
    /* 6D9C8 8007D9C8 4800B48F */  lw         $s4, 0x48($sp)
    /* 6D9CC 8007D9CC 4400B38F */  lw         $s3, 0x44($sp)
    /* 6D9D0 8007D9D0 4000B28F */  lw         $s2, 0x40($sp)
    /* 6D9D4 8007D9D4 3C00B18F */  lw         $s1, 0x3C($sp)
    /* 6D9D8 8007D9D8 3800B08F */  lw         $s0, 0x38($sp)
    /* 6D9DC 8007D9DC 5000BD27 */  addiu      $sp, $sp, 0x50
    /* 6D9E0 8007D9E0 0800E003 */  jr         $ra
    /* 6D9E4 8007D9E4 00000000 */   nop
endlabel ML_GetPresetMonsters__FiPiUl
