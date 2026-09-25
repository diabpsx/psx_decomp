.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetInitPadFlag, 0xC

glabel SetInitPadFlag
    /* 1B0C 80011B0C 0B80013C */  lui        $at, %hi(D_800B42BC)
    /* 1B10 80011B10 0800E003 */  jr         $ra
    /* 1B14 80011B14 BC4224AC */   sw        $a0, %lo(D_800B42BC)($at)
endlabel SetInitPadFlag
