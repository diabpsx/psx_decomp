.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetBLOCK__Fii, 0x8C

glabel SetBLOCK__Fii
    /* 72E70 80082E70 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 72E74 80082E74 1000B0AF */  sw         $s0, 0x10($sp)
    /* 72E78 80082E78 21808000 */  addu       $s0, $a0, $zero
    /* 72E7C 80082E7C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 72E80 80082E80 2188A000 */  addu       $s1, $a1, $zero
    /* 72E84 80082E84 7100022E */  sltiu      $v0, $s0, 0x71
    /* 72E88 80082E88 04004010 */  beqz       $v0, .L80082E9C
    /* 72E8C 80082E8C 1800BFAF */   sw        $ra, 0x18($sp)
    /* 72E90 80082E90 7100222E */  sltiu      $v0, $s1, 0x71
    /* 72E94 80082E94 07004014 */  bnez       $v0, .L80082EB4
    /* 72E98 80082E98 C0101100 */   sll       $v0, $s1, 3
  .L80082E9C:
    /* 72E9C 80082E9C 21200000 */  addu       $a0, $zero, $zero
    /* 72EA0 80082EA0 1280053C */  lui        $a1, %hi(D_801194E8)
    /* 72EA4 80082EA4 E894A524 */  addiu      $a1, $a1, %lo(D_801194E8)
    /* 72EA8 80082EA8 A583000C */  jal        DBG_Error
    /* 72EAC 80082EAC E7000624 */   addiu     $a2, $zero, 0xE7
    /* 72EB0 80082EB0 C0101100 */  sll        $v0, $s1, 3
  .L80082EB4:
    /* 72EB4 80082EB4 C0181000 */  sll        $v1, $s0, 3
    /* 72EB8 80082EB8 23187000 */  subu       $v1, $v1, $s0
    /* 72EBC 80082EBC C0190300 */  sll        $v1, $v1, 7
    /* 72EC0 80082EC0 21104300 */  addu       $v0, $v0, $v1
    /* 72EC4 80082EC4 0E80013C */  lui        $at, %hi(dung_map + 0x2)
    /* 72EC8 80082EC8 21082200 */  addu       $at, $at, $v0
    /* 72ECC 80082ECC 2A7A2390 */  lbu        $v1, %lo(dung_map + 0x2)($at)
    /* 72ED0 80082ED0 00000000 */  nop
    /* 72ED4 80082ED4 04006334 */  ori        $v1, $v1, 0x4
    /* 72ED8 80082ED8 0E80013C */  lui        $at, %hi(dung_map + 0x2)
    /* 72EDC 80082EDC 21082200 */  addu       $at, $at, $v0
    /* 72EE0 80082EE0 2A7A23A0 */  sb         $v1, %lo(dung_map + 0x2)($at)
    /* 72EE4 80082EE4 1800BF8F */  lw         $ra, 0x18($sp)
    /* 72EE8 80082EE8 1400B18F */  lw         $s1, 0x14($sp)
    /* 72EEC 80082EEC 1000B08F */  lw         $s0, 0x10($sp)
    /* 72EF0 80082EF0 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 72EF4 80082EF4 0800E003 */  jr         $ra
    /* 72EF8 80082EF8 00000000 */   nop
endlabel SetBLOCK__Fii
