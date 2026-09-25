.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetTile, 0x14

glabel SetTile
    /* 3364 80013364 03000224 */  addiu      $v0, $zero, 0x3
    /* 3368 80013368 030082A0 */  sb         $v0, 0x3($a0)
    /* 336C 8001336C 60000224 */  addiu      $v0, $zero, 0x60
    /* 3370 80013370 0800E003 */  jr         $ra
    /* 3374 80013374 070082A0 */   sb        $v0, 0x7($a0)
endlabel SetTile
