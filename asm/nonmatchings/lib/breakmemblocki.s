.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching breakmemblocki, 0x138

glabel breakmemblocki
    /* 1B8EC 8002B8EC E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 1B8F0 8002B8F0 1400B1AF */  sw         $s1, 0x14($sp)
    /* 1B8F4 8002B8F4 2188A000 */  addu       $s1, $a1, $zero
    /* 1B8F8 8002B8F8 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1B8FC 8002B8FC 21808000 */  addu       $s0, $a0, $zero
    /* 1B900 8002B900 0C000016 */  bnez       $s0, .L8002B934
    /* 1B904 8002B904 1800BFAF */   sw        $ra, 0x18($sp)
    /* 1B908 8002B908 1180043C */  lui        $a0, %hi(D_8010F898)
    /* 1B90C 8002B90C 98F88424 */  addiu      $a0, $a0, %lo(D_8010F898)
    /* 1B910 8002B910 1180023C */  lui        $v0, %hi(D_8010F3D4)
    /* 1B914 8002B914 D4F34224 */  addiu      $v0, $v0, %lo(D_8010F3D4)
    /* 1B918 8002B918 1280013C */  lui        $at, %hi(abortfile)
    /* 1B91C 8002B91C B8C322AC */  sw         $v0, %lo(abortfile)($at)
    /* 1B920 8002B920 7A060224 */  addiu      $v0, $zero, 0x67A
    /* 1B924 8002B924 1280013C */  lui        $at, %hi(abortline)
    /* 1B928 8002B928 BCC322AC */  sw         $v0, %lo(abortline)($at)
    /* 1B92C 8002B92C 0F95000C */  jal        abortmessage
    /* 1B930 8002B930 00000000 */   nop
  .L8002B934:
    /* 1B934 8002B934 1800028E */  lw         $v0, 0x18($s0)
    /* 1B938 8002B938 00000000 */  nop
    /* 1B93C 8002B93C 00204230 */  andi       $v0, $v0, 0x2000
    /* 1B940 8002B940 05004010 */  beqz       $v0, .L8002B958
    /* 1B944 8002B944 00000000 */   nop
    /* 1B948 8002B948 401D828F */  lw         $v0, %gp_rel(membreak)($gp)
    /* 1B94C 8002B94C 00000000 */  nop
    /* 1B950 8002B950 09F84000 */  jalr       $v0
    /* 1B954 8002B954 21200002 */   addu      $a0, $s0, $zero
  .L8002B958:
    /* 1B958 8002B958 1800028E */  lw         $v0, 0x18($s0)
    /* 1B95C 8002B95C 00000000 */  nop
    /* 1B960 8002B960 00804230 */  andi       $v0, $v0, 0x8000
    /* 1B964 8002B964 0C004010 */  beqz       $v0, .L8002B998
    /* 1B968 8002B968 00000000 */   nop
    /* 1B96C 8002B96C 1180043C */  lui        $a0, %hi(D_8010F8B8)
    /* 1B970 8002B970 B8F88424 */  addiu      $a0, $a0, %lo(D_8010F8B8)
    /* 1B974 8002B974 1180023C */  lui        $v0, %hi(D_8010F3D4)
    /* 1B978 8002B978 D4F34224 */  addiu      $v0, $v0, %lo(D_8010F3D4)
    /* 1B97C 8002B97C 1280013C */  lui        $at, %hi(abortfile)
    /* 1B980 8002B980 B8C322AC */  sw         $v0, %lo(abortfile)($at)
    /* 1B984 8002B984 7C060224 */  addiu      $v0, $zero, 0x67C
    /* 1B988 8002B988 1280013C */  lui        $at, %hi(abortline)
    /* 1B98C 8002B98C BCC322AC */  sw         $v0, %lo(abortline)($at)
    /* 1B990 8002B990 0F95000C */  jal        abortmessage
    /* 1B994 8002B994 00000000 */   nop
  .L8002B998:
    /* 1B998 8002B998 1800028E */  lw         $v0, 0x18($s0)
    /* 1B99C 8002B99C 00000000 */  nop
    /* 1B9A0 8002B9A0 00404230 */  andi       $v0, $v0, 0x4000
    /* 1B9A4 8002B9A4 12004010 */  beqz       $v0, .L8002B9F0
    /* 1B9A8 8002B9A8 00000000 */   nop
    /* 1B9AC 8002B9AC 1BB1000C */  jal        checksentinelz
    /* 1B9B0 8002B9B0 21200002 */   addu      $a0, $s0, $zero
    /* 1B9B4 8002B9B4 0E004014 */  bnez       $v0, .L8002B9F0
    /* 1B9B8 8002B9B8 00000000 */   nop
    /* 1B9BC 8002B9BC 0000068E */  lw         $a2, 0x0($s0)
    /* 1B9C0 8002B9C0 1400078E */  lw         $a3, 0x14($s0)
    /* 1B9C4 8002B9C4 1180043C */  lui        $a0, %hi(D_8010F8E8)
    /* 1B9C8 8002B9C8 E8F88424 */  addiu      $a0, $a0, %lo(D_8010F8E8)
    /* 1B9CC 8002B9CC 1180023C */  lui        $v0, %hi(D_8010F3D4)
    /* 1B9D0 8002B9D0 D4F34224 */  addiu      $v0, $v0, %lo(D_8010F3D4)
    /* 1B9D4 8002B9D4 1280013C */  lui        $at, %hi(abortfile)
    /* 1B9D8 8002B9D8 B8C322AC */  sw         $v0, %lo(abortfile)($at)
    /* 1B9DC 8002B9DC 82060224 */  addiu      $v0, $zero, 0x682
    /* 1B9E0 8002B9E0 1280013C */  lui        $at, %hi(abortline)
    /* 1B9E4 8002B9E4 BCC322AC */  sw         $v0, %lo(abortline)($at)
    /* 1B9E8 8002B9E8 0F95000C */  jal        abortmessage
    /* 1B9EC 8002B9EC 04000526 */   addiu     $a1, $s0, 0x4
  .L8002B9F0:
    /* 1B9F0 8002B9F0 1800038E */  lw         $v1, 0x18($s0)
    /* 1B9F4 8002B9F4 FFDF0224 */  addiu      $v0, $zero, -0x2001
    /* 1B9F8 8002B9F8 24106200 */  and        $v0, $v1, $v0
    /* 1B9FC 8002B9FC 03002012 */  beqz       $s1, .L8002BA0C
    /* 1BA00 8002BA00 180002AE */   sw        $v0, 0x18($s0)
    /* 1BA04 8002BA04 00204234 */  ori        $v0, $v0, 0x2000
    /* 1BA08 8002BA08 180002AE */  sw         $v0, 0x18($s0)
  .L8002BA0C:
    /* 1BA0C 8002BA0C 1800BF8F */  lw         $ra, 0x18($sp)
    /* 1BA10 8002BA10 1400B18F */  lw         $s1, 0x14($sp)
    /* 1BA14 8002BA14 1000B08F */  lw         $s0, 0x10($sp)
    /* 1BA18 8002BA18 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 1BA1C 8002BA1C 0800E003 */  jr         $ra
    /* 1BA20 8002BA20 00000000 */   nop
endlabel breakmemblocki
