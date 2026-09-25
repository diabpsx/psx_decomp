.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetMISSILE__Fii, 0x30

glabel GetMISSILE__Fii
    /* 72E40 80082E40 C0280500 */  sll        $a1, $a1, 3
    /* 72E44 80082E44 C0100400 */  sll        $v0, $a0, 3
    /* 72E48 80082E48 23104400 */  subu       $v0, $v0, $a0
    /* 72E4C 80082E4C C0110200 */  sll        $v0, $v0, 7
    /* 72E50 80082E50 2128A200 */  addu       $a1, $a1, $v0
    /* 72E54 80082E54 0E80013C */  lui        $at, %hi(dung_map + 0x2)
    /* 72E58 80082E58 21082500 */  addu       $at, $at, $a1
    /* 72E5C 80082E5C 2A7A2290 */  lbu        $v0, %lo(dung_map + 0x2)($at)
    /* 72E60 80082E60 00000000 */  nop
    /* 72E64 80082E64 02004230 */  andi       $v0, $v0, 0x2
    /* 72E68 80082E68 0800E003 */  jr         $ra
    /* 72E6C 80082E6C 2B100200 */   sltu      $v0, $zero, $v0
endlabel GetMISSILE__Fii
