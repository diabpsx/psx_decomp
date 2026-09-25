.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching NextPrim, 0x1C

glabel NextPrim
    /* 3110 80013110 FF00033C */  lui        $v1, (0xFFFFFF >> 16)
    /* 3114 80013114 0000828C */  lw         $v0, 0x0($a0)
    /* 3118 80013118 FFFF6334 */  ori        $v1, $v1, (0xFFFFFF & 0xFFFF)
    /* 311C 8001311C 24104300 */  and        $v0, $v0, $v1
    /* 3120 80013120 0080033C */  lui        $v1, (0x80000000 >> 16)
    /* 3124 80013124 0800E003 */  jr         $ra
    /* 3128 80013128 25104300 */   or        $v0, $v0, $v1
endlabel NextPrim
