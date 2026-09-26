.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetCharHeight__5CFontUc, 0x40

glabel GetCharHeight__5CFontUc
    /* 44E4 8013E0DC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 44E8 8013E0E0 FF00A530 */  andi       $a1, $a1, 0xFF
    /* 44EC 8013E0E4 40280500 */  sll        $a1, $a1, 1
    /* 44F0 8013E0E8 2128A400 */  addu       $a1, $a1, $a0
    /* 44F4 8013E0EC 1000BFAF */  sw         $ra, 0x10($sp)
    /* 44F8 8013E0F0 1402848C */  lw         $a0, 0x214($a0)
    /* 44FC 8013E0F4 0400A594 */  lhu        $a1, 0x4($a1)
    /* 4500 8013E0F8 4FF8040C */  jal        GetFr__7TextDati_8013e13c
    /* 4504 8013E0FC 00000000 */   nop
    /* 4508 8013E100 0800428C */  lw         $v0, 0x8($v0)
    /* 450C 8013E104 00000000 */  nop
    /* 4510 8013E108 42120200 */  srl        $v0, $v0, 9
    /* 4514 8013E10C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 4518 8013E110 FF014230 */  andi       $v0, $v0, 0x1FF
    /* 451C 8013E114 0800E003 */  jr         $ra
    /* 4520 8013E118 1800BD27 */   addiu     $sp, $sp, 0x18
endlabel GetCharHeight__5CFontUc
