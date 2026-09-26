.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitPWaterTriggers__Fv, 0x4C

glabel InitPWaterTriggers__Fv
    /* 29098 80162C90 1280033C */  lui        $v1, %hi(sel_data)
    /* 2909C 80162C94 2CB7638C */  lw         $v1, %lo(sel_data)($v1)
    /* 290A0 80162C98 01000224 */  addiu      $v0, $zero, 0x1
    /* 290A4 80162C9C 1280013C */  lui        $at, %hi(numtrigs)
    /* 290A8 80162CA0 78BB22AC */  sw         $v0, %lo(numtrigs)($at)
    /* 290AC 80162CA4 1E000224 */  addiu      $v0, $zero, 0x1E
    /* 290B0 80162CA8 0E80013C */  lui        $at, %hi(trigs)
    /* 290B4 80162CAC CC3322AC */  sw         $v0, %lo(trigs)($at)
    /* 290B8 80162CB0 53000224 */  addiu      $v0, $zero, 0x53
    /* 290BC 80162CB4 0E80013C */  lui        $at, %hi(trigs + 0x4)
    /* 290C0 80162CB8 D03322AC */  sw         $v0, %lo(trigs + 0x4)($at)
    /* 290C4 80162CBC 44000224 */  addiu      $v0, $zero, 0x44
    /* 290C8 80162CC0 0E80013C */  lui        $at, %hi(trigs + 0x8)
    /* 290CC 80162CC4 D43322AC */  sw         $v0, %lo(trigs + 0x8)($at)
    /* 290D0 80162CC8 1280013C */  lui        $at, %hi(_trigflag)
    /* 290D4 80162CCC 21082300 */  addu       $at, $at, $v1
    /* 290D8 80162CD0 74BB20A0 */  sb         $zero, %lo(_trigflag)($at)
    /* 290DC 80162CD4 0800E003 */  jr         $ra
    /* 290E0 80162CD8 00000000 */   nop
endlabel InitPWaterTriggers__Fv
