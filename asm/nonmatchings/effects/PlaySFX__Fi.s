.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PlaySFX__Fi, 0x6C

glabel PlaySFX__Fi
    /* 2D718 8003D718 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 2D71C 8003D71C 0B008014 */  bnez       $a0, .L8003D74C
    /* 2D720 8003D720 1000BFAF */   sw        $ra, 0x10($sp)
    /* 2D724 8003D724 0E80023C */  lui        $v0, %hi(plr + 0x1D)
    /* 2D728 8003D728 55A54290 */  lbu        $v0, %lo(plr + 0x1D)($v0)
    /* 2D72C 8003D72C 00000000 */  nop
    /* 2D730 8003D730 06004010 */  beqz       $v0, .L8003D74C
    /* 2D734 8003D734 00000000 */   nop
    /* 2D738 8003D738 0E80023C */  lui        $v0, %hi(plr + 0x1A05)
    /* 2D73C 8003D73C 3DBF4290 */  lbu        $v0, %lo(plr + 0x1A05)($v0)
    /* 2D740 8003D740 00000000 */  nop
    /* 2D744 8003D744 0B004014 */  bnez       $v0, .L8003D774
    /* 2D748 8003D748 00000000 */   nop
  .L8003D74C:
    /* 2D74C 8003D74C 9CF5000C */  jal        RndSFX__Fi
    /* 2D750 8003D750 00000000 */   nop
    /* 2D754 8003D754 80100200 */  sll        $v0, $v0, 2
    /* 2D758 8003D758 0D80043C */  lui        $a0, %hi(sgSFX)
    /* 2D75C 8003D75C C00A8424 */  addiu      $a0, $a0, %lo(sgSFX)
    /* 2D760 8003D760 21204400 */  addu       $a0, $v0, $a0
    /* 2D764 8003D764 21280000 */  addu       $a1, $zero, $zero
    /* 2D768 8003D768 21300000 */  addu       $a2, $zero, $zero
    /* 2D76C 8003D76C F1F4000C */  jal        PlaySFX_priv__FP4TSFXUcii
    /* 2D770 8003D770 21380000 */   addu      $a3, $zero, $zero
  .L8003D774:
    /* 2D774 8003D774 1000BF8F */  lw         $ra, 0x10($sp)
    /* 2D778 8003D778 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 2D77C 8003D77C 0800E003 */  jr         $ra
    /* 2D780 8003D780 00000000 */   nop
endlabel PlaySFX__Fi
