.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching StartPlrHit__FiiUc, 0x50

glabel StartPlrHit__FiiUc
    /* 56F54 80066F54 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 56F58 80066F58 1000BFAF */  sw         $ra, 0x10($sp)
    /* 56F5C 80066F5C 40100400 */  sll        $v0, $a0, 1
    /* 56F60 80066F60 21104400 */  addu       $v0, $v0, $a0
    /* 56F64 80066F64 80100200 */  sll        $v0, $v0, 2
    /* 56F68 80066F68 21104400 */  addu       $v0, $v0, $a0
    /* 56F6C 80066F6C 00110200 */  sll        $v0, $v0, 4
    /* 56F70 80066F70 23104400 */  subu       $v0, $v0, $a0
    /* 56F74 80066F74 80100200 */  sll        $v0, $v0, 2
    /* 56F78 80066F78 21104400 */  addu       $v0, $v0, $a0
    /* 56F7C 80066F7C C0100200 */  sll        $v0, $v0, 3
    /* 56F80 80066F80 0E80043C */  lui        $a0, %hi(plr)
    /* 56F84 80066F84 38A58424 */  addiu      $a0, $a0, %lo(plr)
    /* 56F88 80066F88 21204400 */  addu       $a0, $v0, $a0
    /* 56F8C 80066F8C BF84010C */  jal        StartPlrHit__FP12PlayerStructiUc
    /* 56F90 80066F90 FF00C630 */   andi      $a2, $a2, 0xFF
    /* 56F94 80066F94 1000BF8F */  lw         $ra, 0x10($sp)
    /* 56F98 80066F98 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 56F9C 80066F9C 0800E003 */  jr         $ra
    /* 56FA0 80066FA0 00000000 */   nop
endlabel StartPlrHit__FiiUc
