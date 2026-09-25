.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching RecreateTownItem__FiiUsii, 0x8C

glabel RecreateTownItem__FiiUsii
    /* 3A4B4 8004A4B4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 3A4B8 8004A4B8 0008C230 */  andi       $v0, $a2, 0x800
    /* 3A4BC 8004A4BC 05004010 */  beqz       $v0, .L8004A4D4
    /* 3A4C0 8004A4C0 1000BFAF */   sw        $ra, 0x10($sp)
    /* 3A4C4 8004A4C4 0528010C */  jal        RecreatePremiumItem__Fiiii
    /* 3A4C8 8004A4C8 3F00C630 */   andi      $a2, $a2, 0x3F
    /* 3A4CC 8004A4CC 4C290108 */  j          .L8004A530
    /* 3A4D0 8004A4D0 00000000 */   nop
  .L8004A4D4:
    /* 3A4D4 8004A4D4 0010C230 */  andi       $v0, $a2, 0x1000
    /* 3A4D8 8004A4D8 05004010 */  beqz       $v0, .L8004A4F0
    /* 3A4DC 8004A4DC 0020C230 */   andi      $v0, $a2, 0x2000
    /* 3A4E0 8004A4E0 F728010C */  jal        RecreateBoyItem__Fiiii
    /* 3A4E4 8004A4E4 3F00C630 */   andi      $a2, $a2, 0x3F
    /* 3A4E8 8004A4E8 4C290108 */  j          .L8004A530
    /* 3A4EC 8004A4EC 00000000 */   nop
  .L8004A4F0:
    /* 3A4F0 8004A4F0 05004010 */  beqz       $v0, .L8004A508
    /* 3A4F4 8004A4F4 0040C230 */   andi      $v0, $a2, 0x4000
    /* 3A4F8 8004A4F8 3C28010C */  jal        RecreateWitchItem__Fiiii
    /* 3A4FC 8004A4FC 3F00C630 */   andi      $a2, $a2, 0x3F
    /* 3A500 8004A500 4C290108 */  j          .L8004A530
    /* 3A504 8004A504 00000000 */   nop
  .L8004A508:
    /* 3A508 8004A508 05004010 */  beqz       $v0, .L8004A520
    /* 3A50C 8004A50C 0004C230 */   andi      $v0, $a2, 0x400
    /* 3A510 8004A510 C228010C */  jal        RecreateHealerItem__Fiiii
    /* 3A514 8004A514 3F00C630 */   andi      $a2, $a2, 0x3F
    /* 3A518 8004A518 4C290108 */  j          .L8004A530
    /* 3A51C 8004A51C 00000000 */   nop
  .L8004A520:
    /* 3A520 8004A520 03004010 */  beqz       $v0, .L8004A530
    /* 3A524 8004A524 00000000 */   nop
    /* 3A528 8004A528 9628010C */  jal        RecreateSmithItem__Fiiii
    /* 3A52C 8004A52C 3F00C630 */   andi      $a2, $a2, 0x3F
  .L8004A530:
    /* 3A530 8004A530 1000BF8F */  lw         $ra, 0x10($sp)
    /* 3A534 8004A534 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 3A538 8004A538 0800E003 */  jr         $ra
    /* 3A53C 8004A53C 00000000 */   nop
endlabel RecreateTownItem__FiiUsii
