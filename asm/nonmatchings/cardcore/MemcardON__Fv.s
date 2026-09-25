.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MemcardON__Fv, 0x6C

glabel MemcardON__Fv
    /* 954EC 800A54EC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 954F0 800A54F0 1000BFAF */  sw         $ra, 0x10($sp)
    /* 954F4 800A54F4 8D64020C */  jal        STR_pauseall__Fv
    /* 954F8 800A54F8 00000000 */   nop
    /* 954FC 800A54FC D7F3000C */  jal        stream_stop__Fv
    /* 95500 800A5500 00000000 */   nop
    /* 95504 800A5504 47DF010C */  jal        snd_stop_snd__FP4TSnd
    /* 95508 800A5508 21200000 */   addu      $a0, $zero, $zero
    /* 9550C 800A550C 1355020C */  jal        OVR_LoadFrontend__Fv
    /* 95510 800A5510 00000000 */   nop
    /* 95514 800A5514 0A80043C */  lui        $a0, %hi(memcard_event__Fii)
    /* 95518 800A5518 3C528424 */  addiu      $a0, $a0, %lo(memcard_event__Fii)
    /* 9551C 800A551C 0194020C */  jal        init_mem_card__FPFii_vUc
    /* 95520 800A5520 01000524 */   addiu     $a1, $zero, 0x1
    /* 95524 800A5524 45000424 */  addiu      $a0, $zero, 0x45
    /* 95528 800A5528 0A80053C */  lui        $a1, %hi(CardUpdateTask__FP4TASK)
    /* 9552C 800A552C 9854A524 */  addiu      $a1, $a1, %lo(CardUpdateTask__FP4TASK)
    /* 95530 800A5530 00200624 */  addiu      $a2, $zero, 0x2000
    /* 95534 800A5534 0480000C */  jal        TSK_AddTask
    /* 95538 800A5538 21380000 */   addu      $a3, $zero, $zero
    /* 9553C 800A553C 700A82AF */  sw         $v0, %gp_rel(MemcardTask)($gp)
    /* 95540 800A5540 01000224 */  addiu      $v0, $zero, 0x1
    /* 95544 800A5544 E00982AF */  sw         $v0, %gp_rel(MemCardActive)($gp)
    /* 95548 800A5548 1000BF8F */  lw         $ra, 0x10($sp)
    /* 9554C 800A554C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 95550 800A5550 0800E003 */  jr         $ra
    /* 95554 800A5554 00000000 */   nop
endlabel MemcardON__Fv
