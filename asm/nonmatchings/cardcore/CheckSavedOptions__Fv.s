.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CheckSavedOptions__Fv, 0x100

glabel CheckSavedOptions__Fv
    /* 95590 800A5590 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 95594 800A5594 0A80043C */  lui        $a0, %hi(memcard_event__Fii)
    /* 95598 800A5598 3C528424 */  addiu      $a0, $a0, %lo(memcard_event__Fii)
    /* 9559C 800A559C 01000524 */  addiu      $a1, $zero, 0x1
    /* 955A0 800A55A0 1800BFAF */  sw         $ra, 0x18($sp)
    /* 955A4 800A55A4 1400B1AF */  sw         $s1, 0x14($sp)
    /* 955A8 800A55A8 0194020C */  jal        init_mem_card__FPFii_vUc
    /* 955AC 800A55AC 1000B0AF */   sw        $s0, 0x10($sp)
    /* 955B0 800A55B0 45000424 */  addiu      $a0, $zero, 0x45
    /* 955B4 800A55B4 0A80053C */  lui        $a1, %hi(CardUpdateTask__FP4TASK)
    /* 955B8 800A55B8 9854A524 */  addiu      $a1, $a1, %lo(CardUpdateTask__FP4TASK)
    /* 955BC 800A55BC 00200624 */  addiu      $a2, $zero, 0x2000
    /* 955C0 800A55C0 0480000C */  jal        TSK_AddTask
    /* 955C4 800A55C4 21380000 */   addu      $a3, $zero, $zero
    /* 955C8 800A55C8 700A82AF */  sw         $v0, %gp_rel(MemcardTask)($gp)
    /* 955CC 800A55CC 21200000 */  addu       $a0, $zero, $zero
  .L800A55D0:
    /* 955D0 800A55D0 45000524 */  addiu      $a1, $zero, 0x45
    /* 955D4 800A55D4 B681000C */  jal        TSK_Exist
    /* 955D8 800A55D8 FFFF0624 */   addiu     $a2, $zero, -0x1
    /* 955DC 800A55DC 05004014 */  bnez       $v0, .L800A55F4
    /* 955E0 800A55E0 01001124 */   addiu     $s1, $zero, 0x1
    /* 955E4 800A55E4 EE80000C */  jal        TSK_Sleep
    /* 955E8 800A55E8 01000424 */   addiu     $a0, $zero, 0x1
    /* 955EC 800A55EC 74950208 */  j          .L800A55D0
    /* 955F0 800A55F0 21200000 */   addu      $a0, $zero, $zero
  .L800A55F4:
    /* 955F4 800A55F4 1280053C */  lui        $a1, %hi(DiabloOptionFile)
    /* 955F8 800A55F8 14B4A58C */  lw         $a1, %lo(DiabloOptionFile)($a1)
    /* 955FC 800A55FC 800A91AF */  sw         $s1, %gp_rel(card_active)($gp)
    /* 95600 800A5600 6465050C */  jal        func_80159590
    /* 95604 800A5604 21200000 */   addu      $a0, $zero, $zero
    /* 95608 800A5608 FFFF1024 */  addiu      $s0, $zero, -0x1
    /* 9560C 800A560C 08005014 */  bne        $v0, $s0, .L800A5630
    /* 95610 800A5610 21200000 */   addu      $a0, $zero, $zero
    /* 95614 800A5614 1280053C */  lui        $a1, %hi(DiabloOptionFile)
    /* 95618 800A5618 14B4A58C */  lw         $a1, %lo(DiabloOptionFile)($a1)
    /* 9561C 800A561C 840A91AF */  sw         $s1, %gp_rel(card_active + 0x4)($gp)
    /* 95620 800A5620 6465050C */  jal        func_80159590
    /* 95624 800A5624 01000424 */   addiu     $a0, $zero, 0x1
    /* 95628 800A5628 04005010 */  beq        $v0, $s0, .L800A563C
    /* 9562C 800A562C 01000424 */   addiu     $a0, $zero, 0x1
  .L800A5630:
    /* 95630 800A5630 21284000 */  addu       $a1, $v0, $zero
    /* 95634 800A5634 B571050C */  jal        func_8015C6D4
    /* 95638 800A5638 01000624 */   addiu     $a2, $zero, 0x1
  .L800A563C:
    /* 9563C 800A563C 700A848F */  lw         $a0, %gp_rel(MemcardTask)($gp)
    /* 95640 800A5640 5281000C */  jal        TSK_Kill
    /* 95644 800A5644 00000000 */   nop
    /* 95648 800A5648 21200000 */  addu       $a0, $zero, $zero
  .L800A564C:
    /* 9564C 800A564C 45000524 */  addiu      $a1, $zero, 0x45
    /* 95650 800A5650 B681000C */  jal        TSK_Exist
    /* 95654 800A5654 FFFF0624 */   addiu     $a2, $zero, -0x1
    /* 95658 800A5658 05004010 */  beqz       $v0, .L800A5670
    /* 9565C 800A565C 00000000 */   nop
    /* 95660 800A5660 EE80000C */  jal        TSK_Sleep
    /* 95664 800A5664 01000424 */   addiu     $a0, $zero, 0x1
    /* 95668 800A5668 93950208 */  j          .L800A564C
    /* 9566C 800A566C 21200000 */   addu      $a0, $zero, $zero
  .L800A5670:
    /* 95670 800A5670 840A80AF */  sw         $zero, %gp_rel(card_active + 0x4)($gp)
    /* 95674 800A5674 800A80AF */  sw         $zero, %gp_rel(card_active)($gp)
    /* 95678 800A5678 1800BF8F */  lw         $ra, 0x18($sp)
    /* 9567C 800A567C 1400B18F */  lw         $s1, 0x14($sp)
    /* 95680 800A5680 1000B08F */  lw         $s0, 0x10($sp)
    /* 95684 800A5684 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 95688 800A5688 0800E003 */  jr         $ra
    /* 9568C 800A568C 00000000 */   nop
endlabel CheckSavedOptions__Fv
