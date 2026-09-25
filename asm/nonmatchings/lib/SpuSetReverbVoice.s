.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SpuSetReverbVoice, 0x24

glabel SpuSetReverbVoice
    /* 866C 8001866C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 8670 80018670 1000BFAF */  sw         $ra, 0x10($sp)
    /* 8674 80018674 CC000624 */  addiu      $a2, $zero, 0xCC
    /* 8678 80018678 A761000C */  jal        _SpuSetAnyVoice
    /* 867C 8001867C CD000724 */   addiu     $a3, $zero, 0xCD
    /* 8680 80018680 1000BF8F */  lw         $ra, 0x10($sp)
    /* 8684 80018684 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 8688 80018688 0800E003 */  jr         $ra
    /* 868C 8001868C 00000000 */   nop
endlabel SpuSetReverbVoice
    /* 8690 80018690 00000000 */  nop
    /* 8694 80018694 00000000 */  nop
    /* 8698 80018698 00000000 */  nop
