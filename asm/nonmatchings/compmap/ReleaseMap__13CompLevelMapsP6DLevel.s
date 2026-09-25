.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ReleaseMap__13CompLevelMapsP6DLevel, 0xA0

glabel ReleaseMap__13CompLevelMapsP6DLevel
    /* 71804 80081804 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 71808 80081808 1000B0AF */  sw         $s0, 0x10($sp)
    /* 7180C 8008180C 21808000 */  addu       $s0, $a0, $zero
    /* 71810 80081810 1800BFAF */  sw         $ra, 0x18($sp)
    /* 71814 80081814 1400B1AF */  sw         $s1, 0x14($sp)
    /* 71818 80081818 6C01028E */  lw         $v0, 0x16C($s0)
    /* 7181C 8008181C 00000000 */  nop
    /* 71820 80081820 06004014 */  bnez       $v0, .L8008183C
    /* 71824 80081824 2188A000 */   addu      $s1, $a1, $zero
    /* 71828 80081828 21200000 */  addu       $a0, $zero, $zero
    /* 7182C 8008182C 1280053C */  lui        $a1, %hi(D_80118E58)
    /* 71830 80081830 588EA524 */  addiu      $a1, $a1, %lo(D_80118E58)
    /* 71834 80081834 A583000C */  jal        DBG_Error
    /* 71838 80081838 78000624 */   addiu     $a2, $zero, 0x78
  .L8008183C:
    /* 7183C 8008183C 6401058E */  lw         $a1, 0x164($s0)
    /* 71840 80081840 21200002 */  addu       $a0, $s0, $zero
    /* 71844 80081844 4808020C */  jal        CheckMapNum__13CompLevelMapsi
    /* 71848 80081848 6C0100AE */   sw        $zero, 0x16C($s0)
    /* 7184C 8008184C 6801028E */  lw         $v0, 0x168($s0)
    /* 71850 80081850 00000000 */  nop
    /* 71854 80081854 06002212 */  beq        $s1, $v0, .L80081870
    /* 71858 80081858 00000000 */   nop
    /* 7185C 8008185C 21200000 */  addu       $a0, $zero, $zero
    /* 71860 80081860 1280053C */  lui        $a1, %hi(D_80118E58)
    /* 71864 80081864 588EA524 */  addiu      $a1, $a1, %lo(D_80118E58)
    /* 71868 80081868 A583000C */  jal        DBG_Error
    /* 7186C 8008186C 7C000624 */   addiu     $a2, $zero, 0x7C
  .L80081870:
    /* 71870 80081870 6401048E */  lw         $a0, 0x164($s0)
    /* 71874 80081874 21282002 */  addu       $a1, $s1, $zero
    /* 71878 80081878 00210400 */  sll        $a0, $a0, 4
    /* 7187C 8008187C 04008424 */  addiu      $a0, $a0, 0x4
    /* 71880 80081880 6607020C */  jal        ReleaseMap__4AMapP6DLevel
    /* 71884 80081884 21200402 */   addu      $a0, $s0, $a0
    /* 71888 80081888 680100AE */  sw         $zero, 0x168($s0)
    /* 7188C 8008188C 1800BF8F */  lw         $ra, 0x18($sp)
    /* 71890 80081890 1400B18F */  lw         $s1, 0x14($sp)
    /* 71894 80081894 1000B08F */  lw         $s0, 0x10($sp)
    /* 71898 80081898 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 7189C 8008189C 0800E003 */  jr         $ra
    /* 718A0 800818A0 00000000 */   nop
endlabel ReleaseMap__13CompLevelMapsP6DLevel
