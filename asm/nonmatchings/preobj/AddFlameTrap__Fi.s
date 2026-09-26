.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddFlameTrap__Fi, 0x5C

glabel AddFlameTrap__Fi
    /* 1C9E0 801565D8 40100400 */  sll        $v0, $a0, 1
    /* 1C9E4 801565DC 21104400 */  addu       $v0, $v0, $a0
    /* 1C9E8 801565E0 80100200 */  sll        $v0, $v0, 2
    /* 1C9EC 801565E4 23104400 */  subu       $v0, $v0, $a0
    /* 1C9F0 801565E8 1280033C */  lui        $v1, %hi(trapid)
    /* 1C9F4 801565EC D4B9638C */  lw         $v1, %lo(trapid)($v1)
    /* 1C9F8 801565F0 1280043C */  lui        $a0, %hi(trapdir)
    /* 1C9FC 801565F4 D8B9848C */  lw         $a0, %lo(trapdir)($a0)
    /* 1CA00 801565F8 80100200 */  sll        $v0, $v0, 2
    /* 1CA04 801565FC 0E80013C */  lui        $at, %hi(object + 0x10)
    /* 1CA08 80156600 21082200 */  addu       $at, $at, $v0
    /* 1CA0C 80156604 5C8C20A4 */  sh         $zero, %lo(object + 0x10)($at)
    /* 1CA10 80156608 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 1CA14 8015660C 21082200 */  addu       $at, $at, $v0
    /* 1CA18 80156610 608C20A4 */  sh         $zero, %lo(object + 0x14)($at)
    /* 1CA1C 80156614 0E80013C */  lui        $at, %hi(object + 0xE)
    /* 1CA20 80156618 21082200 */  addu       $at, $at, $v0
    /* 1CA24 8015661C 5A8C23A4 */  sh         $v1, %lo(object + 0xE)($at)
    /* 1CA28 80156620 0E80013C */  lui        $at, %hi(object + 0x12)
    /* 1CA2C 80156624 21082200 */  addu       $at, $at, $v0
    /* 1CA30 80156628 5E8C24A4 */  sh         $a0, %lo(object + 0x12)($at)
    /* 1CA34 8015662C 0800E003 */  jr         $ra
    /* 1CA38 80156630 00000000 */   nop
endlabel AddFlameTrap__Fi
