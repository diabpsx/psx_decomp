.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching McInitLoadCard2Menu__Fv, 0x40

glabel McInitLoadCard2Menu__Fv
    /* 1FD34 8015992C E40C828F */  lw         $v0, %gp_rel(LoadType)($gp)
    /* 1FD38 80159930 01000324 */  addiu      $v1, $zero, 0x1
    /* 1FD3C 80159934 E00C83AF */  sw         $v1, %gp_rel(current_card)($gp)
    /* 1FD40 80159938 06004314 */  bne        $v0, $v1, .L80159954
    /* 1FD44 8015993C 02000224 */   addiu     $v0, $zero, 0x2
    /* 1FD48 80159940 04000224 */  addiu      $v0, $zero, 0x4
    /* 1FD4C 80159944 1280013C */  lui        $at, %hi(loadflag)
    /* 1FD50 80159948 7CB122AC */  sw         $v0, %lo(loadflag)($at)
    /* 1FD54 8015994C 59660508 */  j          .L80159964
    /* 1FD58 80159950 00000000 */   nop
  .L80159954:
    /* 1FD5C 80159954 1280013C */  lui        $at, %hi(DoLoadedChar)
    /* 1FD60 80159958 ECB923AC */  sw         $v1, %lo(DoLoadedChar)($at)
    /* 1FD64 8015995C 1280013C */  lui        $at, %hi(FeFlag)
    /* 1FD68 80159960 74B322A0 */  sb         $v0, %lo(FeFlag)($at)
  .L80159964:
    /* 1FD6C 80159964 0800E003 */  jr         $ra
    /* 1FD70 80159968 00000000 */   nop
endlabel McInitLoadCard2Menu__Fv
