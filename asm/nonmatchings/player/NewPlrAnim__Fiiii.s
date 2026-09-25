.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching NewPlrAnim__Fiiii, 0x4C

glabel NewPlrAnim__Fiiii
    /* 56E70 80066E70 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 56E74 80066E74 1000BFAF */  sw         $ra, 0x10($sp)
    /* 56E78 80066E78 40100400 */  sll        $v0, $a0, 1
    /* 56E7C 80066E7C 21104400 */  addu       $v0, $v0, $a0
    /* 56E80 80066E80 80100200 */  sll        $v0, $v0, 2
    /* 56E84 80066E84 21104400 */  addu       $v0, $v0, $a0
    /* 56E88 80066E88 00110200 */  sll        $v0, $v0, 4
    /* 56E8C 80066E8C 23104400 */  subu       $v0, $v0, $a0
    /* 56E90 80066E90 80100200 */  sll        $v0, $v0, 2
    /* 56E94 80066E94 21104400 */  addu       $v0, $v0, $a0
    /* 56E98 80066E98 C0100200 */  sll        $v0, $v0, 3
    /* 56E9C 80066E9C 0E80043C */  lui        $a0, %hi(plr)
    /* 56EA0 80066EA0 38A58424 */  addiu      $a0, $a0, %lo(plr)
    /* 56EA4 80066EA4 877F010C */  jal        NewPlrAnim__FP12PlayerStructiii
    /* 56EA8 80066EA8 21204400 */   addu      $a0, $v0, $a0
    /* 56EAC 80066EAC 1000BF8F */  lw         $ra, 0x10($sp)
    /* 56EB0 80066EB0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 56EB4 80066EB4 0800E003 */  jr         $ra
    /* 56EB8 80066EB8 00000000 */   nop
endlabel NewPlrAnim__Fiiii
