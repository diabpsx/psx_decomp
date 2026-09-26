.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CheckBlock__Fiiii, 0xB4

glabel CheckBlock__Fiiii
    /* 604 8013A1FC D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 608 8013A200 1000B0AF */  sw         $s0, 0x10($sp)
    /* 60C 8013A204 21808000 */  addu       $s0, $a0, $zero
    /* 610 8013A208 1400B1AF */  sw         $s1, 0x14($sp)
    /* 614 8013A20C 2188A000 */  addu       $s1, $a1, $zero
    /* 618 8013A210 1800B2AF */  sw         $s2, 0x18($sp)
    /* 61C 8013A214 2190C000 */  addu       $s2, $a2, $zero
    /* 620 8013A218 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 624 8013A21C 2198E000 */  addu       $s3, $a3, $zero
    /* 628 8013A220 2000B4AF */  sw         $s4, 0x20($sp)
    /* 62C 8013A224 21A00000 */  addu       $s4, $zero, $zero
    /* 630 8013A228 2400BFAF */  sw         $ra, 0x24($sp)
  .L8013A22C:
    /* 634 8013A22C 03001216 */  bne        $s0, $s2, .L8013A23C
    /* 638 8013A230 21200002 */   addu      $a0, $s0, $zero
    /* 63C 8013A234 15003312 */  beq        $s1, $s3, .L8013A28C
    /* 640 8013A238 21108002 */   addu      $v0, $s4, $zero
  .L8013A23C:
    /* 644 8013A23C 21282002 */  addu       $a1, $s1, $zero
    /* 648 8013A240 21304002 */  addu       $a2, $s2, $zero
    /* 64C 8013A244 8AF6000C */  jal        GetDirection__Fiiii
    /* 650 8013A248 21386002 */   addu      $a3, $s3, $zero
    /* 654 8013A24C 80100200 */  sll        $v0, $v0, 2
    /* 658 8013A250 1080013C */  lui        $at, %hi(XDirAdd)
    /* 65C 8013A254 21082200 */  addu       $at, $at, $v0
    /* 660 8013A258 D829238C */  lw         $v1, %lo(XDirAdd)($at)
    /* 664 8013A25C 1080013C */  lui        $at, %hi(YDirAdd)
    /* 668 8013A260 21082200 */  addu       $at, $at, $v0
    /* 66C 8013A264 F829228C */  lw         $v0, %lo(YDirAdd)($at)
    /* 670 8013A268 21800302 */  addu       $s0, $s0, $v1
    /* 674 8013A26C 21882202 */  addu       $s1, $s1, $v0
    /* 678 8013A270 21200002 */  addu       $a0, $s0, $zero
    /* 67C 8013A274 380B020C */  jal        GetSOLID__Fii
    /* 680 8013A278 21282002 */   addu      $a1, $s1, $zero
    /* 684 8013A27C EBFF4010 */  beqz       $v0, .L8013A22C
    /* 688 8013A280 00000000 */   nop
    /* 68C 8013A284 8BE80408 */  j          .L8013A22C
    /* 690 8013A288 01001424 */   addiu     $s4, $zero, 0x1
  .L8013A28C:
    /* 694 8013A28C 2400BF8F */  lw         $ra, 0x24($sp)
    /* 698 8013A290 2000B48F */  lw         $s4, 0x20($sp)
    /* 69C 8013A294 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 6A0 8013A298 1800B28F */  lw         $s2, 0x18($sp)
    /* 6A4 8013A29C 1400B18F */  lw         $s1, 0x14($sp)
    /* 6A8 8013A2A0 1000B08F */  lw         $s0, 0x10($sp)
    /* 6AC 8013A2A4 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 6B0 8013A2A8 0800E003 */  jr         $ra
    /* 6B4 8013A2AC 00000000 */   nop
endlabel CheckBlock__Fiiii
