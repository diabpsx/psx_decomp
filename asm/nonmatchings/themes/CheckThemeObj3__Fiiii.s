.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CheckThemeObj3__Fiiii, 0x14C

glabel CheckThemeObj3__Fiiii
    /* 22610 8015C208 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 22614 8015C20C 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 22618 8015C210 21988000 */  addu       $s3, $a0, $zero
    /* 2261C 8015C214 2000B4AF */  sw         $s4, 0x20($sp)
    /* 22620 8015C218 21A0A000 */  addu       $s4, $a1, $zero
    /* 22624 8015C21C 2800B6AF */  sw         $s6, 0x28($sp)
    /* 22628 8015C220 21B0C000 */  addu       $s6, $a2, $zero
    /* 2262C 8015C224 2400B5AF */  sw         $s5, 0x24($sp)
    /* 22630 8015C228 21A8E000 */  addu       $s5, $a3, $zero
    /* 22634 8015C22C 1800B2AF */  sw         $s2, 0x18($sp)
    /* 22638 8015C230 21900000 */  addu       $s2, $zero, $zero
    /* 2263C 8015C234 1400B1AF */  sw         $s1, 0x14($sp)
    /* 22640 8015C238 1080113C */  lui        $s1, %hi(trm3x)
    /* 22644 8015C23C 00283126 */  addiu      $s1, $s1, %lo(trm3x)
    /* 22648 8015C240 2C00BFAF */  sw         $ra, 0x2C($sp)
    /* 2264C 8015C244 1000B0AF */  sw         $s0, 0x10($sp)
  .L8015C248:
    /* 22650 8015C248 0000228E */  lw         $v0, 0x0($s1)
    /* 22654 8015C24C 00000000 */  nop
    /* 22658 8015C250 21186202 */  addu       $v1, $s3, $v0
    /* 2265C 8015C254 2D006004 */  bltz       $v1, .L8015C30C
    /* 22660 8015C258 80201200 */   sll       $a0, $s2, 2
    /* 22664 8015C25C 1080023C */  lui        $v0, %hi(trm3y)
    /* 22668 8015C260 24284224 */  addiu      $v0, $v0, %lo(trm3y)
    /* 2266C 8015C264 21808200 */  addu       $s0, $a0, $v0
    /* 22670 8015C268 0000028E */  lw         $v0, 0x0($s0)
    /* 22674 8015C26C 00000000 */  nop
    /* 22678 8015C270 21288202 */  addu       $a1, $s4, $v0
    /* 2267C 8015C274 2C00A004 */  bltz       $a1, .L8015C328
    /* 22680 8015C278 21100000 */   addu      $v0, $zero, $zero
    /* 22684 8015C27C 380B020C */  jal        GetSOLID__Fii
    /* 22688 8015C280 21206000 */   addu      $a0, $v1, $zero
    /* 2268C 8015C284 28004014 */  bnez       $v0, .L8015C328
    /* 22690 8015C288 21100000 */   addu      $v0, $zero, $zero
    /* 22694 8015C28C 0000048E */  lw         $a0, 0x0($s0)
    /* 22698 8015C290 0000238E */  lw         $v1, 0x0($s1)
    /* 2269C 8015C294 21208402 */  addu       $a0, $s4, $a0
    /* 226A0 8015C298 C0200400 */  sll        $a0, $a0, 3
    /* 226A4 8015C29C 21186302 */  addu       $v1, $s3, $v1
    /* 226A8 8015C2A0 C0100300 */  sll        $v0, $v1, 3
    /* 226AC 8015C2A4 23104300 */  subu       $v0, $v0, $v1
    /* 226B0 8015C2A8 C0110200 */  sll        $v0, $v0, 7
    /* 226B4 8015C2AC 21208200 */  addu       $a0, $a0, $v0
    /* 226B8 8015C2B0 C0101600 */  sll        $v0, $s6, 3
    /* 226BC 8015C2B4 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 226C0 8015C2B8 21082400 */  addu       $at, $at, $a0
    /* 226C4 8015C2BC 2F7A2380 */  lb         $v1, %lo(dung_map + 0x7)($at)
    /* 226C8 8015C2C0 1080013C */  lui        $at, %hi(theme + 0x4)
    /* 226CC 8015C2C4 21082200 */  addu       $at, $at, $v0
    /* 226D0 8015C2C8 4C28228C */  lw         $v0, %lo(theme + 0x4)($at)
    /* 226D4 8015C2CC 00000000 */  nop
    /* 226D8 8015C2D0 15006214 */  bne        $v1, $v0, .L8015C328
    /* 226DC 8015C2D4 21100000 */   addu      $v0, $zero, $zero
    /* 226E0 8015C2D8 0E80013C */  lui        $at, %hi(dung_map + 0x3)
    /* 226E4 8015C2DC 21082400 */  addu       $at, $at, $a0
    /* 226E8 8015C2E0 2B7A2280 */  lb         $v0, %lo(dung_map + 0x3)($at)
    /* 226EC 8015C2E4 00000000 */  nop
    /* 226F0 8015C2E8 0F004014 */  bnez       $v0, .L8015C328
    /* 226F4 8015C2EC 21100000 */   addu      $v0, $zero, $zero
    /* 226F8 8015C2F0 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 226FC 8015C2F4 0700A212 */  beq        $s5, $v0, .L8015C314
    /* 22700 8015C2F8 00000000 */   nop
    /* 22704 8015C2FC C9F6000C */  jal        ENG_random__Fl
    /* 22708 8015C300 2120A002 */   addu      $a0, $s5, $zero
    /* 2270C 8015C304 04004014 */  bnez       $v0, .L8015C318
    /* 22710 8015C308 01005226 */   addiu     $s2, $s2, 0x1
  .L8015C30C:
    /* 22714 8015C30C CA700508 */  j          .L8015C328
    /* 22718 8015C310 21100000 */   addu      $v0, $zero, $zero
  .L8015C314:
    /* 2271C 8015C314 01005226 */  addiu      $s2, $s2, 0x1
  .L8015C318:
    /* 22720 8015C318 0900422A */  slti       $v0, $s2, 0x9
    /* 22724 8015C31C CAFF4014 */  bnez       $v0, .L8015C248
    /* 22728 8015C320 04003126 */   addiu     $s1, $s1, 0x4
    /* 2272C 8015C324 01000224 */  addiu      $v0, $zero, 0x1
  .L8015C328:
    /* 22730 8015C328 2C00BF8F */  lw         $ra, 0x2C($sp)
    /* 22734 8015C32C 2800B68F */  lw         $s6, 0x28($sp)
    /* 22738 8015C330 2400B58F */  lw         $s5, 0x24($sp)
    /* 2273C 8015C334 2000B48F */  lw         $s4, 0x20($sp)
    /* 22740 8015C338 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 22744 8015C33C 1800B28F */  lw         $s2, 0x18($sp)
    /* 22748 8015C340 1400B18F */  lw         $s1, 0x14($sp)
    /* 2274C 8015C344 1000B08F */  lw         $s0, 0x10($sp)
    /* 22750 8015C348 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 22754 8015C34C 0800E003 */  jr         $ra
    /* 22758 8015C350 00000000 */   nop
endlabel CheckThemeObj3__Fiiii
