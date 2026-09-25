.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetQSpell__Fiii, 0x20

glabel SetQSpell__Fiii
    /* 909DC 800A09DC 1280013C */  lui        $at, %hi(QSpell)
    /* 909E0 800A09E0 21082400 */  addu       $at, $at, $a0
    /* 909E4 800A09E4 20B125A0 */  sb         $a1, %lo(QSpell)($at)
    /* 909E8 800A09E8 1280013C */  lui        $at, %hi(_spltotype)
    /* 909EC 800A09EC 21082400 */  addu       $at, $at, $a0
    /* 909F0 800A09F0 24B126A0 */  sb         $a2, %lo(_spltotype)($at)
    /* 909F4 800A09F4 0800E003 */  jr         $ra
    /* 909F8 800A09F8 00000000 */   nop
endlabel SetQSpell__Fiii
