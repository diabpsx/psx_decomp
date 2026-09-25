.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching setjmp, 0x38

glabel setjmp
    /* 36C 8001036C 00009FAC */  sw         $ra, 0x0($a0)
    /* 370 80010370 04009DAC */  sw         $sp, 0x4($a0)
    /* 374 80010374 08009EAC */  sw         $fp, 0x8($a0)
    /* 378 80010378 0C0090AC */  sw         $s0, 0xC($a0)
    /* 37C 8001037C 100091AC */  sw         $s1, 0x10($a0)
    /* 380 80010380 140092AC */  sw         $s2, 0x14($a0)
    /* 384 80010384 180093AC */  sw         $s3, 0x18($a0)
    /* 388 80010388 1C0094AC */  sw         $s4, 0x1C($a0)
    /* 38C 8001038C 200095AC */  sw         $s5, 0x20($a0)
    /* 390 80010390 240096AC */  sw         $s6, 0x24($a0)
    /* 394 80010394 280097AC */  sw         $s7, 0x28($a0)
    /* 398 80010398 2C009CAC */  sw         $gp, 0x2C($a0)
    /* 39C 8001039C 0800E003 */  jr         $ra
    /* 3A0 800103A0 21100000 */   addu      $v0, $zero, $zero
endlabel setjmp
