.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching saveplrpos__Fv, 0xBC

glabel saveplrpos__Fv
    /* 1F8B0 801594A8 1280023C */  lui        $v0, %hi(ViewX)
    /* 1F8B4 801594AC 14C1428C */  lw         $v0, %lo(ViewX)($v0)
    /* 1F8B8 801594B0 1280033C */  lui        $v1, %hi(ViewY)
    /* 1F8BC 801594B4 18C1638C */  lw         $v1, %lo(ViewY)($v1)
    /* 1F8C0 801594B8 0E80043C */  lui        $a0, %hi(plr + 0x30)
    /* 1F8C4 801594BC 68A58494 */  lhu        $a0, %lo(plr + 0x30)($a0)
    /* 1F8C8 801594C0 0E80053C */  lui        $a1, %hi(plr + 0x32)
    /* 1F8CC 801594C4 6AA5A594 */  lhu        $a1, %lo(plr + 0x32)($a1)
    /* 1F8D0 801594C8 0E80063C */  lui        $a2, %hi(plr + 0x1A18)
    /* 1F8D4 801594CC 50BFC694 */  lhu        $a2, %lo(plr + 0x1A18)($a2)
    /* 1F8D8 801594D0 0E80073C */  lui        $a3, %hi(plr + 0x1A1A)
    /* 1F8DC 801594D4 52BFE794 */  lhu        $a3, %lo(plr + 0x1A1A)($a3)
    /* 1F8E0 801594D8 0E80083C */  lui        $t0, %hi(plr + 0x1D)
    /* 1F8E4 801594DC 55A50891 */  lbu        $t0, %lo(plr + 0x1D)($t0)
    /* 1F8E8 801594E0 0E80013C */  lui        $at, %hi(plr + 0x156)
    /* 1F8EC 801594E4 8EA622A4 */  sh         $v0, %lo(plr + 0x156)($at)
    /* 1F8F0 801594E8 0E80013C */  lui        $at, %hi(plr + 0x158)
    /* 1F8F4 801594EC 90A623A4 */  sh         $v1, %lo(plr + 0x158)($at)
    /* 1F8F8 801594F0 0E80013C */  lui        $at, %hi(plr + 0x15A)
    /* 1F8FC 801594F4 92A624A4 */  sh         $a0, %lo(plr + 0x15A)($at)
    /* 1F900 801594F8 0E80013C */  lui        $at, %hi(plr + 0x15C)
    /* 1F904 801594FC 94A625A4 */  sh         $a1, %lo(plr + 0x15C)($at)
    /* 1F908 80159500 0E80013C */  lui        $at, %hi(plr + 0x15E)
    /* 1F90C 80159504 96A626A4 */  sh         $a2, %lo(plr + 0x15E)($at)
    /* 1F910 80159508 0E80013C */  lui        $at, %hi(plr + 0x160)
    /* 1F914 8015950C 98A627A4 */  sh         $a3, %lo(plr + 0x160)($at)
    /* 1F918 80159510 05000011 */  beqz       $t0, .L80159528
    /* 1F91C 80159514 00000000 */   nop
    /* 1F920 80159518 0E80013C */  lui        $at, %hi(plr + 0x32)
    /* 1F924 8015951C 6AA520A4 */  sh         $zero, %lo(plr + 0x32)($at)
    /* 1F928 80159520 0E80013C */  lui        $at, %hi(plr + 0x30)
    /* 1F92C 80159524 68A520A4 */  sh         $zero, %lo(plr + 0x30)($at)
  .L80159528:
    /* 1F930 80159528 0E80023C */  lui        $v0, %hi(plr + 0x1A05)
    /* 1F934 8015952C 3DBF4290 */  lbu        $v0, %lo(plr + 0x1A05)($v0)
    /* 1F938 80159530 00000000 */  nop
    /* 1F93C 80159534 05004010 */  beqz       $v0, .L8015954C
    /* 1F940 80159538 00000000 */   nop
    /* 1F944 8015953C 0E80013C */  lui        $at, %hi(plr + 0x1A1A)
    /* 1F948 80159540 52BF20A4 */  sh         $zero, %lo(plr + 0x1A1A)($at)
    /* 1F94C 80159544 0E80013C */  lui        $at, %hi(plr + 0x1A18)
    /* 1F950 80159548 50BF20A4 */  sh         $zero, %lo(plr + 0x1A18)($at)
  .L8015954C:
    /* 1F954 8015954C 1280013C */  lui        $at, %hi(ViewY)
    /* 1F958 80159550 18C120AC */  sw         $zero, %lo(ViewY)($at)
    /* 1F95C 80159554 1280013C */  lui        $at, %hi(ViewX)
    /* 1F960 80159558 14C120AC */  sw         $zero, %lo(ViewX)($at)
    /* 1F964 8015955C 0800E003 */  jr         $ra
    /* 1F968 80159560 00000000 */   nop
endlabel saveplrpos__Fv
