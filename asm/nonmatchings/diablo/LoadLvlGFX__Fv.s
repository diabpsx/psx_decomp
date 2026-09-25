.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching LoadLvlGFX__Fv, 0xB8

glabel LoadLvlGFX__Fv
    /* 28930 80038930 1280033C */  lui        $v1, %hi(leveltype)
    /* 28934 80038934 0DC16390 */  lbu        $v1, %lo(leveltype)($v1)
    /* 28938 80038938 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 2893C 8003893C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 28940 80038940 21800000 */  addu       $s0, $zero, $zero
    /* 28944 80038944 0500622C */  sltiu      $v0, $v1, 0x5
    /* 28948 80038948 1A004010 */  beqz       $v0, .L800389B4
    /* 2894C 8003894C 1400BFAF */   sw        $ra, 0x14($sp)
    /* 28950 80038950 80100300 */  sll        $v0, $v1, 2
    /* 28954 80038954 1180013C */  lui        $at, %hi(jtbl_8011117C)
    /* 28958 80038958 21082200 */  addu       $at, $at, $v0
    /* 2895C 8003895C 7C11228C */  lw         $v0, %lo(jtbl_8011117C)($at)
    /* 28960 80038960 00000000 */  nop
    /* 28964 80038964 08004000 */  jr         $v0
    /* 28968 80038968 00000000 */   nop
  jlabel .L8003896C
    /* 2896C 8003896C 1180103C */  lui        $s0, %hi(D_80111158)
    /* 28970 80038970 58111026 */  addiu      $s0, $s0, %lo(D_80111158)
    /* 28974 80038974 6DE20008 */  j          .L800389B4
    /* 28978 80038978 00000000 */   nop
  jlabel .L8003897C
    /* 2897C 8003897C 1280103C */  lui        $s0, %hi(D_8011B7B0)
    /* 28980 80038980 B0B71026 */  addiu      $s0, $s0, %lo(D_8011B7B0)
    /* 28984 80038984 6DE20008 */  j          .L800389B4
    /* 28988 80038988 00000000 */   nop
  jlabel .L8003898C
    /* 2898C 8003898C 1280103C */  lui        $s0, %hi(D_8011B7B8)
    /* 28990 80038990 B8B71026 */  addiu      $s0, $s0, %lo(D_8011B7B8)
    /* 28994 80038994 6DE20008 */  j          .L800389B4
    /* 28998 80038998 00000000 */   nop
  jlabel .L8003899C
    /* 2899C 8003899C 1280103C */  lui        $s0, %hi(D_8011B7C0)
    /* 289A0 800389A0 C0B71026 */  addiu      $s0, $s0, %lo(D_8011B7C0)
    /* 289A4 800389A4 6DE20008 */  j          .L800389B4
    /* 289A8 800389A8 00000000 */   nop
  jlabel .L800389AC
    /* 289AC 800389AC 1280103C */  lui        $s0, %hi(D_8011B7C8)
    /* 289B0 800389B0 C8B71026 */  addiu      $s0, $s0, %lo(D_8011B7C8)
  .L800389B4:
    /* 289B4 800389B4 05000016 */  bnez       $s0, .L800389CC
    /* 289B8 800389B8 21200000 */   addu      $a0, $zero, $zero
    /* 289BC 800389BC 1180053C */  lui        $a1, %hi(D_80111164)
    /* 289C0 800389C0 6411A524 */  addiu      $a1, $a1, %lo(D_80111164)
    /* 289C4 800389C4 A583000C */  jal        DBG_Error
    /* 289C8 800389C8 8B090624 */   addiu     $a2, $zero, 0x98B
  .L800389CC:
    /* 289CC 800389CC 7AE2000C */  jal        LoadMegaTiles__FPCc
    /* 289D0 800389D0 21200002 */   addu      $a0, $s0, $zero
    /* 289D4 800389D4 1400BF8F */  lw         $ra, 0x14($sp)
    /* 289D8 800389D8 1000B08F */  lw         $s0, 0x10($sp)
    /* 289DC 800389DC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 289E0 800389E0 0800E003 */  jr         $ra
    /* 289E4 800389E4 00000000 */   nop
endlabel LoadLvlGFX__Fv
