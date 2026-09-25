.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetSOLID__Fii, 0x8C

glabel SetSOLID__Fii
    /* 72BC8 80082BC8 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 72BCC 80082BCC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 72BD0 80082BD0 21808000 */  addu       $s0, $a0, $zero
    /* 72BD4 80082BD4 1400B1AF */  sw         $s1, 0x14($sp)
    /* 72BD8 80082BD8 2188A000 */  addu       $s1, $a1, $zero
    /* 72BDC 80082BDC 7100022E */  sltiu      $v0, $s0, 0x71
    /* 72BE0 80082BE0 04004010 */  beqz       $v0, .L80082BF4
    /* 72BE4 80082BE4 1800BFAF */   sw        $ra, 0x18($sp)
    /* 72BE8 80082BE8 7100222E */  sltiu      $v0, $s1, 0x71
    /* 72BEC 80082BEC 07004014 */  bnez       $v0, .L80082C0C
    /* 72BF0 80082BF0 C0101100 */   sll       $v0, $s1, 3
  .L80082BF4:
    /* 72BF4 80082BF4 21200000 */  addu       $a0, $zero, $zero
    /* 72BF8 80082BF8 1280053C */  lui        $a1, %hi(D_801194E8)
    /* 72BFC 80082BFC E894A524 */  addiu      $a1, $a1, %lo(D_801194E8)
    /* 72C00 80082C00 A583000C */  jal        DBG_Error
    /* 72C04 80082C04 B7000624 */   addiu     $a2, $zero, 0xB7
    /* 72C08 80082C08 C0101100 */  sll        $v0, $s1, 3
  .L80082C0C:
    /* 72C0C 80082C0C C0181000 */  sll        $v1, $s0, 3
    /* 72C10 80082C10 23187000 */  subu       $v1, $v1, $s0
    /* 72C14 80082C14 C0190300 */  sll        $v1, $v1, 7
    /* 72C18 80082C18 21104300 */  addu       $v0, $v0, $v1
    /* 72C1C 80082C1C 0E80013C */  lui        $at, %hi(dung_map + 0x2)
    /* 72C20 80082C20 21082200 */  addu       $at, $at, $v0
    /* 72C24 80082C24 2A7A2390 */  lbu        $v1, %lo(dung_map + 0x2)($at)
    /* 72C28 80082C28 00000000 */  nop
    /* 72C2C 80082C2C 01006334 */  ori        $v1, $v1, 0x1
    /* 72C30 80082C30 0E80013C */  lui        $at, %hi(dung_map + 0x2)
    /* 72C34 80082C34 21082200 */  addu       $at, $at, $v0
    /* 72C38 80082C38 2A7A23A0 */  sb         $v1, %lo(dung_map + 0x2)($at)
    /* 72C3C 80082C3C 1800BF8F */  lw         $ra, 0x18($sp)
    /* 72C40 80082C40 1400B18F */  lw         $s1, 0x14($sp)
    /* 72C44 80082C44 1000B08F */  lw         $s0, 0x10($sp)
    /* 72C48 80082C48 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 72C4C 80082C4C 0800E003 */  jr         $ra
    /* 72C50 80082C50 00000000 */   nop
endlabel SetSOLID__Fii
