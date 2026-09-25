.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetXOff__Fii, 0x48

glabel GetXOff__Fii
    /* 9F128 800AF128 6210033C */  lui        $v1, (0x10624DD3 >> 16)
    /* 9F12C 800AF12C D34D6334 */  ori        $v1, $v1, (0x10624DD3 & 0xFFFF)
    /* 9F130 800AF130 07008430 */  andi       $a0, $a0, 0x7
    /* 9F134 800AF134 0700A530 */  andi       $a1, $a1, 0x7
    /* 9F138 800AF138 23208500 */  subu       $a0, $a0, $a1
    /* 9F13C 800AF13C 80100400 */  sll        $v0, $a0, 2
    /* 9F140 800AF140 00210400 */  sll        $a0, $a0, 4
    /* 9F144 800AF144 21208200 */  addu       $a0, $a0, $v0
    /* 9F148 800AF148 C0200400 */  sll        $a0, $a0, 3
    /* 9F14C 800AF14C 23208200 */  subu       $a0, $a0, $v0
    /* 9F150 800AF150 00210400 */  sll        $a0, $a0, 4
    /* 9F154 800AF154 21208200 */  addu       $a0, $a0, $v0
    /* 9F158 800AF158 18008300 */  mult       $a0, $v1
    /* 9F15C 800AF15C C3270400 */  sra        $a0, $a0, 31
    /* 9F160 800AF160 10300000 */  mfhi       $a2
    /* 9F164 800AF164 83110600 */  sra        $v0, $a2, 6
    /* 9F168 800AF168 0800E003 */  jr         $ra
    /* 9F16C 800AF16C 23104400 */   subu      $v0, $v0, $a0
endlabel GetXOff__Fii
