.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetSemiTrans, 0x28

glabel SetSemiTrans
    /* 31FC 800131FC 0400A010 */  beqz       $a1, .L80013210
    /* 3200 80013200 00000000 */   nop
    /* 3204 80013204 07008290 */  lbu        $v0, 0x7($a0)
    /* 3208 80013208 874C0008 */  j          .L8001321C
    /* 320C 8001320C 02004234 */   ori       $v0, $v0, 0x2
  .L80013210:
    /* 3210 80013210 07008290 */  lbu        $v0, 0x7($a0)
    /* 3214 80013214 00000000 */  nop
    /* 3218 80013218 FD004230 */  andi       $v0, $v0, 0xFD
  .L8001321C:
    /* 321C 8001321C 0800E003 */  jr         $ra
    /* 3220 80013220 070082A0 */   sb        $v0, 0x7($a0)
endlabel SetSemiTrans
