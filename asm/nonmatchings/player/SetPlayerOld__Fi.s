.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetPlayerOld__Fi, 0x4C

glabel SetPlayerOld__Fi
    /* 57338 80067338 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 5733C 8006733C 1000BFAF */  sw         $ra, 0x10($sp)
    /* 57340 80067340 40100400 */  sll        $v0, $a0, 1
    /* 57344 80067344 21104400 */  addu       $v0, $v0, $a0
    /* 57348 80067348 80100200 */  sll        $v0, $v0, 2
    /* 5734C 8006734C 21104400 */  addu       $v0, $v0, $a0
    /* 57350 80067350 00110200 */  sll        $v0, $v0, 4
    /* 57354 80067354 23104400 */  subu       $v0, $v0, $a0
    /* 57358 80067358 80100200 */  sll        $v0, $v0, 2
    /* 5735C 8006735C 21104400 */  addu       $v0, $v0, $a0
    /* 57360 80067360 C0100200 */  sll        $v0, $v0, 3
    /* 57364 80067364 0E80043C */  lui        $a0, %hi(plr)
    /* 57368 80067368 38A58424 */  addiu      $a0, $a0, %lo(plr)
    /* 5736C 8006736C 7F83010C */  jal        SetPlayerOld__FP12PlayerStruct
    /* 57370 80067370 21204400 */   addu      $a0, $v0, $a0
    /* 57374 80067374 1000BF8F */  lw         $ra, 0x10($sp)
    /* 57378 80067378 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 5737C 8006737C 0800E003 */  jr         $ra
    /* 57380 80067380 00000000 */   nop
endlabel SetPlayerOld__Fi
