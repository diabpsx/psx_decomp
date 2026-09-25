.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SyncInitPlrPos__Fi, 0x4C

glabel SyncInitPlrPos__Fi
    /* 571BC 800671BC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 571C0 800671C0 1000BFAF */  sw         $ra, 0x10($sp)
    /* 571C4 800671C4 40100400 */  sll        $v0, $a0, 1
    /* 571C8 800671C8 21104400 */  addu       $v0, $v0, $a0
    /* 571CC 800671CC 80100200 */  sll        $v0, $v0, 2
    /* 571D0 800671D0 21104400 */  addu       $v0, $v0, $a0
    /* 571D4 800671D4 00110200 */  sll        $v0, $v0, 4
    /* 571D8 800671D8 23104400 */  subu       $v0, $v0, $a0
    /* 571DC 800671DC 80100200 */  sll        $v0, $v0, 2
    /* 571E0 800671E0 21104400 */  addu       $v0, $v0, $a0
    /* 571E4 800671E4 C0100200 */  sll        $v0, $v0, 3
    /* 571E8 800671E8 0E80043C */  lui        $a0, %hi(plr)
    /* 571EC 800671EC 38A58424 */  addiu      $a0, $a0, %lo(plr)
    /* 571F0 800671F0 AD96010C */  jal        SyncInitPlrPos__FP12PlayerStruct
    /* 571F4 800671F4 21204400 */   addu      $a0, $v0, $a0
    /* 571F8 800671F8 1000BF8F */  lw         $ra, 0x10($sp)
    /* 571FC 800671FC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 57200 80067200 0800E003 */  jr         $ra
    /* 57204 80067204 00000000 */   nop
endlabel SyncInitPlrPos__Fi
