.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DealWithCard__Fi, 0xC4

glabel DealWithCard__Fi
    /* 953D4 800A53D4 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 953D8 800A53D8 1400B1AF */  sw         $s1, 0x14($sp)
    /* 953DC 800A53DC 21888000 */  addu       $s1, $a0, $zero
    /* 953E0 800A53E0 1000B0AF */  sw         $s0, 0x10($sp)
    /* 953E4 800A53E4 80801100 */  sll        $s0, $s1, 2
    /* 953E8 800A53E8 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 953EC 800A53EC 1800B2AF */  sw         $s2, 0x18($sp)
    /* 953F0 800A53F0 1280013C */  lui        $at, %hi(card_active)
    /* 953F4 800A53F4 21083000 */  addu       $at, $at, $s0
    /* 953F8 800A53F8 00B2228C */  lw         $v0, %lo(card_active)($at)
    /* 953FC 800A53FC 00000000 */  nop
    /* 95400 800A5400 1E004010 */  beqz       $v0, .L800A547C
    /* 95404 800A5404 00000000 */   nop
    /* 95408 800A5408 1280023C */  lui        $v0, %hi(card_status)
    /* 9540C 800A540C DCB34224 */  addiu      $v0, $v0, %lo(card_status)
    /* 95410 800A5410 21900202 */  addu       $s2, $s0, $v0
    /* 95414 800A5414 0000428E */  lw         $v0, 0x0($s2)
    /* 95418 800A5418 1280013C */  lui        $at, %hi(last_card_status)
    /* 9541C 800A541C 21083000 */  addu       $at, $at, $s0
    /* 95420 800A5420 FCB322AC */  sw         $v0, %lo(last_card_status)($at)
    /* 95424 800A5424 D094020C */  jal        ping_card__Fi
    /* 95428 800A5428 00000000 */   nop
    /* 9542C 800A542C 21202002 */  addu       $a0, $s1, $zero
    /* 95430 800A5430 280D050C */  jal        func_801434A0
    /* 95434 800A5434 000042AE */   sw        $v0, 0x0($s2)
    /* 95438 800A5438 EE80000C */  jal        TSK_Sleep
    /* 9543C 800A543C 04000424 */   addiu     $a0, $zero, 0x4
    /* 95440 800A5440 1280023C */  lui        $v0, %hi(new_card_flag)
    /* 95444 800A5444 10B24224 */  addiu      $v0, $v0, %lo(new_card_flag)
    /* 95448 800A5448 21180202 */  addu       $v1, $s0, $v0
    /* 9544C 800A544C 0000628C */  lw         $v0, 0x0($v1)
    /* 95450 800A5450 00000000 */  nop
    /* 95454 800A5454 09004010 */  beqz       $v0, .L800A547C
    /* 95458 800A5458 00000000 */   nop
    /* 9545C 800A545C 1280023C */  lui        $v0, %hi(AlertTxt)
    /* 95460 800A5460 58B4428C */  lw         $v0, %lo(AlertTxt)($v0)
    /* 95464 800A5464 00000000 */  nop
    /* 95468 800A5468 04004014 */  bnez       $v0, .L800A547C
    /* 9546C 800A546C 21202002 */   addu      $a0, $s1, $zero
    /* 95470 800A5470 030D050C */  jal        func_8014340C
    /* 95474 800A5474 000060AC */   sw        $zero, 0x0($v1)
    /* 95478 800A5478 000040AE */  sw         $zero, 0x0($s2)
  .L800A547C:
    /* 9547C 800A547C 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 95480 800A5480 1800B28F */  lw         $s2, 0x18($sp)
    /* 95484 800A5484 1400B18F */  lw         $s1, 0x14($sp)
    /* 95488 800A5488 1000B08F */  lw         $s0, 0x10($sp)
    /* 9548C 800A548C 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 95490 800A5490 0800E003 */  jr         $ra
    /* 95494 800A5494 00000000 */   nop
endlabel DealWithCard__Fi
