.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetMissDir__Fii, 0x4C

glabel SetMissDir__Fii
    /* 382C 8013D424 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 3830 8013D428 80100400 */  sll        $v0, $a0, 2
    /* 3834 8013D42C 21104400 */  addu       $v0, $v0, $a0
    /* 3838 8013D430 80100200 */  sll        $v0, $v0, 2
    /* 383C 8013D434 23104400 */  subu       $v0, $v0, $a0
    /* 3840 8013D438 80100200 */  sll        $v0, $v0, 2
    /* 3844 8013D43C 1000BFAF */  sw         $ra, 0x10($sp)
    /* 3848 8013D440 1080013C */  lui        $at, %hi(missile + 0x3F)
    /* 384C 8013D444 21082200 */  addu       $at, $at, $v0
    /* 3850 8013D448 972C25A0 */  sb         $a1, %lo(missile + 0x3F)($at)
    /* 3854 8013D44C 1080013C */  lui        $at, %hi(missile + 0x37)
    /* 3858 8013D450 21082200 */  addu       $at, $at, $v0
    /* 385C 8013D454 8F2C2590 */  lbu        $a1, %lo(missile + 0x37)($at)
    /* 3860 8013D458 D3F4040C */  jal        SetMissAnim__Fii
    /* 3864 8013D45C 00000000 */   nop
    /* 3868 8013D460 1000BF8F */  lw         $ra, 0x10($sp)
    /* 386C 8013D464 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 3870 8013D468 0800E003 */  jr         $ra
    /* 3874 8013D46C 00000000 */   nop
endlabel SetMissDir__Fii
