.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching StopRCnt, 0x34

glabel StopRCnt
    /* 11100 80021100 FFFF8430 */  andi       $a0, $a0, 0xFFFF
    /* 11104 80021104 80200400 */  sll        $a0, $a0, 2
    /* 11108 80021108 0B80053C */  lui        $a1, %hi(D_800B6374)
    /* 1110C 8002110C 7463A58C */  lw         $a1, %lo(D_800B6374)($a1)
    /* 11110 80021110 0B80023C */  lui        $v0, %hi(D_800B637C)
    /* 11114 80021114 21104400 */  addu       $v0, $v0, $a0
    /* 11118 80021118 7C63428C */  lw         $v0, %lo(D_800B637C)($v0)
    /* 1111C 8002111C 0400A38C */  lw         $v1, 0x4($a1)
    /* 11120 80021120 27100200 */  nor        $v0, $zero, $v0
    /* 11124 80021124 24186200 */  and        $v1, $v1, $v0
    /* 11128 80021128 01000224 */  addiu      $v0, $zero, 0x1
    /* 1112C 8002112C 0800E003 */  jr         $ra
    /* 11130 80021130 0400A3AC */   sw        $v1, 0x4($a1)
endlabel StopRCnt
