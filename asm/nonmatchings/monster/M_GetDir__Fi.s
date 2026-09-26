.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching M_GetDir__Fi, 0x64

glabel M_GetDir__Fi
    /* 10FB4 8014ABAC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 10FB8 8014ABB0 40100400 */  sll        $v0, $a0, 1
    /* 10FBC 8014ABB4 21104400 */  addu       $v0, $v0, $a0
    /* 10FC0 8014ABB8 80100200 */  sll        $v0, $v0, 2
    /* 10FC4 8014ABBC 21104400 */  addu       $v0, $v0, $a0
    /* 10FC8 8014ABC0 C0100200 */  sll        $v0, $v0, 3
    /* 10FCC 8014ABC4 1000BFAF */  sw         $ra, 0x10($sp)
    /* 10FD0 8014ABC8 1080013C */  lui        $at, %hi(monster + 0x34)
    /* 10FD4 8014ABCC 21082200 */  addu       $at, $at, $v0
    /* 10FD8 8014ABD0 C8532480 */  lb         $a0, %lo(monster + 0x34)($at)
    /* 10FDC 8014ABD4 1080013C */  lui        $at, %hi(monster + 0x35)
    /* 10FE0 8014ABD8 21082200 */  addu       $at, $at, $v0
    /* 10FE4 8014ABDC C9532580 */  lb         $a1, %lo(monster + 0x35)($at)
    /* 10FE8 8014ABE0 1080013C */  lui        $at, %hi(monster + 0x4A)
    /* 10FEC 8014ABE4 21082200 */  addu       $at, $at, $v0
    /* 10FF0 8014ABE8 DE532690 */  lbu        $a2, %lo(monster + 0x4A)($at)
    /* 10FF4 8014ABEC 1080013C */  lui        $at, %hi(monster + 0x4B)
    /* 10FF8 8014ABF0 21082200 */  addu       $at, $at, $v0
    /* 10FFC 8014ABF4 DF532790 */  lbu        $a3, %lo(monster + 0x4B)($at)
    /* 11000 8014ABF8 8AF6000C */  jal        GetDirection__Fiiii
    /* 11004 8014ABFC 00000000 */   nop
    /* 11008 8014AC00 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1100C 8014AC04 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 11010 8014AC08 0800E003 */  jr         $ra
    /* 11014 8014AC0C 00000000 */   nop
endlabel M_GetDir__Fi
