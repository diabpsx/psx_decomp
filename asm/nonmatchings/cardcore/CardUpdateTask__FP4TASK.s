.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CardUpdateTask__FP4TASK, 0x54

glabel CardUpdateTask__FP4TASK
    /* 95498 800A5498 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 9549C 800A549C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 954A0 800A54A0 21800000 */  addu       $s0, $zero, $zero
    /* 954A4 800A54A4 1400BFAF */  sw         $ra, 0x14($sp)
  .L800A54A8:
    /* 954A8 800A54A8 04000016 */  bnez       $s0, .L800A54BC
    /* 954AC 800A54AC 21800000 */   addu      $s0, $zero, $zero
    /* 954B0 800A54B0 01001024 */  addiu      $s0, $zero, 0x1
    /* 954B4 800A54B4 30950208 */  j          .L800A54C0
    /* 954B8 800A54B8 21200000 */   addu      $a0, $zero, $zero
  .L800A54BC:
    /* 954BC 800A54BC 01000424 */  addiu      $a0, $zero, 0x1
  .L800A54C0:
    /* 954C0 800A54C0 F594020C */  jal        DealWithCard__Fi
    /* 954C4 800A54C4 00000000 */   nop
    /* 954C8 800A54C8 EE80000C */  jal        TSK_Sleep
    /* 954CC 800A54CC 01000424 */   addiu     $a0, $zero, 0x1
    /* 954D0 800A54D0 2A950208 */  j          .L800A54A8
    /* 954D4 800A54D4 00000000 */   nop
    /* 954D8 800A54D8 1400BF8F */  lw         $ra, 0x14($sp)
    /* 954DC 800A54DC 1000B08F */  lw         $s0, 0x10($sp)
    /* 954E0 800A54E0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 954E4 800A54E4 0800E003 */  jr         $ra
    /* 954E8 800A54E8 00000000 */   nop
endlabel CardUpdateTask__FP4TASK
