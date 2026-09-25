.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetFrNum__C15CCreatureActionii, 0x30

glabel GetFrNum__C15CCreatureActionii
    /* 841B8 800941B8 21288500 */  addu       $a1, $a0, $a1
    /* 841BC 800941BC 0400A290 */  lbu        $v0, 0x4($a1)
    /* 841C0 800941C0 03008390 */  lbu        $v1, 0x3($a0)
    /* 841C4 800941C4 02110200 */  srl        $v0, $v0, 4
    /* 841C8 800941C8 18004300 */  mult       $v0, $v1
    /* 841CC 800941CC 21308600 */  addu       $a2, $a0, $a2
    /* 841D0 800941D0 0C00C290 */  lbu        $v0, 0xC($a2)
    /* 841D4 800941D4 00008394 */  lhu        $v1, 0x0($a0)
    /* 841D8 800941D8 12380000 */  mflo       $a3
    /* 841DC 800941DC 2110E200 */  addu       $v0, $a3, $v0
    /* 841E0 800941E0 0800E003 */  jr         $ra
    /* 841E4 800941E4 21104300 */   addu      $v0, $v0, $v1
endlabel GetFrNum__C15CCreatureActionii
