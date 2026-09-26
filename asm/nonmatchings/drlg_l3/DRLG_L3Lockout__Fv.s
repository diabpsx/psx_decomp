.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_L3Lockout__Fv, 0xC0

glabel DRLG_L3Lockout__Fv
    /* 12DB0 8014C9A8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 12DB4 8014C9AC 21200000 */  addu       $a0, $zero, $zero
    /* 12DB8 8014C9B0 21280000 */  addu       $a1, $zero, $zero
    /* 12DBC 8014C9B4 1000B0AF */  sw         $s0, 0x10($sp)
    /* 12DC0 8014C9B8 21800000 */  addu       $s0, $zero, $zero
    /* 12DC4 8014C9BC 21180000 */  addu       $v1, $zero, $zero
    /* 12DC8 8014C9C0 0E800C3C */  lui        $t4, %hi(dungeon)
    /* 12DCC 8014C9C4 C4408C25 */  addiu      $t4, $t4, %lo(dungeon)
    /* 12DD0 8014C9C8 15800B3C */  lui        $t3, %hi(lockout)
    /* 12DD4 8014C9CC 58896B25 */  addiu      $t3, $t3, %lo(lockout)
    /* 12DD8 8014C9D0 01000A24 */  addiu      $t2, $zero, 0x1
    /* 12DDC 8014C9D4 1400BFAF */  sw         $ra, 0x14($sp)
    /* 12DE0 8014C9D8 21380000 */  addu       $a3, $zero, $zero
  .L8014C9DC:
    /* 12DE4 8014C9DC 40480300 */  sll        $t1, $v1, 1
    /* 12DE8 8014C9E0 21306001 */  addu       $a2, $t3, $zero
    /* 12DEC 8014C9E4 21408001 */  addu       $t0, $t4, $zero
  .L8014C9E8:
    /* 12DF0 8014C9E8 21102801 */  addu       $v0, $t1, $t0
    /* 12DF4 8014C9EC 00004294 */  lhu        $v0, 0x0($v0)
    /* 12DF8 8014C9F0 00000000 */  nop
    /* 12DFC 8014C9F4 06004010 */  beqz       $v0, .L8014CA10
    /* 12E00 8014C9F8 2110C300 */   addu      $v0, $a2, $v1
    /* 12E04 8014C9FC 00004AA0 */  sb         $t2, 0x0($v0)
    /* 12E08 8014CA00 2120E000 */  addu       $a0, $a3, $zero
    /* 12E0C 8014CA04 21286000 */  addu       $a1, $v1, $zero
    /* 12E10 8014CA08 85320508 */  j          .L8014CA14
    /* 12E14 8014CA0C 01001026 */   addiu     $s0, $s0, 0x1
  .L8014CA10:
    /* 12E18 8014CA10 000040A0 */  sb         $zero, 0x0($v0)
  .L8014CA14:
    /* 12E1C 8014CA14 2800C624 */  addiu      $a2, $a2, 0x28
    /* 12E20 8014CA18 0100E724 */  addiu      $a3, $a3, 0x1
    /* 12E24 8014CA1C 2800E228 */  slti       $v0, $a3, 0x28
    /* 12E28 8014CA20 F1FF4014 */  bnez       $v0, .L8014C9E8
    /* 12E2C 8014CA24 60000825 */   addiu     $t0, $t0, 0x60
    /* 12E30 8014CA28 01006324 */  addiu      $v1, $v1, 0x1
    /* 12E34 8014CA2C 28006228 */  slti       $v0, $v1, 0x28
    /* 12E38 8014CA30 EAFF4014 */  bnez       $v0, .L8014C9DC
    /* 12E3C 8014CA34 21380000 */   addu      $a3, $zero, $zero
    /* 12E40 8014CA38 E81780AF */  sw         $zero, %gp_rel(lockoutcnt)($gp)
    /* 12E44 8014CA3C 4332050C */  jal        DRLG_L3LockRec__Fii
    /* 12E48 8014CA40 00000000 */   nop
    /* 12E4C 8014CA44 E817828F */  lw         $v0, %gp_rel(lockoutcnt)($gp)
    /* 12E50 8014CA48 00000000 */  nop
    /* 12E54 8014CA4C 26100202 */  xor        $v0, $s0, $v0
    /* 12E58 8014CA50 0100422C */  sltiu      $v0, $v0, 0x1
    /* 12E5C 8014CA54 1400BF8F */  lw         $ra, 0x14($sp)
    /* 12E60 8014CA58 1000B08F */  lw         $s0, 0x10($sp)
    /* 12E64 8014CA5C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 12E68 8014CA60 0800E003 */  jr         $ra
    /* 12E6C 8014CA64 00000000 */   nop
endlabel DRLG_L3Lockout__Fv
