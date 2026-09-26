.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ClearMissileSpot__Fi, 0xA0

glabel ClearMissileSpot__Fi
    /* 10EC8 8014AAC0 80180400 */  sll        $v1, $a0, 2
    /* 10ECC 8014AAC4 21186400 */  addu       $v1, $v1, $a0
    /* 10ED0 8014AAC8 80180300 */  sll        $v1, $v1, 2
    /* 10ED4 8014AACC 23186400 */  subu       $v1, $v1, $a0
    /* 10ED8 8014AAD0 80180300 */  sll        $v1, $v1, 2
    /* 10EDC 8014AAD4 1080013C */  lui        $at, %hi(missile + 0x32)
    /* 10EE0 8014AAD8 21082300 */  addu       $at, $at, $v1
    /* 10EE4 8014AADC 8A2C2480 */  lb         $a0, %lo(missile + 0x32)($at)
    /* 10EE8 8014AAE0 1080013C */  lui        $at, %hi(missile + 0x31)
    /* 10EEC 8014AAE4 21082300 */  addu       $at, $at, $v1
    /* 10EF0 8014AAE8 892C2580 */  lb         $a1, %lo(missile + 0x31)($at)
    /* 10EF4 8014AAEC C0200400 */  sll        $a0, $a0, 3
    /* 10EF8 8014AAF0 C0100500 */  sll        $v0, $a1, 3
    /* 10EFC 8014AAF4 23104500 */  subu       $v0, $v0, $a1
    /* 10F00 8014AAF8 C0110200 */  sll        $v0, $v0, 7
    /* 10F04 8014AAFC 21208200 */  addu       $a0, $a0, $v0
    /* 10F08 8014AB00 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 10F0C 8014AB04 21082400 */  addu       $at, $at, $a0
    /* 10F10 8014AB08 2E7A2290 */  lbu        $v0, %lo(dung_map + 0x6)($at)
    /* 10F14 8014AB0C 00000000 */  nop
    /* 10F18 8014AB10 BF004230 */  andi       $v0, $v0, 0xBF
    /* 10F1C 8014AB14 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 10F20 8014AB18 21082400 */  addu       $at, $at, $a0
    /* 10F24 8014AB1C 2E7A22A0 */  sb         $v0, %lo(dung_map + 0x6)($at)
    /* 10F28 8014AB20 1080013C */  lui        $at, %hi(missile + 0x32)
    /* 10F2C 8014AB24 21082300 */  addu       $at, $at, $v1
    /* 10F30 8014AB28 8A2C2480 */  lb         $a0, %lo(missile + 0x32)($at)
    /* 10F34 8014AB2C 1080013C */  lui        $at, %hi(missile + 0x31)
    /* 10F38 8014AB30 21082300 */  addu       $at, $at, $v1
    /* 10F3C 8014AB34 892C2380 */  lb         $v1, %lo(missile + 0x31)($at)
    /* 10F40 8014AB38 C0200400 */  sll        $a0, $a0, 3
    /* 10F44 8014AB3C C0100300 */  sll        $v0, $v1, 3
    /* 10F48 8014AB40 23104300 */  subu       $v0, $v0, $v1
    /* 10F4C 8014AB44 C0110200 */  sll        $v0, $v0, 7
    /* 10F50 8014AB48 21208200 */  addu       $a0, $a0, $v0
    /* 10F54 8014AB4C 0E80013C */  lui        $at, %hi(dung_map + 0x5)
    /* 10F58 8014AB50 21082400 */  addu       $at, $at, $a0
    /* 10F5C 8014AB54 2D7A20A0 */  sb         $zero, %lo(dung_map + 0x5)($at)
    /* 10F60 8014AB58 0800E003 */  jr         $ra
    /* 10F64 8014AB5C 00000000 */   nop
endlabel ClearMissileSpot__Fi
