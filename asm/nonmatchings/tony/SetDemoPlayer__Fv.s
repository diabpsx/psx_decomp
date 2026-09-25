.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetDemoPlayer__Fv, 0x30

glabel SetDemoPlayer__Fv
    /* 8B4BC 8009B4BC 00960234 */  ori        $v0, $zero, 0x9600
    /* 8B4C0 8009B4C0 0E80013C */  lui        $at, %hi(plr + 0x11C)
    /* 8B4C4 8009B4C4 54A622AC */  sw         $v0, %lo(plr + 0x11C)($at)
    /* 8B4C8 8009B4C8 0E80013C */  lui        $at, %hi(plr + 0x120)
    /* 8B4CC 8009B4CC 58A622AC */  sw         $v0, %lo(plr + 0x120)($at)
    /* 8B4D0 8009B4D0 004B0224 */  addiu      $v0, $zero, 0x4B00
    /* 8B4D4 8009B4D4 0E80013C */  lui        $at, %hi(plr + 0x130)
    /* 8B4D8 8009B4D8 68A622AC */  sw         $v0, %lo(plr + 0x130)($at)
    /* 8B4DC 8009B4DC 0E80013C */  lui        $at, %hi(plr + 0x134)
    /* 8B4E0 8009B4E0 6CA622AC */  sw         $v0, %lo(plr + 0x134)($at)
    /* 8B4E4 8009B4E4 0800E003 */  jr         $ra
    /* 8B4E8 8009B4E8 00000000 */   nop
endlabel SetDemoPlayer__Fv
