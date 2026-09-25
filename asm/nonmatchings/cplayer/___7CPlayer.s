.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ___7CPlayer, 0x90

glabel ___7CPlayer
    /* 859AC 800959AC E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 859B0 800959B0 1000B0AF */  sw         $s0, 0x10($sp)
    /* 859B4 800959B4 21808000 */  addu       $s0, $a0, $zero
    /* 859B8 800959B8 1400B1AF */  sw         $s1, 0x14($sp)
    /* 859BC 800959BC 1800BFAF */  sw         $ra, 0x18($sp)
    /* 859C0 800959C0 7C000296 */  lhu        $v0, 0x7C($s0)
    /* 859C4 800959C4 00000000 */  nop
    /* 859C8 800959C8 80100200 */  sll        $v0, $v0, 2
    /* 859CC 800959CC 1280013C */  lui        $at, %hi(_7CPlayer_PActiveArray)
    /* 859D0 800959D0 21082200 */  addu       $at, $at, $v0
    /* 859D4 800959D4 50AD20AC */  sw         $zero, %lo(_7CPlayer_PActiveArray)($at)
    /* 859D8 800959D8 3559020C */  jal        Dump__7CPlayer
    /* 859DC 800959DC 2188A000 */   addu      $s1, $a1, $zero
    /* 859E0 800959E0 7000048E */  lw         $a0, 0x70($s0)
    /* 859E4 800959E4 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 859E8 800959E8 0B008210 */  beq        $a0, $v0, .L80095A18
    /* 859EC 800959EC 00000000 */   nop
    /* 859F0 800959F0 1886000C */  jal        GAL_Free
    /* 859F4 800959F4 00000000 */   nop
    /* 859F8 800959F8 FF004230 */  andi       $v0, $v0, 0xFF
    /* 859FC 800959FC 07004014 */  bnez       $v0, .L80095A1C
    /* 85A00 80095A00 21200002 */   addu      $a0, $s0, $zero
    /* 85A04 80095A04 21200000 */  addu       $a0, $zero, $zero
    /* 85A08 80095A08 1180053C */  lui        $a1, %hi(D_8011064C)
    /* 85A0C 80095A0C 4C06A524 */  addiu      $a1, $a1, %lo(D_8011064C)
    /* 85A10 80095A10 A583000C */  jal        DBG_Error
    /* 85A14 80095A14 9B000624 */   addiu     $a2, $zero, 0x9B
  .L80095A18:
    /* 85A18 80095A18 21200002 */  addu       $a0, $s0, $zero
  .L80095A1C:
    /* 85A1C 80095A1C AA47020C */  jal        ___7TextDat
    /* 85A20 80095A20 21282002 */   addu      $a1, $s1, $zero
    /* 85A24 80095A24 1800BF8F */  lw         $ra, 0x18($sp)
    /* 85A28 80095A28 1400B18F */  lw         $s1, 0x14($sp)
    /* 85A2C 80095A2C 1000B08F */  lw         $s0, 0x10($sp)
    /* 85A30 80095A30 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 85A34 80095A34 0800E003 */  jr         $ra
    /* 85A38 80095A38 00000000 */   nop
endlabel ___7CPlayer
