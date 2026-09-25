.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ItemPlace__Fii, 0x9C

glabel ItemPlace__Fii
    /* 2E254 8003E254 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 2E258 8003E258 C0100500 */  sll        $v0, $a1, 3
    /* 2E25C 8003E25C C0180400 */  sll        $v1, $a0, 3
    /* 2E260 8003E260 23186400 */  subu       $v1, $v1, $a0
    /* 2E264 8003E264 C0190300 */  sll        $v1, $v1, 7
    /* 2E268 8003E268 21184300 */  addu       $v1, $v0, $v1
    /* 2E26C 8003E26C 1000BFAF */  sw         $ra, 0x10($sp)
    /* 2E270 8003E270 0E80013C */  lui        $at, %hi(dung_map)
    /* 2E274 8003E274 21082300 */  addu       $at, $at, $v1
    /* 2E278 8003E278 287A2284 */  lh         $v0, %lo(dung_map)($at)
    /* 2E27C 8003E27C 00000000 */  nop
    /* 2E280 8003E280 17004014 */  bnez       $v0, .L8003E2E0
    /* 2E284 8003E284 21100000 */   addu      $v0, $zero, $zero
    /* 2E288 8003E288 0E80013C */  lui        $at, %hi(dung_map + 0x4)
    /* 2E28C 8003E28C 21082300 */  addu       $at, $at, $v1
    /* 2E290 8003E290 2C7A2280 */  lb         $v0, %lo(dung_map + 0x4)($at)
    /* 2E294 8003E294 00000000 */  nop
    /* 2E298 8003E298 11004014 */  bnez       $v0, .L8003E2E0
    /* 2E29C 8003E29C 21100000 */   addu      $v0, $zero, $zero
    /* 2E2A0 8003E2A0 0E80013C */  lui        $at, %hi(dung_map + 0x3)
    /* 2E2A4 8003E2A4 21082300 */  addu       $at, $at, $v1
    /* 2E2A8 8003E2A8 2B7A2280 */  lb         $v0, %lo(dung_map + 0x3)($at)
    /* 2E2AC 8003E2AC 00000000 */  nop
    /* 2E2B0 8003E2B0 0B004014 */  bnez       $v0, .L8003E2E0
    /* 2E2B4 8003E2B4 21100000 */   addu      $v0, $zero, $zero
    /* 2E2B8 8003E2B8 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 2E2BC 8003E2BC 21082300 */  addu       $at, $at, $v1
    /* 2E2C0 8003E2C0 2E7A2290 */  lbu        $v0, %lo(dung_map + 0x6)($at)
    /* 2E2C4 8003E2C4 00000000 */  nop
    /* 2E2C8 8003E2C8 08004230 */  andi       $v0, $v0, 0x8
    /* 2E2CC 8003E2CC 04004014 */  bnez       $v0, .L8003E2E0
    /* 2E2D0 8003E2D0 21100000 */   addu      $v0, $zero, $zero
    /* 2E2D4 8003E2D4 380B020C */  jal        GetSOLID__Fii
    /* 2E2D8 8003E2D8 00000000 */   nop
    /* 2E2DC 8003E2DC 0100422C */  sltiu      $v0, $v0, 0x1
  .L8003E2E0:
    /* 2E2E0 8003E2E0 1000BF8F */  lw         $ra, 0x10($sp)
    /* 2E2E4 8003E2E4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 2E2E8 8003E2E8 0800E003 */  jr         $ra
    /* 2E2EC 8003E2EC 00000000 */   nop
endlabel ItemPlace__Fii
