.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_L3LockRec__Fii, 0x9C

glabel DRLG_L3LockRec__Fii
    /* 12D14 8014C90C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 12D18 8014C910 1000B0AF */  sw         $s0, 0x10($sp)
    /* 12D1C 8014C914 21808000 */  addu       $s0, $a0, $zero
    /* 12D20 8014C918 1400B1AF */  sw         $s1, 0x14($sp)
    /* 12D24 8014C91C 2188A000 */  addu       $s1, $a1, $zero
    /* 12D28 8014C920 1580023C */  lui        $v0, %hi(lockout)
    /* 12D2C 8014C924 58894224 */  addiu      $v0, $v0, %lo(lockout)
    /* 12D30 8014C928 80181000 */  sll        $v1, $s0, 2
    /* 12D34 8014C92C 21187000 */  addu       $v1, $v1, $s0
    /* 12D38 8014C930 C0180300 */  sll        $v1, $v1, 3
    /* 12D3C 8014C934 21186200 */  addu       $v1, $v1, $v0
    /* 12D40 8014C938 21187100 */  addu       $v1, $v1, $s1
    /* 12D44 8014C93C 1800BFAF */  sw         $ra, 0x18($sp)
    /* 12D48 8014C940 00006290 */  lbu        $v0, 0x0($v1)
    /* 12D4C 8014C944 00000000 */  nop
    /* 12D50 8014C948 11004010 */  beqz       $v0, .L8014C990
    /* 12D54 8014C94C 00000000 */   nop
    /* 12D58 8014C950 000060A0 */  sb         $zero, 0x0($v1)
    /* 12D5C 8014C954 E817828F */  lw         $v0, %gp_rel(lockoutcnt)($gp)
    /* 12D60 8014C958 00000000 */  nop
    /* 12D64 8014C95C 01004224 */  addiu      $v0, $v0, 0x1
    /* 12D68 8014C960 E81782AF */  sw         $v0, %gp_rel(lockoutcnt)($gp)
    /* 12D6C 8014C964 4332050C */  jal        DRLG_L3LockRec__Fii
    /* 12D70 8014C968 FFFF2526 */   addiu     $a1, $s1, -0x1
    /* 12D74 8014C96C 21200002 */  addu       $a0, $s0, $zero
    /* 12D78 8014C970 4332050C */  jal        DRLG_L3LockRec__Fii
    /* 12D7C 8014C974 01002526 */   addiu     $a1, $s1, 0x1
    /* 12D80 8014C978 FFFF0426 */  addiu      $a0, $s0, -0x1
    /* 12D84 8014C97C 4332050C */  jal        DRLG_L3LockRec__Fii
    /* 12D88 8014C980 21282002 */   addu      $a1, $s1, $zero
    /* 12D8C 8014C984 01000426 */  addiu      $a0, $s0, 0x1
    /* 12D90 8014C988 4332050C */  jal        DRLG_L3LockRec__Fii
    /* 12D94 8014C98C 21282002 */   addu      $a1, $s1, $zero
  .L8014C990:
    /* 12D98 8014C990 1800BF8F */  lw         $ra, 0x18($sp)
    /* 12D9C 8014C994 1400B18F */  lw         $s1, 0x14($sp)
    /* 12DA0 8014C998 1000B08F */  lw         $s0, 0x10($sp)
    /* 12DA4 8014C99C 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 12DA8 8014C9A0 0800E003 */  jr         $ra
    /* 12DAC 8014C9A4 00000000 */   nop
endlabel DRLG_L3LockRec__Fii
