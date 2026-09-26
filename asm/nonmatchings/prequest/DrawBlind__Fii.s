.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawBlind__Fii, 0xDC

glabel DrawBlind__Fii
    /* 25580 8015F178 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 25584 8015F17C 2000B0AF */  sw         $s0, 0x20($sp)
    /* 25588 8015F180 21808000 */  addu       $s0, $a0, $zero
    /* 2558C 8015F184 2400B1AF */  sw         $s1, 0x24($sp)
    /* 25590 8015F188 2188A000 */  addu       $s1, $a1, $zero
    /* 25594 8015F18C 1280043C */  lui        $a0, %hi(D_80119B68)
    /* 25598 8015F190 689B8424 */  addiu      $a0, $a0, %lo(D_80119B68)
    /* 2559C 8015F194 2800BFAF */  sw         $ra, 0x28($sp)
    /* 255A0 8015F198 A7D3010C */  jal        GRL_LoadFileInMemSig__FPCcPUl
    /* 255A4 8015F19C 21280000 */   addu      $a1, $zero, $zero
    /* 255A8 8015F1A0 21204000 */  addu       $a0, $v0, $zero
    /* 255AC 8015F1A4 04008824 */  addiu      $t0, $a0, 0x4
    /* 255B0 8015F1A8 00008A90 */  lbu        $t2, 0x0($a0)
    /* 255B4 8015F1AC 02008B90 */  lbu        $t3, 0x2($a0)
    /* 255B8 8015F1B0 1280013C */  lui        $at, %hi(setpc_x)
    /* 255BC 8015F1B4 E4C030AC */  sw         $s0, %lo(setpc_x)($at)
    /* 255C0 8015F1B8 1280013C */  lui        $at, %hi(setpc_y)
    /* 255C4 8015F1BC E8C031AC */  sw         $s1, %lo(setpc_y)($at)
    /* 255C8 8015F1C0 1280013C */  lui        $at, %hi(setpc_w)
    /* 255CC 8015F1C4 ECC02AAC */  sw         $t2, %lo(setpc_w)($at)
    /* 255D0 8015F1C8 1280013C */  lui        $at, %hi(setpc_h)
    /* 255D4 8015F1CC F0C02BAC */  sw         $t3, %lo(setpc_h)($at)
    /* 255D8 8015F1D0 18006011 */  beqz       $t3, .L8015F234
    /* 255DC 8015F1D4 21380000 */   addu      $a3, $zero, $zero
    /* 255E0 8015F1D8 0E800C3C */  lui        $t4, %hi(pdungeon)
    /* 255E4 8015F1DC C4528C25 */  addiu      $t4, $t4, %lo(pdungeon)
  .L8015F1E0:
    /* 255E8 8015F1E0 10004011 */  beqz       $t2, .L8015F224
    /* 255EC 8015F1E4 21280000 */   addu      $a1, $zero, $zero
    /* 255F0 8015F1E8 21482702 */  addu       $t1, $s1, $a3
  .L8015F1EC:
    /* 255F4 8015F1EC 00000691 */  lbu        $a2, 0x0($t0)
    /* 255F8 8015F1F0 00000000 */  nop
    /* 255FC 8015F1F4 0700C010 */  beqz       $a2, .L8015F214
    /* 25600 8015F1F8 21180502 */   addu      $v1, $s0, $a1
    /* 25604 8015F1FC 80100300 */  sll        $v0, $v1, 2
    /* 25608 8015F200 21104300 */  addu       $v0, $v0, $v1
    /* 2560C 8015F204 C0100200 */  sll        $v0, $v0, 3
    /* 25610 8015F208 21104C00 */  addu       $v0, $v0, $t4
    /* 25614 8015F20C 21104900 */  addu       $v0, $v0, $t1
    /* 25618 8015F210 000046A0 */  sb         $a2, 0x0($v0)
  .L8015F214:
    /* 2561C 8015F214 0100A524 */  addiu      $a1, $a1, 0x1
    /* 25620 8015F218 2A10AA00 */  slt        $v0, $a1, $t2
    /* 25624 8015F21C F3FF4014 */  bnez       $v0, .L8015F1EC
    /* 25628 8015F220 02000825 */   addiu     $t0, $t0, 0x2
  .L8015F224:
    /* 2562C 8015F224 0100E724 */  addiu      $a3, $a3, 0x1
    /* 25630 8015F228 2A10EB00 */  slt        $v0, $a3, $t3
    /* 25634 8015F22C ECFF4014 */  bnez       $v0, .L8015F1E0
    /* 25638 8015F230 00000000 */   nop
  .L8015F234:
    /* 2563C 8015F234 F7F6000C */  jal        mem_free_dbg__FPv
    /* 25640 8015F238 00000000 */   nop
    /* 25644 8015F23C 2800BF8F */  lw         $ra, 0x28($sp)
    /* 25648 8015F240 2400B18F */  lw         $s1, 0x24($sp)
    /* 2564C 8015F244 2000B08F */  lw         $s0, 0x20($sp)
    /* 25650 8015F248 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 25654 8015F24C 0800E003 */  jr         $ra
    /* 25658 8015F250 00000000 */   nop
endlabel DrawBlind__Fii
