.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching StartStand__Fii, 0x4C

glabel StartStand__Fii
    /* 56CA4 80066CA4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 56CA8 80066CA8 1000BFAF */  sw         $ra, 0x10($sp)
    /* 56CAC 80066CAC 40100400 */  sll        $v0, $a0, 1
    /* 56CB0 80066CB0 21104400 */  addu       $v0, $v0, $a0
    /* 56CB4 80066CB4 80100200 */  sll        $v0, $v0, 2
    /* 56CB8 80066CB8 21104400 */  addu       $v0, $v0, $a0
    /* 56CBC 80066CBC 00110200 */  sll        $v0, $v0, 4
    /* 56CC0 80066CC0 23104400 */  subu       $v0, $v0, $a0
    /* 56CC4 80066CC4 80100200 */  sll        $v0, $v0, 2
    /* 56CC8 80066CC8 21104400 */  addu       $v0, $v0, $a0
    /* 56CCC 80066CCC C0100200 */  sll        $v0, $v0, 3
    /* 56CD0 80066CD0 0E80043C */  lui        $a0, %hi(plr)
    /* 56CD4 80066CD4 38A58424 */  addiu      $a0, $a0, %lo(plr)
    /* 56CD8 80066CD8 8483010C */  jal        StartStand__FP12PlayerStructi
    /* 56CDC 80066CDC 21204400 */   addu      $a0, $v0, $a0
    /* 56CE0 80066CE0 1000BF8F */  lw         $ra, 0x10($sp)
    /* 56CE4 80066CE4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 56CE8 80066CE8 0800E003 */  jr         $ra
    /* 56CEC 80066CEC 00000000 */   nop
endlabel StartStand__Fii
