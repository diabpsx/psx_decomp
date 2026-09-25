.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ClearTRAP__Fii, 0x8C

glabel ClearTRAP__Fii
    /* 73044 80083044 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 73048 80083048 1000B0AF */  sw         $s0, 0x10($sp)
    /* 7304C 8008304C 21808000 */  addu       $s0, $a0, $zero
    /* 73050 80083050 1400B1AF */  sw         $s1, 0x14($sp)
    /* 73054 80083054 2188A000 */  addu       $s1, $a1, $zero
    /* 73058 80083058 7100022E */  sltiu      $v0, $s0, 0x71
    /* 7305C 8008305C 04004010 */  beqz       $v0, .L80083070
    /* 73060 80083060 1800BFAF */   sw        $ra, 0x18($sp)
    /* 73064 80083064 7100222E */  sltiu      $v0, $s1, 0x71
    /* 73068 80083068 07004014 */  bnez       $v0, .L80083088
    /* 7306C 8008306C C0101100 */   sll       $v0, $s1, 3
  .L80083070:
    /* 73070 80083070 21200000 */  addu       $a0, $zero, $zero
    /* 73074 80083074 1280053C */  lui        $a1, %hi(D_801194E8)
    /* 73078 80083078 E894A524 */  addiu      $a1, $a1, %lo(D_801194E8)
    /* 7307C 8008307C A583000C */  jal        DBG_Error
    /* 73080 80083080 04010624 */   addiu     $a2, $zero, 0x104
    /* 73084 80083084 C0101100 */  sll        $v0, $s1, 3
  .L80083088:
    /* 73088 80083088 C0181000 */  sll        $v1, $s0, 3
    /* 7308C 8008308C 23187000 */  subu       $v1, $v1, $s0
    /* 73090 80083090 C0190300 */  sll        $v1, $v1, 7
    /* 73094 80083094 21104300 */  addu       $v0, $v0, $v1
    /* 73098 80083098 0E80013C */  lui        $at, %hi(dung_map + 0x2)
    /* 7309C 8008309C 21082200 */  addu       $at, $at, $v0
    /* 730A0 800830A0 2A7A2390 */  lbu        $v1, %lo(dung_map + 0x2)($at)
    /* 730A4 800830A4 00000000 */  nop
    /* 730A8 800830A8 F7006330 */  andi       $v1, $v1, 0xF7
    /* 730AC 800830AC 0E80013C */  lui        $at, %hi(dung_map + 0x2)
    /* 730B0 800830B0 21082200 */  addu       $at, $at, $v0
    /* 730B4 800830B4 2A7A23A0 */  sb         $v1, %lo(dung_map + 0x2)($at)
    /* 730B8 800830B8 1800BF8F */  lw         $ra, 0x18($sp)
    /* 730BC 800830BC 1400B18F */  lw         $s1, 0x14($sp)
    /* 730C0 800830C0 1000B08F */  lw         $s0, 0x10($sp)
    /* 730C4 800830C4 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 730C8 800830C8 0800E003 */  jr         $ra
    /* 730CC 800830CC 00000000 */   nop
endlabel ClearTRAP__Fii
