.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Obj_Sarc__Fi, 0x4C

glabel Obj_Sarc__Fi
    /* 44B10 80054B10 40100400 */  sll        $v0, $a0, 1
    /* 44B14 80054B14 21104400 */  addu       $v0, $v0, $a0
    /* 44B18 80054B18 80100200 */  sll        $v0, $v0, 2
    /* 44B1C 80054B1C 23104400 */  subu       $v0, $v0, $a0
    /* 44B20 80054B20 80200200 */  sll        $a0, $v0, 2
    /* 44B24 80054B24 0E80013C */  lui        $at, %hi(object + 0x21)
    /* 44B28 80054B28 21082400 */  addu       $at, $at, $a0
    /* 44B2C 80054B2C 6D8C2380 */  lb         $v1, %lo(object + 0x21)($at)
    /* 44B30 80054B30 0E80013C */  lui        $at, %hi(object + 0xC)
    /* 44B34 80054B34 21082400 */  addu       $at, $at, $a0
    /* 44B38 80054B38 588C2284 */  lh         $v0, %lo(object + 0xC)($at)
    /* 44B3C 80054B3C 00000000 */  nop
    /* 44B40 80054B40 04006214 */  bne        $v1, $v0, .L80054B54
    /* 44B44 80054B44 00000000 */   nop
    /* 44B48 80054B48 0E80013C */  lui        $at, %hi(object + 0x25)
    /* 44B4C 80054B4C 21082400 */  addu       $at, $at, $a0
    /* 44B50 80054B50 718C20A0 */  sb         $zero, %lo(object + 0x25)($at)
  .L80054B54:
    /* 44B54 80054B54 0800E003 */  jr         $ra
    /* 44B58 80054B58 00000000 */   nop
endlabel Obj_Sarc__Fi
