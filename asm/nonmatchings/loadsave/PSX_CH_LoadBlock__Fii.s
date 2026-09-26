.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PSX_CH_LoadBlock__Fii, 0x28

glabel PSX_CH_LoadBlock__Fii
    /* 22790 8015C388 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 22794 8015C38C 1000BFAF */  sw         $ra, 0x10($sp)
    /* 22798 8015C390 1580073C */  lui        $a3, %hi(CharDataStruct)
    /* 2279C 8015C394 F076E724 */  addiu      $a3, $a3, %lo(CharDataStruct)
    /* 227A0 8015C398 860B050C */  jal        read_card_file__FiiiPc
    /* 227A4 8015C39C 01300624 */   addiu     $a2, $zero, 0x3001
    /* 227A8 8015C3A0 1000BF8F */  lw         $ra, 0x10($sp)
    /* 227AC 8015C3A4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 227B0 8015C3A8 0800E003 */  jr         $ra
    /* 227B4 8015C3AC 00000000 */   nop
endlabel PSX_CH_LoadBlock__Fii
