.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching On_DROPITEM__FPC4TCmdi, 0x58

glabel On_DROPITEM__FPC4TCmdi
    /* 41F0C 80051F0C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 41F10 80051F10 40100500 */  sll        $v0, $a1, 1
    /* 41F14 80051F14 21104500 */  addu       $v0, $v0, $a1
    /* 41F18 80051F18 80100200 */  sll        $v0, $v0, 2
    /* 41F1C 80051F1C 21104500 */  addu       $v0, $v0, $a1
    /* 41F20 80051F20 00110200 */  sll        $v0, $v0, 4
    /* 41F24 80051F24 23104500 */  subu       $v0, $v0, $a1
    /* 41F28 80051F28 80100200 */  sll        $v0, $v0, 2
    /* 41F2C 80051F2C 21104500 */  addu       $v0, $v0, $a1
    /* 41F30 80051F30 01008590 */  lbu        $a1, 0x1($a0)
    /* 41F34 80051F34 02008690 */  lbu        $a2, 0x2($a0)
    /* 41F38 80051F38 C0100200 */  sll        $v0, $v0, 3
    /* 41F3C 80051F3C 1000BFAF */  sw         $ra, 0x10($sp)
    /* 41F40 80051F40 0E80013C */  lui        $at, %hi(plr + 0x24)
    /* 41F44 80051F44 21082200 */  addu       $at, $at, $v0
    /* 41F48 80051F48 5CA52790 */  lbu        $a3, %lo(plr + 0x24)($at)
    /* 41F4C 80051F4C 593C010C */  jal        delta_put_item__FPC9TCmdPItemiiUc
    /* 41F50 80051F50 00000000 */   nop
    /* 41F54 80051F54 1000BF8F */  lw         $ra, 0x10($sp)
    /* 41F58 80051F58 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 41F5C 80051F5C 0800E003 */  jr         $ra
    /* 41F60 80051F60 00000000 */   nop
endlabel On_DROPITEM__FPC4TCmdi
