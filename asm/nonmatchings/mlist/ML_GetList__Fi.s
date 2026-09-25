.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ML_GetList__Fi, 0x80

glabel ML_GetList__Fi
    /* 6D630 8007D630 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 6D634 8007D634 1000B0AF */  sw         $s0, 0x10($sp)
    /* 6D638 8007D638 21808000 */  addu       $s0, $a0, $zero
    /* 6D63C 8007D63C FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 6D640 8007D640 16000012 */  beqz       $s0, .L8007D69C
    /* 6D644 8007D644 1400BFAF */   sw        $ra, 0x14($sp)
    /* 6D648 8007D648 FFFF1026 */  addiu      $s0, $s0, -0x1
    /* 6D64C 8007D64C 1000022A */  slti       $v0, $s0, 0x10
    /* 6D650 8007D650 05004014 */  bnez       $v0, .L8007D668
    /* 6D654 8007D654 21200000 */   addu      $a0, $zero, $zero
    /* 6D658 8007D658 1280053C */  lui        $a1, %hi(D_80118D78)
    /* 6D65C 8007D65C 788DA524 */  addiu      $a1, $a1, %lo(D_80118D78)
    /* 6D660 8007D660 A583000C */  jal        DBG_Error
    /* 6D664 8007D664 5D000624 */   addiu     $a2, $zero, 0x5D
  .L8007D668:
    /* 6D668 8007D668 1280023C */  lui        $v0, %hi(setlevel)
    /* 6D66C 8007D66C 0EC14290 */  lbu        $v0, %lo(setlevel)($v0)
    /* 6D670 8007D670 00000000 */  nop
    /* 6D674 8007D674 06004014 */  bnez       $v0, .L8007D690
    /* 6D678 8007D678 00000000 */   nop
    /* 6D67C 8007D67C 0E80013C */  lui        $at, %hi(MlTab)
    /* 6D680 8007D680 21083000 */  addu       $at, $at, $s0
    /* 6D684 8007D684 C4392280 */  lb         $v0, %lo(MlTab)($at)
    /* 6D688 8007D688 A7F50108 */  j          .L8007D69C
    /* 6D68C 8007D68C 00000000 */   nop
  .L8007D690:
    /* 6D690 8007D690 0E80013C */  lui        $at, %hi(QlTab)
    /* 6D694 8007D694 21083000 */  addu       $at, $at, $s0
    /* 6D698 8007D698 D4392280 */  lb         $v0, %lo(QlTab)($at)
  .L8007D69C:
    /* 6D69C 8007D69C 1400BF8F */  lw         $ra, 0x14($sp)
    /* 6D6A0 8007D6A0 1000B08F */  lw         $s0, 0x10($sp)
    /* 6D6A4 8007D6A4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 6D6A8 8007D6A8 0800E003 */  jr         $ra
    /* 6D6AC 8007D6AC 00000000 */   nop
endlabel ML_GetList__Fi
