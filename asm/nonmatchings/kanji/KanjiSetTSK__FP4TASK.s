.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching KanjiSetTSK__FP4TASK, 0x58

glabel KanjiSetTSK__FP4TASK
    /* 9D724 800AD724 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 9D728 800AD728 1400BFAF */  sw         $ra, 0x14($sp)
    /* 9D72C 800AD72C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 9D730 800AD730 1C00828C */  lw         $v0, 0x1C($a0)
    /* 9D734 800AD734 1280033C */  lui        $v1, %hi(FeFlag)
    /* 9D738 800AD738 74B36390 */  lbu        $v1, %lo(FeFlag)($v1)
    /* 9D73C 800AD73C 0000508C */  lw         $s0, 0x0($v0)
    /* 9D740 800AD740 03006014 */  bnez       $v1, .L800AD750
    /* 9D744 800AD744 00000000 */   nop
    /* 9D748 800AD748 EE80000C */  jal        TSK_Sleep
    /* 9D74C 800AD74C 05000424 */   addiu     $a0, $zero, 0x5
  .L800AD750:
    /* 9D750 800AD750 76B5020C */  jal        LoadKanji__F10LANG_DB_NO
    /* 9D754 800AD754 21200002 */   addu      $a0, $s0, $zero
    /* 9D758 800AD758 01000224 */  addiu      $v0, $zero, 0x1
    /* 9D75C 800AD75C 500B82AF */  sw         $v0, %gp_rel(D_8011B2D0)($gp)
    /* 9D760 800AD760 1280013C */  lui        $at, %hi(CDWAIT)
    /* 9D764 800AD764 ECAD20AC */  sw         $zero, %lo(CDWAIT)($at)
    /* 9D768 800AD768 1400BF8F */  lw         $ra, 0x14($sp)
    /* 9D76C 800AD76C 1000B08F */  lw         $s0, 0x10($sp)
    /* 9D770 800AD770 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 9D774 800AD774 0800E003 */  jr         $ra
    /* 9D778 800AD778 00000000 */   nop
endlabel KanjiSetTSK__FP4TASK
