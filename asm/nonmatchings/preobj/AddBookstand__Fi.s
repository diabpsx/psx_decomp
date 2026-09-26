.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddBookstand__Fi, 0x48

glabel AddBookstand__Fi
    /* 1CEC8 80156AC0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1CECC 80156AC4 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1CED0 80156AC8 1400BFAF */  sw         $ra, 0x14($sp)
    /* 1CED4 80156ACC B7F6000C */  jal        GetRndSeed__Fv
    /* 1CED8 80156AD0 21808000 */   addu      $s0, $a0, $zero
    /* 1CEDC 80156AD4 40181000 */  sll        $v1, $s0, 1
    /* 1CEE0 80156AD8 21187000 */  addu       $v1, $v1, $s0
    /* 1CEE4 80156ADC 80180300 */  sll        $v1, $v1, 2
    /* 1CEE8 80156AE0 23187000 */  subu       $v1, $v1, $s0
    /* 1CEEC 80156AE4 80180300 */  sll        $v1, $v1, 2
    /* 1CEF0 80156AE8 0E80013C */  lui        $at, %hi(object + 0x4)
    /* 1CEF4 80156AEC 21082300 */  addu       $at, $at, $v1
    /* 1CEF8 80156AF0 508C22AC */  sw         $v0, %lo(object + 0x4)($at)
    /* 1CEFC 80156AF4 1400BF8F */  lw         $ra, 0x14($sp)
    /* 1CF00 80156AF8 1000B08F */  lw         $s0, 0x10($sp)
    /* 1CF04 80156AFC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1CF08 80156B00 0800E003 */  jr         $ra
    /* 1CF0C 80156B04 00000000 */   nop
endlabel AddBookstand__Fi
