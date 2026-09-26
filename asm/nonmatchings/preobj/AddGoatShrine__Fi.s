.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddGoatShrine__Fi, 0x48

glabel AddGoatShrine__Fi
    /* 1D014 80156C0C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1D018 80156C10 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1D01C 80156C14 1400BFAF */  sw         $ra, 0x14($sp)
    /* 1D020 80156C18 B7F6000C */  jal        GetRndSeed__Fv
    /* 1D024 80156C1C 21808000 */   addu      $s0, $a0, $zero
    /* 1D028 80156C20 40181000 */  sll        $v1, $s0, 1
    /* 1D02C 80156C24 21187000 */  addu       $v1, $v1, $s0
    /* 1D030 80156C28 80180300 */  sll        $v1, $v1, 2
    /* 1D034 80156C2C 23187000 */  subu       $v1, $v1, $s0
    /* 1D038 80156C30 80180300 */  sll        $v1, $v1, 2
    /* 1D03C 80156C34 0E80013C */  lui        $at, %hi(object + 0x4)
    /* 1D040 80156C38 21082300 */  addu       $at, $at, $v1
    /* 1D044 80156C3C 508C22AC */  sw         $v0, %lo(object + 0x4)($at)
    /* 1D048 80156C40 1400BF8F */  lw         $ra, 0x14($sp)
    /* 1D04C 80156C44 1000B08F */  lw         $s0, 0x10($sp)
    /* 1D050 80156C48 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1D054 80156C4C 0800E003 */  jr         $ra
    /* 1D058 80156C50 00000000 */   nop
endlabel AddGoatShrine__Fi
