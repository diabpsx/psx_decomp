.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PAD_GetPad__FiUc, 0xB0

glabel PAD_GetPad__FiUc
    /* 797F4 800897F4 1280023C */  lui        $v0, %hi(deathflag)
    /* 797F8 800897F8 0CBA4290 */  lbu        $v0, %lo(deathflag)($v0)
    /* 797FC 800897FC D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 79800 80089800 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 79804 80089804 21988000 */  addu       $s3, $a0, $zero
    /* 79808 80089808 1000B0AF */  sw         $s0, 0x10($sp)
    /* 7980C 8008980C 2180A000 */  addu       $s0, $a1, $zero
    /* 79810 80089810 2000BFAF */  sw         $ra, 0x20($sp)
    /* 79814 80089814 1800B2AF */  sw         $s2, 0x18($sp)
    /* 79818 80089818 02004010 */  beqz       $v0, .L80089824
    /* 7981C 8008981C 1400B1AF */   sw        $s1, 0x14($sp)
    /* 79820 80089820 01001024 */  addiu      $s0, $zero, 0x1
  .L80089824:
    /* 79824 80089824 FF000232 */  andi       $v0, $s0, 0xFF
    /* 79828 80089828 08004014 */  bnez       $v0, .L8008984C
    /* 7982C 8008982C 00000000 */   nop
    /* 79830 80089830 0200622E */  sltiu      $v0, $s3, 0x2
    /* 79834 80089834 05004014 */  bnez       $v0, .L8008984C
    /* 79838 80089838 21200000 */   addu      $a0, $zero, $zero
    /* 7983C 8008983C 1180053C */  lui        $a1, %hi(D_801104A8)
    /* 79840 80089840 A804A524 */  addiu      $a1, $a1, %lo(D_801104A8)
    /* 79844 80089844 A583000C */  jal        DBG_Error
    /* 79848 80089848 01010624 */   addiu     $a2, $zero, 0x101
  .L8008984C:
    /* 7984C 8008984C 0B80113C */  lui        $s1, %hi(Pad0)
    /* 79850 80089850 347D3126 */  addiu      $s1, $s1, %lo(Pad0)
    /* 79854 80089854 21202002 */  addu       $a0, $s1, $zero
    /* 79858 80089858 FF001032 */  andi       $s0, $s0, 0xFF
    /* 7985C 8008985C 0927020C */  jal        SetBothFlag__4CPadUc
    /* 79860 80089860 21280002 */   addu      $a1, $s0, $zero
    /* 79864 80089864 0B80123C */  lui        $s2, %hi(Pad1)
    /* 79868 80089868 207E5226 */  addiu      $s2, $s2, %lo(Pad1)
    /* 7986C 8008986C 21204002 */  addu       $a0, $s2, $zero
    /* 79870 80089870 0927020C */  jal        SetBothFlag__4CPadUc
    /* 79874 80089874 21280002 */   addu      $a1, $s0, $zero
    /* 79878 80089878 02006012 */  beqz       $s3, .L80089884
    /* 7987C 8008987C 21102002 */   addu      $v0, $s1, $zero
    /* 79880 80089880 21104002 */  addu       $v0, $s2, $zero
  .L80089884:
    /* 79884 80089884 2000BF8F */  lw         $ra, 0x20($sp)
    /* 79888 80089888 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 7988C 8008988C 1800B28F */  lw         $s2, 0x18($sp)
    /* 79890 80089890 1400B18F */  lw         $s1, 0x14($sp)
    /* 79894 80089894 1000B08F */  lw         $s0, 0x10($sp)
    /* 79898 80089898 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 7989C 8008989C 0800E003 */  jr         $ra
    /* 798A0 800898A0 00000000 */   nop
endlabel PAD_GetPad__FiUc
