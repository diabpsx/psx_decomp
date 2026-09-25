.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ProcessFlock__FP10BIRDSTRUCT, 0xF0

glabel ProcessFlock__FP10BIRDSTRUCT
    /* 9C674 800AC674 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 9C678 800AC678 1000B0AF */  sw         $s0, 0x10($sp)
    /* 9C67C 800AC67C 21808000 */  addu       $s0, $a0, $zero
    /* 9C680 800AC680 01000324 */  addiu      $v1, $zero, 0x1
    /* 9C684 800AC684 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 9C688 800AC688 1800B2AF */  sw         $s2, 0x18($sp)
    /* 9C68C 800AC68C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 9C690 800AC690 12000282 */  lb         $v0, 0x12($s0)
    /* 9C694 800AC694 0000058E */  lw         $a1, 0x0($s0)
    /* 9C698 800AC698 2B004314 */  bne        $v0, $v1, .L800AC748
    /* 9C69C 800AC69C 00000000 */   nop
    /* 9C6A0 800AC6A0 1200A380 */  lb         $v1, 0x12($a1)
    /* 9C6A4 800AC6A4 00000000 */  nop
    /* 9C6A8 800AC6A8 03006010 */  beqz       $v1, .L800AC6B8
    /* 9C6AC 800AC6AC 04000224 */   addiu     $v0, $zero, 0x4
    /* 9C6B0 800AC6B0 25006214 */  bne        $v1, $v0, .L800AC748
    /* 9C6B4 800AC6B4 00000000 */   nop
  .L800AC6B8:
    /* 9C6B8 800AC6B8 0C000382 */  lb         $v1, 0xC($s0)
    /* 9C6BC 800AC6BC 13000282 */  lb         $v0, 0x13($s0)
    /* 9C6C0 800AC6C0 1280013C */  lui        $at, %hi(offset_x)
    /* 9C6C4 800AC6C4 21082300 */  addu       $at, $at, $v1
    /* 9C6C8 800AC6C8 A8C23180 */  lb         $s1, %lo(offset_x)($at)
    /* 9C6CC 800AC6CC 00000000 */  nop
    /* 9C6D0 800AC6D0 18002202 */  mult       $s1, $v0
    /* 9C6D4 800AC6D4 12880000 */  mflo       $s1
    /* 9C6D8 800AC6D8 1280013C */  lui        $at, %hi(offset_y)
    /* 9C6DC 800AC6DC 21082300 */  addu       $at, $at, $v1
    /* 9C6E0 800AC6E0 B0C23280 */  lb         $s2, %lo(offset_y)($at)
    /* 9C6E4 800AC6E4 00000000 */  nop
    /* 9C6E8 800AC6E8 18004202 */  mult       $s2, $v0
    /* 9C6EC 800AC6EC 0400A484 */  lh         $a0, 0x4($a1)
    /* 9C6F0 800AC6F0 0600A584 */  lh         $a1, 0x6($a1)
    /* 9C6F4 800AC6F4 04000686 */  lh         $a2, 0x4($s0)
    /* 9C6F8 800AC6F8 06000786 */  lh         $a3, 0x6($s0)
    /* 9C6FC 800AC6FC 2130D100 */  addu       $a2, $a2, $s1
    /* 9C700 800AC700 12900000 */  mflo       $s2
    /* 9C704 800AC704 B9AD020C */  jal        BirdDistanceOK__Fiiii
    /* 9C708 800AC708 2138F200 */   addu      $a3, $a3, $s2
    /* 9C70C 800AC70C FF004230 */  andi       $v0, $v0, 0xFF
    /* 9C710 800AC710 0D004010 */  beqz       $v0, .L800AC748
    /* 9C714 800AC714 00000000 */   nop
    /* 9C718 800AC718 04000486 */  lh         $a0, 0x4($s0)
    /* 9C71C 800AC71C 06000586 */  lh         $a1, 0x6($s0)
    /* 9C720 800AC720 21209100 */  addu       $a0, $a0, $s1
    /* 9C724 800AC724 C3200400 */  sra        $a0, $a0, 3
    /* 9C728 800AC728 2128B200 */  addu       $a1, $a1, $s2
    /* 9C72C 800AC72C 1383010C */  jal        SolidLoc__Fii
    /* 9C730 800AC730 C3280500 */   sra       $a1, $a1, 3
    /* 9C734 800AC734 FF004230 */  andi       $v0, $v0, 0xFF
    /* 9C738 800AC738 03004014 */  bnez       $v0, .L800AC748
    /* 9C73C 800AC73C 00000000 */   nop
    /* 9C740 800AC740 45B1020C */  jal        BIRD_StartLanding__FP10BIRDSTRUCT
    /* 9C744 800AC744 21200002 */   addu      $a0, $s0, $zero
  .L800AC748:
    /* 9C748 800AC748 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 9C74C 800AC74C 1800B28F */  lw         $s2, 0x18($sp)
    /* 9C750 800AC750 1400B18F */  lw         $s1, 0x14($sp)
    /* 9C754 800AC754 1000B08F */  lw         $s0, 0x10($sp)
    /* 9C758 800AC758 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 9C75C 800AC75C 0800E003 */  jr         $ra
    /* 9C760 800AC760 00000000 */   nop
endlabel ProcessFlock__FP10BIRDSTRUCT
