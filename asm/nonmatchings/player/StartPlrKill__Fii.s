.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching StartPlrKill__Fii, 0x4C

glabel StartPlrKill__Fii
    /* 56E24 80066E24 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 56E28 80066E28 1000BFAF */  sw         $ra, 0x10($sp)
    /* 56E2C 80066E2C 40100400 */  sll        $v0, $a0, 1
    /* 56E30 80066E30 21104400 */  addu       $v0, $v0, $a0
    /* 56E34 80066E34 80100200 */  sll        $v0, $v0, 2
    /* 56E38 80066E38 21104400 */  addu       $v0, $v0, $a0
    /* 56E3C 80066E3C 00110200 */  sll        $v0, $v0, 4
    /* 56E40 80066E40 23104400 */  subu       $v0, $v0, $a0
    /* 56E44 80066E44 80100200 */  sll        $v0, $v0, 2
    /* 56E48 80066E48 21104400 */  addu       $v0, $v0, $a0
    /* 56E4C 80066E4C C0100200 */  sll        $v0, $v0, 3
    /* 56E50 80066E50 0E80043C */  lui        $a0, %hi(plr)
    /* 56E54 80066E54 38A58424 */  addiu      $a0, $a0, %lo(plr)
    /* 56E58 80066E58 1587010C */  jal        StartPlrKill__FP12PlayerStructi
    /* 56E5C 80066E5C 21204400 */   addu      $a0, $v0, $a0
    /* 56E60 80066E60 1000BF8F */  lw         $ra, 0x10($sp)
    /* 56E64 80066E64 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 56E68 80066E68 0800E003 */  jr         $ra
    /* 56E6C 80066E6C 00000000 */   nop
endlabel StartPlrKill__Fii
