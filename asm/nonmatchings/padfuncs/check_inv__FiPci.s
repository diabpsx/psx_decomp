.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching check_inv__FiPci, 0x280

glabel check_inv__FiPci
    /* 9278C 800A278C C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 92790 800A2790 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 92794 800A2794 21988000 */  addu       $s3, $a0, $zero
    /* 92798 800A2798 2C00B7AF */  sw         $s7, 0x2C($sp)
    /* 9279C 800A279C 21B8A000 */  addu       $s7, $a1, $zero
    /* 927A0 800A27A0 3000BEAF */  sw         $fp, 0x30($sp)
    /* 927A4 800A27A4 21F0C000 */  addu       $fp, $a2, $zero
    /* 927A8 800A27A8 40101300 */  sll        $v0, $s3, 1
    /* 927AC 800A27AC 21105300 */  addu       $v0, $v0, $s3
    /* 927B0 800A27B0 80100200 */  sll        $v0, $v0, 2
    /* 927B4 800A27B4 21105300 */  addu       $v0, $v0, $s3
    /* 927B8 800A27B8 00110200 */  sll        $v0, $v0, 4
    /* 927BC 800A27BC 23105300 */  subu       $v0, $v0, $s3
    /* 927C0 800A27C0 80100200 */  sll        $v0, $v0, 2
    /* 927C4 800A27C4 21105300 */  addu       $v0, $v0, $s3
    /* 927C8 800A27C8 C0100200 */  sll        $v0, $v0, 3
    /* 927CC 800A27CC 0E80033C */  lui        $v1, %hi(plr)
    /* 927D0 800A27D0 38A56324 */  addiu      $v1, $v1, %lo(plr)
    /* 927D4 800A27D4 2000B4AF */  sw         $s4, 0x20($sp)
    /* 927D8 800A27D8 21A04300 */  addu       $s4, $v0, $v1
    /* 927DC 800A27DC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 927E0 800A27E0 1280103C */  lui        $s0, %hi(stextflag)
    /* 927E4 800A27E4 E0BA1082 */  lb         $s0, %lo(stextflag)($s0)
    /* 927E8 800A27E8 1280023C */  lui        $v0, %hi(qtextflag)
    /* 927EC 800A27EC 60B94290 */  lbu        $v0, %lo(qtextflag)($v0)
    /* 927F0 800A27F0 1280033C */  lui        $v1, %hi(PauseMode)
    /* 927F4 800A27F4 A4B76390 */  lbu        $v1, %lo(PauseMode)($v1)
    /* 927F8 800A27F8 3400BFAF */  sw         $ra, 0x34($sp)
    /* 927FC 800A27FC 2800B6AF */  sw         $s6, 0x28($sp)
    /* 92800 800A2800 2400B5AF */  sw         $s5, 0x24($sp)
    /* 92804 800A2804 1800B2AF */  sw         $s2, 0x18($sp)
    /* 92808 800A2808 1400B1AF */  sw         $s1, 0x14($sp)
    /* 9280C 800A280C 25800202 */  or         $s0, $s0, $v0
    /* 92810 800A2810 25800302 */  or         $s0, $s0, $v1
    /* 92814 800A2814 1280023C */  lui        $v0, %hi(chrflag)
    /* 92818 800A2818 C0B64290 */  lbu        $v0, %lo(chrflag)($v0)
    /* 9281C 800A281C 1280033C */  lui        $v1, %hi(invflag)
    /* 92820 800A2820 2CC36390 */  lbu        $v1, %lo(invflag)($v1)
    /* 92824 800A2824 25800202 */  or         $s0, $s0, $v0
    /* 92828 800A2828 25800302 */  or         $s0, $s0, $v1
    /* 9282C 800A282C 1280023C */  lui        $v0, %hi(questlog)
    /* 92830 800A2830 29BA4290 */  lbu        $v0, %lo(questlog)($v0)
    /* 92834 800A2834 1280033C */  lui        $v1, %hi(optionsflag)
    /* 92838 800A2838 48B2638C */  lw         $v1, %lo(optionsflag)($v1)
    /* 9283C 800A283C 25800202 */  or         $s0, $s0, $v0
    /* 92840 800A2840 25800302 */  or         $s0, $s0, $v1
    /* 92844 800A2844 1280023C */  lui        $v0, %hi(sbookflag)
    /* 92848 800A2848 C6B64290 */  lbu        $v0, %lo(sbookflag)($v0)
    /* 9284C 800A284C 1280013C */  lui        $at, %hi(_SpdBeltSelFlag)
    /* 92850 800A2850 21083300 */  addu       $at, $at, $s3
    /* 92854 800A2854 C4BB2390 */  lbu        $v1, %lo(_SpdBeltSelFlag)($at)
    /* 92858 800A2858 25800202 */  or         $s0, $s0, $v0
    /* 9285C 800A285C A4BF020C */  jal        GetSpellTarget__Fi
    /* 92860 800A2860 25800302 */   or        $s0, $s0, $v1
    /* 92864 800A2864 C890020C */  jal        Active__11SpellTarget_800a4320
    /* 92868 800A2868 21204000 */   addu      $a0, $v0, $zero
    /* 9286C 800A286C 25800202 */  or         $s0, $s0, $v0
    /* 92870 800A2870 59000016 */  bnez       $s0, .L800A29D8
    /* 92874 800A2874 00000000 */   nop
    /* 92878 800A2878 01DE000C */  jal        NewCursor__Fi
    /* 9287C 800A287C 01000424 */   addiu     $a0, $zero, 0x1
    /* 92880 800A2880 5500C01B */  blez       $fp, .L800A29D8
    /* 92884 800A2884 FFFF1624 */   addiu     $s6, $zero, -0x1
    /* 92888 800A2888 15001524 */  addiu      $s5, $zero, 0x15
    /* 9288C 800A288C 2190E002 */  addu       $s2, $s7, $zero
    /* 92890 800A2890 21880000 */  addu       $s1, $zero, $zero
  .L800A2894:
    /* 92894 800A2894 21109102 */  addu       $v0, $s4, $s1
  .L800A2898:
    /* 92898 800A2898 88154580 */  lb         $a1, 0x1588($v0)
    /* 9289C 800A289C 00000000 */  nop
    /* 928A0 800A28A0 1C00A018 */  blez       $a1, .L800A2914
    /* 928A4 800A28A4 FFFFA224 */   addiu     $v0, $a1, -0x1
    /* 928A8 800A28A8 C0180200 */  sll        $v1, $v0, 3
    /* 928AC 800A28AC 23186200 */  subu       $v1, $v1, $v0
    /* 928B0 800A28B0 80180300 */  sll        $v1, $v1, 2
    /* 928B4 800A28B4 23186200 */  subu       $v1, $v1, $v0
    /* 928B8 800A28B8 80180300 */  sll        $v1, $v1, 2
    /* 928BC 800A28BC 21208302 */  addu       $a0, $s4, $v1
    /* 928C0 800A28C0 D0048284 */  lh         $v0, 0x4D0($a0)
    /* 928C4 800A28C4 00000000 */  nop
    /* 928C8 800A28C8 12005610 */  beq        $v0, $s6, .L800A2914
    /* 928CC 800A28CC 00000000 */   nop
    /* 928D0 800A28D0 F1048390 */  lbu        $v1, 0x4F1($a0)
    /* 928D4 800A28D4 00004282 */  lb         $v0, 0x0($s2)
    /* 928D8 800A28D8 00000000 */  nop
    /* 928DC 800A28DC 0D006214 */  bne        $v1, $v0, .L800A2914
    /* 928E0 800A28E0 00000000 */   nop
    /* 928E4 800A28E4 05007514 */  bne        $v1, $s5, .L800A28FC
    /* 928E8 800A28E8 02000224 */   addiu     $v0, $zero, 0x2
    /* 928EC 800A28EC E1048380 */  lb         $v1, 0x4E1($a0)
    /* 928F0 800A28F0 00000000 */  nop
    /* 928F4 800A28F4 07006214 */  bne        $v1, $v0, .L800A2914
    /* 928F8 800A28F8 00000000 */   nop
  .L800A28FC:
    /* 928FC 800A28FC 21206002 */  addu       $a0, $s3, $zero
    /* 92900 800A2900 1C81050C */  jal        func_80160470
    /* 92904 800A2904 0600A524 */   addiu     $a1, $a1, 0x6
    /* 92908 800A2908 FF004230 */  andi       $v0, $v0, 0xFF
    /* 9290C 800A290C 32004014 */  bnez       $v0, .L800A29D8
    /* 92910 800A2910 00000000 */   nop
  .L800A2914:
    /* 92914 800A2914 01003126 */  addiu      $s1, $s1, 0x1
    /* 92918 800A2918 2800222A */  slti       $v0, $s1, 0x28
    /* 9291C 800A291C DEFF4014 */  bnez       $v0, .L800A2898
    /* 92920 800A2920 21109102 */   addu      $v0, $s4, $s1
    /* 92924 800A2924 21880000 */  addu       $s1, $zero, $zero
    /* 92928 800A2928 21808002 */  addu       $s0, $s4, $zero
  .L800A292C:
    /* 9292C 800A292C DC150286 */  lh         $v0, 0x15DC($s0)
    /* 92930 800A2930 00000000 */  nop
    /* 92934 800A2934 1F005610 */  beq        $v0, $s6, .L800A29B4
    /* 92938 800A2938 00000000 */   nop
    /* 9293C 800A293C FD150392 */  lbu        $v1, 0x15FD($s0)
    /* 92940 800A2940 00004282 */  lb         $v0, 0x0($s2)
    /* 92944 800A2944 00000000 */  nop
    /* 92948 800A2948 1A006214 */  bne        $v1, $v0, .L800A29B4
    /* 9294C 800A294C 00000000 */   nop
    /* 92950 800A2950 05007514 */  bne        $v1, $s5, .L800A2968
    /* 92954 800A2954 21206002 */   addu      $a0, $s3, $zero
    /* 92958 800A2958 ED150382 */  lb         $v1, 0x15ED($s0)
    /* 9295C 800A295C 02000224 */  addiu      $v0, $zero, 0x2
    /* 92960 800A2960 14006214 */  bne        $v1, $v0, .L800A29B4
    /* 92964 800A2964 00000000 */   nop
  .L800A2968:
    /* 92968 800A2968 1C81050C */  jal        func_80160470
    /* 9296C 800A296C 2F002526 */   addiu     $a1, $s1, 0x2F
    /* 92970 800A2970 FF004230 */  andi       $v0, $v0, 0xFF
    /* 92974 800A2974 0F004010 */  beqz       $v0, .L800A29B4
    /* 92978 800A2978 00000000 */   nop
    /* 9297C 800A297C 1280023C */  lui        $v0, %hi(sel_data)
    /* 92980 800A2980 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 92984 800A2984 1280073C */  lui        $a3, %hi(_pcurr_inv)
    /* 92988 800A2988 D4BBE724 */  addiu      $a3, $a3, %lo(_pcurr_inv)
    /* 9298C 800A298C 80100200 */  sll        $v0, $v0, 2
    /* 92990 800A2990 21104700 */  addu       $v0, $v0, $a3
    /* 92994 800A2994 0000428C */  lw         $v0, 0x0($v0)
    /* 92998 800A2998 00000000 */  nop
    /* 9299C 800A299C 0E005114 */  bne        $v0, $s1, .L800A29D8
    /* 929A0 800A29A0 00000000 */   nop
    /* 929A4 800A29A4 FF82020C */  jal        get_next_inv__Fv
    /* 929A8 800A29A8 00000000 */   nop
    /* 929AC 800A29AC 768A0208 */  j          .L800A29D8
    /* 929B0 800A29B0 00000000 */   nop
  .L800A29B4:
    /* 929B4 800A29B4 01003126 */  addiu      $s1, $s1, 0x1
    /* 929B8 800A29B8 0800222A */  slti       $v0, $s1, 0x8
    /* 929BC 800A29BC DBFF4014 */  bnez       $v0, .L800A292C
    /* 929C0 800A29C0 6C001026 */   addiu     $s0, $s0, 0x6C
    /* 929C4 800A29C4 01005226 */  addiu      $s2, $s2, 0x1
    /* 929C8 800A29C8 2110D703 */  addu       $v0, $fp, $s7
    /* 929CC 800A29CC 2A104202 */  slt        $v0, $s2, $v0
    /* 929D0 800A29D0 B0FF4014 */  bnez       $v0, .L800A2894
    /* 929D4 800A29D4 21880000 */   addu      $s1, $zero, $zero
  .L800A29D8:
    /* 929D8 800A29D8 3400BF8F */  lw         $ra, 0x34($sp)
    /* 929DC 800A29DC 3000BE8F */  lw         $fp, 0x30($sp)
    /* 929E0 800A29E0 2C00B78F */  lw         $s7, 0x2C($sp)
    /* 929E4 800A29E4 2800B68F */  lw         $s6, 0x28($sp)
    /* 929E8 800A29E8 2400B58F */  lw         $s5, 0x24($sp)
    /* 929EC 800A29EC 2000B48F */  lw         $s4, 0x20($sp)
    /* 929F0 800A29F0 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 929F4 800A29F4 1800B28F */  lw         $s2, 0x18($sp)
    /* 929F8 800A29F8 1400B18F */  lw         $s1, 0x14($sp)
    /* 929FC 800A29FC 1000B08F */  lw         $s0, 0x10($sp)
    /* 92A00 800A2A00 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 92A04 800A2A04 0800E003 */  jr         $ra
    /* 92A08 800A2A08 00000000 */   nop
endlabel check_inv__FiPci
