.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetOtPos__7CBlocksi_800acf1c, 0x3C

glabel GetOtPos__7CBlocksi_800acf1c
    /* 9CF1C 800ACF1C C2008284 */  lh         $v0, 0xC2($a0)
    /* 9CF20 800ACF20 1280033C */  lui        $v1, %hi(PosAdj)
    /* 9CF24 800ACF24 ACAC638C */  lw         $v1, %lo(PosAdj)($v1)
    /* 9CF28 800ACF28 21104500 */  addu       $v0, $v0, $a1
    /* 9CF2C 800ACF2C 21184300 */  addu       $v1, $v0, $v1
    /* 9CF30 800ACF30 BDFF6228 */  slti       $v0, $v1, -0x43
    /* 9CF34 800ACF34 03004010 */  beqz       $v0, .L800ACF44
    /* 9CF38 800ACF38 9C016228 */   slti      $v0, $v1, 0x19C
    /* 9CF3C 800ACF3C BDFF0324 */  addiu      $v1, $zero, -0x43
    /* 9CF40 800ACF40 9C016228 */  slti       $v0, $v1, 0x19C
  .L800ACF44:
    /* 9CF44 800ACF44 02004014 */  bnez       $v0, .L800ACF50
    /* 9CF48 800ACF48 00000000 */   nop
    /* 9CF4C 800ACF4C 9B010324 */  addiu      $v1, $zero, 0x19B
  .L800ACF50:
    /* 9CF50 800ACF50 0800E003 */  jr         $ra
    /* 9CF54 800ACF54 4D006224 */   addiu     $v0, $v1, 0x4D
endlabel GetOtPos__7CBlocksi_800acf1c
