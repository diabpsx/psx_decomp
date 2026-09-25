.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching func_80017264, 0x28

glabel func_80017264
    /* 7264 80017264 0B80043C */  lui        $a0, %hi(D_800B5A60)
    /* 7268 80017268 605A848C */  lw         $a0, %lo(D_800B5A60)($a0)
    /* 726C 8001726C FFF0033C */  lui        $v1, (0xF0FFFFFF >> 16)
    /* 7270 80017270 0000828C */  lw         $v0, 0x0($a0)
    /* 7274 80017274 FFFF6334 */  ori        $v1, $v1, (0xF0FFFFFF & 0xFFFF)
    /* 7278 80017278 24104300 */  and        $v0, $v0, $v1
    /* 727C 8001727C 0020033C */  lui        $v1, (0x20000000 >> 16)
    /* 7280 80017280 25104300 */  or         $v0, $v0, $v1
    /* 7284 80017284 0800E003 */  jr         $ra
    /* 7288 80017288 000082AC */   sw        $v0, 0x0($a0)
endlabel func_80017264
