.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetTile1, 0x14

glabel SetTile1
    /* 3328 80013328 02000224 */  addiu      $v0, $zero, 0x2
    /* 332C 8001332C 030082A0 */  sb         $v0, 0x3($a0)
    /* 3330 80013330 68000224 */  addiu      $v0, $zero, 0x68
    /* 3334 80013334 0800E003 */  jr         $ra
    /* 3338 80013338 070082A0 */   sb        $v0, 0x7($a0)
endlabel SetTile1
