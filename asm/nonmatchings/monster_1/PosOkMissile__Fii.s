.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PosOkMissile__Fii, 0x78

glabel PosOkMissile__Fii
    /* 1B560 80155158 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 1B564 8015515C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1B568 80155160 21808000 */  addu       $s0, $a0, $zero
    /* 1B56C 80155164 1400B1AF */  sw         $s1, 0x14($sp)
    /* 1B570 80155168 2188A000 */  addu       $s1, $a1, $zero
    /* 1B574 8015516C 1800B2AF */  sw         $s2, 0x18($sp)
    /* 1B578 80155170 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 1B57C 80155174 900B020C */  jal        GetMISSILE__Fii
    /* 1B580 80155178 21900000 */   addu      $s2, $zero, $zero
    /* 1B584 8015517C 01004238 */  xori       $v0, $v0, 0x1
    /* 1B588 80155180 0B004010 */  beqz       $v0, .L801551B0
    /* 1B58C 80155184 C0101100 */   sll       $v0, $s1, 3
    /* 1B590 80155188 C0181000 */  sll        $v1, $s0, 3
    /* 1B594 8015518C 23187000 */  subu       $v1, $v1, $s0
    /* 1B598 80155190 C0190300 */  sll        $v1, $v1, 7
    /* 1B59C 80155194 21104300 */  addu       $v0, $v0, $v1
    /* 1B5A0 80155198 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 1B5A4 8015519C 21082200 */  addu       $at, $at, $v0
    /* 1B5A8 801551A0 2E7A2290 */  lbu        $v0, %lo(dung_map + 0x6)($at)
    /* 1B5AC 801551A4 00000000 */  nop
    /* 1B5B0 801551A8 10004230 */  andi       $v0, $v0, 0x10
    /* 1B5B4 801551AC 0100522C */  sltiu      $s2, $v0, 0x1
  .L801551B0:
    /* 1B5B8 801551B0 21104002 */  addu       $v0, $s2, $zero
    /* 1B5BC 801551B4 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 1B5C0 801551B8 1800B28F */  lw         $s2, 0x18($sp)
    /* 1B5C4 801551BC 1400B18F */  lw         $s1, 0x14($sp)
    /* 1B5C8 801551C0 1000B08F */  lw         $s0, 0x10($sp)
    /* 1B5CC 801551C4 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 1B5D0 801551C8 0800E003 */  jr         $ra
    /* 1B5D4 801551CC 00000000 */   nop
endlabel PosOkMissile__Fii
