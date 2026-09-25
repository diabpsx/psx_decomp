.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetPolyG4, 0x14

glabel SetPolyG4
    /* 32C4 800132C4 08000224 */  addiu      $v0, $zero, 0x8
    /* 32C8 800132C8 030082A0 */  sb         $v0, 0x3($a0)
    /* 32CC 800132CC 38000224 */  addiu      $v0, $zero, 0x38
    /* 32D0 800132D0 0800E003 */  jr         $ra
    /* 32D4 800132D4 070082A0 */   sb        $v0, 0x7($a0)
endlabel SetPolyG4
