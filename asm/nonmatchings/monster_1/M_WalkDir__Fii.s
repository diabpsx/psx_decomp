.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching M_WalkDir__Fii, 0x230

glabel M_WalkDir__Fii
    /* 15514 8014F10C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 15518 8014F110 40100400 */  sll        $v0, $a0, 1
    /* 1551C 8014F114 21104400 */  addu       $v0, $v0, $a0
    /* 15520 8014F118 80100200 */  sll        $v0, $v0, 2
    /* 15524 8014F11C 21104400 */  addu       $v0, $v0, $a0
    /* 15528 8014F120 C0100200 */  sll        $v0, $v0, 3
    /* 1552C 8014F124 1800BFAF */  sw         $ra, 0x18($sp)
    /* 15530 8014F128 1080013C */  lui        $at, %hi(monster + 0x60)
    /* 15534 8014F12C 21082200 */  addu       $at, $at, $v0
    /* 15538 8014F130 F453228C */  lw         $v0, %lo(monster + 0x60)($at)
    /* 1553C 8014F134 00000000 */  nop
    /* 15540 8014F138 06004280 */  lb         $v0, 0x6($v0)
    /* 15544 8014F13C 00000000 */  nop
    /* 15548 8014F140 FFFF4324 */  addiu      $v1, $v0, -0x1
    /* 1554C 8014F144 0800A22C */  sltiu      $v0, $a1, 0x8
    /* 15550 8014F148 78004010 */  beqz       $v0, .L8014F32C
    /* 15554 8014F14C 80100500 */   sll       $v0, $a1, 2
    /* 15558 8014F150 1280013C */  lui        $at, %hi(jtbl_8011A310)
    /* 1555C 8014F154 21082200 */  addu       $at, $at, $v0
    /* 15560 8014F158 10A3228C */  lw         $v0, %lo(jtbl_8011A310)($at)
    /* 15564 8014F15C 00000000 */  nop
    /* 15568 8014F160 08004000 */  jr         $v0
    /* 1556C 8014F164 00000000 */   nop
    /* 15570 8014F168 21280000 */  addu       $a1, $zero, $zero
    /* 15574 8014F16C FFFF0724 */  addiu      $a3, $zero, -0x1
    /* 15578 8014F170 40100300 */  sll        $v0, $v1, 1
    /* 1557C 8014F174 21104300 */  addu       $v0, $v0, $v1
    /* 15580 8014F178 80100200 */  sll        $v0, $v0, 2
    /* 15584 8014F17C 1080013C */  lui        $at, %hi(MWVel + 0x4)
    /* 15588 8014F180 21082200 */  addu       $at, $at, $v0
    /* 1558C 8014F184 F851268C */  lw         $a2, %lo(MWVel + 0x4)($at)
    /* 15590 8014F188 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 15594 8014F18C 1000A2AF */  sw         $v0, 0x10($sp)
    /* 15598 8014F190 04000224 */  addiu      $v0, $zero, 0x4
    /* 1559C 8014F194 C83C0508 */  j          .L8014F320
    /* 155A0 8014F198 1400A2AF */   sw        $v0, 0x14($sp)
    /* 155A4 8014F19C 21380000 */  addu       $a3, $zero, $zero
    /* 155A8 8014F1A0 40100300 */  sll        $v0, $v1, 1
    /* 155AC 8014F1A4 21104300 */  addu       $v0, $v0, $v1
    /* 155B0 8014F1A8 80100200 */  sll        $v0, $v0, 2
    /* 155B4 8014F1AC 1080013C */  lui        $at, %hi(MWVel + 0x4)
    /* 155B8 8014F1B0 21082200 */  addu       $at, $at, $v0
    /* 155BC 8014F1B4 F851258C */  lw         $a1, %lo(MWVel + 0x4)($at)
    /* 155C0 8014F1B8 1080013C */  lui        $at, %hi(MWVel)
    /* 155C4 8014F1BC 21082200 */  addu       $at, $at, $v0
    /* 155C8 8014F1C0 F451268C */  lw         $a2, %lo(MWVel)($at)
    /* 155CC 8014F1C4 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 155D0 8014F1C8 1000A2AF */  sw         $v0, 0x10($sp)
    /* 155D4 8014F1CC 05000224 */  addiu      $v0, $zero, 0x5
    /* 155D8 8014F1D0 C83C0508 */  j          .L8014F320
    /* 155DC 8014F1D4 1400A2AF */   sw        $v0, 0x14($sp)
    /* 155E0 8014F1D8 21300000 */  addu       $a2, $zero, $zero
    /* 155E4 8014F1DC 01000724 */  addiu      $a3, $zero, 0x1
    /* 155E8 8014F1E0 40100300 */  sll        $v0, $v1, 1
    /* 155EC 8014F1E4 21104300 */  addu       $v0, $v0, $v1
    /* 155F0 8014F1E8 80100200 */  sll        $v0, $v0, 2
    /* 155F4 8014F1EC 1080013C */  lui        $at, %hi(MWVel + 0x8)
    /* 155F8 8014F1F0 21082200 */  addu       $at, $at, $v0
    /* 155FC 8014F1F4 FC51258C */  lw         $a1, %lo(MWVel + 0x8)($at)
    /* 15600 8014F1F8 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 15604 8014F1FC 1000A2AF */  sw         $v0, 0x10($sp)
    /* 15608 8014F200 06000224 */  addiu      $v0, $zero, 0x6
    /* 1560C 8014F204 C93C0508 */  j          .L8014F324
    /* 15610 8014F208 1400A2AF */   sw        $v0, 0x14($sp)
    /* 15614 8014F20C 40100300 */  sll        $v0, $v1, 1
    /* 15618 8014F210 21104300 */  addu       $v0, $v0, $v1
    /* 1561C 8014F214 80100200 */  sll        $v0, $v0, 2
    /* 15620 8014F218 01000724 */  addiu      $a3, $zero, 0x1
    /* 15624 8014F21C 1080013C */  lui        $at, %hi(MWVel + 0x4)
    /* 15628 8014F220 21082200 */  addu       $at, $at, $v0
    /* 1562C 8014F224 F851258C */  lw         $a1, %lo(MWVel + 0x4)($at)
    /* 15630 8014F228 1080013C */  lui        $at, %hi(MWVel)
    /* 15634 8014F22C 21082200 */  addu       $at, $at, $v0
    /* 15638 8014F230 F451268C */  lw         $a2, %lo(MWVel)($at)
    /* 1563C 8014F234 07000224 */  addiu      $v0, $zero, 0x7
    /* 15640 8014F238 1000A0AF */  sw         $zero, 0x10($sp)
    /* 15644 8014F23C C93C0508 */  j          .L8014F324
    /* 15648 8014F240 1400A2AF */   sw        $v0, 0x14($sp)
    /* 1564C 8014F244 21280000 */  addu       $a1, $zero, $zero
    /* 15650 8014F248 01000724 */  addiu      $a3, $zero, 0x1
    /* 15654 8014F24C 40100300 */  sll        $v0, $v1, 1
    /* 15658 8014F250 21104300 */  addu       $v0, $v0, $v1
    /* 1565C 8014F254 80100200 */  sll        $v0, $v0, 2
    /* 15660 8014F258 1080013C */  lui        $at, %hi(MWVel + 0x4)
    /* 15664 8014F25C 21082200 */  addu       $at, $at, $v0
    /* 15668 8014F260 F851268C */  lw         $a2, %lo(MWVel + 0x4)($at)
    /* 1566C 8014F264 01000224 */  addiu      $v0, $zero, 0x1
    /* 15670 8014F268 1000A2AF */  sw         $v0, 0x10($sp)
    /* 15674 8014F26C C93C0508 */  j          .L8014F324
    /* 15678 8014F270 1400A0AF */   sw        $zero, 0x14($sp)
    /* 1567C 8014F274 21380000 */  addu       $a3, $zero, $zero
    /* 15680 8014F278 40100300 */  sll        $v0, $v1, 1
    /* 15684 8014F27C 21104300 */  addu       $v0, $v0, $v1
    /* 15688 8014F280 80100200 */  sll        $v0, $v0, 2
    /* 1568C 8014F284 1080013C */  lui        $at, %hi(MWVel + 0x4)
    /* 15690 8014F288 21082200 */  addu       $at, $at, $v0
    /* 15694 8014F28C F851258C */  lw         $a1, %lo(MWVel + 0x4)($at)
    /* 15698 8014F290 1080013C */  lui        $at, %hi(MWVel)
    /* 1569C 8014F294 21082200 */  addu       $at, $at, $v0
    /* 156A0 8014F298 F451268C */  lw         $a2, %lo(MWVel)($at)
    /* 156A4 8014F29C 01000224 */  addiu      $v0, $zero, 0x1
    /* 156A8 8014F2A0 1000A2AF */  sw         $v0, 0x10($sp)
    /* 156AC 8014F2A4 1400A2AF */  sw         $v0, 0x14($sp)
    /* 156B0 8014F2A8 C93C0508 */  j          .L8014F324
    /* 156B4 8014F2AC 23280500 */   negu      $a1, $a1
    /* 156B8 8014F2B0 21300000 */  addu       $a2, $zero, $zero
    /* 156BC 8014F2B4 FFFF0724 */  addiu      $a3, $zero, -0x1
    /* 156C0 8014F2B8 40100300 */  sll        $v0, $v1, 1
    /* 156C4 8014F2BC 21104300 */  addu       $v0, $v0, $v1
    /* 156C8 8014F2C0 80100200 */  sll        $v0, $v0, 2
    /* 156CC 8014F2C4 1080013C */  lui        $at, %hi(MWVel + 0x8)
    /* 156D0 8014F2C8 21082200 */  addu       $at, $at, $v0
    /* 156D4 8014F2CC FC51258C */  lw         $a1, %lo(MWVel + 0x8)($at)
    /* 156D8 8014F2D0 01000224 */  addiu      $v0, $zero, 0x1
    /* 156DC 8014F2D4 1000A2AF */  sw         $v0, 0x10($sp)
    /* 156E0 8014F2D8 02000224 */  addiu      $v0, $zero, 0x2
    /* 156E4 8014F2DC 1400A2AF */  sw         $v0, 0x14($sp)
    /* 156E8 8014F2E0 C93C0508 */  j          .L8014F324
    /* 156EC 8014F2E4 23280500 */   negu      $a1, $a1
    /* 156F0 8014F2E8 40100300 */  sll        $v0, $v1, 1
    /* 156F4 8014F2EC 21104300 */  addu       $v0, $v0, $v1
    /* 156F8 8014F2F0 80100200 */  sll        $v0, $v0, 2
    /* 156FC 8014F2F4 FFFF0724 */  addiu      $a3, $zero, -0x1
    /* 15700 8014F2F8 1080013C */  lui        $at, %hi(MWVel + 0x4)
    /* 15704 8014F2FC 21082200 */  addu       $at, $at, $v0
    /* 15708 8014F300 F851258C */  lw         $a1, %lo(MWVel + 0x4)($at)
    /* 1570C 8014F304 1080013C */  lui        $at, %hi(MWVel)
    /* 15710 8014F308 21082200 */  addu       $at, $at, $v0
    /* 15714 8014F30C F451268C */  lw         $a2, %lo(MWVel)($at)
    /* 15718 8014F310 03000224 */  addiu      $v0, $zero, 0x3
    /* 1571C 8014F314 1000A0AF */  sw         $zero, 0x10($sp)
    /* 15720 8014F318 1400A2AF */  sw         $v0, 0x14($sp)
    /* 15724 8014F31C 23280500 */  negu       $a1, $a1
  .L8014F320:
    /* 15728 8014F320 23300600 */  negu       $a2, $a2
  .L8014F324:
    /* 1572C 8014F324 475C050C */  jal        M_StartWalk__Fiiiiii
    /* 15730 8014F328 00000000 */   nop
  .L8014F32C:
    /* 15734 8014F32C 1800BF8F */  lw         $ra, 0x18($sp)
    /* 15738 8014F330 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 1573C 8014F334 0800E003 */  jr         $ra
    /* 15740 8014F338 00000000 */   nop
endlabel M_WalkDir__Fii
