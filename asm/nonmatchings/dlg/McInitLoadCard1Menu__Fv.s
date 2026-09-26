.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching McInitLoadCard1Menu__Fv, 0x40

glabel McInitLoadCard1Menu__Fv
    /* 1FCF4 801598EC E40C828F */  lw         $v0, %gp_rel(LoadType)($gp)
    /* 1FCF8 801598F0 01000324 */  addiu      $v1, $zero, 0x1
    /* 1FCFC 801598F4 E00C80AF */  sw         $zero, %gp_rel(current_card)($gp)
    /* 1FD00 801598F8 06004314 */  bne        $v0, $v1, .L80159914
    /* 1FD04 801598FC 02000224 */   addiu     $v0, $zero, 0x2
    /* 1FD08 80159900 04000224 */  addiu      $v0, $zero, 0x4
    /* 1FD0C 80159904 1280013C */  lui        $at, %hi(loadflag)
    /* 1FD10 80159908 7CB122AC */  sw         $v0, %lo(loadflag)($at)
    /* 1FD14 8015990C 49660508 */  j          .L80159924
    /* 1FD18 80159910 00000000 */   nop
  .L80159914:
    /* 1FD1C 80159914 1280013C */  lui        $at, %hi(DoLoadedChar)
    /* 1FD20 80159918 ECB923AC */  sw         $v1, %lo(DoLoadedChar)($at)
    /* 1FD24 8015991C 1280013C */  lui        $at, %hi(FeFlag)
    /* 1FD28 80159920 74B322A0 */  sb         $v0, %lo(FeFlag)($at)
  .L80159924:
    /* 1FD2C 80159924 0800E003 */  jr         $ra
    /* 1FD30 80159928 00000000 */   nop
endlabel McInitLoadCard1Menu__Fv
