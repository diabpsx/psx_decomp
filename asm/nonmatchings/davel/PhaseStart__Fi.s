.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PhaseStart__Fi, 0x34

glabel PhaseStart__Fi
    /* 90438 800A0438 C0100400 */  sll        $v0, $a0, 3
    /* 9043C 800A043C 21104400 */  addu       $v0, $v0, $a0
    /* 90440 800A0440 C0100200 */  sll        $v0, $v0, 3
    /* 90444 800A0444 05000324 */  addiu      $v1, $zero, 0x5
    /* 90448 800A0448 0D80013C */  lui        $at, %hi(SpellFXDat + 0xC)
    /* 9044C 800A044C 21082200 */  addu       $at, $at, $v0
    /* 90450 800A0450 E8C623AC */  sw         $v1, %lo(SpellFXDat + 0xC)($at)
    /* 90454 800A0454 1E000324 */  addiu      $v1, $zero, 0x1E
    /* 90458 800A0458 0D80013C */  lui        $at, %hi(SpellFXDat + 0x10)
    /* 9045C 800A045C 21082200 */  addu       $at, $at, $v0
    /* 90460 800A0460 ECC623AC */  sw         $v1, %lo(SpellFXDat + 0x10)($at)
    /* 90464 800A0464 0800E003 */  jr         $ra
    /* 90468 800A0468 00000000 */   nop
endlabel PhaseStart__Fi
