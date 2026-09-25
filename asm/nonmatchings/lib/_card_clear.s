.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching _card_clear, 0x34

glabel _card_clear
    /* A7FC 8001A7FC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* A800 8001A800 1000B0AF */  sw         $s0, 0x10($sp)
    /* A804 8001A804 1400BFAF */  sw         $ra, 0x14($sp)
    /* A808 8001A808 136A000C */  jal        _new_card
    /* A80C 8001A80C 21808000 */   addu      $s0, $a0, $zero
    /* A810 8001A810 21200002 */  addu       $a0, $s0, $zero
    /* A814 8001A814 3F000524 */  addiu      $a1, $zero, 0x3F
    /* A818 8001A818 0F6A000C */  jal        _card_write
    /* A81C 8001A81C 21300000 */   addu      $a2, $zero, $zero
    /* A820 8001A820 1400BF8F */  lw         $ra, 0x14($sp)
    /* A824 8001A824 1000B08F */  lw         $s0, 0x10($sp)
    /* A828 8001A828 0800E003 */  jr         $ra
    /* A82C 8001A82C 1800BD27 */   addiu     $sp, $sp, 0x18
endlabel _card_clear
    /* A830 8001A830 00000000 */  nop
    /* A834 8001A834 00000000 */  nop
    /* A838 8001A838 00000000 */  nop
