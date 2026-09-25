.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching __6Dialog_800a4f5c, 0x80

glabel __6Dialog_800a4f5c
    /* 94F5C 800A4F5C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 94F60 800A4F60 1000B0AF */  sw         $s0, 0x10($sp)
    /* 94F64 800A4F64 21808000 */  addu       $s0, $a0, $zero
    /* 94F68 800A4F68 94000224 */  addiu      $v0, $zero, 0x94
    /* 94F6C 800A4F6C 1400BFAF */  sw         $ra, 0x14($sp)
    /* 94F70 800A4F70 080002AE */  sw         $v0, 0x8($s0)
    /* 94F74 800A4F74 1A000224 */  addiu      $v0, $zero, 0x1A
    /* 94F78 800A4F78 000002AE */  sw         $v0, 0x0($s0)
    /* 94F7C 800A4F7C 040002AE */  sw         $v0, 0x4($s0)
    /* 94F80 800A4F80 80000224 */  addiu      $v0, $zero, 0x80
    /* 94F84 800A4F84 1280013C */  lui        $at, %hi(DialogRed)
    /* 94F88 800A4F88 FDAB22A0 */  sb         $v0, %lo(DialogRed)($at)
    /* 94F8C 800A4F8C 1280013C */  lui        $at, %hi(DialogGreen)
    /* 94F90 800A4F90 FEAB22A0 */  sb         $v0, %lo(DialogGreen)($at)
    /* 94F94 800A4F94 1280013C */  lui        $at, %hi(DialogBlue)
    /* 94F98 800A4F98 FFAB22A0 */  sb         $v0, %lo(DialogBlue)($at)
    /* 94F9C 800A4F9C 20000224 */  addiu      $v0, $zero, 0x20
    /* 94FA0 800A4FA0 1280013C */  lui        $at, %hi(DialogTRed)
    /* 94FA4 800A4FA4 00AC22A0 */  sb         $v0, %lo(DialogTRed)($at)
    /* 94FA8 800A4FA8 1280013C */  lui        $at, %hi(DialogTGreen)
    /* 94FAC 800A4FAC 01AC22A0 */  sb         $v0, %lo(DialogTGreen)($at)
    /* 94FB0 800A4FB0 1280013C */  lui        $at, %hi(DialogTBlue)
    /* 94FB4 800A4FB4 02AC22A0 */  sb         $v0, %lo(DialogTBlue)($at)
    /* 94FB8 800A4FB8 F793020C */  jal        GetOverlayOtBase__7CBlocks_800a4fdc
    /* 94FBC 800A4FBC 00000000 */   nop
    /* 94FC0 800A4FC0 0C0002AE */  sw         $v0, 0xC($s0)
    /* 94FC4 800A4FC4 21100002 */  addu       $v0, $s0, $zero
    /* 94FC8 800A4FC8 1400BF8F */  lw         $ra, 0x14($sp)
    /* 94FCC 800A4FCC 1000B08F */  lw         $s0, 0x10($sp)
    /* 94FD0 800A4FD0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 94FD4 800A4FD4 0800E003 */  jr         $ra
    /* 94FD8 800A4FD8 00000000 */   nop
endlabel __6Dialog_800a4f5c
