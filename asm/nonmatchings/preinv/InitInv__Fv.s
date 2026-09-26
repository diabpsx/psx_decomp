.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitInv__Fv, 0x54

glabel InitInv__Fv
    /* 25878 8015F470 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 2587C 8015F474 1000BFAF */  sw         $ra, 0x10($sp)
    /* 25880 8015F478 1280013C */  lui        $at, %hi(invflag)
    /* 25884 8015F47C 2CC320A0 */  sb         $zero, %lo(invflag)($at)
    /* 25888 8015F480 1280013C */  lui        $at, %hi(drawsbarflag)
    /* 2588C 8015F484 2DC320A0 */  sb         $zero, %lo(drawsbarflag)($at)
    /* 25890 8015F488 1280013C */  lui        $at, %hi(InvBackY)
    /* 25894 8015F48C 30C320AC */  sw         $zero, %lo(InvBackY)($at)
    /* 25898 8015F490 044F020C */  jal        GM_UseTexData__Fi
    /* 2589C 8015F494 21200000 */   addu      $a0, $zero, $zero
    /* 258A0 8015F498 1280013C */  lui        $at, %hi(InvPanelTData)
    /* 258A4 8015F49C 08C322AC */  sw         $v0, %lo(InvPanelTData)($at)
    /* 258A8 8015F4A0 19000224 */  addiu      $v0, $zero, 0x19
    /* 258AC 8015F4A4 1280013C */  lui        $at, %hi(InvGfxTData)
    /* 258B0 8015F4A8 0CC320AC */  sw         $zero, %lo(InvGfxTData)($at)
    /* 258B4 8015F4AC 1280013C */  lui        $at, %hi(InvCursPos)
    /* 258B8 8015F4B0 34C322AC */  sw         $v0, %lo(InvCursPos)($at)
    /* 258BC 8015F4B4 1000BF8F */  lw         $ra, 0x10($sp)
    /* 258C0 8015F4B8 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 258C4 8015F4BC 0800E003 */  jr         $ra
    /* 258C8 8015F4C0 00000000 */   nop
endlabel InitInv__Fv
