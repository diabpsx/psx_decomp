.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetTRAP__Fii, 0x8C

glabel SetTRAP__Fii
    /* 72FB8 80082FB8 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 72FBC 80082FBC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 72FC0 80082FC0 21808000 */  addu       $s0, $a0, $zero
    /* 72FC4 80082FC4 1400B1AF */  sw         $s1, 0x14($sp)
    /* 72FC8 80082FC8 2188A000 */  addu       $s1, $a1, $zero
    /* 72FCC 80082FCC 7100022E */  sltiu      $v0, $s0, 0x71
    /* 72FD0 80082FD0 04004010 */  beqz       $v0, .L80082FE4
    /* 72FD4 80082FD4 1800BFAF */   sw        $ra, 0x18($sp)
    /* 72FD8 80082FD8 7100222E */  sltiu      $v0, $s1, 0x71
    /* 72FDC 80082FDC 07004014 */  bnez       $v0, .L80082FFC
    /* 72FE0 80082FE0 C0101100 */   sll       $v0, $s1, 3
  .L80082FE4:
    /* 72FE4 80082FE4 21200000 */  addu       $a0, $zero, $zero
    /* 72FE8 80082FE8 1280053C */  lui        $a1, %hi(D_801194E8)
    /* 72FEC 80082FEC E894A524 */  addiu      $a1, $a1, %lo(D_801194E8)
    /* 72FF0 80082FF0 A583000C */  jal        DBG_Error
    /* 72FF4 80082FF4 FE000624 */   addiu     $a2, $zero, 0xFE
    /* 72FF8 80082FF8 C0101100 */  sll        $v0, $s1, 3
  .L80082FFC:
    /* 72FFC 80082FFC C0181000 */  sll        $v1, $s0, 3
    /* 73000 80083000 23187000 */  subu       $v1, $v1, $s0
    /* 73004 80083004 C0190300 */  sll        $v1, $v1, 7
    /* 73008 80083008 21104300 */  addu       $v0, $v0, $v1
    /* 7300C 8008300C 0E80013C */  lui        $at, %hi(dung_map + 0x2)
    /* 73010 80083010 21082200 */  addu       $at, $at, $v0
    /* 73014 80083014 2A7A2390 */  lbu        $v1, %lo(dung_map + 0x2)($at)
    /* 73018 80083018 00000000 */  nop
    /* 7301C 8008301C 08006334 */  ori        $v1, $v1, 0x8
    /* 73020 80083020 0E80013C */  lui        $at, %hi(dung_map + 0x2)
    /* 73024 80083024 21082200 */  addu       $at, $at, $v0
    /* 73028 80083028 2A7A23A0 */  sb         $v1, %lo(dung_map + 0x2)($at)
    /* 7302C 8008302C 1800BF8F */  lw         $ra, 0x18($sp)
    /* 73030 80083030 1400B18F */  lw         $s1, 0x14($sp)
    /* 73034 80083034 1000B08F */  lw         $s0, 0x10($sp)
    /* 73038 80083038 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 7303C 8008303C 0800E003 */  jr         $ra
    /* 73040 80083040 00000000 */   nop
endlabel SetTRAP__Fii
