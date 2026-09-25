.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetMISSILE__Fii, 0x8C

glabel SetMISSILE__Fii
    /* 72D28 80082D28 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 72D2C 80082D2C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 72D30 80082D30 21808000 */  addu       $s0, $a0, $zero
    /* 72D34 80082D34 1400B1AF */  sw         $s1, 0x14($sp)
    /* 72D38 80082D38 2188A000 */  addu       $s1, $a1, $zero
    /* 72D3C 80082D3C 7100022E */  sltiu      $v0, $s0, 0x71
    /* 72D40 80082D40 04004010 */  beqz       $v0, .L80082D54
    /* 72D44 80082D44 1800BFAF */   sw        $ra, 0x18($sp)
    /* 72D48 80082D48 7100222E */  sltiu      $v0, $s1, 0x71
    /* 72D4C 80082D4C 07004014 */  bnez       $v0, .L80082D6C
    /* 72D50 80082D50 C0101100 */   sll       $v0, $s1, 3
  .L80082D54:
    /* 72D54 80082D54 21200000 */  addu       $a0, $zero, $zero
    /* 72D58 80082D58 1280053C */  lui        $a1, %hi(D_801194E8)
    /* 72D5C 80082D5C E894A524 */  addiu      $a1, $a1, %lo(D_801194E8)
    /* 72D60 80082D60 A583000C */  jal        DBG_Error
    /* 72D64 80082D64 D0000624 */   addiu     $a2, $zero, 0xD0
    /* 72D68 80082D68 C0101100 */  sll        $v0, $s1, 3
  .L80082D6C:
    /* 72D6C 80082D6C C0181000 */  sll        $v1, $s0, 3
    /* 72D70 80082D70 23187000 */  subu       $v1, $v1, $s0
    /* 72D74 80082D74 C0190300 */  sll        $v1, $v1, 7
    /* 72D78 80082D78 21104300 */  addu       $v0, $v0, $v1
    /* 72D7C 80082D7C 0E80013C */  lui        $at, %hi(dung_map + 0x2)
    /* 72D80 80082D80 21082200 */  addu       $at, $at, $v0
    /* 72D84 80082D84 2A7A2390 */  lbu        $v1, %lo(dung_map + 0x2)($at)
    /* 72D88 80082D88 00000000 */  nop
    /* 72D8C 80082D8C 02006334 */  ori        $v1, $v1, 0x2
    /* 72D90 80082D90 0E80013C */  lui        $at, %hi(dung_map + 0x2)
    /* 72D94 80082D94 21082200 */  addu       $at, $at, $v0
    /* 72D98 80082D98 2A7A23A0 */  sb         $v1, %lo(dung_map + 0x2)($at)
    /* 72D9C 80082D9C 1800BF8F */  lw         $ra, 0x18($sp)
    /* 72DA0 80082DA0 1400B18F */  lw         $s1, 0x14($sp)
    /* 72DA4 80082DA4 1000B08F */  lw         $s0, 0x10($sp)
    /* 72DA8 80082DA8 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 72DAC 80082DAC 0800E003 */  jr         $ra
    /* 72DB0 80082DB0 00000000 */   nop
endlabel SetMISSILE__Fii
