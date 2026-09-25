.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching priv_sound_init__FUc, 0x44

glabel priv_sound_init__FUc
    /* 2D8FC 8003D8FC 1280023C */  lui        $v0, %hi(gbSndInited)
    /* 2D900 8003D900 99BB4290 */  lbu        $v0, %lo(gbSndInited)($v0)
    /* 2D904 8003D904 00000000 */  nop
    /* 2D908 8003D908 0B004010 */  beqz       $v0, .L8003D938
    /* 2D90C 8003D90C 00000000 */   nop
    /* 2D910 8003D910 8F008530 */  andi       $a1, $a0, 0x8F
    /* 2D914 8003D914 FF00A630 */  andi       $a2, $a1, 0xFF
    /* 2D918 8003D918 21180000 */  addu       $v1, $zero, $zero
  .L8003D91C:
    /* 2D91C 8003D91C 0D80013C */  lui        $at, %hi(sgSFX + 0x1)
    /* 2D920 8003D920 21082300 */  addu       $at, $at, $v1
    /* 2D924 8003D924 C10A2490 */  lbu        $a0, %lo(sgSFX + 0x1)($at)
    /* 2D928 8003D928 04006324 */  addiu      $v1, $v1, 0x4
    /* 2D92C 8003D92C 800F622C */  sltiu      $v0, $v1, 0xF80
    /* 2D930 8003D930 FAFF4014 */  bnez       $v0, .L8003D91C
    /* 2D934 8003D934 00000000 */   nop
  .L8003D938:
    /* 2D938 8003D938 0800E003 */  jr         $ra
    /* 2D93C 8003D93C 00000000 */   nop
endlabel priv_sound_init__FUc
