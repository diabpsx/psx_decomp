.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching delta_quest_inited__Fi, 0x24

glabel delta_quest_inited__Fi
    /* 3F314 8004F314 40100400 */  sll        $v0, $a0, 1
    /* 3F318 8004F318 21104400 */  addu       $v0, $v0, $a0
    /* 3F31C 8004F31C 1380013C */  lui        $at, %hi(D_8012EDEC)
    /* 3F320 8004F320 21082200 */  addu       $at, $at, $v0
    /* 3F324 8004F324 ECED2290 */  lbu        $v0, %lo(D_8012EDEC)($at)
    /* 3F328 8004F328 00000000 */  nop
    /* 3F32C 8004F32C FF004238 */  xori       $v0, $v0, 0xFF
    /* 3F330 8004F330 0800E003 */  jr         $ra
    /* 3F334 8004F334 2B100200 */   sltu      $v0, $zero, $v0
endlabel delta_quest_inited__Fi
