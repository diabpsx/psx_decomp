.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FeInitPlayer1ClassMenu__Fv, 0x14

glabel FeInitPlayer1ClassMenu__Fv
    /* 126C 8013AE64 1280023C */  lui        $v0, %hi(MemCardActive)
    /* 1270 8013AE68 60B1428C */  lw         $v0, %lo(MemCardActive)($v0)
    /* 1274 8013AE6C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1278 8013AE70 1000BFAF */  sw         $ra, 0x10($sp)
    /* 127C 8013AE74 A80B80AF */  sw         $zero, %gp_rel(LoadedChar)($gp)
endlabel FeInitPlayer1ClassMenu__Fv
