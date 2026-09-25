.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching read_card_block__Fii, 0x48

glabel read_card_block__Fii
    /* 956C8 800A56C8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 956CC 800A56CC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 956D0 800A56D0 21808000 */  addu       $s0, $a0, $zero
    /* 956D4 800A56D4 0D80063C */  lui        $a2, %hi(block_buf)
    /* 956D8 800A56D8 E8C7C624 */  addiu      $a2, $a2, %lo(block_buf)
    /* 956DC 800A56DC 1400BFAF */  sw         $ra, 0x14($sp)
    /* 956E0 800A56E0 F769000C */  jal        _card_read
    /* 956E4 800A56E4 00211000 */   sll       $a0, $s0, 4
    /* 956E8 800A56E8 FB69000C */  jal        _card_wait
    /* 956EC 800A56EC 21200002 */   addu      $a0, $s0, $zero
    /* 956F0 800A56F0 C495020C */  jal        test_hw_event__Fv
    /* 956F4 800A56F4 00000000 */   nop
    /* 956F8 800A56F8 0100422C */  sltiu      $v0, $v0, 0x1
    /* 956FC 800A56FC 1400BF8F */  lw         $ra, 0x14($sp)
    /* 95700 800A5700 1000B08F */  lw         $s0, 0x10($sp)
    /* 95704 800A5704 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 95708 800A5708 0800E003 */  jr         $ra
    /* 9570C 800A570C 00000000 */   nop
endlabel read_card_block__Fii
