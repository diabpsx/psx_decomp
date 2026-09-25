.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetPal__6GPaneli, 0x44

glabel GetPal__6GPaneli
    /* 875CC 800975CC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 875D0 800975D0 1000B0AF */  sw         $s0, 0x10($sp)
    /* 875D4 800975D4 21808000 */  addu       $s0, $a0, $zero
    /* 875D8 800975D8 1400BFAF */  sw         $ra, 0x14($sp)
    /* 875DC 800975DC 1400048E */  lw         $a0, 0x14($s0)
    /* 875E0 800975E0 5B62020C */  jal        GetFr__7TextDati_8009896c
    /* 875E4 800975E4 FFFFA530 */   andi      $a1, $a1, 0xFFFF
    /* 875E8 800975E8 1400048E */  lw         $a0, 0x14($s0)
    /* 875EC 800975EC 06004590 */  lbu        $a1, 0x6($v0)
    /* 875F0 800975F0 5462020C */  jal        GetPal__7TextDati_80098950
    /* 875F4 800975F4 00000000 */   nop
    /* 875F8 800975F8 02004294 */  lhu        $v0, 0x2($v0)
    /* 875FC 800975FC 1400BF8F */  lw         $ra, 0x14($sp)
    /* 87600 80097600 1000B08F */  lw         $s0, 0x10($sp)
    /* 87604 80097604 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 87608 80097608 0800E003 */  jr         $ra
    /* 8760C 8009760C 00000000 */   nop
endlabel GetPal__6GPaneli
