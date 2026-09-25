.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PhaseEnd__Fi, 0x2C

glabel PhaseEnd__Fi
    /* 9046C 800A046C C0100400 */  sll        $v0, $a0, 3
    /* 90470 800A0470 21104400 */  addu       $v0, $v0, $a0
    /* 90474 800A0474 C0100200 */  sll        $v0, $v0, 3
    /* 90478 800A0478 0D80013C */  lui        $at, %hi(SpellFXDat + 0xC)
    /* 9047C 800A047C 21082200 */  addu       $at, $at, $v0
    /* 90480 800A0480 E8C620AC */  sw         $zero, %lo(SpellFXDat + 0xC)($at)
    /* 90484 800A0484 0D80013C */  lui        $at, %hi(SpellFXDat + 0x10)
    /* 90488 800A0488 21082200 */  addu       $at, $at, $v0
    /* 9048C 800A048C ECC620AC */  sw         $zero, %lo(SpellFXDat + 0x10)($at)
    /* 90490 800A0490 0800E003 */  jr         $ra
    /* 90494 800A0494 00000000 */   nop
endlabel PhaseEnd__Fi
