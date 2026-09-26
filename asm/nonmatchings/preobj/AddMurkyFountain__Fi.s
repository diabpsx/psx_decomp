.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddMurkyFountain__Fi, 0xBC

glabel AddMurkyFountain__Fi
    /* 1D0A4 80156C9C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1D0A8 80156CA0 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1D0AC 80156CA4 40800400 */  sll        $s0, $a0, 1
    /* 1D0B0 80156CA8 21800402 */  addu       $s0, $s0, $a0
    /* 1D0B4 80156CAC 80801000 */  sll        $s0, $s0, 2
    /* 1D0B8 80156CB0 23800402 */  subu       $s0, $s0, $a0
    /* 1D0BC 80156CB4 80801000 */  sll        $s0, $s0, 2
    /* 1D0C0 80156CB8 27200400 */  nor        $a0, $zero, $a0
    /* 1D0C4 80156CBC 1400BFAF */  sw         $ra, 0x14($sp)
    /* 1D0C8 80156CC0 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 1D0CC 80156CC4 21083000 */  addu       $at, $at, $s0
    /* 1D0D0 80156CC8 6C8C2580 */  lb         $a1, %lo(object + 0x20)($at)
    /* 1D0D4 80156CCC 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 1D0D8 80156CD0 21083000 */  addu       $at, $at, $s0
    /* 1D0DC 80156CD4 6B8C2380 */  lb         $v1, %lo(object + 0x1F)($at)
    /* 1D0E0 80156CD8 FFFFA624 */  addiu      $a2, $a1, -0x1
    /* 1D0E4 80156CDC C0300600 */  sll        $a2, $a2, 3
    /* 1D0E8 80156CE0 C0100300 */  sll        $v0, $v1, 3
    /* 1D0EC 80156CE4 23104300 */  subu       $v0, $v0, $v1
    /* 1D0F0 80156CE8 C0110200 */  sll        $v0, $v0, 7
    /* 1D0F4 80156CEC 2110C200 */  addu       $v0, $a2, $v0
    /* 1D0F8 80156CF0 C0280500 */  sll        $a1, $a1, 3
    /* 1D0FC 80156CF4 FFFF6324 */  addiu      $v1, $v1, -0x1
    /* 1D100 80156CF8 0E80013C */  lui        $at, %hi(dung_map + 0x3)
    /* 1D104 80156CFC 21082200 */  addu       $at, $at, $v0
    /* 1D108 80156D00 2B7A24A0 */  sb         $a0, %lo(dung_map + 0x3)($at)
    /* 1D10C 80156D04 C0100300 */  sll        $v0, $v1, 3
    /* 1D110 80156D08 23104300 */  subu       $v0, $v0, $v1
    /* 1D114 80156D0C C0110200 */  sll        $v0, $v0, 7
    /* 1D118 80156D10 2128A200 */  addu       $a1, $a1, $v0
    /* 1D11C 80156D14 2130C200 */  addu       $a2, $a2, $v0
    /* 1D120 80156D18 0E80013C */  lui        $at, %hi(dung_map + 0x3)
    /* 1D124 80156D1C 21082500 */  addu       $at, $at, $a1
    /* 1D128 80156D20 2B7A24A0 */  sb         $a0, %lo(dung_map + 0x3)($at)
    /* 1D12C 80156D24 0E80013C */  lui        $at, %hi(dung_map + 0x3)
    /* 1D130 80156D28 21082600 */  addu       $at, $at, $a2
    /* 1D134 80156D2C 2B7A24A0 */  sb         $a0, %lo(dung_map + 0x3)($at)
    /* 1D138 80156D30 B7F6000C */  jal        GetRndSeed__Fv
    /* 1D13C 80156D34 00000000 */   nop
    /* 1D140 80156D38 0E80013C */  lui        $at, %hi(object + 0x4)
    /* 1D144 80156D3C 21083000 */  addu       $at, $at, $s0
    /* 1D148 80156D40 508C22AC */  sw         $v0, %lo(object + 0x4)($at)
    /* 1D14C 80156D44 1400BF8F */  lw         $ra, 0x14($sp)
    /* 1D150 80156D48 1000B08F */  lw         $s0, 0x10($sp)
    /* 1D154 80156D4C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1D158 80156D50 0800E003 */  jr         $ra
    /* 1D15C 80156D54 00000000 */   nop
endlabel AddMurkyFountain__Fi
