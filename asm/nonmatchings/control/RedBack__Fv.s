.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching RedBack__Fv, 0xF8

glabel RedBack__Fv
    /* 260F8 800360F8 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 260FC 800360FC 21200000 */  addu       $a0, $zero, $zero
    /* 26100 80036100 2400BFAF */  sw         $ra, 0x24($sp)
    /* 26104 80036104 044F020C */  jal        GM_UseTexData__Fi
    /* 26108 80036108 2000B0AF */   sw        $s0, 0x20($sp)
    /* 2610C 8003610C BDDD000C */  jal        GetMaxOtPos__7CBlocks
    /* 26110 80036110 21804000 */   addu      $s0, $v0, $zero
    /* 26114 80036114 21200002 */  addu       $a0, $s0, $zero
    /* 26118 80036118 FCFF4224 */  addiu      $v0, $v0, -0x4
    /* 2611C 8003611C D8000524 */  addiu      $a1, $zero, 0xD8
    /* 26120 80036120 21300000 */  addu       $a2, $zero, $zero
    /* 26124 80036124 21380000 */  addu       $a3, $zero, $zero
    /* 26128 80036128 1000A0AF */  sw         $zero, 0x10($sp)
    /* 2612C 8003612C 1400A2AF */  sw         $v0, 0x14($sp)
    /* 26130 80036130 064D020C */  jal        PrintFt4__7TextDatiiiiii
    /* 26134 80036134 1800A0AF */   sw        $zero, 0x18($sp)
    /* 26138 80036138 21384000 */  addu       $a3, $v0, $zero
    /* 2613C 8003613C 1400E690 */  lbu        $a2, 0x14($a3)
    /* 26140 80036140 2400E490 */  lbu        $a0, 0x24($a3)
    /* 26144 80036144 1D00E590 */  lbu        $a1, 0x1D($a3)
    /* 26148 80036148 60010324 */  addiu      $v1, $zero, 0x160
    /* 2614C 8003614C 1000E3A4 */  sh         $v1, 0x10($a3)
    /* 26150 80036150 2000E3A4 */  sh         $v1, 0x20($a3)
    /* 26154 80036154 2500E390 */  lbu        $v1, 0x25($a3)
    /* 26158 80036158 F0000224 */  addiu      $v0, $zero, 0xF0
    /* 2615C 8003615C 1A00E2A4 */  sh         $v0, 0x1A($a3)
    /* 26160 80036160 2200E2A4 */  sh         $v0, 0x22($a3)
    /* 26164 80036164 18000224 */  addiu      $v0, $zero, 0x18
    /* 26168 80036168 0400E2A0 */  sb         $v0, 0x4($a3)
    /* 2616C 8003616C 0500E2A0 */  sb         $v0, 0x5($a3)
    /* 26170 80036170 0600E2A0 */  sb         $v0, 0x6($a3)
    /* 26174 80036174 0700E290 */  lbu        $v0, 0x7($a3)
    /* 26178 80036178 0800E0A4 */  sh         $zero, 0x8($a3)
    /* 2617C 8003617C 0A00E0A4 */  sh         $zero, 0xA($a3)
    /* 26180 80036180 1200E0A4 */  sh         $zero, 0x12($a3)
    /* 26184 80036184 1800E0A4 */  sh         $zero, 0x18($a3)
    /* 26188 80036188 FFFFC624 */  addiu      $a2, $a2, -0x1
    /* 2618C 8003618C FFFF8424 */  addiu      $a0, $a0, -0x1
    /* 26190 80036190 FFFFA524 */  addiu      $a1, $a1, -0x1
    /* 26194 80036194 02004234 */  ori        $v0, $v0, 0x2
    /* 26198 80036198 FE004230 */  andi       $v0, $v0, 0xFE
    /* 2619C 8003619C 0700E2A0 */  sb         $v0, 0x7($a3)
    /* 261A0 800361A0 1600E294 */  lhu        $v0, 0x16($a3)
    /* 261A4 800361A4 FFFF6324 */  addiu      $v1, $v1, -0x1
    /* 261A8 800361A8 1400E6A0 */  sb         $a2, 0x14($a3)
    /* 261AC 800361AC 2400E4A0 */  sb         $a0, 0x24($a3)
    /* 261B0 800361B0 1D00E5A0 */  sb         $a1, 0x1D($a3)
    /* 261B4 800361B4 2500E3A0 */  sb         $v1, 0x25($a3)
    /* 261B8 800361B8 1280033C */  lui        $v1, %hi(leveltype)
    /* 261BC 800361BC 0DC16390 */  lbu        $v1, %lo(leveltype)($v1)
    /* 261C0 800361C0 40004234 */  ori        $v0, $v0, 0x40
    /* 261C4 800361C4 05006010 */  beqz       $v1, .L800361DC
    /* 261C8 800361C8 1600E2A4 */   sh        $v0, 0x16($a3)
    /* 261CC 800361CC FF000224 */  addiu      $v0, $zero, 0xFF
    /* 261D0 800361D0 0400E0A0 */  sb         $zero, 0x4($a3)
    /* 261D4 800361D4 0500E2A0 */  sb         $v0, 0x5($a3)
    /* 261D8 800361D8 0600E2A0 */  sb         $v0, 0x6($a3)
  .L800361DC:
    /* 261DC 800361DC 2400BF8F */  lw         $ra, 0x24($sp)
    /* 261E0 800361E0 2000B08F */  lw         $s0, 0x20($sp)
    /* 261E4 800361E4 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 261E8 800361E8 0800E003 */  jr         $ra
    /* 261EC 800361EC 00000000 */   nop
endlabel RedBack__Fv
