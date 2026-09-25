.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching StartPlrBlock__Fii, 0x4C

glabel StartPlrBlock__Fii
    /* 56F08 80066F08 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 56F0C 80066F0C 1000BFAF */  sw         $ra, 0x10($sp)
    /* 56F10 80066F10 40100400 */  sll        $v0, $a0, 1
    /* 56F14 80066F14 21104400 */  addu       $v0, $v0, $a0
    /* 56F18 80066F18 80100200 */  sll        $v0, $v0, 2
    /* 56F1C 80066F1C 21104400 */  addu       $v0, $v0, $a0
    /* 56F20 80066F20 00110200 */  sll        $v0, $v0, 4
    /* 56F24 80066F24 23104400 */  subu       $v0, $v0, $a0
    /* 56F28 80066F28 80100200 */  sll        $v0, $v0, 2
    /* 56F2C 80066F2C 21104400 */  addu       $v0, $v0, $a0
    /* 56F30 80066F30 C0100200 */  sll        $v0, $v0, 3
    /* 56F34 80066F34 0E80043C */  lui        $a0, %hi(plr)
    /* 56F38 80066F38 38A58424 */  addiu      $a0, $a0, %lo(plr)
    /* 56F3C 80066F3C 2A84010C */  jal        StartPlrBlock__FP12PlayerStructi
    /* 56F40 80066F40 21204400 */   addu      $a0, $v0, $a0
    /* 56F44 80066F44 1000BF8F */  lw         $ra, 0x10($sp)
    /* 56F48 80066F48 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 56F4C 80066F4C 0800E003 */  jr         $ra
    /* 56F50 80066F50 00000000 */   nop
endlabel StartPlrBlock__Fii
