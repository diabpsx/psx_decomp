.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching __7CBlocksiiiii, 0x164

glabel __7CBlocksiiiii
    /* 7D6FC 8008D6FC D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 7D700 8008D700 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 7D704 8008D704 4000B38F */  lw         $s3, 0x40($sp)
    /* 7D708 8008D708 1400B1AF */  sw         $s1, 0x14($sp)
    /* 7D70C 8008D70C 21888000 */  addu       $s1, $a0, $zero
    /* 7D710 8008D710 1000B0AF */  sw         $s0, 0x10($sp)
    /* 7D714 8008D714 2180A000 */  addu       $s0, $a1, $zero
    /* 7D718 8008D718 2400B5AF */  sw         $s5, 0x24($sp)
    /* 7D71C 8008D71C 21A8C000 */  addu       $s5, $a2, $zero
    /* 7D720 8008D720 2000B4AF */  sw         $s4, 0x20($sp)
    /* 7D724 8008D724 21A0E000 */  addu       $s4, $a3, $zero
    /* 7D728 8008D728 2800B6AF */  sw         $s6, 0x28($sp)
    /* 7D72C 8008D72C 4400B68F */  lw         $s6, 0x44($sp)
    /* 7D730 8008D730 2C00BFAF */  sw         $ra, 0x2C($sp)
    /* 7D734 8008D734 9547020C */  jal        __7TextDat
    /* 7D738 8008D738 1800B2AF */   sw        $s2, 0x18($sp)
    /* 7D73C 8008D73C 21202002 */  addu       $a0, $s1, $zero
    /* 7D740 8008D740 21280000 */  addu       $a1, $zero, $zero
    /* 7D744 8008D744 21300000 */  addu       $a2, $zero, $zero
    /* 7D748 8008D748 FFFF1224 */  addiu      $s2, $zero, -0x1
    /* 7D74C 8008D74C 01000224 */  addiu      $v0, $zero, 0x1
    /* 7D750 8008D750 C00022A6 */  sh         $v0, 0xC0($s1)
    /* 7D754 8008D754 3E010224 */  addiu      $v0, $zero, 0x13E
    /* 7D758 8008D758 C40022A6 */  sh         $v0, 0xC4($s1)
    /* 7D75C 8008D75C F0000224 */  addiu      $v0, $zero, 0xF0
    /* 7D760 8008D760 E80032AE */  sw         $s2, 0xE8($s1)
    /* 7D764 8008D764 EC0032AE */  sw         $s2, 0xEC($s1)
    /* 7D768 8008D768 7C0020AE */  sw         $zero, 0x7C($s1)
    /* 7D76C 8008D76C 800020AE */  sw         $zero, 0x80($s1)
    /* 7D770 8008D770 A80020AE */  sw         $zero, 0xA8($s1)
    /* 7D774 8008D774 C20020A6 */  sh         $zero, 0xC2($s1)
    /* 7D778 8008D778 8345020C */  jal        SetScrollTarget__7CBlocksii
    /* 7D77C 8008D77C C60022A6 */   sh        $v0, 0xC6($s1)
    /* 7D780 8008D780 21202002 */  addu       $a0, $s1, $zero
    /* 7D784 8008D784 21280000 */  addu       $a1, $zero, $zero
    /* 7D788 8008D788 9738020C */  jal        SetXY__7CBlocksii
    /* 7D78C 8008D78C 21300000 */   addu      $a2, $zero, $zero
    /* 7D790 8008D790 21202002 */  addu       $a0, $s1, $zero
    /* 7D794 8008D794 21280002 */  addu       $a1, $s0, $zero
    /* 7D798 8008D798 840032AE */  sw         $s2, 0x84($s1)
    /* 7D79C 8008D79C 700020AE */  sw         $zero, 0x70($s1)
    /* 7D7A0 8008D7A0 780020AE */  sw         $zero, 0x78($s1)
    /* 7D7A4 8008D7A4 8C0032AE */  sw         $s2, 0x8C($s1)
    /* 7D7A8 8008D7A8 740020AE */  sw         $zero, 0x74($s1)
    /* 7D7AC 8008D7AC 900032AE */  sw         $s2, 0x90($s1)
    /* 7D7B0 8008D7B0 940020AE */  sw         $zero, 0x94($s1)
    /* 7D7B4 8008D7B4 980032AE */  sw         $s2, 0x98($s1)
    /* 7D7B8 8008D7B8 D936020C */  jal        Load__7CBlocksi
    /* 7D7BC 8008D7BC 9C0020AE */   sw        $zero, 0x9C($s1)
    /* 7D7C0 8008D7C0 A738020C */  jal        InitColourCycling__7CBlocks
    /* 7D7C4 8008D7C4 21202002 */   addu      $a0, $s1, $zero
    /* 7D7C8 8008D7C8 980030AE */  sw         $s0, 0x98($s1)
    /* 7D7CC 8008D7CC 04009212 */  beq        $s4, $s2, .L8008D7E0
    /* 7D7D0 8008D7D0 9C0031AE */   sw        $s1, 0x9C($s1)
    /* 7D7D4 8008D7D4 21202002 */  addu       $a0, $s1, $zero
    /* 7D7D8 8008D7D8 0047020C */  jal        SetItemGraphics__7CBlocksi
    /* 7D7DC 8008D7DC 21288002 */   addu      $a1, $s4, $zero
  .L8008D7E0:
    /* 7D7E0 8008D7E0 5F91020C */  jal        UPDATEPROGRESS__Fi
    /* 7D7E4 8008D7E4 01000424 */   addiu     $a0, $zero, 0x1
    /* 7D7E8 8008D7E8 0300B212 */  beq        $s5, $s2, .L8008D7F8
    /* 7D7EC 8008D7EC 21202002 */   addu      $a0, $s1, $zero
    /* 7D7F0 8008D7F0 0A47020C */  jal        SetObjGraphics__7CBlocksi
    /* 7D7F4 8008D7F4 2128A002 */   addu      $a1, $s5, $zero
  .L8008D7F8:
    /* 7D7F8 8008D7F8 5F91020C */  jal        UPDATEPROGRESS__Fi
    /* 7D7FC 8008D7FC 01000424 */   addiu     $a0, $zero, 0x1
    /* 7D800 8008D800 08007212 */  beq        $s3, $s2, .L8008D824
    /* 7D804 8008D804 00000000 */   nop
    /* 7D808 8008D808 0600D212 */  beq        $s6, $s2, .L8008D824
    /* 7D80C 8008D80C 00000000 */   nop
    /* 7D810 8008D810 04006012 */  beqz       $s3, .L8008D824
    /* 7D814 8008D814 21202002 */   addu      $a0, $s1, $zero
    /* 7D818 8008D818 21286002 */  addu       $a1, $s3, $zero
    /* 7D81C 8008D81C 2636020C */  jal        SetMonsterGraphics__7CBlocksii
    /* 7D820 8008D820 2130C002 */   addu      $a2, $s6, $zero
  .L8008D824:
    /* 7D824 8008D824 5F91020C */  jal        UPDATEPROGRESS__Fi
    /* 7D828 8008D828 01000424 */   addiu     $a0, $zero, 0x1
    /* 7D82C 8008D82C 280591AF */  sw         $s1, %gp_rel(CurrentBlocks)($gp)
    /* 7D830 8008D830 21102002 */  addu       $v0, $s1, $zero
    /* 7D834 8008D834 2C00BF8F */  lw         $ra, 0x2C($sp)
    /* 7D838 8008D838 2800B68F */  lw         $s6, 0x28($sp)
    /* 7D83C 8008D83C 2400B58F */  lw         $s5, 0x24($sp)
    /* 7D840 8008D840 2000B48F */  lw         $s4, 0x20($sp)
    /* 7D844 8008D844 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 7D848 8008D848 1800B28F */  lw         $s2, 0x18($sp)
    /* 7D84C 8008D84C 1400B18F */  lw         $s1, 0x14($sp)
    /* 7D850 8008D850 1000B08F */  lw         $s0, 0x10($sp)
    /* 7D854 8008D854 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 7D858 8008D858 0800E003 */  jr         $ra
    /* 7D85C 8008D85C 00000000 */   nop
endlabel __7CBlocksiiiii
