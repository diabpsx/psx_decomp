.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ML_SetRandomList__Fi, 0x98

glabel ML_SetRandomList__Fi
    /* 6D6B0 8007D6B0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 6D6B4 8007D6B4 1000B0AF */  sw         $s0, 0x10($sp)
    /* 6D6B8 8007D6B8 FFFF9024 */  addiu      $s0, $a0, -0x1
    /* 6D6BC 8007D6BC 1000022E */  sltiu      $v0, $s0, 0x10
    /* 6D6C0 8007D6C0 06004014 */  bnez       $v0, .L8007D6DC
    /* 6D6C4 8007D6C4 1400BFAF */   sw        $ra, 0x14($sp)
    /* 6D6C8 8007D6C8 21200000 */  addu       $a0, $zero, $zero
    /* 6D6CC 8007D6CC 1280053C */  lui        $a1, %hi(D_80118D78)
    /* 6D6D0 8007D6D0 788DA524 */  addiu      $a1, $a1, %lo(D_80118D78)
    /* 6D6D4 8007D6D4 A583000C */  jal        DBG_Error
    /* 6D6D8 8007D6D8 6F000624 */   addiu     $a2, $zero, 0x6F
  .L8007D6DC:
    /* 6D6DC 8007D6DC C0101000 */  sll        $v0, $s0, 3
    /* 6D6E0 8007D6E0 1280033C */  lui        $v1, %hi(setlevel)
    /* 6D6E4 8007D6E4 0EC16390 */  lbu        $v1, %lo(setlevel)($v1)
    /* 6D6E8 8007D6E8 0B80013C */  lui        $at, %hi(AllLevels)
    /* 6D6EC 8007D6EC 21082200 */  addu       $at, $at, $v0
    /* 6D6F0 8007D6F0 5875248C */  lw         $a0, %lo(AllLevels)($at)
    /* 6D6F4 8007D6F4 08006010 */  beqz       $v1, .L8007D718
    /* 6D6F8 8007D6F8 00000000 */   nop
    /* 6D6FC 8007D6FC 6983000C */  jal        GU_GetRndRange
    /* 6D700 8007D700 00000000 */   nop
    /* 6D704 8007D704 0E80013C */  lui        $at, %hi(QlTab)
    /* 6D708 8007D708 21083000 */  addu       $at, $at, $s0
    /* 6D70C 8007D70C D43922A0 */  sb         $v0, %lo(QlTab)($at)
    /* 6D710 8007D710 CCF50108 */  j          .L8007D730
    /* 6D714 8007D714 00160200 */   sll       $v0, $v0, 24
  .L8007D718:
    /* 6D718 8007D718 6983000C */  jal        GU_GetRndRange
    /* 6D71C 8007D71C 00000000 */   nop
    /* 6D720 8007D720 0E80013C */  lui        $at, %hi(MlTab)
    /* 6D724 8007D724 21083000 */  addu       $at, $at, $s0
    /* 6D728 8007D728 C43922A0 */  sb         $v0, %lo(MlTab)($at)
    /* 6D72C 8007D72C 00160200 */  sll        $v0, $v0, 24
  .L8007D730:
    /* 6D730 8007D730 03160200 */  sra        $v0, $v0, 24
    /* 6D734 8007D734 1400BF8F */  lw         $ra, 0x14($sp)
    /* 6D738 8007D738 1000B08F */  lw         $s0, 0x10($sp)
    /* 6D73C 8007D73C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 6D740 8007D740 0800E003 */  jr         $ra
    /* 6D744 8007D744 00000000 */   nop
endlabel ML_SetRandomList__Fi
