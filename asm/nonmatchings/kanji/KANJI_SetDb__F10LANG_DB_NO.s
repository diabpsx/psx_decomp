.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching KANJI_SetDb__F10LANG_DB_NO, 0x78

glabel KANJI_SetDb__F10LANG_DB_NO
    /* 9D77C 800AD77C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 9D780 800AD780 1400B1AF */  sw         $s1, 0x14($sp)
    /* 9D784 800AD784 21888000 */  addu       $s1, $a0, $zero
    /* 9D788 800AD788 21200000 */  addu       $a0, $zero, $zero
    /* 9D78C 800AD78C 0B80053C */  lui        $a1, %hi(KanjiSetTSK__FP4TASK)
    /* 9D790 800AD790 24D7A524 */  addiu      $a1, $a1, %lo(KanjiSetTSK__FP4TASK)
    /* 9D794 800AD794 00100624 */  addiu      $a2, $zero, 0x1000
    /* 9D798 800AD798 10000724 */  addiu      $a3, $zero, 0x10
    /* 9D79C 800AD79C 1800BFAF */  sw         $ra, 0x18($sp)
    /* 9D7A0 800AD7A0 0480000C */  jal        TSK_AddTask
    /* 9D7A4 800AD7A4 1000B0AF */   sw        $s0, 0x10($sp)
    /* 9D7A8 800AD7A8 21804000 */  addu       $s0, $v0, $zero
    /* 9D7AC 800AD7AC 05000016 */  bnez       $s0, .L800AD7C4
    /* 9D7B0 800AD7B0 21200000 */   addu      $a0, $zero, $zero
    /* 9D7B4 800AD7B4 1180053C */  lui        $a1, %hi(D_80110EE8)
    /* 9D7B8 800AD7B8 E80EA524 */  addiu      $a1, $a1, %lo(D_80110EE8)
    /* 9D7BC 800AD7BC A583000C */  jal        DBG_Error
    /* 9D7C0 800AD7C0 44010624 */   addiu     $a2, $zero, 0x144
  .L800AD7C4:
    /* 9D7C4 800AD7C4 1C00038E */  lw         $v1, 0x1C($s0)
    /* 9D7C8 800AD7C8 01000224 */  addiu      $v0, $zero, 0x1
    /* 9D7CC 800AD7CC 500B80AF */  sw         $zero, %gp_rel(D_8011B2D0)($gp)
    /* 9D7D0 800AD7D0 1280013C */  lui        $at, %hi(CDWAIT)
    /* 9D7D4 800AD7D4 ECAD22AC */  sw         $v0, %lo(CDWAIT)($at)
    /* 9D7D8 800AD7D8 000071AC */  sw         $s1, 0x0($v1)
    /* 9D7DC 800AD7DC 1800BF8F */  lw         $ra, 0x18($sp)
    /* 9D7E0 800AD7E0 1400B18F */  lw         $s1, 0x14($sp)
    /* 9D7E4 800AD7E4 1000B08F */  lw         $s0, 0x10($sp)
    /* 9D7E8 800AD7E8 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 9D7EC 800AD7EC 0800E003 */  jr         $ra
    /* 9D7F0 800AD7F0 00000000 */   nop
endlabel KANJI_SetDb__F10LANG_DB_NO
