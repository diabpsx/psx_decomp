.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddSTextVal__Fii, 0x28

glabel AddSTextVal__Fii
    /* 59DC0 80069DC0 C0100400 */  sll        $v0, $a0, 3
    /* 59DC4 80069DC4 21104400 */  addu       $v0, $v0, $a0
    /* 59DC8 80069DC8 80100200 */  sll        $v0, $v0, 2
    /* 59DCC 80069DCC 23104400 */  subu       $v0, $v0, $a0
    /* 59DD0 80069DD0 80100200 */  sll        $v0, $v0, 2
    /* 59DD4 80069DD4 1380013C */  lui        $at, %hi(D_8012EED0)
    /* 59DD8 80069DD8 21082200 */  addu       $at, $at, $v0
    /* 59DDC 80069DDC D0EE25AC */  sw         $a1, %lo(D_8012EED0)($at)
    /* 59DE0 80069DE0 0800E003 */  jr         $ra
    /* 59DE4 80069DE4 00000000 */   nop
endlabel AddSTextVal__Fii
