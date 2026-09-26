.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ConstructSlotName__FPci, 0xF8

glabel ConstructSlotName__FPci
    /* 2168C 8015B284 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 21690 8015B288 2800B2AF */  sw         $s2, 0x28($sp)
    /* 21694 8015B28C 2190A000 */  addu       $s2, $a1, $zero
    /* 21698 8015B290 80101200 */  sll        $v0, $s2, 2
    /* 2169C 8015B294 21105200 */  addu       $v0, $v0, $s2
    /* 216A0 8015B298 40110200 */  sll        $v0, $v0, 5
    /* 216A4 8015B29C 23105200 */  subu       $v0, $v0, $s2
    /* 216A8 8015B2A0 2400B1AF */  sw         $s1, 0x24($sp)
    /* 216AC 8015B2A4 C0880200 */  sll        $s1, $v0, 3
    /* 216B0 8015B2A8 3000BFAF */  sw         $ra, 0x30($sp)
    /* 216B4 8015B2AC 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 216B8 8015B2B0 2000B0AF */  sw         $s0, 0x20($sp)
    /* 216BC 8015B2B4 1580013C */  lui        $at, %hi(CharDataStruct + 0x478)
    /* 216C0 8015B2B8 21083100 */  addu       $at, $at, $s1
    /* 216C4 8015B2BC 687B2280 */  lb         $v0, %lo(CharDataStruct + 0x478)($at)
    /* 216C8 8015B2C0 00000000 */  nop
    /* 216CC 8015B2C4 0B004014 */  bnez       $v0, .L8015B2F4
    /* 216D0 8015B2C8 21988000 */   addu      $s3, $a0, $zero
    /* 216D4 8015B2CC 4AED010C */  jal        GetStr__Fi
    /* 216D8 8015B2D0 2C010424 */   addiu     $a0, $zero, 0x12C
    /* 216DC 8015B2D4 21206002 */  addu       $a0, $s3, $zero
    /* 216E0 8015B2D8 1280053C */  lui        $a1, %hi(D_8011B438)
    /* 216E4 8015B2DC 38B4A524 */  addiu      $a1, $a1, %lo(D_8011B438)
    /* 216E8 8015B2E0 01004626 */  addiu      $a2, $s2, 0x1
    /* 216EC 8015B2E4 9767000C */  jal        sprintf
    /* 216F0 8015B2E8 21384000 */   addu      $a3, $v0, $zero
    /* 216F4 8015B2EC D76C0508 */  j          .L8015B35C
    /* 216F8 8015B2F0 00000000 */   nop
  .L8015B2F4:
    /* 216FC 8015B2F4 4AED010C */  jal        GetStr__Fi
    /* 21700 8015B2F8 45020424 */   addiu     $a0, $zero, 0x245
    /* 21704 8015B2FC 1580013C */  lui        $at, %hi(CharDataStruct + 0x4E9)
    /* 21708 8015B300 21083100 */  addu       $at, $at, $s1
    /* 2170C 8015B304 D97B2390 */  lbu        $v1, %lo(CharDataStruct + 0x4E9)($at)
    /* 21710 8015B308 00000000 */  nop
    /* 21714 8015B30C 80180300 */  sll        $v1, $v1, 2
    /* 21718 8015B310 1480013C */  lui        $at, %hi(ClassStrTbl)
    /* 2171C 8015B314 21082300 */  addu       $at, $at, $v1
    /* 21720 8015B318 F835248C */  lw         $a0, %lo(ClassStrTbl)($at)
    /* 21724 8015B31C 4AED010C */  jal        GetStr__Fi
    /* 21728 8015B320 21804000 */   addu      $s0, $v0, $zero
    /* 2172C 8015B324 21206002 */  addu       $a0, $s3, $zero
    /* 21730 8015B328 1480053C */  lui        $a1, %hi(func_801436A0 + 0x3C)
    /* 21734 8015B32C DC36A524 */  addiu      $a1, $a1, %lo(func_801436A0 + 0x3C)
    /* 21738 8015B330 01004626 */  addiu      $a2, $s2, 0x1
    /* 2173C 8015B334 1580073C */  lui        $a3, %hi(CharDataStruct + 0x478)
    /* 21740 8015B338 687BE724 */  addiu      $a3, $a3, %lo(CharDataStruct + 0x478)
    /* 21744 8015B33C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 21748 8015B340 1580013C */  lui        $at, %hi(CharDataStruct + 0x4EE)
    /* 2174C 8015B344 21083100 */  addu       $at, $at, $s1
    /* 21750 8015B348 DE7B2390 */  lbu        $v1, %lo(CharDataStruct + 0x4EE)($at)
    /* 21754 8015B34C 21382702 */  addu       $a3, $s1, $a3
    /* 21758 8015B350 1800A2AF */  sw         $v0, 0x18($sp)
    /* 2175C 8015B354 9767000C */  jal        sprintf
    /* 21760 8015B358 1400A3AF */   sw        $v1, 0x14($sp)
  .L8015B35C:
    /* 21764 8015B35C 3000BF8F */  lw         $ra, 0x30($sp)
    /* 21768 8015B360 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 2176C 8015B364 2800B28F */  lw         $s2, 0x28($sp)
    /* 21770 8015B368 2400B18F */  lw         $s1, 0x24($sp)
    /* 21774 8015B36C 2000B08F */  lw         $s0, 0x20($sp)
    /* 21778 8015B370 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 2177C 8015B374 0800E003 */  jr         $ra
    /* 21780 8015B378 00000000 */   nop
endlabel ConstructSlotName__FPci
