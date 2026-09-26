.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PSX_OPT_LoadGame__Fiib, 0x5C

glabel PSX_OPT_LoadGame__Fiib
    /* 22ADC 8015C6D4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 22AE0 8015C6D8 1480073C */  lui        $a3, %hi(save_buffer)
    /* 22AE4 8015C6DC EC36E724 */  addiu      $a3, $a3, %lo(save_buffer)
    /* 22AE8 8015C6E0 1400BFAF */  sw         $ra, 0x14($sp)
    /* 22AEC 8015C6E4 1000B0AF */  sw         $s0, 0x10($sp)
    /* 22AF0 8015C6E8 542187AF */  sw         $a3, %gp_rel(D_8011C8D4)($gp)
    /* 22AF4 8015C6EC 860B050C */  jal        read_card_file__FiiiPc
    /* 22AF8 8015C6F0 01300624 */   addiu     $a2, $zero, 0x3001
    /* 22AFC 8015C6F4 21804000 */  addu       $s0, $v0, $zero
    /* 22B00 8015C6F8 08000016 */  bnez       $s0, .L8015C71C
    /* 22B04 8015C6FC 21100002 */   addu      $v0, $s0, $zero
    /* 22B08 8015C700 1472050C */  jal        LoadOptions__Fv
    /* 22B0C 8015C704 00000000 */   nop
    /* 22B10 8015C708 656E050C */  jal        ILoad__Fv
    /* 22B14 8015C70C 00000000 */   nop
    /* 22B18 8015C710 309C020C */  jal        SetLoadedLang__F9LANG_TYPE
    /* 22B1C 8015C714 21204000 */   addu      $a0, $v0, $zero
    /* 22B20 8015C718 21100002 */  addu       $v0, $s0, $zero
  .L8015C71C:
    /* 22B24 8015C71C 1400BF8F */  lw         $ra, 0x14($sp)
    /* 22B28 8015C720 1000B08F */  lw         $s0, 0x10($sp)
    /* 22B2C 8015C724 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 22B30 8015C728 0800E003 */  jr         $ra
    /* 22B34 8015C72C 00000000 */   nop
endlabel PSX_OPT_LoadGame__Fiib
