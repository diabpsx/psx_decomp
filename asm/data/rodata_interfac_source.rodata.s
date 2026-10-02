.include "macro.inc"

.section .rodata, "a"

.align 2
nonmatching D_8011135C

dlabel D_8011135C
    /* 10135C 8011135C */ .asciz "OLD uMSG WM_DIABLOADGAME"
.align 2
.align 2
    /* 101378 80111378 */ .asciz ""
.align 2
enddlabel D_8011135C

.align 3
nonmatching jtbl_8011137C

dlabel jtbl_8011137C
    /* 10137C 8011137C E8DE0380 */ .word .L8003DEE8
    /* 101380 80111380 2CDF0380 */ .word .L8003DF2C
    /* 101384 80111384 A8DF0380 */ .word .L8003DFA8
    /* 101388 80111388 70DF0380 */ .word .L8003DF70
    /* 10138C 8011138C CCDF0380 */ .word .L8003DFCC
    /* 101390 80111390 E8DF0380 */ .word .L8003DFE8
    /* 101394 80111394 4CE00380 */ .word .L8003E04C
    /* 101398 80111398 B0E00380 */ .word .L8003E0B0
    /* 10139C 8011139C D4DE0380 */ .word .L8003DED4
    /* 1013A0 801113A0 BCDE0380 */ .word .L8003DEBC
enddlabel jtbl_8011137C
