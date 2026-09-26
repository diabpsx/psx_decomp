.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawBlood__Fii, 0xE0

glabel DrawBlood__Fii
    /* 2565C 8015F254 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 25660 8015F258 2000B0AF */  sw         $s0, 0x20($sp)
    /* 25664 8015F25C 21808000 */  addu       $s0, $a0, $zero
    /* 25668 8015F260 2400B1AF */  sw         $s1, 0x24($sp)
    /* 2566C 8015F264 2188A000 */  addu       $s1, $a1, $zero
    /* 25670 8015F268 1280043C */  lui        $a0, %hi(D_80119B74)
    /* 25674 8015F26C 749B8424 */  addiu      $a0, $a0, %lo(D_80119B74)
    /* 25678 8015F270 2800BFAF */  sw         $ra, 0x28($sp)
    /* 2567C 8015F274 A7D3010C */  jal        GRL_LoadFileInMemSig__FPCcPUl
    /* 25680 8015F278 21280000 */   addu      $a1, $zero, $zero
    /* 25684 8015F27C 21204000 */  addu       $a0, $v0, $zero
    /* 25688 8015F280 04008824 */  addiu      $t0, $a0, 0x4
    /* 2568C 8015F284 00008A90 */  lbu        $t2, 0x0($a0)
    /* 25690 8015F288 02008B90 */  lbu        $t3, 0x2($a0)
    /* 25694 8015F28C 1280013C */  lui        $at, %hi(setpc_x)
    /* 25698 8015F290 E4C030AC */  sw         $s0, %lo(setpc_x)($at)
    /* 2569C 8015F294 1280013C */  lui        $at, %hi(setpc_y)
    /* 256A0 8015F298 E8C031AC */  sw         $s1, %lo(setpc_y)($at)
    /* 256A4 8015F29C 1280013C */  lui        $at, %hi(setpc_w)
    /* 256A8 8015F2A0 ECC02AAC */  sw         $t2, %lo(setpc_w)($at)
    /* 256AC 8015F2A4 1280013C */  lui        $at, %hi(setpc_h)
    /* 256B0 8015F2A8 F0C02BAC */  sw         $t3, %lo(setpc_h)($at)
    /* 256B4 8015F2AC 19006011 */  beqz       $t3, .L8015F314
    /* 256B8 8015F2B0 21380000 */   addu      $a3, $zero, $zero
    /* 256BC 8015F2B4 0E800C3C */  lui        $t4, %hi(dungeon)
    /* 256C0 8015F2B8 C4408C25 */  addiu      $t4, $t4, %lo(dungeon)
  .L8015F2BC:
    /* 256C4 8015F2BC 11004011 */  beqz       $t2, .L8015F304
    /* 256C8 8015F2C0 21280000 */   addu      $a1, $zero, $zero
    /* 256CC 8015F2C4 21102702 */  addu       $v0, $s1, $a3
    /* 256D0 8015F2C8 40480200 */  sll        $t1, $v0, 1
  .L8015F2CC:
    /* 256D4 8015F2CC 00000691 */  lbu        $a2, 0x0($t0)
    /* 256D8 8015F2D0 00000000 */  nop
    /* 256DC 8015F2D4 0700C010 */  beqz       $a2, .L8015F2F4
    /* 256E0 8015F2D8 21180502 */   addu      $v1, $s0, $a1
    /* 256E4 8015F2DC 40100300 */  sll        $v0, $v1, 1
    /* 256E8 8015F2E0 21104300 */  addu       $v0, $v0, $v1
    /* 256EC 8015F2E4 40110200 */  sll        $v0, $v0, 5
    /* 256F0 8015F2E8 21104C00 */  addu       $v0, $v0, $t4
    /* 256F4 8015F2EC 21102201 */  addu       $v0, $t1, $v0
    /* 256F8 8015F2F0 000046A4 */  sh         $a2, 0x0($v0)
  .L8015F2F4:
    /* 256FC 8015F2F4 0100A524 */  addiu      $a1, $a1, 0x1
    /* 25700 8015F2F8 2A10AA00 */  slt        $v0, $a1, $t2
    /* 25704 8015F2FC F3FF4014 */  bnez       $v0, .L8015F2CC
    /* 25708 8015F300 02000825 */   addiu     $t0, $t0, 0x2
  .L8015F304:
    /* 2570C 8015F304 0100E724 */  addiu      $a3, $a3, 0x1
    /* 25710 8015F308 2A10EB00 */  slt        $v0, $a3, $t3
    /* 25714 8015F30C EBFF4014 */  bnez       $v0, .L8015F2BC
    /* 25718 8015F310 00000000 */   nop
  .L8015F314:
    /* 2571C 8015F314 F7F6000C */  jal        mem_free_dbg__FPv
    /* 25720 8015F318 00000000 */   nop
    /* 25724 8015F31C 2800BF8F */  lw         $ra, 0x28($sp)
    /* 25728 8015F320 2400B18F */  lw         $s1, 0x24($sp)
    /* 2572C 8015F324 2000B08F */  lw         $s0, 0x20($sp)
    /* 25730 8015F328 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 25734 8015F32C 0800E003 */  jr         $ra
    /* 25738 8015F330 00000000 */   nop
endlabel DrawBlood__Fii
