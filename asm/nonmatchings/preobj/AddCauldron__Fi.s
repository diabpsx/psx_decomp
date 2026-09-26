.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddCauldron__Fi, 0x48

glabel AddCauldron__Fi
    /* 1D05C 80156C54 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1D060 80156C58 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1D064 80156C5C 1400BFAF */  sw         $ra, 0x14($sp)
    /* 1D068 80156C60 B7F6000C */  jal        GetRndSeed__Fv
    /* 1D06C 80156C64 21808000 */   addu      $s0, $a0, $zero
    /* 1D070 80156C68 40181000 */  sll        $v1, $s0, 1
    /* 1D074 80156C6C 21187000 */  addu       $v1, $v1, $s0
    /* 1D078 80156C70 80180300 */  sll        $v1, $v1, 2
    /* 1D07C 80156C74 23187000 */  subu       $v1, $v1, $s0
    /* 1D080 80156C78 80180300 */  sll        $v1, $v1, 2
    /* 1D084 80156C7C 0E80013C */  lui        $at, %hi(object + 0x4)
    /* 1D088 80156C80 21082300 */  addu       $at, $at, $v1
    /* 1D08C 80156C84 508C22AC */  sw         $v0, %lo(object + 0x4)($at)
    /* 1D090 80156C88 1400BF8F */  lw         $ra, 0x14($sp)
    /* 1D094 80156C8C 1000B08F */  lw         $s0, 0x10($sp)
    /* 1D098 80156C90 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1D09C 80156C94 0800E003 */  jr         $ra
    /* 1D0A0 80156C98 00000000 */   nop
endlabel AddCauldron__Fi
