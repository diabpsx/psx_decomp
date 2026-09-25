.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SyncPlrKill__Fii, 0x4C

glabel SyncPlrKill__Fii
    /* 56DD8 80066DD8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 56DDC 80066DDC 1000BFAF */  sw         $ra, 0x10($sp)
    /* 56DE0 80066DE0 40100400 */  sll        $v0, $a0, 1
    /* 56DE4 80066DE4 21104400 */  addu       $v0, $v0, $a0
    /* 56DE8 80066DE8 80100200 */  sll        $v0, $v0, 2
    /* 56DEC 80066DEC 21104400 */  addu       $v0, $v0, $a0
    /* 56DF0 80066DF0 00110200 */  sll        $v0, $v0, 4
    /* 56DF4 80066DF4 23104400 */  subu       $v0, $v0, $a0
    /* 56DF8 80066DF8 80100200 */  sll        $v0, $v0, 2
    /* 56DFC 80066DFC 21104400 */  addu       $v0, $v0, $a0
    /* 56E00 80066E00 C0100200 */  sll        $v0, $v0, 3
    /* 56E04 80066E04 0E80043C */  lui        $a0, %hi(plr)
    /* 56E08 80066E08 38A58424 */  addiu      $a0, $a0, %lo(plr)
    /* 56E0C 80066E0C 6C87010C */  jal        SyncPlrKill__FP12PlayerStructi
    /* 56E10 80066E10 21204400 */   addu      $a0, $v0, $a0
    /* 56E14 80066E14 1000BF8F */  lw         $ra, 0x10($sp)
    /* 56E18 80066E18 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 56E1C 80066E1C 0800E003 */  jr         $ra
    /* 56E20 80066E20 00000000 */   nop
endlabel SyncPlrKill__Fii
