.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CatPrim, 0x24

glabel CatPrim
    /* 31C0 800131C0 FF00063C */  lui        $a2, (0xFFFFFF >> 16)
    /* 31C4 800131C4 FFFFC634 */  ori        $a2, $a2, (0xFFFFFF & 0xFFFF)
    /* 31C8 800131C8 00FF033C */  lui        $v1, (0xFF000000 >> 16)
    /* 31CC 800131CC 0000828C */  lw         $v0, 0x0($a0)
    /* 31D0 800131D0 2428A600 */  and        $a1, $a1, $a2
    /* 31D4 800131D4 24104300 */  and        $v0, $v0, $v1
    /* 31D8 800131D8 25104500 */  or         $v0, $v0, $a1
    /* 31DC 800131DC 0800E003 */  jr         $ra
    /* 31E0 800131E0 000082AC */   sw        $v0, 0x0($a0)
endlabel CatPrim
