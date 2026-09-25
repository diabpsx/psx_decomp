.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetRGB__6DialogUcUcUc_800a4248, 0x20

glabel SetRGB__6DialogUcUcUc_800a4248
    /* 94248 800A4248 1280013C */  lui        $at, %hi(DialogRed)
    /* 9424C 800A424C FDAB25A0 */  sb         $a1, %lo(DialogRed)($at)
    /* 94250 800A4250 1280013C */  lui        $at, %hi(DialogGreen)
    /* 94254 800A4254 FEAB26A0 */  sb         $a2, %lo(DialogGreen)($at)
    /* 94258 800A4258 1280013C */  lui        $at, %hi(DialogBlue)
    /* 9425C 800A425C FFAB27A0 */  sb         $a3, %lo(DialogBlue)($at)
    /* 94260 800A4260 0800E003 */  jr         $ra
    /* 94264 800A4264 00000000 */   nop
endlabel SetRGB__6DialogUcUcUc_800a4248
