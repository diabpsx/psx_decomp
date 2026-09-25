.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Obj_StopAnim__Fi, 0x64

glabel Obj_StopAnim__Fi
    /* 445D4 800545D4 40100400 */  sll        $v0, $a0, 1
    /* 445D8 800545D8 21104400 */  addu       $v0, $v0, $a0
    /* 445DC 800545DC 80100200 */  sll        $v0, $v0, 2
    /* 445E0 800545E0 23104400 */  subu       $v0, $v0, $a0
    /* 445E4 800545E4 80200200 */  sll        $a0, $v0, 2
    /* 445E8 800545E8 0E80013C */  lui        $at, %hi(object + 0x21)
    /* 445EC 800545EC 21082400 */  addu       $at, $at, $a0
    /* 445F0 800545F0 6D8C2380 */  lb         $v1, %lo(object + 0x21)($at)
    /* 445F4 800545F4 0E80013C */  lui        $at, %hi(object + 0xC)
    /* 445F8 800545F8 21082400 */  addu       $at, $at, $a0
    /* 445FC 800545FC 588C2284 */  lh         $v0, %lo(object + 0xC)($at)
    /* 44600 80054600 00000000 */  nop
    /* 44604 80054604 0A006214 */  bne        $v1, $v0, .L80054630
    /* 44608 80054608 E8030224 */   addiu     $v0, $zero, 0x3E8
    /* 4460C 8005460C 0E80013C */  lui        $at, %hi(object + 0xA)
    /* 44610 80054610 21082400 */  addu       $at, $at, $a0
    /* 44614 80054614 568C20A4 */  sh         $zero, %lo(object + 0xA)($at)
    /* 44618 80054618 0E80013C */  lui        $at, %hi(object + 0x8)
    /* 4461C 8005461C 21082400 */  addu       $at, $at, $a0
    /* 44620 80054620 548C22A4 */  sh         $v0, %lo(object + 0x8)($at)
    /* 44624 80054624 0E80013C */  lui        $at, %hi(object + 0x25)
    /* 44628 80054628 21082400 */  addu       $at, $at, $a0
    /* 4462C 8005462C 718C20A0 */  sb         $zero, %lo(object + 0x25)($at)
  .L80054630:
    /* 44630 80054630 0800E003 */  jr         $ra
    /* 44634 80054634 00000000 */   nop
endlabel Obj_StopAnim__Fi
