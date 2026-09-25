.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FuncLARROW__FP13MissileStructiii, 0xF0

glabel FuncLARROW__FP13MissileStructiii
    /* 6C908 8007C908 C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 6C90C 8007C90C 21488000 */  addu       $t1, $a0, $zero
    /* 6C910 8007C910 3800BFAF */  sw         $ra, 0x38($sp)
    /* 6C914 8007C914 28002285 */  lh         $v0, 0x28($t1)
    /* 6C918 8007C918 2A002385 */  lh         $v1, 0x2A($t1)
    /* 6C91C 8007C91C 2120A200 */  addu       $a0, $a1, $v0
    /* 6C920 8007C920 2128C300 */  addu       $a1, $a2, $v1
    /* 6C924 8007C924 37002391 */  lbu        $v1, 0x37($t1)
    /* 6C928 8007C928 1A000224 */  addiu      $v0, $zero, 0x1A
    /* 6C92C 8007C92C 0F006214 */  bne        $v1, $v0, .L8007C96C
    /* 6C930 8007C930 21580000 */   addu      $t3, $zero, $zero
    /* 6C934 8007C934 2130E000 */  addu       $a2, $a3, $zero
    /* 6C938 8007C938 08000724 */  addiu      $a3, $zero, 0x8
    /* 6C93C 8007C93C 47002381 */  lb         $v1, 0x47($t1)
    /* 6C940 8007C940 80000224 */  addiu      $v0, $zero, 0x80
    /* 6C944 8007C944 1400A0AF */  sw         $zero, 0x14($sp)
    /* 6C948 8007C948 1800A0AF */  sw         $zero, 0x18($sp)
    /* 6C94C 8007C94C 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 6C950 8007C950 2000A0AF */  sw         $zero, 0x20($sp)
    /* 6C954 8007C954 2400A0AF */  sw         $zero, 0x24($sp)
    /* 6C958 8007C958 2800A2AF */  sw         $v0, 0x28($sp)
    /* 6C95C 8007C95C 2C00A2AF */  sw         $v0, 0x2C($sp)
    /* 6C960 8007C960 3000A2AF */  sw         $v0, 0x30($sp)
    /* 6C964 8007C964 78F20108 */  j          .L8007C9E0
    /* 6C968 8007C968 3400A0AF */   sw        $zero, 0x34($sp)
  .L8007C96C:
    /* 6C96C 8007C96C 3F002881 */  lb         $t0, 0x3F($t1)
    /* 6C970 8007C970 21500000 */  addu       $t2, $zero, $zero
    /* 6C974 8007C974 09000229 */  slti       $v0, $t0, 0x9
    /* 6C978 8007C978 03004014 */  bnez       $v0, .L8007C988
    /* 6C97C 8007C97C 21180001 */   addu      $v1, $t0, $zero
    /* 6C980 8007C980 01000B24 */  addiu      $t3, $zero, 0x1
    /* 6C984 8007C984 F8FF0825 */  addiu      $t0, $t0, -0x8
  .L8007C988:
    /* 6C988 8007C988 FBFF6224 */  addiu      $v0, $v1, -0x5
    /* 6C98C 8007C98C 0700422C */  sltiu      $v0, $v0, 0x7
    /* 6C990 8007C990 02004010 */  beqz       $v0, .L8007C99C
    /* 6C994 8007C994 05000229 */   slti      $v0, $t0, 0x5
    /* 6C998 8007C998 01000A24 */  addiu      $t2, $zero, 0x1
  .L8007C99C:
    /* 6C99C 8007C99C 03004014 */  bnez       $v0, .L8007C9AC
    /* 6C9A0 8007C9A0 2130E000 */   addu      $a2, $a3, $zero
    /* 6C9A4 8007C9A4 08000224 */  addiu      $v0, $zero, 0x8
    /* 6C9A8 8007C9A8 23404800 */  subu       $t0, $v0, $t0
  .L8007C9AC:
    /* 6C9AC 8007C9AC 05000724 */  addiu      $a3, $zero, 0x5
    /* 6C9B0 8007C9B0 47002391 */  lbu        $v1, 0x47($t1)
    /* 6C9B4 8007C9B4 80000224 */  addiu      $v0, $zero, 0x80
    /* 6C9B8 8007C9B8 1400A0AF */  sw         $zero, 0x14($sp)
    /* 6C9BC 8007C9BC 1800A8AF */  sw         $t0, 0x18($sp)
    /* 6C9C0 8007C9C0 1C00A0AF */  sw         $zero, 0x1C($sp)
    /* 6C9C4 8007C9C4 2000ABAF */  sw         $t3, 0x20($sp)
    /* 6C9C8 8007C9C8 2400AAAF */  sw         $t2, 0x24($sp)
    /* 6C9CC 8007C9CC 2800A2AF */  sw         $v0, 0x28($sp)
    /* 6C9D0 8007C9D0 2C00A2AF */  sw         $v0, 0x2C($sp)
    /* 6C9D4 8007C9D4 3000A2AF */  sw         $v0, 0x30($sp)
    /* 6C9D8 8007C9D8 3400A0AF */  sw         $zero, 0x34($sp)
    /* 6C9DC 8007C9DC 01006330 */  andi       $v1, $v1, 0x1
  .L8007C9E0:
    /* 6C9E0 8007C9E0 0DEF010C */  jal        TempPrintMissile__FiiiiiiiiccUcUcUcc
    /* 6C9E4 8007C9E4 1000A3AF */   sw        $v1, 0x10($sp)
    /* 6C9E8 8007C9E8 3800BF8F */  lw         $ra, 0x38($sp)
    /* 6C9EC 8007C9EC 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 6C9F0 8007C9F0 0800E003 */  jr         $ra
    /* 6C9F4 8007C9F4 00000000 */   nop
endlabel FuncLARROW__FP13MissileStructiii
