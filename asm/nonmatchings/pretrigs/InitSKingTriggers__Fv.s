.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitSKingTriggers__Fv, 0x4C

glabel InitSKingTriggers__Fv
    /* 29000 80162BF8 1280033C */  lui        $v1, %hi(sel_data)
    /* 29004 80162BFC 2CB7638C */  lw         $v1, %lo(sel_data)($v1)
    /* 29008 80162C00 01000224 */  addiu      $v0, $zero, 0x1
    /* 2900C 80162C04 1280013C */  lui        $at, %hi(numtrigs)
    /* 29010 80162C08 78BB22AC */  sw         $v0, %lo(numtrigs)($at)
    /* 29014 80162C0C 52000224 */  addiu      $v0, $zero, 0x52
    /* 29018 80162C10 0E80013C */  lui        $at, %hi(trigs)
    /* 2901C 80162C14 CC3322AC */  sw         $v0, %lo(trigs)($at)
    /* 29020 80162C18 2A000224 */  addiu      $v0, $zero, 0x2A
    /* 29024 80162C1C 0E80013C */  lui        $at, %hi(trigs + 0x4)
    /* 29028 80162C20 D03322AC */  sw         $v0, %lo(trigs + 0x4)($at)
    /* 2902C 80162C24 44000224 */  addiu      $v0, $zero, 0x44
    /* 29030 80162C28 0E80013C */  lui        $at, %hi(trigs + 0x8)
    /* 29034 80162C2C D43322AC */  sw         $v0, %lo(trigs + 0x8)($at)
    /* 29038 80162C30 1280013C */  lui        $at, %hi(_trigflag)
    /* 2903C 80162C34 21082300 */  addu       $at, $at, $v1
    /* 29040 80162C38 74BB20A0 */  sb         $zero, %lo(_trigflag)($at)
    /* 29044 80162C3C 0800E003 */  jr         $ra
    /* 29048 80162C40 00000000 */   nop
endlabel InitSKingTriggers__Fv
