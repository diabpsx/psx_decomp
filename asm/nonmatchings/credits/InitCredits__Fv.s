.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitCredits__Fv, 0x94

glabel InitCredits__Fv
    /* 35BC 8013D1B4 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 35C0 8013D1B8 05000224 */  addiu      $v0, $zero, 0x5
    /* 35C4 8013D1BC 3C0C82AF */  sw         $v0, %gp_rel(InCredits)($gp)
    /* 35C8 8013D1C0 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 35CC 8013D1C4 1800BFAF */  sw         $ra, 0x18($sp)
    /* 35D0 8013D1C8 1400B1AF */  sw         $s1, 0x14($sp)
    /* 35D4 8013D1CC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 35D8 8013D1D0 440C82AF */  sw         $v0, %gp_rel(CreditSubTitleNo)($gp)
    /* 35DC 8013D1D4 400C82AF */  sw         $v0, %gp_rel(CreditTitleNo)($gp)
    /* 35E0 8013D1D8 044F020C */  jal        GM_UseTexData__Fi
    /* 35E4 8013D1DC CB000424 */   addiu     $a0, $zero, 0xCB
    /* 35E8 8013D1E0 0C80103C */  lui        $s0, %hi(LargeFont)
    /* 35EC 8013D1E4 F4841026 */  addiu      $s0, $s0, %lo(LargeFont)
    /* 35F0 8013D1E8 21200002 */  addu       $a0, $s0, $zero
    /* 35F4 8013D1EC 6B27020C */  jal        SetTextDat__5CFontP7TextDat
    /* 35F8 8013D1F0 21284000 */   addu      $a1, $v0, $zero
    /* 35FC 8013D1F4 0C80113C */  lui        $s1, %hi(LFont)
    /* 3600 8013D1F8 D8883126 */  addiu      $s1, $s1, %lo(LFont)
    /* 3604 8013D1FC 1827020C */  jal        Set__7FontTab
    /* 3608 8013D200 21202002 */   addu      $a0, $s1, $zero
    /* 360C 8013D204 15F7040C */  jal        DoCredits__Fv
    /* 3610 8013D208 00000000 */   nop
    /* 3614 8013D20C 2EF8040C */  jal        ClearFont__5CFont_8013e0b8
    /* 3618 8013D210 21200002 */   addu      $a0, $s0, $zero
    /* 361C 8013D214 044F020C */  jal        GM_UseTexData__Fi
    /* 3620 8013D218 21200000 */   addu      $a0, $zero, $zero
    /* 3624 8013D21C 21200002 */  addu       $a0, $s0, $zero
    /* 3628 8013D220 6B27020C */  jal        SetTextDat__5CFontP7TextDat
    /* 362C 8013D224 21284000 */   addu      $a1, $v0, $zero
    /* 3630 8013D228 1827020C */  jal        Set__7FontTab
    /* 3634 8013D22C 21202002 */   addu      $a0, $s1, $zero
    /* 3638 8013D230 1800BF8F */  lw         $ra, 0x18($sp)
    /* 363C 8013D234 1400B18F */  lw         $s1, 0x14($sp)
    /* 3640 8013D238 1000B08F */  lw         $s0, 0x10($sp)
    /* 3644 8013D23C 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 3648 8013D240 0800E003 */  jr         $ra
    /* 364C 8013D244 00000000 */   nop
endlabel InitCredits__Fv
