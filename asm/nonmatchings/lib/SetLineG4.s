.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetLineG4, 0x20

glabel SetLineG4
    /* 3400 80013400 5555033C */  lui        $v1, (0x55555555 >> 16)
    /* 3404 80013404 55556334 */  ori        $v1, $v1, (0x55555555 & 0xFFFF)
    /* 3408 80013408 09000224 */  addiu      $v0, $zero, 0x9
    /* 340C 8001340C 030082A0 */  sb         $v0, 0x3($a0)
    /* 3410 80013410 5C000224 */  addiu      $v0, $zero, 0x5C
    /* 3414 80013414 070082A0 */  sb         $v0, 0x7($a0)
    /* 3418 80013418 0800E003 */  jr         $ra
    /* 341C 8001341C 240083AC */   sw        $v1, 0x24($a0)
endlabel SetLineG4
