.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching McInitLoadGameMenu__Fv, 0x64

glabel McInitLoadGameMenu__Fv
    /* 1FE10 80159A08 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1FE14 80159A0C 20000224 */  addiu      $v0, $zero, 0x20
    /* 1FE18 80159A10 1280013C */  lui        $at, %hi(FeBackX)
    /* 1FE1C 80159A14 64B322AC */  sw         $v0, %lo(FeBackX)($at)
    /* 1FE20 80159A18 40000224 */  addiu      $v0, $zero, 0x40
    /* 1FE24 80159A1C 1280013C */  lui        $at, %hi(FeBackY)
    /* 1FE28 80159A20 68B322AC */  sw         $v0, %lo(FeBackY)($at)
    /* 1FE2C 80159A24 00010224 */  addiu      $v0, $zero, 0x100
    /* 1FE30 80159A28 1280013C */  lui        $at, %hi(FeBackW)
    /* 1FE34 80159A2C 6CB322AC */  sw         $v0, %lo(FeBackW)($at)
    /* 1FE38 80159A30 70000224 */  addiu      $v0, $zero, 0x70
    /* 1FE3C 80159A34 1280013C */  lui        $at, %hi(FeBackH)
    /* 1FE40 80159A38 70B322AC */  sw         $v0, %lo(FeBackH)($at)
    /* 1FE44 80159A3C 01000224 */  addiu      $v0, $zero, 0x1
    /* 1FE48 80159A40 1000BFAF */  sw         $ra, 0x10($sp)
    /* 1FE4C 80159A44 A80C80AF */  sw         $zero, %gp_rel(fileinfoflag)($gp)
    /* 1FE50 80159A48 1280013C */  lui        $at, %hi(loadflag)
    /* 1FE54 80159A4C 7CB120AC */  sw         $zero, %lo(loadflag)($at)
    /* 1FE58 80159A50 E40C82AF */  sw         $v0, %gp_rel(LoadType)($gp)
    /* 1FE5C 80159A54 5B66050C */  jal        ChooseCardLoad__Fv
    /* 1FE60 80159A58 00000000 */   nop
    /* 1FE64 80159A5C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1FE68 80159A60 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1FE6C 80159A64 0800E003 */  jr         $ra
    /* 1FE70 80159A68 00000000 */   nop
endlabel McInitLoadGameMenu__Fv
