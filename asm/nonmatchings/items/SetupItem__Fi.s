.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetupItem__Fi, 0x130

glabel SetupItem__Fi
    /* 33530 80043530 C0100400 */  sll        $v0, $a0, 3
    /* 33534 80043534 23104400 */  subu       $v0, $v0, $a0
    /* 33538 80043538 80100200 */  sll        $v0, $v0, 2
    /* 3353C 8004353C 23104400 */  subu       $v0, $v0, $a0
    /* 33540 80043540 80280200 */  sll        $a1, $v0, 2
    /* 33544 80043544 0D80013C */  lui        $at, %hi(item + 0x4C)
    /* 33548 80043548 21082500 */  addu       $at, $at, $a1
    /* 3354C 8004354C A01D2290 */  lbu        $v0, %lo(item + 0x4C)($at)
    /* 33550 80043550 0D80013C */  lui        $at, %hi(ItemCAnimTbl)
    /* 33554 80043554 21082200 */  addu       $at, $at, $v0
    /* 33558 80043558 E01B2290 */  lbu        $v0, %lo(ItemCAnimTbl)($at)
    /* 3355C 8004355C 0D80013C */  lui        $at, %hi(item + 0x69)
    /* 33560 80043560 21082500 */  addu       $at, $at, $a1
    /* 33564 80043564 BD1D20A0 */  sb         $zero, %lo(item + 0x69)($at)
    /* 33568 80043568 0D80013C */  lui        $at, %hi(item + 0x67)
    /* 3356C 8004356C 21082500 */  addu       $at, $at, $a1
    /* 33570 80043570 BB1D20A0 */  sb         $zero, %lo(item + 0x67)($at)
    /* 33574 80043574 1280033C */  lui        $v1, %hi(myplr)
    /* 33578 80043578 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 3357C 8004357C 40100200 */  sll        $v0, $v0, 1
    /* 33580 80043580 1180013C */  lui        $at, %hi(D_801161F4)
    /* 33584 80043584 21082200 */  addu       $at, $at, $v0
    /* 33588 80043588 F4612294 */  lhu        $v0, %lo(D_801161F4)($at)
    /* 3358C 8004358C 0D80013C */  lui        $at, %hi(item + 0x2A)
    /* 33590 80043590 21082500 */  addu       $at, $at, $a1
    /* 33594 80043594 7E1D22A4 */  sh         $v0, %lo(item + 0x2A)($at)
    /* 33598 80043598 40100300 */  sll        $v0, $v1, 1
    /* 3359C 8004359C 21104300 */  addu       $v0, $v0, $v1
    /* 335A0 800435A0 80100200 */  sll        $v0, $v0, 2
    /* 335A4 800435A4 21104300 */  addu       $v0, $v0, $v1
    /* 335A8 800435A8 00110200 */  sll        $v0, $v0, 4
    /* 335AC 800435AC 23104300 */  subu       $v0, $v0, $v1
    /* 335B0 800435B0 80100200 */  sll        $v0, $v0, 2
    /* 335B4 800435B4 21104300 */  addu       $v0, $v0, $v1
    /* 335B8 800435B8 C0100200 */  sll        $v0, $v0, 3
    /* 335BC 800435BC 0E80013C */  lui        $at, %hi(plr + 0x19E2)
    /* 335C0 800435C0 21082200 */  addu       $at, $at, $v0
    /* 335C4 800435C4 1ABF2290 */  lbu        $v0, %lo(plr + 0x19E2)($at)
    /* 335C8 800435C8 00000000 */  nop
    /* 335CC 800435CC 0C004014 */  bnez       $v0, .L80043600
    /* 335D0 800435D0 01000224 */   addiu     $v0, $zero, 0x1
    /* 335D4 800435D4 0D80013C */  lui        $at, %hi(item + 0x4F)
    /* 335D8 800435D8 21082500 */  addu       $at, $at, $a1
    /* 335DC 800435DC A31D22A0 */  sb         $v0, %lo(item + 0x4F)($at)
    /* 335E0 800435E0 0D80013C */  lui        $at, %hi(item + 0x68)
    /* 335E4 800435E4 21082500 */  addu       $at, $at, $a1
    /* 335E8 800435E8 BC1D22A0 */  sb         $v0, %lo(item + 0x68)($at)
    /* 335EC 800435EC 0D80013C */  lui        $at, %hi(item + 0x50)
    /* 335F0 800435F0 21082500 */  addu       $at, $at, $a1
    /* 335F4 800435F4 A41D20A0 */  sb         $zero, %lo(item + 0x50)($at)
    /* 335F8 800435F8 8D0D0108 */  j          .L80043634
    /* 335FC 800435FC C0100400 */   sll       $v0, $a0, 3
  .L80043600:
    /* 33600 80043600 0D80013C */  lui        $at, %hi(item + 0x4E)
    /* 33604 80043604 21082500 */  addu       $at, $at, $a1
    /* 33608 80043608 A21D2390 */  lbu        $v1, %lo(item + 0x4E)($at)
    /* 3360C 8004360C 0D80013C */  lui        $at, %hi(item + 0x68)
    /* 33610 80043610 21082500 */  addu       $at, $at, $a1
    /* 33614 80043614 BC1D20A0 */  sb         $zero, %lo(item + 0x68)($at)
    /* 33618 80043618 0D80013C */  lui        $at, %hi(item + 0x50)
    /* 3361C 8004361C 21082500 */  addu       $at, $at, $a1
    /* 33620 80043620 A41D22A0 */  sb         $v0, %lo(item + 0x50)($at)
    /* 33624 80043624 0D80013C */  lui        $at, %hi(item + 0x4F)
    /* 33628 80043628 21082500 */  addu       $at, $at, $a1
    /* 3362C 8004362C A31D23A0 */  sb         $v1, %lo(item + 0x4F)($at)
    /* 33630 80043630 C0100400 */  sll        $v0, $a0, 3
  .L80043634:
    /* 33634 80043634 23104400 */  subu       $v0, $v0, $a0
    /* 33638 80043638 80100200 */  sll        $v0, $v0, 2
    /* 3363C 8004363C 23104400 */  subu       $v0, $v0, $a0
    /* 33640 80043640 1280033C */  lui        $v1, %hi(FePlayerNo)
    /* 33644 80043644 78B3638C */  lw         $v1, %lo(FePlayerNo)($v1)
    /* 33648 80043648 80100200 */  sll        $v0, $v0, 2
    /* 3364C 8004364C 0D80013C */  lui        $at, %hi(item + 0x65)
    /* 33650 80043650 21082200 */  addu       $at, $at, $v0
    /* 33654 80043654 B91D23A0 */  sb         $v1, %lo(item + 0x65)($at)
    /* 33658 80043658 0800E003 */  jr         $ra
    /* 3365C 8004365C 00000000 */   nop
endlabel SetupItem__Fi
