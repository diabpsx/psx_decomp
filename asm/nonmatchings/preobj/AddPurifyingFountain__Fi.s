.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddPurifyingFountain__Fi, 0xBC

glabel AddPurifyingFountain__Fi
    /* 1CF58 80156B50 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1CF5C 80156B54 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1CF60 80156B58 40800400 */  sll        $s0, $a0, 1
    /* 1CF64 80156B5C 21800402 */  addu       $s0, $s0, $a0
    /* 1CF68 80156B60 80801000 */  sll        $s0, $s0, 2
    /* 1CF6C 80156B64 23800402 */  subu       $s0, $s0, $a0
    /* 1CF70 80156B68 80801000 */  sll        $s0, $s0, 2
    /* 1CF74 80156B6C 27200400 */  nor        $a0, $zero, $a0
    /* 1CF78 80156B70 1400BFAF */  sw         $ra, 0x14($sp)
    /* 1CF7C 80156B74 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 1CF80 80156B78 21083000 */  addu       $at, $at, $s0
    /* 1CF84 80156B7C 6C8C2580 */  lb         $a1, %lo(object + 0x20)($at)
    /* 1CF88 80156B80 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 1CF8C 80156B84 21083000 */  addu       $at, $at, $s0
    /* 1CF90 80156B88 6B8C2380 */  lb         $v1, %lo(object + 0x1F)($at)
    /* 1CF94 80156B8C FFFFA624 */  addiu      $a2, $a1, -0x1
    /* 1CF98 80156B90 C0300600 */  sll        $a2, $a2, 3
    /* 1CF9C 80156B94 C0100300 */  sll        $v0, $v1, 3
    /* 1CFA0 80156B98 23104300 */  subu       $v0, $v0, $v1
    /* 1CFA4 80156B9C C0110200 */  sll        $v0, $v0, 7
    /* 1CFA8 80156BA0 2110C200 */  addu       $v0, $a2, $v0
    /* 1CFAC 80156BA4 C0280500 */  sll        $a1, $a1, 3
    /* 1CFB0 80156BA8 FFFF6324 */  addiu      $v1, $v1, -0x1
    /* 1CFB4 80156BAC 0E80013C */  lui        $at, %hi(dung_map + 0x3)
    /* 1CFB8 80156BB0 21082200 */  addu       $at, $at, $v0
    /* 1CFBC 80156BB4 2B7A24A0 */  sb         $a0, %lo(dung_map + 0x3)($at)
    /* 1CFC0 80156BB8 C0100300 */  sll        $v0, $v1, 3
    /* 1CFC4 80156BBC 23104300 */  subu       $v0, $v0, $v1
    /* 1CFC8 80156BC0 C0110200 */  sll        $v0, $v0, 7
    /* 1CFCC 80156BC4 2128A200 */  addu       $a1, $a1, $v0
    /* 1CFD0 80156BC8 2130C200 */  addu       $a2, $a2, $v0
    /* 1CFD4 80156BCC 0E80013C */  lui        $at, %hi(dung_map + 0x3)
    /* 1CFD8 80156BD0 21082500 */  addu       $at, $at, $a1
    /* 1CFDC 80156BD4 2B7A24A0 */  sb         $a0, %lo(dung_map + 0x3)($at)
    /* 1CFE0 80156BD8 0E80013C */  lui        $at, %hi(dung_map + 0x3)
    /* 1CFE4 80156BDC 21082600 */  addu       $at, $at, $a2
    /* 1CFE8 80156BE0 2B7A24A0 */  sb         $a0, %lo(dung_map + 0x3)($at)
    /* 1CFEC 80156BE4 B7F6000C */  jal        GetRndSeed__Fv
    /* 1CFF0 80156BE8 00000000 */   nop
    /* 1CFF4 80156BEC 0E80013C */  lui        $at, %hi(object + 0x4)
    /* 1CFF8 80156BF0 21083000 */  addu       $at, $at, $s0
    /* 1CFFC 80156BF4 508C22AC */  sw         $v0, %lo(object + 0x4)($at)
    /* 1D000 80156BF8 1400BF8F */  lw         $ra, 0x14($sp)
    /* 1D004 80156BFC 1000B08F */  lw         $s0, 0x10($sp)
    /* 1D008 80156C00 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1D00C 80156C04 0800E003 */  jr         $ra
    /* 1D010 80156C08 00000000 */   nop
endlabel AddPurifyingFountain__Fi
