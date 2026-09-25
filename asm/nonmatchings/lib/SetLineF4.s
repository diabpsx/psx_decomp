.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetLineF4, 0x20

glabel SetLineF4
    /* 33E0 800133E0 5555033C */  lui        $v1, (0x55555555 >> 16)
    /* 33E4 800133E4 55556334 */  ori        $v1, $v1, (0x55555555 & 0xFFFF)
    /* 33E8 800133E8 06000224 */  addiu      $v0, $zero, 0x6
    /* 33EC 800133EC 030082A0 */  sb         $v0, 0x3($a0)
    /* 33F0 800133F0 4C000224 */  addiu      $v0, $zero, 0x4C
    /* 33F4 800133F4 070082A0 */  sb         $v0, 0x7($a0)
    /* 33F8 800133F8 0800E003 */  jr         $ra
    /* 33FC 800133FC 180083AC */   sw        $v1, 0x18($a0)
endlabel SetLineF4
