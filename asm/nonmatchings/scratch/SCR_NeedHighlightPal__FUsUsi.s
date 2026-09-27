.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SCR_NeedHighlightPal__FUsUsi, 0x34

glabel SCR_NeedHighlightPal__FUsUsi
    /* 8AD30 8009AD30 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 8AD34 8009AD34 1000BFAF */  sw         $ra, 0x10($sp)
    /* 8AD38 8009AD38 2138C000 */  addu       $a3, $a2, $zero
    /* 8AD3C 8009AD3C FFFF8230 */  andi       $v0, $a0, 0xFFFF
    /* 8AD40 8009AD40 FFFFA630 */  andi       $a2, $a1, 0xFFFF
    /* 8AD44 8009AD44 0D80043C */  lui        $a0, %hi(ThePals)
    /* 8AD48 8009AD48 ACBD8424 */  addiu      $a0, $a0, %lo(ThePals)
    /* 8AD4C 8009AD4C FC6B020C */  jal        GetHighlightPal__13PalCollectionUsUsi
    /* 8AD50 8009AD50 21284000 */   addu      $a1, $v0, $zero
    /* 8AD54 8009AD54 1000BF8F */  lw         $ra, 0x10($sp)
    /* 8AD58 8009AD58 FFFF4230 */  andi       $v0, $v0, 0xFFFF
    /* 8AD5C 8009AD5C 0800E003 */  jr         $ra
    /* 8AD60 8009AD60 1800BD27 */   addiu     $sp, $sp, 0x18
endlabel SCR_NeedHighlightPal__FUsUsi
