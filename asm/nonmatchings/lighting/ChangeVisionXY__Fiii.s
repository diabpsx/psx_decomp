.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ChangeVisionXY__Fiii, 0x84

glabel ChangeVisionXY__Fiii
    /* 3D6D0 8004D6D0 F8FFBD27 */  addiu      $sp, $sp, -0x8
    /* 3D6D4 8004D6D4 21588000 */  addu       $t3, $a0, $zero
    /* 3D6D8 8004D6D8 0D80083C */  lui        $t0, %hi(VisionList)
    /* 3D6DC 8004D6DC D0650825 */  addiu      $t0, $t0, %lo(VisionList)
    /* 3D6E0 8004D6E0 9C11828F */  lw         $v0, %gp_rel(numvision)($gp)
    /* 3D6E4 8004D6E4 00000000 */  nop
    /* 3D6E8 8004D6E8 17004018 */  blez       $v0, .L8004D748
    /* 3D6EC 8004D6EC 21480000 */   addu      $t1, $zero, $zero
    /* 3D6F0 8004D6F0 01000A24 */  addiu      $t2, $zero, 0x1
    /* 3D6F4 8004D6F4 01000725 */  addiu      $a3, $t0, 0x1
  .L8004D6F8:
    /* 3D6F8 8004D6F8 0300E280 */  lb         $v0, 0x3($a3)
    /* 3D6FC 8004D6FC 00000000 */  nop
    /* 3D700 8004D700 0B004B14 */  bne        $v0, $t3, .L8004D730
    /* 3D704 8004D704 00000000 */   nop
    /* 3D708 8004D708 0500EAA0 */  sb         $t2, 0x5($a3)
    /* 3D70C 8004D70C 00000291 */  lbu        $v0, 0x0($t0)
    /* 3D710 8004D710 0000E390 */  lbu        $v1, 0x0($a3)
    /* 3D714 8004D714 0100E494 */  lhu        $a0, 0x1($a3)
    /* 3D718 8004D718 0600E2A0 */  sb         $v0, 0x6($a3)
    /* 3D71C 8004D71C 0700E3A0 */  sb         $v1, 0x7($a3)
    /* 3D720 8004D720 0800E4A0 */  sb         $a0, 0x8($a3)
    /* 3D724 8004D724 000005A1 */  sb         $a1, 0x0($t0)
    /* 3D728 8004D728 0000E6A0 */  sb         $a2, 0x0($a3)
    /* 3D72C 8004D72C A0118AA3 */  sb         $t2, %gp_rel(dovision)($gp)
  .L8004D730:
    /* 3D730 8004D730 0E00E724 */  addiu      $a3, $a3, 0xE
    /* 3D734 8004D734 9C11828F */  lw         $v0, %gp_rel(numvision)($gp)
    /* 3D738 8004D738 01002925 */  addiu      $t1, $t1, 0x1
    /* 3D73C 8004D73C 2A102201 */  slt        $v0, $t1, $v0
    /* 3D740 8004D740 EDFF4014 */  bnez       $v0, .L8004D6F8
    /* 3D744 8004D744 0E000825 */   addiu     $t0, $t0, 0xE
  .L8004D748:
    /* 3D748 8004D748 0800BD27 */  addiu      $sp, $sp, 0x8
    /* 3D74C 8004D74C 0800E003 */  jr         $ra
    /* 3D750 8004D750 00000000 */   nop
endlabel ChangeVisionXY__Fiii
