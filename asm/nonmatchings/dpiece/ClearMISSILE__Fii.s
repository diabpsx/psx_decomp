.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ClearMISSILE__Fii, 0x8C

glabel ClearMISSILE__Fii
    /* 72DB4 80082DB4 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 72DB8 80082DB8 1000B0AF */  sw         $s0, 0x10($sp)
    /* 72DBC 80082DBC 21808000 */  addu       $s0, $a0, $zero
    /* 72DC0 80082DC0 1400B1AF */  sw         $s1, 0x14($sp)
    /* 72DC4 80082DC4 2188A000 */  addu       $s1, $a1, $zero
    /* 72DC8 80082DC8 7100022E */  sltiu      $v0, $s0, 0x71
    /* 72DCC 80082DCC 04004010 */  beqz       $v0, .L80082DE0
    /* 72DD0 80082DD0 1800BFAF */   sw        $ra, 0x18($sp)
    /* 72DD4 80082DD4 7100222E */  sltiu      $v0, $s1, 0x71
    /* 72DD8 80082DD8 07004014 */  bnez       $v0, .L80082DF8
    /* 72DDC 80082DDC C0101100 */   sll       $v0, $s1, 3
  .L80082DE0:
    /* 72DE0 80082DE0 21200000 */  addu       $a0, $zero, $zero
    /* 72DE4 80082DE4 1280053C */  lui        $a1, %hi(D_801194E8)
    /* 72DE8 80082DE8 E894A524 */  addiu      $a1, $a1, %lo(D_801194E8)
    /* 72DEC 80082DEC A583000C */  jal        DBG_Error
    /* 72DF0 80082DF0 D6000624 */   addiu     $a2, $zero, 0xD6
    /* 72DF4 80082DF4 C0101100 */  sll        $v0, $s1, 3
  .L80082DF8:
    /* 72DF8 80082DF8 C0181000 */  sll        $v1, $s0, 3
    /* 72DFC 80082DFC 23187000 */  subu       $v1, $v1, $s0
    /* 72E00 80082E00 C0190300 */  sll        $v1, $v1, 7
    /* 72E04 80082E04 21104300 */  addu       $v0, $v0, $v1
    /* 72E08 80082E08 0E80013C */  lui        $at, %hi(dung_map + 0x2)
    /* 72E0C 80082E0C 21082200 */  addu       $at, $at, $v0
    /* 72E10 80082E10 2A7A2390 */  lbu        $v1, %lo(dung_map + 0x2)($at)
    /* 72E14 80082E14 00000000 */  nop
    /* 72E18 80082E18 FD006330 */  andi       $v1, $v1, 0xFD
    /* 72E1C 80082E1C 0E80013C */  lui        $at, %hi(dung_map + 0x2)
    /* 72E20 80082E20 21082200 */  addu       $at, $at, $v0
    /* 72E24 80082E24 2A7A23A0 */  sb         $v1, %lo(dung_map + 0x2)($at)
    /* 72E28 80082E28 1800BF8F */  lw         $ra, 0x18($sp)
    /* 72E2C 80082E2C 1400B18F */  lw         $s1, 0x14($sp)
    /* 72E30 80082E30 1000B08F */  lw         $s0, 0x10($sp)
    /* 72E34 80082E34 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 72E38 80082E38 0800E003 */  jr         $ra
    /* 72E3C 80082E3C 00000000 */   nop
endlabel ClearMISSILE__Fii
