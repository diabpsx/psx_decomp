.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching __6Dialog_8013cabc, 0x80

glabel __6Dialog_8013cabc
    /* 2EC4 8013CABC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 2EC8 8013CAC0 1000B0AF */  sw         $s0, 0x10($sp)
    /* 2ECC 8013CAC4 21808000 */  addu       $s0, $a0, $zero
    /* 2ED0 8013CAC8 94000224 */  addiu      $v0, $zero, 0x94
    /* 2ED4 8013CACC 1400BFAF */  sw         $ra, 0x14($sp)
    /* 2ED8 8013CAD0 080002AE */  sw         $v0, 0x8($s0)
    /* 2EDC 8013CAD4 1A000224 */  addiu      $v0, $zero, 0x1A
    /* 2EE0 8013CAD8 000002AE */  sw         $v0, 0x0($s0)
    /* 2EE4 8013CADC 040002AE */  sw         $v0, 0x4($s0)
    /* 2EE8 8013CAE0 80000224 */  addiu      $v0, $zero, 0x80
    /* 2EEC 8013CAE4 1280013C */  lui        $at, %hi(DialogRed)
    /* 2EF0 8013CAE8 FDAB22A0 */  sb         $v0, %lo(DialogRed)($at)
    /* 2EF4 8013CAEC 1280013C */  lui        $at, %hi(DialogGreen)
    /* 2EF8 8013CAF0 FEAB22A0 */  sb         $v0, %lo(DialogGreen)($at)
    /* 2EFC 8013CAF4 1280013C */  lui        $at, %hi(DialogBlue)
    /* 2F00 8013CAF8 FFAB22A0 */  sb         $v0, %lo(DialogBlue)($at)
    /* 2F04 8013CAFC 20000224 */  addiu      $v0, $zero, 0x20
    /* 2F08 8013CB00 1280013C */  lui        $at, %hi(DialogTRed)
    /* 2F0C 8013CB04 00AC22A0 */  sb         $v0, %lo(DialogTRed)($at)
    /* 2F10 8013CB08 1280013C */  lui        $at, %hi(DialogTGreen)
    /* 2F14 8013CB0C 01AC22A0 */  sb         $v0, %lo(DialogTGreen)($at)
    /* 2F18 8013CB10 1280013C */  lui        $at, %hi(DialogTBlue)
    /* 2F1C 8013CB14 02AC22A0 */  sb         $v0, %lo(DialogTBlue)($at)
    /* 2F20 8013CB18 CFF2040C */  jal        GetOverlayOtBase__7CBlocks_8013cb3c
    /* 2F24 8013CB1C 00000000 */   nop
    /* 2F28 8013CB20 0C0002AE */  sw         $v0, 0xC($s0)
    /* 2F2C 8013CB24 21100002 */  addu       $v0, $s0, $zero
    /* 2F30 8013CB28 1400BF8F */  lw         $ra, 0x14($sp)
    /* 2F34 8013CB2C 1000B08F */  lw         $s0, 0x10($sp)
    /* 2F38 8013CB30 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 2F3C 8013CB34 0800E003 */  jr         $ra
    /* 2F40 8013CB38 00000000 */   nop
endlabel __6Dialog_8013cabc
