.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitLevelCursor__Fv, 0x60

glabel InitLevelCursor__Fv
    /* 27824 80037824 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 27828 80037828 1000BFAF */  sw         $ra, 0x10($sp)
    /* 2782C 8003782C E8DD000C */  jal        SetCursor__Fi
    /* 27830 80037830 01000424 */   addiu     $a0, $zero, 0x1
    /* 27834 80037834 1280033C */  lui        $v1, %hi(ViewX)
    /* 27838 80037838 14C1638C */  lw         $v1, %lo(ViewX)($v1)
    /* 2783C 8003783C 1280043C */  lui        $a0, %hi(ViewY)
    /* 27840 80037840 18C1848C */  lw         $a0, %lo(ViewY)($a0)
    /* 27844 80037844 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 27848 80037848 D80F82AF */  sw         $v0, %gp_rel(_pcursmonst)($gp)
    /* 2784C 8003784C DC0F82AF */  sw         $v0, %gp_rel(_pcursmonst + 0x4)($gp)
    /* 27850 80037850 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 27854 80037854 E00F82A3 */  sb         $v0, %gp_rel(_pcursobj)($gp)
    /* 27858 80037858 E10F82A3 */  sb         $v0, %gp_rel(_pcursobj + 0x1)($gp)
    /* 2785C 8003785C E40F82A3 */  sb         $v0, %gp_rel(_pcursitem)($gp)
    /* 27860 80037860 E50F82A3 */  sb         $v0, %gp_rel(_pcursitem + 0x1)($gp)
    /* 27864 80037864 EC0F82A3 */  sb         $v0, %gp_rel(_pcursplr)($gp)
    /* 27868 80037868 ED0F82A3 */  sb         $v0, %gp_rel(_pcursplr + 0x1)($gp)
    /* 2786C 8003786C D00F83AF */  sw         $v1, %gp_rel(cursmx)($gp)
    /* 27870 80037870 D40F84AF */  sw         $a0, %gp_rel(cursmy)($gp)
    /* 27874 80037874 1000BF8F */  lw         $ra, 0x10($sp)
    /* 27878 80037878 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 2787C 8003787C 0800E003 */  jr         $ra
    /* 27880 80037880 00000000 */   nop
endlabel InitLevelCursor__Fv
