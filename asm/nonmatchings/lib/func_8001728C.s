.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching func_8001728C, 0x28

glabel func_8001728C
    /* 728C 8001728C 0B80043C */  lui        $a0, %hi(D_800B5A60)
    /* 7290 80017290 605A848C */  lw         $a0, %lo(D_800B5A60)($a0)
    /* 7294 80017294 FFF0033C */  lui        $v1, (0xF0FFFFFF >> 16)
    /* 7298 80017298 0000828C */  lw         $v0, 0x0($a0)
    /* 729C 8001729C FFFF6334 */  ori        $v1, $v1, (0xF0FFFFFF & 0xFFFF)
    /* 72A0 800172A0 24104300 */  and        $v0, $v0, $v1
    /* 72A4 800172A4 0022033C */  lui        $v1, (0x22000000 >> 16)
    /* 72A8 800172A8 25104300 */  or         $v0, $v0, $v1
    /* 72AC 800172AC 0800E003 */  jr         $ra
    /* 72B0 800172B0 000082AC */   sw        $v0, 0x0($a0)
endlabel func_8001728C
