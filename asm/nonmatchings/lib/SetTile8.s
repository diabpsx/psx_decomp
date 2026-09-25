.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetTile8, 0x14

glabel SetTile8
    /* 333C 8001333C 02000224 */  addiu      $v0, $zero, 0x2
    /* 3340 80013340 030082A0 */  sb         $v0, 0x3($a0)
    /* 3344 80013344 70000224 */  addiu      $v0, $zero, 0x70
    /* 3348 80013348 0800E003 */  jr         $ra
    /* 334C 8001334C 070082A0 */   sb        $v0, 0x7($a0)
endlabel SetTile8
