.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ClearBLOCK__Fii, 0x8C

glabel ClearBLOCK__Fii
    /* 72EFC 80082EFC E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 72F00 80082F00 1000B0AF */  sw         $s0, 0x10($sp)
    /* 72F04 80082F04 21808000 */  addu       $s0, $a0, $zero
    /* 72F08 80082F08 1400B1AF */  sw         $s1, 0x14($sp)
    /* 72F0C 80082F0C 2188A000 */  addu       $s1, $a1, $zero
    /* 72F10 80082F10 7100022E */  sltiu      $v0, $s0, 0x71
    /* 72F14 80082F14 04004010 */  beqz       $v0, .L80082F28
    /* 72F18 80082F18 1800BFAF */   sw        $ra, 0x18($sp)
    /* 72F1C 80082F1C 7100222E */  sltiu      $v0, $s1, 0x71
    /* 72F20 80082F20 07004014 */  bnez       $v0, .L80082F40
    /* 72F24 80082F24 C0101100 */   sll       $v0, $s1, 3
  .L80082F28:
    /* 72F28 80082F28 21200000 */  addu       $a0, $zero, $zero
    /* 72F2C 80082F2C 1280053C */  lui        $a1, %hi(D_801194E8)
    /* 72F30 80082F30 E894A524 */  addiu      $a1, $a1, %lo(D_801194E8)
    /* 72F34 80082F34 A583000C */  jal        DBG_Error
    /* 72F38 80082F38 ED000624 */   addiu     $a2, $zero, 0xED
    /* 72F3C 80082F3C C0101100 */  sll        $v0, $s1, 3
  .L80082F40:
    /* 72F40 80082F40 C0181000 */  sll        $v1, $s0, 3
    /* 72F44 80082F44 23187000 */  subu       $v1, $v1, $s0
    /* 72F48 80082F48 C0190300 */  sll        $v1, $v1, 7
    /* 72F4C 80082F4C 21104300 */  addu       $v0, $v0, $v1
    /* 72F50 80082F50 0E80013C */  lui        $at, %hi(dung_map + 0x2)
    /* 72F54 80082F54 21082200 */  addu       $at, $at, $v0
    /* 72F58 80082F58 2A7A2390 */  lbu        $v1, %lo(dung_map + 0x2)($at)
    /* 72F5C 80082F5C 00000000 */  nop
    /* 72F60 80082F60 FB006330 */  andi       $v1, $v1, 0xFB
    /* 72F64 80082F64 0E80013C */  lui        $at, %hi(dung_map + 0x2)
    /* 72F68 80082F68 21082200 */  addu       $at, $at, $v0
    /* 72F6C 80082F6C 2A7A23A0 */  sb         $v1, %lo(dung_map + 0x2)($at)
    /* 72F70 80082F70 1800BF8F */  lw         $ra, 0x18($sp)
    /* 72F74 80082F74 1400B18F */  lw         $s1, 0x14($sp)
    /* 72F78 80082F78 1000B08F */  lw         $s0, 0x10($sp)
    /* 72F7C 80082F7C 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 72F80 80082F80 0800E003 */  jr         $ra
    /* 72F84 80082F84 00000000 */   nop
endlabel ClearBLOCK__Fii
