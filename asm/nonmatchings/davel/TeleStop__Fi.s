.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TeleStop__Fi, 0x2C

glabel TeleStop__Fi
    /* 9040C 800A040C C0100400 */  sll        $v0, $a0, 3
    /* 90410 800A0410 21104400 */  addu       $v0, $v0, $a0
    /* 90414 800A0414 C0100200 */  sll        $v0, $v0, 3
    /* 90418 800A0418 0D80013C */  lui        $at, %hi(SpellFXDat + 0x8)
    /* 9041C 800A041C 21082200 */  addu       $at, $at, $v0
    /* 90420 800A0420 E4C620AC */  sw         $zero, %lo(SpellFXDat + 0x8)($at)
    /* 90424 800A0424 0D80013C */  lui        $at, %hi(SpellFXDat + 0x40)
    /* 90428 800A0428 21082200 */  addu       $at, $at, $v0
    /* 9042C 800A042C 1CC720AC */  sw         $zero, %lo(SpellFXDat + 0x40)($at)
    /* 90430 800A0430 0800E003 */  jr         $ra
    /* 90434 800A0434 00000000 */   nop
endlabel TeleStop__Fi
