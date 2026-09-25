.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetYOff__Fii, 0x4C

glabel GetYOff__Fii
    /* 9F170 800AF170 6210033C */  lui        $v1, (0x10624DD3 >> 16)
    /* 9F174 800AF174 D34D6334 */  ori        $v1, $v1, (0x10624DD3 & 0xFFFF)
    /* 9F178 800AF178 07008430 */  andi       $a0, $a0, 0x7
    /* 9F17C 800AF17C 0700A530 */  andi       $a1, $a1, 0x7
    /* 9F180 800AF180 21208500 */  addu       $a0, $a0, $a1
    /* 9F184 800AF184 F8FF8424 */  addiu      $a0, $a0, -0x8
    /* 9F188 800AF188 40100400 */  sll        $v0, $a0, 1
    /* 9F18C 800AF18C C0200400 */  sll        $a0, $a0, 3
    /* 9F190 800AF190 21208200 */  addu       $a0, $a0, $v0
    /* 9F194 800AF194 C0200400 */  sll        $a0, $a0, 3
    /* 9F198 800AF198 23208200 */  subu       $a0, $a0, $v0
    /* 9F19C 800AF19C 00210400 */  sll        $a0, $a0, 4
    /* 9F1A0 800AF1A0 21208200 */  addu       $a0, $a0, $v0
    /* 9F1A4 800AF1A4 18008300 */  mult       $a0, $v1
    /* 9F1A8 800AF1A8 C3270400 */  sra        $a0, $a0, 31
    /* 9F1AC 800AF1AC 10300000 */  mfhi       $a2
    /* 9F1B0 800AF1B0 83110600 */  sra        $v0, $a2, 6
    /* 9F1B4 800AF1B4 0800E003 */  jr         $ra
    /* 9F1B8 800AF1B8 23104400 */   subu      $v0, $v0, $a0
endlabel GetYOff__Fii
