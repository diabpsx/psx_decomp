.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching start_mdec_decode, 0x15C

glabel start_mdec_decode
    /* 1CB5C 80156754 180D828F */  lw         $v0, %gp_rel(slices_to_do)($gp)
    /* 1CB60 80156758 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 1CB64 8015675C 1800B2AF */  sw         $s2, 0x18($sp)
    /* 1CB68 80156760 3800B28F */  lw         $s2, 0x38($sp)
    /* 1CB6C 80156764 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1CB70 80156768 21808000 */  addu       $s0, $a0, $zero
    /* 1CB74 8015676C 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 1CB78 80156770 2198A000 */  addu       $s3, $a1, $zero
    /* 1CB7C 80156774 2000B4AF */  sw         $s4, 0x20($sp)
    /* 1CB80 80156778 21A0C000 */  addu       $s4, $a2, $zero
    /* 1CB84 8015677C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 1CB88 80156780 2188E000 */  addu       $s1, $a3, $zero
    /* 1CB8C 80156784 05004010 */  beqz       $v0, .L8015679C
    /* 1CB90 80156788 2400BFAF */   sw        $ra, 0x24($sp)
  .L8015678C:
    /* 1CB94 8015678C 180D828F */  lw         $v0, %gp_rel(slices_to_do)($gp)
    /* 1CB98 80156790 00000000 */  nop
    /* 1CB9C 80156794 FDFF4014 */  bnez       $v0, .L8015678C
    /* 1CBA0 80156798 00000000 */   nop
  .L8015679C:
    /* 1CBA4 8015679C 080D828F */  lw         $v0, %gp_rel(vbuf)($gp)
    /* 1CBA8 801567A0 4C0E868F */  lw         $a2, %gp_rel(vlctab)($gp)
    /* 1CBAC 801567A4 80100200 */  sll        $v0, $v0, 2
    /* 1CBB0 801567A8 1280013C */  lui        $at, %hi(vlcbuf)
    /* 1CBB4 801567AC 21082200 */  addu       $at, $at, $v0
    /* 1CBB8 801567B0 58B5258C */  lw         $a1, %lo(vlcbuf)($at)
    /* 1CBBC 801567B4 ECEC040C */  jal        func_8013B3B0
    /* 1CBC0 801567B8 21200002 */   addu      $a0, $s0, $zero
    /* 1CBC4 801567BC 65EB040C */  jal        func_8013AD94
    /* 1CBC8 801567C0 21200002 */   addu      $a0, $s0, $zero
    /* 1CBCC 801567C4 E80D8487 */  lh         $a0, %gp_rel(slice + 0x4)($gp)
    /* 1CBD0 801567C8 00000000 */  nop
    /* 1CBD4 801567CC 1A002402 */  div        $zero, $s1, $a0
    /* 1CBD8 801567D0 12180000 */  mflo       $v1
    /* 1CBDC 801567D4 10100000 */  mfhi       $v0
    /* 1CBE0 801567D8 E40D93A7 */  sh         $s3, %gp_rel(slice)($gp)
    /* 1CBE4 801567DC E60D94A7 */  sh         $s4, %gp_rel(slice + 0x2)($gp)
    /* 1CBE8 801567E0 EA0D92A7 */  sh         $s2, %gp_rel(slice + 0x6)($gp)
    /* 1CBEC 801567E4 2A100200 */  slt        $v0, $zero, $v0
    /* 1CBF0 801567E8 21186200 */  addu       $v1, $v1, $v0
    /* 1CBF4 801567EC 180D83AF */  sw         $v1, %gp_rel(slices_to_do)($gp)
    /* 1CBF8 801567F0 180D828F */  lw         $v0, %gp_rel(slices_to_do)($gp)
    /* 1CBFC 801567F4 0F004332 */  andi       $v1, $s2, 0xF
    /* 1CC00 801567F8 140D82AF */  sw         $v0, %gp_rel(slnum)($gp)
    /* 1CC04 801567FC 05006010 */  beqz       $v1, .L80156814
    /* 1CC08 80156800 00141200 */   sll       $v0, $s2, 16
    /* 1CC0C 80156804 03140200 */  sra        $v0, $v0, 16
    /* 1CC10 80156808 10004224 */  addiu      $v0, $v0, 0x10
    /* 1CC14 8015680C 065A0508 */  j          .L80156818
    /* 1CC18 80156810 23104300 */   subu      $v0, $v0, $v1
  .L80156814:
    /* 1CC1C 80156814 03140200 */  sra        $v0, $v0, 16
  .L80156818:
    /* 1CC20 80156818 18008200 */  mult       $a0, $v0
    /* 1CC24 8015681C 12400000 */  mflo       $t0
    /* 1CC28 80156820 43100800 */  sra        $v0, $t0, 1
    /* 1CC2C 80156824 E00D82AF */  sw         $v0, %gp_rel(slice_size)($gp)
    /* 1CC30 80156828 0F002232 */  andi       $v0, $s1, 0xF
    /* 1CC34 8015682C 02004014 */  bnez       $v0, .L80156838
    /* 1CC38 80156830 00000000 */   nop
    /* 1CC3C 80156834 10000224 */  addiu      $v0, $zero, 0x10
  .L80156838:
    /* 1CC40 80156838 EC0D82AF */  sw         $v0, %gp_rel(slice_inc)($gp)
    /* 1CC44 8015683C 080D828F */  lw         $v0, %gp_rel(vbuf)($gp)
    /* 1CC48 80156840 00000000 */  nop
    /* 1CC4C 80156844 80100200 */  sll        $v0, $v0, 2
    /* 1CC50 80156848 1280013C */  lui        $at, %hi(vlcbuf)
    /* 1CC54 8015684C 21082200 */  addu       $at, $at, $v0
    /* 1CC58 80156850 58B5248C */  lw         $a0, %lo(vlcbuf)($at)
    /* 1CC5C 80156854 68EB040C */  jal        func_8013ADA0
    /* 1CC60 80156858 02000524 */   addiu     $a1, $zero, 0x2
    /* 1CC64 8015685C 180D828F */  lw         $v0, %gp_rel(slices_to_do)($gp)
    /* 1CC68 80156860 E00D858F */  lw         $a1, %gp_rel(slice_size)($gp)
    /* 1CC6C 80156864 80100200 */  sll        $v0, $v0, 2
    /* 1CC70 80156868 1580013C */  lui        $at, %hi(map_buf + 0x18FFC)
    /* 1CC74 8015686C 21082200 */  addu       $at, $at, $v0
    /* 1CC78 80156870 0C49248C */  lw         $a0, %lo(map_buf + (0x18FFC & 0xFFFF))($at)
    /* 1CC7C 80156874 87EB040C */  jal        func_8013AE1C
    /* 1CC80 80156878 00000000 */   nop
    /* 1CC84 8015687C 080D828F */  lw         $v0, %gp_rel(vbuf)($gp)
    /* 1CC88 80156880 00000000 */  nop
    /* 1CC8C 80156884 01004238 */  xori       $v0, $v0, 0x1
    /* 1CC90 80156888 080D82AF */  sw         $v0, %gp_rel(vbuf)($gp)
    /* 1CC94 8015688C 2400BF8F */  lw         $ra, 0x24($sp)
    /* 1CC98 80156890 2000B48F */  lw         $s4, 0x20($sp)
    /* 1CC9C 80156894 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 1CCA0 80156898 1800B28F */  lw         $s2, 0x18($sp)
    /* 1CCA4 8015689C 1400B18F */  lw         $s1, 0x14($sp)
    /* 1CCA8 801568A0 1000B08F */  lw         $s0, 0x10($sp)
    /* 1CCAC 801568A4 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 1CCB0 801568A8 0800E003 */  jr         $ra
    /* 1CCB4 801568AC 00000000 */   nop
endlabel start_mdec_decode
