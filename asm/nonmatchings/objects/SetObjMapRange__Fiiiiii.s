.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetObjMapRange__Fiiiiii, 0x60

glabel SetObjMapRange__Fiiiiii
    /* 43A70 80053A70 40100400 */  sll        $v0, $a0, 1
    /* 43A74 80053A74 21104400 */  addu       $v0, $v0, $a0
    /* 43A78 80053A78 80100200 */  sll        $v0, $v0, 2
    /* 43A7C 80053A7C 23104400 */  subu       $v0, $v0, $a0
    /* 43A80 80053A80 1000A38F */  lw         $v1, 0x10($sp)
    /* 43A84 80053A84 1400A48F */  lw         $a0, 0x14($sp)
    /* 43A88 80053A88 80100200 */  sll        $v0, $v0, 2
    /* 43A8C 80053A8C 0E80013C */  lui        $at, %hi(object + 0xE)
    /* 43A90 80053A90 21082200 */  addu       $at, $at, $v0
    /* 43A94 80053A94 5A8C25A4 */  sh         $a1, %lo(object + 0xE)($at)
    /* 43A98 80053A98 0E80013C */  lui        $at, %hi(object + 0x10)
    /* 43A9C 80053A9C 21082200 */  addu       $at, $at, $v0
    /* 43AA0 80053AA0 5C8C26A4 */  sh         $a2, %lo(object + 0x10)($at)
    /* 43AA4 80053AA4 0E80013C */  lui        $at, %hi(object + 0x12)
    /* 43AA8 80053AA8 21082200 */  addu       $at, $at, $v0
    /* 43AAC 80053AAC 5E8C27A4 */  sh         $a3, %lo(object + 0x12)($at)
    /* 43AB0 80053AB0 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 43AB4 80053AB4 21082200 */  addu       $at, $at, $v0
    /* 43AB8 80053AB8 608C23A4 */  sh         $v1, %lo(object + 0x14)($at)
    /* 43ABC 80053ABC 0E80013C */  lui        $at, %hi(object + 0x1C)
    /* 43AC0 80053AC0 21082200 */  addu       $at, $at, $v0
    /* 43AC4 80053AC4 688C24A4 */  sh         $a0, %lo(object + 0x1C)($at)
    /* 43AC8 80053AC8 0800E003 */  jr         $ra
    /* 43ACC 80053ACC 00000000 */   nop
endlabel SetObjMapRange__Fiiiiii
