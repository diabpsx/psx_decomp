.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetScrXY__FPiT0, 0xD0

glabel GetScrXY__FPiT0
    /* 9F1BC 800AF1BC C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 9F1C0 800AF1C0 3000B4AF */  sw         $s4, 0x30($sp)
    /* 9F1C4 800AF1C4 21A08000 */  addu       $s4, $a0, $zero
    /* 9F1C8 800AF1C8 3400B5AF */  sw         $s5, 0x34($sp)
    /* 9F1CC 800AF1CC 21A8A000 */  addu       $s5, $a1, $zero
    /* 9F1D0 800AF1D0 3800BFAF */  sw         $ra, 0x38($sp)
    /* 9F1D4 800AF1D4 2C00B3AF */  sw         $s3, 0x2C($sp)
    /* 9F1D8 800AF1D8 2800B2AF */  sw         $s2, 0x28($sp)
    /* 9F1DC 800AF1DC 2400B1AF */  sw         $s1, 0x24($sp)
    /* 9F1E0 800AF1E0 7B46020C */  jal        BL_GetCurrentBlocks__Fv
    /* 9F1E4 800AF1E4 2000B0AF */   sw        $s0, 0x20($sp)
    /* 9F1E8 800AF1E8 21984000 */  addu       $s3, $v0, $zero
    /* 9F1EC 800AF1EC 1D006012 */  beqz       $s3, .L800AF264
    /* 9F1F0 800AF1F0 00000000 */   nop
    /* 9F1F4 800AF1F4 0000908E */  lw         $s0, 0x0($s4)
    /* 9F1F8 800AF1F8 0000B18E */  lw         $s1, 0x0($s5)
    /* 9F1FC 800AF1FC 21200002 */  addu       $a0, $s0, $zero
    /* 9F200 800AF200 4ABC020C */  jal        GetXOff__Fii
    /* 9F204 800AF204 21282002 */   addu      $a1, $s1, $zero
    /* 9F208 800AF208 21200002 */  addu       $a0, $s0, $zero
    /* 9F20C 800AF20C 21282002 */  addu       $a1, $s1, $zero
    /* 9F210 800AF210 5CBC020C */  jal        GetYOff__Fii
    /* 9F214 800AF214 21904000 */   addu      $s2, $v0, $zero
    /* 9F218 800AF218 21206002 */  addu       $a0, $s3, $zero
    /* 9F21C 800AF21C 1800A527 */  addiu      $a1, $sp, 0x18
    /* 9F220 800AF220 C3801000 */  sra        $s0, $s0, 3
    /* 9F224 800AF224 C3881100 */  sra        $s1, $s1, 3
    /* 9F228 800AF228 80301000 */  sll        $a2, $s0, 2
    /* 9F22C 800AF22C 2130D000 */  addu       $a2, $a2, $s0
    /* 9F230 800AF230 80381100 */  sll        $a3, $s1, 2
    /* 9F234 800AF234 2138F100 */  addu       $a3, $a3, $s1
    /* 9F238 800AF238 80300600 */  sll        $a2, $a2, 2
    /* 9F23C 800AF23C 80380700 */  sll        $a3, $a3, 2
    /* 9F240 800AF240 1000B2AF */  sw         $s2, 0x10($sp)
    /* 9F244 800AF244 1746020C */  jal        GetScrXY__7CBlocksR4RECTiiii
    /* 9F248 800AF248 1400A2AF */   sw        $v0, 0x14($sp)
    /* 9F24C 800AF24C 1800A287 */  lh         $v0, 0x18($sp)
    /* 9F250 800AF250 00000000 */  nop
    /* 9F254 800AF254 000082AE */  sw         $v0, 0x0($s4)
    /* 9F258 800AF258 1A00A287 */  lh         $v0, 0x1A($sp)
    /* 9F25C 800AF25C 00000000 */  nop
    /* 9F260 800AF260 0000A2AE */  sw         $v0, 0x0($s5)
  .L800AF264:
    /* 9F264 800AF264 3800BF8F */  lw         $ra, 0x38($sp)
    /* 9F268 800AF268 3400B58F */  lw         $s5, 0x34($sp)
    /* 9F26C 800AF26C 3000B48F */  lw         $s4, 0x30($sp)
    /* 9F270 800AF270 2C00B38F */  lw         $s3, 0x2C($sp)
    /* 9F274 800AF274 2800B28F */  lw         $s2, 0x28($sp)
    /* 9F278 800AF278 2400B18F */  lw         $s1, 0x24($sp)
    /* 9F27C 800AF27C 2000B08F */  lw         $s0, 0x20($sp)
    /* 9F280 800AF280 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 9F284 800AF284 0800E003 */  jr         $ra
    /* 9F288 800AF288 00000000 */   nop
endlabel GetScrXY__FPiT0
