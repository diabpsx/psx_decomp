.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawLTBanner__Fii, 0xDC

glabel DrawLTBanner__Fii
    /* 254A4 8015F09C D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 254A8 8015F0A0 2000B0AF */  sw         $s0, 0x20($sp)
    /* 254AC 8015F0A4 21808000 */  addu       $s0, $a0, $zero
    /* 254B0 8015F0A8 2400B1AF */  sw         $s1, 0x24($sp)
    /* 254B4 8015F0AC 2188A000 */  addu       $s1, $a1, $zero
    /* 254B8 8015F0B0 1280043C */  lui        $a0, %hi(D_80119B5C)
    /* 254BC 8015F0B4 5C9B8424 */  addiu      $a0, $a0, %lo(D_80119B5C)
    /* 254C0 8015F0B8 2800BFAF */  sw         $ra, 0x28($sp)
    /* 254C4 8015F0BC A7D3010C */  jal        GRL_LoadFileInMemSig__FPCcPUl
    /* 254C8 8015F0C0 21280000 */   addu      $a1, $zero, $zero
    /* 254CC 8015F0C4 21204000 */  addu       $a0, $v0, $zero
    /* 254D0 8015F0C8 04008824 */  addiu      $t0, $a0, 0x4
    /* 254D4 8015F0CC 00008A90 */  lbu        $t2, 0x0($a0)
    /* 254D8 8015F0D0 02008B90 */  lbu        $t3, 0x2($a0)
    /* 254DC 8015F0D4 1280013C */  lui        $at, %hi(setpc_x)
    /* 254E0 8015F0D8 E4C030AC */  sw         $s0, %lo(setpc_x)($at)
    /* 254E4 8015F0DC 1280013C */  lui        $at, %hi(setpc_y)
    /* 254E8 8015F0E0 E8C031AC */  sw         $s1, %lo(setpc_y)($at)
    /* 254EC 8015F0E4 1280013C */  lui        $at, %hi(setpc_w)
    /* 254F0 8015F0E8 ECC02AAC */  sw         $t2, %lo(setpc_w)($at)
    /* 254F4 8015F0EC 1280013C */  lui        $at, %hi(setpc_h)
    /* 254F8 8015F0F0 F0C02BAC */  sw         $t3, %lo(setpc_h)($at)
    /* 254FC 8015F0F4 18006011 */  beqz       $t3, .L8015F158
    /* 25500 8015F0F8 21380000 */   addu      $a3, $zero, $zero
    /* 25504 8015F0FC 0E800C3C */  lui        $t4, %hi(pdungeon)
    /* 25508 8015F100 C4528C25 */  addiu      $t4, $t4, %lo(pdungeon)
  .L8015F104:
    /* 2550C 8015F104 10004011 */  beqz       $t2, .L8015F148
    /* 25510 8015F108 21280000 */   addu      $a1, $zero, $zero
    /* 25514 8015F10C 21482702 */  addu       $t1, $s1, $a3
  .L8015F110:
    /* 25518 8015F110 00000691 */  lbu        $a2, 0x0($t0)
    /* 2551C 8015F114 00000000 */  nop
    /* 25520 8015F118 0700C010 */  beqz       $a2, .L8015F138
    /* 25524 8015F11C 21180502 */   addu      $v1, $s0, $a1
    /* 25528 8015F120 80100300 */  sll        $v0, $v1, 2
    /* 2552C 8015F124 21104300 */  addu       $v0, $v0, $v1
    /* 25530 8015F128 C0100200 */  sll        $v0, $v0, 3
    /* 25534 8015F12C 21104C00 */  addu       $v0, $v0, $t4
    /* 25538 8015F130 21104900 */  addu       $v0, $v0, $t1
    /* 2553C 8015F134 000046A0 */  sb         $a2, 0x0($v0)
  .L8015F138:
    /* 25540 8015F138 0100A524 */  addiu      $a1, $a1, 0x1
    /* 25544 8015F13C 2A10AA00 */  slt        $v0, $a1, $t2
    /* 25548 8015F140 F3FF4014 */  bnez       $v0, .L8015F110
    /* 2554C 8015F144 02000825 */   addiu     $t0, $t0, 0x2
  .L8015F148:
    /* 25550 8015F148 0100E724 */  addiu      $a3, $a3, 0x1
    /* 25554 8015F14C 2A10EB00 */  slt        $v0, $a3, $t3
    /* 25558 8015F150 ECFF4014 */  bnez       $v0, .L8015F104
    /* 2555C 8015F154 00000000 */   nop
  .L8015F158:
    /* 25560 8015F158 F7F6000C */  jal        mem_free_dbg__FPv
    /* 25564 8015F15C 00000000 */   nop
    /* 25568 8015F160 2800BF8F */  lw         $ra, 0x28($sp)
    /* 2556C 8015F164 2400B18F */  lw         $s1, 0x24($sp)
    /* 25570 8015F168 2000B08F */  lw         $s0, 0x20($sp)
    /* 25574 8015F16C 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 25578 8015F170 0800E003 */  jr         $ra
    /* 2557C 8015F174 00000000 */   nop
endlabel DrawLTBanner__Fii
