.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DL2_Cont__FUcUcUcUc, 0x80

glabel DL2_Cont__FUcUcUcUc
    /* B9C0 801455B8 FF008230 */  andi       $v0, $a0, 0xFF
    /* B9C4 801455BC 11004010 */  beqz       $v0, .L80145604
    /* B9C8 801455C0 FF00C230 */   andi      $v0, $a2, 0xFF
    /* B9CC 801455C4 05004010 */  beqz       $v0, .L801455DC
    /* B9D0 801455C8 FF00A230 */   andi      $v0, $a1, 0xFF
    /* B9D4 801455CC 03004010 */  beqz       $v0, .L801455DC
    /* B9D8 801455D0 FF00E230 */   andi      $v0, $a3, 0xFF
    /* B9DC 801455D4 16004014 */  bnez       $v0, .L80145630
    /* B9E0 801455D8 21100000 */   addu      $v0, $zero, $zero
  .L801455DC:
    /* B9E4 801455DC FF008230 */  andi       $v0, $a0, 0xFF
    /* B9E8 801455E0 08004010 */  beqz       $v0, .L80145604
    /* B9EC 801455E4 FF00C230 */   andi      $v0, $a2, 0xFF
    /* B9F0 801455E8 06004010 */  beqz       $v0, .L80145604
    /* B9F4 801455EC FF00A230 */   andi      $v0, $a1, 0xFF
    /* B9F8 801455F0 0F004014 */  bnez       $v0, .L80145630
    /* B9FC 801455F4 01000224 */   addiu     $v0, $zero, 0x1
    /* BA00 801455F8 FF00E230 */  andi       $v0, $a3, 0xFF
    /* BA04 801455FC 0C004014 */  bnez       $v0, .L80145630
    /* BA08 80145600 01000224 */   addiu     $v0, $zero, 0x1
  .L80145604:
    /* BA0C 80145604 FF00A230 */  andi       $v0, $a1, 0xFF
    /* BA10 80145608 08004010 */  beqz       $v0, .L8014562C
    /* BA14 8014560C FF00E230 */   andi      $v0, $a3, 0xFF
    /* BA18 80145610 06004010 */  beqz       $v0, .L8014562C
    /* BA1C 80145614 FF008230 */   andi      $v0, $a0, 0xFF
    /* BA20 80145618 05004014 */  bnez       $v0, .L80145630
    /* BA24 8014561C 01000224 */   addiu     $v0, $zero, 0x1
    /* BA28 80145620 FF00C230 */  andi       $v0, $a2, 0xFF
    /* BA2C 80145624 02004014 */  bnez       $v0, .L80145630
    /* BA30 80145628 01000224 */   addiu     $v0, $zero, 0x1
  .L8014562C:
    /* BA34 8014562C 21100000 */  addu       $v0, $zero, $zero
  .L80145630:
    /* BA38 80145630 0800E003 */  jr         $ra
    /* BA3C 80145634 00000000 */   nop
endlabel DL2_Cont__FUcUcUcUc
