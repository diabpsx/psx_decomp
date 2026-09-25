.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching OperateSkelBook__FiiUc, 0x178

glabel OperateSkelBook__FiiUc
    /* 4C850 8005C850 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 4C854 8005C854 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 4C858 8005C858 21988000 */  addu       $s3, $a0, $zero
    /* 4C85C 8005C85C 2400B1AF */  sw         $s1, 0x24($sp)
    /* 4C860 8005C860 2188A000 */  addu       $s1, $a1, $zero
    /* 4C864 8005C864 40101100 */  sll        $v0, $s1, 1
    /* 4C868 8005C868 21105100 */  addu       $v0, $v0, $s1
    /* 4C86C 8005C86C 80100200 */  sll        $v0, $v0, 2
    /* 4C870 8005C870 23105100 */  subu       $v0, $v0, $s1
    /* 4C874 8005C874 2000B0AF */  sw         $s0, 0x20($sp)
    /* 4C878 8005C878 80800200 */  sll        $s0, $v0, 2
    /* 4C87C 8005C87C 3000BFAF */  sw         $ra, 0x30($sp)
    /* 4C880 8005C880 2800B2AF */  sw         $s2, 0x28($sp)
    /* 4C884 8005C884 0E80013C */  lui        $at, %hi(object + 0x23)
    /* 4C888 8005C888 21083000 */  addu       $at, $at, $s0
    /* 4C88C 8005C88C 6F8C2280 */  lb         $v0, %lo(object + 0x23)($at)
    /* 4C890 8005C890 00000000 */  nop
    /* 4C894 8005C894 44004010 */  beqz       $v0, .L8005C9A8
    /* 4C898 8005C898 2190C000 */   addu      $s2, $a2, $zero
    /* 4C89C 8005C89C 1280023C */  lui        $v0, %hi(deltaload)
    /* 4C8A0 8005C8A0 7DB94290 */  lbu        $v0, %lo(deltaload)($v0)
    /* 4C8A4 8005C8A4 00000000 */  nop
    /* 4C8A8 8005C8A8 09004014 */  bnez       $v0, .L8005C8D0
    /* 4C8AC 8005C8AC 00000000 */   nop
    /* 4C8B0 8005C8B0 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 4C8B4 8005C8B4 21083000 */  addu       $at, $at, $s0
    /* 4C8B8 8005C8B8 6B8C2580 */  lb         $a1, %lo(object + 0x1F)($at)
    /* 4C8BC 8005C8BC 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 4C8C0 8005C8C0 21083000 */  addu       $at, $at, $s0
    /* 4C8C4 8005C8C4 6C8C2680 */  lb         $a2, %lo(object + 0x20)($at)
    /* 4C8C8 8005C8C8 E1F5000C */  jal        PlaySfxLoc__Fiii
    /* 4C8CC 8005C8CC 26000424 */   addiu     $a0, $zero, 0x26
  .L8005C8D0:
    /* 4C8D0 8005C8D0 0E80013C */  lui        $at, %hi(object + 0x21)
    /* 4C8D4 8005C8D4 21083000 */  addu       $at, $at, $s0
    /* 4C8D8 8005C8D8 6D8C2290 */  lbu        $v0, %lo(object + 0x21)($at)
    /* 4C8DC 8005C8DC 0E80013C */  lui        $at, %hi(object + 0x23)
    /* 4C8E0 8005C8E0 21083000 */  addu       $at, $at, $s0
    /* 4C8E4 8005C8E4 6F8C20A0 */  sb         $zero, %lo(object + 0x23)($at)
    /* 4C8E8 8005C8E8 02004224 */  addiu      $v0, $v0, 0x2
    /* 4C8EC 8005C8EC 0E80013C */  lui        $at, %hi(object + 0x21)
    /* 4C8F0 8005C8F0 21083000 */  addu       $at, $at, $s0
    /* 4C8F4 8005C8F4 6D8C22A0 */  sb         $v0, %lo(object + 0x21)($at)
    /* 4C8F8 8005C8F8 1280023C */  lui        $v0, %hi(deltaload)
    /* 4C8FC 8005C8FC 7DB94290 */  lbu        $v0, %lo(deltaload)($v0)
    /* 4C900 8005C900 00000000 */  nop
    /* 4C904 8005C904 28004014 */  bnez       $v0, .L8005C9A8
    /* 4C908 8005C908 00000000 */   nop
    /* 4C90C 8005C90C 0E80013C */  lui        $at, %hi(object + 0x4)
    /* 4C910 8005C910 21083000 */  addu       $at, $at, $s0
    /* 4C914 8005C914 508C248C */  lw         $a0, %lo(object + 0x4)($at)
    /* 4C918 8005C918 B3F6000C */  jal        SetRndSeed__Fl
    /* 4C91C 8005C91C 00000000 */   nop
    /* 4C920 8005C920 C9F6000C */  jal        ENG_random__Fl
    /* 4C924 8005C924 05000424 */   addiu     $a0, $zero, 0x5
    /* 4C928 8005C928 0A004010 */  beqz       $v0, .L8005C954
    /* 4C92C 8005C92C 21300000 */   addu      $a2, $zero, $zero
    /* 4C930 8005C930 21380000 */  addu       $a3, $zero, $zero
    /* 4C934 8005C934 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 4C938 8005C938 21083000 */  addu       $at, $at, $s0
    /* 4C93C 8005C93C 6B8C2480 */  lb         $a0, %lo(object + 0x1F)($at)
    /* 4C940 8005C940 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 4C944 8005C944 21083000 */  addu       $at, $at, $s0
    /* 4C948 8005C948 6C8C2580 */  lb         $a1, %lo(object + 0x20)($at)
    /* 4C94C 8005C94C 5D720108 */  j          .L8005C974
    /* 4C950 8005C950 15000224 */   addiu     $v0, $zero, 0x15
  .L8005C954:
    /* 4C954 8005C954 21380000 */  addu       $a3, $zero, $zero
    /* 4C958 8005C958 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 4C95C 8005C95C 21083000 */  addu       $at, $at, $s0
    /* 4C960 8005C960 6B8C2480 */  lb         $a0, %lo(object + 0x1F)($at)
    /* 4C964 8005C964 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 4C968 8005C968 21083000 */  addu       $at, $at, $s0
    /* 4C96C 8005C96C 6C8C2580 */  lb         $a1, %lo(object + 0x20)($at)
    /* 4C970 8005C970 18000224 */  addiu      $v0, $zero, 0x18
  .L8005C974:
    /* 4C974 8005C974 1000A2AF */  sw         $v0, 0x10($sp)
    /* 4C978 8005C978 FF004232 */  andi       $v0, $s2, 0xFF
    /* 4C97C 8005C97C 1400A2AF */  sw         $v0, 0x14($sp)
    /* 4C980 8005C980 B113010C */  jal        CreateTypeItem__FiiUciiUcUc
    /* 4C984 8005C984 1800A0AF */   sw        $zero, 0x18($sp)
    /* 4C988 8005C988 1280023C */  lui        $v0, %hi(myplr)
    /* 4C98C 8005C98C 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 4C990 8005C990 00000000 */  nop
    /* 4C994 8005C994 04006216 */  bne        $s3, $v0, .L8005C9A8
    /* 4C998 8005C998 21200000 */   addu      $a0, $zero, $zero
    /* 4C99C 8005C99C 2D000524 */  addiu      $a1, $zero, 0x2D
    /* 4C9A0 8005C9A0 0D3E010C */  jal        NetSendCmdParam1__FUcUcUs
    /* 4C9A4 8005C9A4 FFFF2632 */   andi      $a2, $s1, 0xFFFF
  .L8005C9A8:
    /* 4C9A8 8005C9A8 3000BF8F */  lw         $ra, 0x30($sp)
    /* 4C9AC 8005C9AC 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 4C9B0 8005C9B0 2800B28F */  lw         $s2, 0x28($sp)
    /* 4C9B4 8005C9B4 2400B18F */  lw         $s1, 0x24($sp)
    /* 4C9B8 8005C9B8 2000B08F */  lw         $s0, 0x20($sp)
    /* 4C9BC 8005C9BC 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 4C9C0 8005C9C0 0800E003 */  jr         $ra
    /* 4C9C4 8005C9C4 00000000 */   nop
endlabel OperateSkelBook__FiiUc
