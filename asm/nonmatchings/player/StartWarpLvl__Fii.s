.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching StartWarpLvl__Fii, 0x4C

glabel StartWarpLvl__Fii
    /* 56D8C 80066D8C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 56D90 80066D90 1000BFAF */  sw         $ra, 0x10($sp)
    /* 56D94 80066D94 40100400 */  sll        $v0, $a0, 1
    /* 56D98 80066D98 21104400 */  addu       $v0, $v0, $a0
    /* 56D9C 80066D9C 80100200 */  sll        $v0, $v0, 2
    /* 56DA0 80066DA0 21104400 */  addu       $v0, $v0, $a0
    /* 56DA4 80066DA4 00110200 */  sll        $v0, $v0, 4
    /* 56DA8 80066DA8 23104400 */  subu       $v0, $v0, $a0
    /* 56DAC 80066DAC 80100200 */  sll        $v0, $v0, 2
    /* 56DB0 80066DB0 21104400 */  addu       $v0, $v0, $a0
    /* 56DB4 80066DB4 C0100200 */  sll        $v0, $v0, 3
    /* 56DB8 80066DB8 0E80043C */  lui        $a0, %hi(plr)
    /* 56DBC 80066DBC 38A58424 */  addiu      $a0, $a0, %lo(plr)
    /* 56DC0 80066DC0 1289010C */  jal        StartWarpLvl__FP12PlayerStructi
    /* 56DC4 80066DC4 21204400 */   addu      $a0, $v0, $a0
    /* 56DC8 80066DC8 1000BF8F */  lw         $ra, 0x10($sp)
    /* 56DCC 80066DCC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 56DD0 80066DD0 0800E003 */  jr         $ra
    /* 56DD4 80066DD4 00000000 */   nop
endlabel StartWarpLvl__Fii
