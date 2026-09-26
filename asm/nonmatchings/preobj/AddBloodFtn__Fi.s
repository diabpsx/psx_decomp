.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddBloodFtn__Fi, 0x48

glabel AddBloodFtn__Fi
    /* 1CF10 80156B08 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1CF14 80156B0C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1CF18 80156B10 1400BFAF */  sw         $ra, 0x14($sp)
    /* 1CF1C 80156B14 B7F6000C */  jal        GetRndSeed__Fv
    /* 1CF20 80156B18 21808000 */   addu      $s0, $a0, $zero
    /* 1CF24 80156B1C 40181000 */  sll        $v1, $s0, 1
    /* 1CF28 80156B20 21187000 */  addu       $v1, $v1, $s0
    /* 1CF2C 80156B24 80180300 */  sll        $v1, $v1, 2
    /* 1CF30 80156B28 23187000 */  subu       $v1, $v1, $s0
    /* 1CF34 80156B2C 80180300 */  sll        $v1, $v1, 2
    /* 1CF38 80156B30 0E80013C */  lui        $at, %hi(object + 0x4)
    /* 1CF3C 80156B34 21082300 */  addu       $at, $at, $v1
    /* 1CF40 80156B38 508C22AC */  sw         $v0, %lo(object + 0x4)($at)
    /* 1CF44 80156B3C 1400BF8F */  lw         $ra, 0x14($sp)
    /* 1CF48 80156B40 1000B08F */  lw         $s0, 0x10($sp)
    /* 1CF4C 80156B44 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1CF50 80156B48 0800E003 */  jr         $ra
    /* 1CF54 80156B4C 00000000 */   nop
endlabel AddBloodFtn__Fi
