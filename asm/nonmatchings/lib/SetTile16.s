.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetTile16, 0x14

glabel SetTile16
    /* 3350 80013350 02000224 */  addiu      $v0, $zero, 0x2
    /* 3354 80013354 030082A0 */  sb         $v0, 0x3($a0)
    /* 3358 80013358 78000224 */  addiu      $v0, $zero, 0x78
    /* 335C 8001335C 0800E003 */  jr         $ra
    /* 3360 80013360 070082A0 */   sb        $v0, 0x7($a0)
endlabel SetTile16
