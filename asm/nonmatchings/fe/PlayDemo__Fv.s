.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PlayDemo__Fv, 0x14

glabel PlayDemo__Fv
    /* 2608 8013C200 01000224 */  addiu      $v0, $zero, 0x1
    /* 260C 8013C204 1280013C */  lui        $at, %hi(PlayDemoFlag)
    /* 2610 8013C208 81AC22A0 */  sb         $v0, %lo(PlayDemoFlag)($at)
    /* 2614 8013C20C 0800E003 */  jr         $ra
    /* 2618 8013C210 00000000 */   nop
endlabel PlayDemo__Fv
