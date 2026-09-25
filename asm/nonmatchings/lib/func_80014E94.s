.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching func_80014E94, 0x1C

glabel func_80014E94
    /* 4E94 80014E94 FF07A530 */  andi       $a1, $a1, 0x7FF
    /* 4E98 80014E98 C02A0500 */  sll        $a1, $a1, 11
    /* 4E9C 80014E9C FF078230 */  andi       $v0, $a0, 0x7FF
    /* 4EA0 80014EA0 00E5033C */  lui        $v1, (0xE5000000 >> 16)
    /* 4EA4 80014EA4 25104300 */  or         $v0, $v0, $v1
    /* 4EA8 80014EA8 0800E003 */  jr         $ra
    /* 4EAC 80014EAC 2510A200 */   or        $v0, $a1, $v0
endlabel func_80014E94
