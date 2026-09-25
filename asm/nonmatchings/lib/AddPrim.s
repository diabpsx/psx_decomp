.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddPrim, 0x3C

glabel AddPrim
    /* 3148 80013148 FF00063C */  lui        $a2, (0xFFFFFF >> 16)
    /* 314C 8001314C FFFFC634 */  ori        $a2, $a2, (0xFFFFFF & 0xFFFF)
    /* 3150 80013150 00FF073C */  lui        $a3, (0xFF000000 >> 16)
    /* 3154 80013154 0000A38C */  lw         $v1, 0x0($a1)
    /* 3158 80013158 0000828C */  lw         $v0, 0x0($a0)
    /* 315C 8001315C 24186700 */  and        $v1, $v1, $a3
    /* 3160 80013160 24104600 */  and        $v0, $v0, $a2
    /* 3164 80013164 25186200 */  or         $v1, $v1, $v0
    /* 3168 80013168 0000A3AC */  sw         $v1, 0x0($a1)
    /* 316C 8001316C 0000828C */  lw         $v0, 0x0($a0)
    /* 3170 80013170 2428A600 */  and        $a1, $a1, $a2
    /* 3174 80013174 24104700 */  and        $v0, $v0, $a3
    /* 3178 80013178 25104500 */  or         $v0, $v0, $a1
    /* 317C 8001317C 0800E003 */  jr         $ra
    /* 3180 80013180 000082AC */   sw        $v0, 0x0($a0)
endlabel AddPrim
