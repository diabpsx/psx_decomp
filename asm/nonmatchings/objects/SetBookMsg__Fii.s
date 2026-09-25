.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetBookMsg__Fii, 0x28

glabel SetBookMsg__Fii
    /* 43AD0 80053AD0 40100400 */  sll        $v0, $a0, 1
    /* 43AD4 80053AD4 21104400 */  addu       $v0, $v0, $a0
    /* 43AD8 80053AD8 80100200 */  sll        $v0, $v0, 2
    /* 43ADC 80053ADC 23104400 */  subu       $v0, $v0, $a0
    /* 43AE0 80053AE0 80100200 */  sll        $v0, $v0, 2
    /* 43AE4 80053AE4 0E80013C */  lui        $at, %hi(object + 0x1A)
    /* 43AE8 80053AE8 21082200 */  addu       $at, $at, $v0
    /* 43AEC 80053AEC 668C25A4 */  sh         $a1, %lo(object + 0x1A)($at)
    /* 43AF0 80053AF0 0800E003 */  jr         $ra
    /* 43AF4 80053AF4 00000000 */   nop
endlabel SetBookMsg__Fii
