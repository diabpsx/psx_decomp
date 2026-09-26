.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching gSameRoom__Fii, 0x98

glabel gSameRoom__Fii
    /* 1CE70 80156A68 40100400 */  sll        $v0, $a0, 1
    /* 1CE74 80156A6C 21104400 */  addu       $v0, $v0, $a0
    /* 1CE78 80156A70 80100200 */  sll        $v0, $v0, 2
    /* 1CE7C 80156A74 21104400 */  addu       $v0, $v0, $a0
    /* 1CE80 80156A78 C0100200 */  sll        $v0, $v0, 3
    /* 1CE84 80156A7C 1080043C */  lui        $a0, %hi(monster)
    /* 1CE88 80156A80 94538424 */  addiu      $a0, $a0, %lo(monster)
    /* 1CE8C 80156A84 21104400 */  addu       $v0, $v0, $a0
    /* 1CE90 80156A88 40180500 */  sll        $v1, $a1, 1
    /* 1CE94 80156A8C 21186500 */  addu       $v1, $v1, $a1
    /* 1CE98 80156A90 80180300 */  sll        $v1, $v1, 2
    /* 1CE9C 80156A94 21186500 */  addu       $v1, $v1, $a1
    /* 1CEA0 80156A98 C0180300 */  sll        $v1, $v1, 3
    /* 1CEA4 80156A9C 21186400 */  addu       $v1, $v1, $a0
    /* 1CEA8 80156AA0 35004580 */  lb         $a1, 0x35($v0)
    /* 1CEAC 80156AA4 34004480 */  lb         $a0, 0x34($v0)
    /* 1CEB0 80156AA8 C0280500 */  sll        $a1, $a1, 3
    /* 1CEB4 80156AAC C0100400 */  sll        $v0, $a0, 3
    /* 1CEB8 80156AB0 23104400 */  subu       $v0, $v0, $a0
    /* 1CEBC 80156AB4 C0110200 */  sll        $v0, $v0, 7
    /* 1CEC0 80156AB8 2128A200 */  addu       $a1, $a1, $v0
    /* 1CEC4 80156ABC 35006480 */  lb         $a0, 0x35($v1)
    /* 1CEC8 80156AC0 34006380 */  lb         $v1, 0x34($v1)
    /* 1CECC 80156AC4 C0200400 */  sll        $a0, $a0, 3
    /* 1CED0 80156AC8 C0100300 */  sll        $v0, $v1, 3
    /* 1CED4 80156ACC 23104300 */  subu       $v0, $v0, $v1
    /* 1CED8 80156AD0 C0110200 */  sll        $v0, $v0, 7
    /* 1CEDC 80156AD4 21208200 */  addu       $a0, $a0, $v0
    /* 1CEE0 80156AD8 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 1CEE4 80156ADC 21082500 */  addu       $at, $at, $a1
    /* 1CEE8 80156AE0 2F7A2280 */  lb         $v0, %lo(dung_map + 0x7)($at)
    /* 1CEEC 80156AE4 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 1CEF0 80156AE8 21082400 */  addu       $at, $at, $a0
    /* 1CEF4 80156AEC 2F7A2380 */  lb         $v1, %lo(dung_map + 0x7)($at)
    /* 1CEF8 80156AF0 00000000 */  nop
    /* 1CEFC 80156AF4 26104300 */  xor        $v0, $v0, $v1
    /* 1CF00 80156AF8 0800E003 */  jr         $ra
    /* 1CF04 80156AFC 0100422C */   sltiu     $v0, $v0, 0x1
endlabel gSameRoom__Fii
