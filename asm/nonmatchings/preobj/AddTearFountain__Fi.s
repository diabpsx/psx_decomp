.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddTearFountain__Fi, 0x48

glabel AddTearFountain__Fi
    /* 1D160 80156D58 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1D164 80156D5C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1D168 80156D60 1400BFAF */  sw         $ra, 0x14($sp)
    /* 1D16C 80156D64 B7F6000C */  jal        GetRndSeed__Fv
    /* 1D170 80156D68 21808000 */   addu      $s0, $a0, $zero
    /* 1D174 80156D6C 40181000 */  sll        $v1, $s0, 1
    /* 1D178 80156D70 21187000 */  addu       $v1, $v1, $s0
    /* 1D17C 80156D74 80180300 */  sll        $v1, $v1, 2
    /* 1D180 80156D78 23187000 */  subu       $v1, $v1, $s0
    /* 1D184 80156D7C 80180300 */  sll        $v1, $v1, 2
    /* 1D188 80156D80 0E80013C */  lui        $at, %hi(object + 0x4)
    /* 1D18C 80156D84 21082300 */  addu       $at, $at, $v1
    /* 1D190 80156D88 508C22AC */  sw         $v0, %lo(object + 0x4)($at)
    /* 1D194 80156D8C 1400BF8F */  lw         $ra, 0x14($sp)
    /* 1D198 80156D90 1000B08F */  lw         $s0, 0x10($sp)
    /* 1D19C 80156D94 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1D1A0 80156D98 0800E003 */  jr         $ra
    /* 1D1A4 80156D9C 00000000 */   nop
endlabel AddTearFountain__Fi
