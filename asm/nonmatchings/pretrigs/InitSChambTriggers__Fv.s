.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitSChambTriggers__Fv, 0x4C

glabel InitSChambTriggers__Fv
    /* 2904C 80162C44 1280033C */  lui        $v1, %hi(sel_data)
    /* 29050 80162C48 2CB7638C */  lw         $v1, %lo(sel_data)($v1)
    /* 29054 80162C4C 01000224 */  addiu      $v0, $zero, 0x1
    /* 29058 80162C50 1280013C */  lui        $at, %hi(numtrigs)
    /* 2905C 80162C54 78BB22AC */  sw         $v0, %lo(numtrigs)($at)
    /* 29060 80162C58 46000224 */  addiu      $v0, $zero, 0x46
    /* 29064 80162C5C 0E80013C */  lui        $at, %hi(trigs)
    /* 29068 80162C60 CC3322AC */  sw         $v0, %lo(trigs)($at)
    /* 2906C 80162C64 27000224 */  addiu      $v0, $zero, 0x27
    /* 29070 80162C68 0E80013C */  lui        $at, %hi(trigs + 0x4)
    /* 29074 80162C6C D03322AC */  sw         $v0, %lo(trigs + 0x4)($at)
    /* 29078 80162C70 44000224 */  addiu      $v0, $zero, 0x44
    /* 2907C 80162C74 0E80013C */  lui        $at, %hi(trigs + 0x8)
    /* 29080 80162C78 D43322AC */  sw         $v0, %lo(trigs + 0x8)($at)
    /* 29084 80162C7C 1280013C */  lui        $at, %hi(_trigflag)
    /* 29088 80162C80 21082300 */  addu       $at, $at, $v1
    /* 2908C 80162C84 74BB20A0 */  sb         $zero, %lo(_trigflag)($at)
    /* 29090 80162C88 0800E003 */  jr         $ra
    /* 29094 80162C8C 00000000 */   nop
endlabel InitSChambTriggers__Fv
