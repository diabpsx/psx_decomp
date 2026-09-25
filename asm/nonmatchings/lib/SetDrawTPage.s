.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetDrawTPage, 0x2C

glabel SetDrawTPage
    /* 3420 80013420 01000224 */  addiu      $v0, $zero, 0x1
    /* 3424 80013424 030082A0 */  sb         $v0, 0x3($a0)
    /* 3428 80013428 0200C010 */  beqz       $a2, .L80013434
    /* 342C 8001342C 00E1033C */   lui       $v1, (0xE1000200 >> 16)
    /* 3430 80013430 00026334 */  ori        $v1, $v1, (0xE1000200 & 0xFFFF)
  .L80013434:
    /* 3434 80013434 0200A010 */  beqz       $a1, .L80013440
    /* 3438 80013438 FF09E230 */   andi      $v0, $a3, 0x9FF
    /* 343C 8001343C 00044234 */  ori        $v0, $v0, 0x400
  .L80013440:
    /* 3440 80013440 25106200 */  or         $v0, $v1, $v0
    /* 3444 80013444 0800E003 */  jr         $ra
    /* 3448 80013448 040082AC */   sw        $v0, 0x4($a0)
endlabel SetDrawTPage
