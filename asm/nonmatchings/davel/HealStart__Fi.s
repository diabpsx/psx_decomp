.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching HealStart__Fi, 0x34

glabel HealStart__Fi
    /* 902E0 800A02E0 C0100400 */  sll        $v0, $a0, 3
    /* 902E4 800A02E4 21104400 */  addu       $v0, $v0, $a0
    /* 902E8 800A02E8 C0100200 */  sll        $v0, $v0, 3
    /* 902EC 800A02EC 01000324 */  addiu      $v1, $zero, 0x1
    /* 902F0 800A02F0 0D80013C */  lui        $at, %hi(SpellFXDat + 0x4)
    /* 902F4 800A02F4 21082200 */  addu       $at, $at, $v0
    /* 902F8 800A02F8 E0C623AC */  sw         $v1, %lo(SpellFXDat + 0x4)($at)
    /* 902FC 800A02FC 14000324 */  addiu      $v1, $zero, 0x14
    /* 90300 800A0300 0D80013C */  lui        $at, %hi(SpellFXDat + 0x44)
    /* 90304 800A0304 21082200 */  addu       $at, $at, $v0
    /* 90308 800A0308 20C723AC */  sw         $v1, %lo(SpellFXDat + 0x44)($at)
    /* 9030C 800A030C 0800E003 */  jr         $ra
    /* 90310 800A0310 00000000 */   nop
endlabel HealStart__Fi
