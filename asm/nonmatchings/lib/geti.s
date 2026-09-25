.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching geti, 0x20

glabel geti
    /* 1CB4C 8002CB4C 03008888 */  lwl        $t0, 0x3($a0)
    /* 1CB50 8002CB50 00008898 */  lwr        $t0, 0x0($a0)
    /* 1CB54 8002CB54 20000924 */  addiu      $t1, $zero, 0x20
    /* 1CB58 8002CB58 C0280500 */  sll        $a1, $a1, 3
    /* 1CB5C 8002CB5C 23282501 */  subu       $a1, $t1, $a1
    /* 1CB60 8002CB60 0440A800 */  sllv       $t0, $t0, $a1
    /* 1CB64 8002CB64 0800E003 */  jr         $ra
    /* 1CB68 8002CB68 0610A800 */   srlv      $v0, $t0, $a1
endlabel geti
