.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_AreaTrans__FiPUc, 0x90

glabel DRLG_AreaTrans__FiPUc
    /* 2061C 8015A214 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 20620 8015A218 2000B2AF */  sw         $s2, 0x20($sp)
    /* 20624 8015A21C 21908000 */  addu       $s2, $a0, $zero
    /* 20628 8015A220 1800B0AF */  sw         $s0, 0x18($sp)
    /* 2062C 8015A224 2180A000 */  addu       $s0, $a1, $zero
    /* 20630 8015A228 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 20634 8015A22C 21880000 */  addu       $s1, $zero, $zero
    /* 20638 8015A230 1100401A */  blez       $s2, .L8015A278
    /* 2063C 8015A234 2400BFAF */   sw        $ra, 0x24($sp)
  .L8015A238:
    /* 20640 8015A238 00000492 */  lbu        $a0, 0x0($s0)
    /* 20644 8015A23C 01001026 */  addiu      $s0, $s0, 0x1
    /* 20648 8015A240 00000592 */  lbu        $a1, 0x0($s0)
    /* 2064C 8015A244 01001026 */  addiu      $s0, $s0, 0x1
    /* 20650 8015A248 00000692 */  lbu        $a2, 0x0($s0)
    /* 20654 8015A24C 01001026 */  addiu      $s0, $s0, 0x1
    /* 20658 8015A250 00000792 */  lbu        $a3, 0x0($s0)
    /* 2065C 8015A254 3968050C */  jal        DRLG_RectTrans__Fiiii
    /* 20660 8015A258 01001026 */   addiu     $s0, $s0, 0x1
    /* 20664 8015A25C C8198293 */  lbu        $v0, %gp_rel(TransVal)($gp)
    /* 20668 8015A260 01003126 */  addiu      $s1, $s1, 0x1
    /* 2066C 8015A264 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 20670 8015A268 C81982A3 */  sb         $v0, %gp_rel(TransVal)($gp)
    /* 20674 8015A26C 2A103202 */  slt        $v0, $s1, $s2
    /* 20678 8015A270 F1FF4014 */  bnez       $v0, .L8015A238
    /* 2067C 8015A274 00000000 */   nop
  .L8015A278:
    /* 20680 8015A278 C8198293 */  lbu        $v0, %gp_rel(TransVal)($gp)
    /* 20684 8015A27C 00000000 */  nop
    /* 20688 8015A280 01004224 */  addiu      $v0, $v0, 0x1
    /* 2068C 8015A284 C81982A3 */  sb         $v0, %gp_rel(TransVal)($gp)
    /* 20690 8015A288 2400BF8F */  lw         $ra, 0x24($sp)
    /* 20694 8015A28C 2000B28F */  lw         $s2, 0x20($sp)
    /* 20698 8015A290 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 2069C 8015A294 1800B08F */  lw         $s0, 0x18($sp)
    /* 206A0 8015A298 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 206A4 8015A29C 0800E003 */  jr         $ra
    /* 206A8 8015A2A0 00000000 */   nop
endlabel DRLG_AreaTrans__FiPUc
