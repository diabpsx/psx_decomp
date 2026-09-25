.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching StartRCnt, 0x30

glabel StartRCnt
    /* 110D0 800210D0 FFFF8230 */  andi       $v0, $a0, 0xFFFF
    /* 110D4 800210D4 80200200 */  sll        $a0, $v0, 2
    /* 110D8 800210D8 0B80053C */  lui        $a1, %hi(D_800B6374)
    /* 110DC 800210DC 7463A58C */  lw         $a1, %lo(D_800B6374)($a1)
    /* 110E0 800210E0 0B80013C */  lui        $at, %hi(D_800B637C)
    /* 110E4 800210E4 21082400 */  addu       $at, $at, $a0
    /* 110E8 800210E8 7C63248C */  lw         $a0, %lo(D_800B637C)($at)
    /* 110EC 800210EC 0400A38C */  lw         $v1, 0x4($a1)
    /* 110F0 800210F0 03004228 */  slti       $v0, $v0, 0x3
    /* 110F4 800210F4 25186400 */  or         $v1, $v1, $a0
    /* 110F8 800210F8 0800E003 */  jr         $ra
    /* 110FC 800210FC 0400A3AC */   sw        $v1, 0x4($a1)
endlabel StartRCnt
