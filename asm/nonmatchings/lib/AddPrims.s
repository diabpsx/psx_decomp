.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddPrims, 0x3C

glabel AddPrims
    /* 3184 80013184 FF00073C */  lui        $a3, (0xFFFFFF >> 16)
    /* 3188 80013188 FFFFE734 */  ori        $a3, $a3, (0xFFFFFF & 0xFFFF)
    /* 318C 8001318C 00FF083C */  lui        $t0, (0xFF000000 >> 16)
    /* 3190 80013190 0000C38C */  lw         $v1, 0x0($a2)
    /* 3194 80013194 0000828C */  lw         $v0, 0x0($a0)
    /* 3198 80013198 24186800 */  and        $v1, $v1, $t0
    /* 319C 8001319C 24104700 */  and        $v0, $v0, $a3
    /* 31A0 800131A0 25186200 */  or         $v1, $v1, $v0
    /* 31A4 800131A4 0000C3AC */  sw         $v1, 0x0($a2)
    /* 31A8 800131A8 0000828C */  lw         $v0, 0x0($a0)
    /* 31AC 800131AC 2428A700 */  and        $a1, $a1, $a3
    /* 31B0 800131B0 24104800 */  and        $v0, $v0, $t0
    /* 31B4 800131B4 25104500 */  or         $v0, $v0, $a1
    /* 31B8 800131B8 0800E003 */  jr         $ra
    /* 31BC 800131BC 000082AC */   sw        $v0, 0x0($a0)
endlabel AddPrims
