.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitVPTriggers__Fv, 0x48

glabel InitVPTriggers__Fv
    /* 65018 80075018 1280033C */  lui        $v1, %hi(sel_data)
    /* 6501C 8007501C 2CB7638C */  lw         $v1, %lo(sel_data)($v1)
    /* 65020 80075020 01000224 */  addiu      $v0, $zero, 0x1
    /* 65024 80075024 F81382AF */  sw         $v0, %gp_rel(numtrigs)($gp)
    /* 65028 80075028 23000224 */  addiu      $v0, $zero, 0x23
    /* 6502C 8007502C 0E80013C */  lui        $at, %hi(trigs)
    /* 65030 80075030 CC3322AC */  sw         $v0, %lo(trigs)($at)
    /* 65034 80075034 20000224 */  addiu      $v0, $zero, 0x20
    /* 65038 80075038 0E80013C */  lui        $at, %hi(trigs + 0x4)
    /* 6503C 8007503C D03322AC */  sw         $v0, %lo(trigs + 0x4)($at)
    /* 65040 80075040 44000224 */  addiu      $v0, $zero, 0x44
    /* 65044 80075044 0E80013C */  lui        $at, %hi(trigs + 0x8)
    /* 65048 80075048 D43322AC */  sw         $v0, %lo(trigs + 0x8)($at)
    /* 6504C 8007504C 1280013C */  lui        $at, %hi(_trigflag)
    /* 65050 80075050 21082300 */  addu       $at, $at, $v1
    /* 65054 80075054 74BB20A0 */  sb         $zero, %lo(_trigflag)($at)
    /* 65058 80075058 0800E003 */  jr         $ra
    /* 6505C 8007505C 00000000 */   nop
endlabel InitVPTriggers__Fv
