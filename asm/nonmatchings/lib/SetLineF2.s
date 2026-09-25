.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetLineF2, 0x14

glabel SetLineF2
    /* 3378 80013378 03000224 */  addiu      $v0, $zero, 0x3
    /* 337C 8001337C 030082A0 */  sb         $v0, 0x3($a0)
    /* 3380 80013380 40000224 */  addiu      $v0, $zero, 0x40
    /* 3384 80013384 0800E003 */  jr         $ra
    /* 3388 80013388 070082A0 */   sb        $v0, 0x7($a0)
endlabel SetLineF2
