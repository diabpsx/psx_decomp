.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching __6Dialog_800af000, 0x80

glabel __6Dialog_800af000
    /* 9F000 800AF000 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 9F004 800AF004 1000B0AF */  sw         $s0, 0x10($sp)
    /* 9F008 800AF008 21808000 */  addu       $s0, $a0, $zero
    /* 9F00C 800AF00C 94000224 */  addiu      $v0, $zero, 0x94
    /* 9F010 800AF010 1400BFAF */  sw         $ra, 0x14($sp)
    /* 9F014 800AF014 080002AE */  sw         $v0, 0x8($s0)
    /* 9F018 800AF018 1A000224 */  addiu      $v0, $zero, 0x1A
    /* 9F01C 800AF01C 000002AE */  sw         $v0, 0x0($s0)
    /* 9F020 800AF020 040002AE */  sw         $v0, 0x4($s0)
    /* 9F024 800AF024 80000224 */  addiu      $v0, $zero, 0x80
    /* 9F028 800AF028 1280013C */  lui        $at, %hi(DialogRed)
    /* 9F02C 800AF02C FDAB22A0 */  sb         $v0, %lo(DialogRed)($at)
    /* 9F030 800AF030 1280013C */  lui        $at, %hi(DialogGreen)
    /* 9F034 800AF034 FEAB22A0 */  sb         $v0, %lo(DialogGreen)($at)
    /* 9F038 800AF038 1280013C */  lui        $at, %hi(DialogBlue)
    /* 9F03C 800AF03C FFAB22A0 */  sb         $v0, %lo(DialogBlue)($at)
    /* 9F040 800AF040 20000224 */  addiu      $v0, $zero, 0x20
    /* 9F044 800AF044 1280013C */  lui        $at, %hi(DialogTRed)
    /* 9F048 800AF048 00AC22A0 */  sb         $v0, %lo(DialogTRed)($at)
    /* 9F04C 800AF04C 1280013C */  lui        $at, %hi(DialogTGreen)
    /* 9F050 800AF050 01AC22A0 */  sb         $v0, %lo(DialogTGreen)($at)
    /* 9F054 800AF054 1280013C */  lui        $at, %hi(DialogTBlue)
    /* 9F058 800AF058 02AC22A0 */  sb         $v0, %lo(DialogTBlue)($at)
    /* 9F05C 800AF05C 20BC020C */  jal        GetOverlayOtBase__7CBlocks_800af080
    /* 9F060 800AF060 00000000 */   nop
    /* 9F064 800AF064 0C0002AE */  sw         $v0, 0xC($s0)
    /* 9F068 800AF068 21100002 */  addu       $v0, $s0, $zero
    /* 9F06C 800AF06C 1400BF8F */  lw         $ra, 0x14($sp)
    /* 9F070 800AF070 1000B08F */  lw         $s0, 0x10($sp)
    /* 9F074 800AF074 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 9F078 800AF078 0800E003 */  jr         $ra
    /* 9F07C 800AF07C 00000000 */   nop
endlabel __6Dialog_800af000
