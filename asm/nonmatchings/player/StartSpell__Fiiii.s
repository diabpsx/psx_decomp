.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching StartSpell__Fiiii, 0x4C

glabel StartSpell__Fiiii
    /* 56FA4 80066FA4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 56FA8 80066FA8 1000BFAF */  sw         $ra, 0x10($sp)
    /* 56FAC 80066FAC 40100400 */  sll        $v0, $a0, 1
    /* 56FB0 80066FB0 21104400 */  addu       $v0, $v0, $a0
    /* 56FB4 80066FB4 80100200 */  sll        $v0, $v0, 2
    /* 56FB8 80066FB8 21104400 */  addu       $v0, $v0, $a0
    /* 56FBC 80066FBC 00110200 */  sll        $v0, $v0, 4
    /* 56FC0 80066FC0 23104400 */  subu       $v0, $v0, $a0
    /* 56FC4 80066FC4 80100200 */  sll        $v0, $v0, 2
    /* 56FC8 80066FC8 21104400 */  addu       $v0, $v0, $a0
    /* 56FCC 80066FCC C0100200 */  sll        $v0, $v0, 3
    /* 56FD0 80066FD0 0E80043C */  lui        $a0, %hi(plr)
    /* 56FD4 80066FD4 38A58424 */  addiu      $a0, $a0, %lo(plr)
    /* 56FD8 80066FD8 5084010C */  jal        StartSpell__FP12PlayerStructiii
    /* 56FDC 80066FDC 21204400 */   addu      $a0, $v0, $a0
    /* 56FE0 80066FE0 1000BF8F */  lw         $ra, 0x10($sp)
    /* 56FE4 80066FE4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 56FE8 80066FE8 0800E003 */  jr         $ra
    /* 56FEC 80066FEC 00000000 */   nop
endlabel StartSpell__Fiiii
