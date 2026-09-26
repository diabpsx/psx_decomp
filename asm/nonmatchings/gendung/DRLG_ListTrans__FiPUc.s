.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_ListTrans__FiPUc, 0x74

glabel DRLG_ListTrans__FiPUc
    /* 205A8 8015A1A0 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 205AC 8015A1A4 2000B2AF */  sw         $s2, 0x20($sp)
    /* 205B0 8015A1A8 21908000 */  addu       $s2, $a0, $zero
    /* 205B4 8015A1AC 1800B0AF */  sw         $s0, 0x18($sp)
    /* 205B8 8015A1B0 2180A000 */  addu       $s0, $a1, $zero
    /* 205BC 8015A1B4 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 205C0 8015A1B8 21880000 */  addu       $s1, $zero, $zero
    /* 205C4 8015A1BC 0E00401A */  blez       $s2, .L8015A1F8
    /* 205C8 8015A1C0 2400BFAF */   sw        $ra, 0x24($sp)
  .L8015A1C4:
    /* 205CC 8015A1C4 00000492 */  lbu        $a0, 0x0($s0)
    /* 205D0 8015A1C8 01001026 */  addiu      $s0, $s0, 0x1
    /* 205D4 8015A1CC 00000592 */  lbu        $a1, 0x0($s0)
    /* 205D8 8015A1D0 01001026 */  addiu      $s0, $s0, 0x1
    /* 205DC 8015A1D4 00000692 */  lbu        $a2, 0x0($s0)
    /* 205E0 8015A1D8 01001026 */  addiu      $s0, $s0, 0x1
    /* 205E4 8015A1DC 00000792 */  lbu        $a3, 0x0($s0)
    /* 205E8 8015A1E0 01001026 */  addiu      $s0, $s0, 0x1
    /* 205EC 8015A1E4 3968050C */  jal        DRLG_RectTrans__Fiiii
    /* 205F0 8015A1E8 01003126 */   addiu     $s1, $s1, 0x1
    /* 205F4 8015A1EC 2A103202 */  slt        $v0, $s1, $s2
    /* 205F8 8015A1F0 F4FF4014 */  bnez       $v0, .L8015A1C4
    /* 205FC 8015A1F4 00000000 */   nop
  .L8015A1F8:
    /* 20600 8015A1F8 2400BF8F */  lw         $ra, 0x24($sp)
    /* 20604 8015A1FC 2000B28F */  lw         $s2, 0x20($sp)
    /* 20608 8015A200 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 2060C 8015A204 1800B08F */  lw         $s0, 0x18($sp)
    /* 20610 8015A208 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 20614 8015A20C 0800E003 */  jr         $ra
    /* 20618 8015A210 00000000 */   nop
endlabel DRLG_ListTrans__FiPUc
