.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching __6Dialog_80161ea8, 0x80

glabel __6Dialog_80161ea8
    /* 282B0 80161EA8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 282B4 80161EAC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 282B8 80161EB0 21808000 */  addu       $s0, $a0, $zero
    /* 282BC 80161EB4 94000224 */  addiu      $v0, $zero, 0x94
    /* 282C0 80161EB8 1400BFAF */  sw         $ra, 0x14($sp)
    /* 282C4 80161EBC 080002AE */  sw         $v0, 0x8($s0)
    /* 282C8 80161EC0 1A000224 */  addiu      $v0, $zero, 0x1A
    /* 282CC 80161EC4 000002AE */  sw         $v0, 0x0($s0)
    /* 282D0 80161EC8 040002AE */  sw         $v0, 0x4($s0)
    /* 282D4 80161ECC 80000224 */  addiu      $v0, $zero, 0x80
    /* 282D8 80161ED0 1280013C */  lui        $at, %hi(DialogRed)
    /* 282DC 80161ED4 FDAB22A0 */  sb         $v0, %lo(DialogRed)($at)
    /* 282E0 80161ED8 1280013C */  lui        $at, %hi(DialogGreen)
    /* 282E4 80161EDC FEAB22A0 */  sb         $v0, %lo(DialogGreen)($at)
    /* 282E8 80161EE0 1280013C */  lui        $at, %hi(DialogBlue)
    /* 282EC 80161EE4 FFAB22A0 */  sb         $v0, %lo(DialogBlue)($at)
    /* 282F0 80161EE8 20000224 */  addiu      $v0, $zero, 0x20
    /* 282F4 80161EEC 1280013C */  lui        $at, %hi(DialogTRed)
    /* 282F8 80161EF0 00AC22A0 */  sb         $v0, %lo(DialogTRed)($at)
    /* 282FC 80161EF4 1280013C */  lui        $at, %hi(DialogTGreen)
    /* 28300 80161EF8 01AC22A0 */  sb         $v0, %lo(DialogTGreen)($at)
    /* 28304 80161EFC 1280013C */  lui        $at, %hi(DialogTBlue)
    /* 28308 80161F00 02AC22A0 */  sb         $v0, %lo(DialogTBlue)($at)
    /* 2830C 80161F04 D487050C */  jal        GetOverlayOtBase__7CBlocks_80161f50
    /* 28310 80161F08 00000000 */   nop
    /* 28314 80161F0C 0C0002AE */  sw         $v0, 0xC($s0)
    /* 28318 80161F10 21100002 */  addu       $v0, $s0, $zero
    /* 2831C 80161F14 1400BF8F */  lw         $ra, 0x14($sp)
    /* 28320 80161F18 1000B08F */  lw         $s0, 0x10($sp)
    /* 28324 80161F1C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 28328 80161F20 0800E003 */  jr         $ra
    /* 2832C 80161F24 00000000 */   nop
endlabel __6Dialog_80161ea8
