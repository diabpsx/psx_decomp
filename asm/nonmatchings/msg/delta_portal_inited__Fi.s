.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching delta_portal_inited__Fi, 0x24

glabel delta_portal_inited__Fi
    /* 3F2F0 8004F2F0 80100400 */  sll        $v0, $a0, 2
    /* 3F2F4 8004F2F4 21104400 */  addu       $v0, $v0, $a0
    /* 3F2F8 8004F2F8 1380013C */  lui        $at, %hi(D_8012EDD8)
    /* 3F2FC 8004F2FC 21082200 */  addu       $at, $at, $v0
    /* 3F300 8004F300 D8ED2290 */  lbu        $v0, %lo(D_8012EDD8)($at)
    /* 3F304 8004F304 00000000 */  nop
    /* 3F308 8004F308 FF004238 */  xori       $v0, $v0, 0xFF
    /* 3F30C 8004F30C 0800E003 */  jr         $ra
    /* 3F310 8004F310 0100422C */   sltiu     $v0, $v0, 0x1
endlabel delta_portal_inited__Fi
