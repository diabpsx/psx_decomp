.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching __6Dialog_8015b8d0, 0x80

glabel __6Dialog_8015b8d0
    /* 21CD8 8015B8D0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 21CDC 8015B8D4 1000B0AF */  sw         $s0, 0x10($sp)
    /* 21CE0 8015B8D8 21808000 */  addu       $s0, $a0, $zero
    /* 21CE4 8015B8DC 94000224 */  addiu      $v0, $zero, 0x94
    /* 21CE8 8015B8E0 1400BFAF */  sw         $ra, 0x14($sp)
    /* 21CEC 8015B8E4 080002AE */  sw         $v0, 0x8($s0)
    /* 21CF0 8015B8E8 1A000224 */  addiu      $v0, $zero, 0x1A
    /* 21CF4 8015B8EC 000002AE */  sw         $v0, 0x0($s0)
    /* 21CF8 8015B8F0 040002AE */  sw         $v0, 0x4($s0)
    /* 21CFC 8015B8F4 80000224 */  addiu      $v0, $zero, 0x80
    /* 21D00 8015B8F8 1280013C */  lui        $at, %hi(DialogRed)
    /* 21D04 8015B8FC FDAB22A0 */  sb         $v0, %lo(DialogRed)($at)
    /* 21D08 8015B900 1280013C */  lui        $at, %hi(DialogGreen)
    /* 21D0C 8015B904 FEAB22A0 */  sb         $v0, %lo(DialogGreen)($at)
    /* 21D10 8015B908 1280013C */  lui        $at, %hi(DialogBlue)
    /* 21D14 8015B90C FFAB22A0 */  sb         $v0, %lo(DialogBlue)($at)
    /* 21D18 8015B910 20000224 */  addiu      $v0, $zero, 0x20
    /* 21D1C 8015B914 1280013C */  lui        $at, %hi(DialogTRed)
    /* 21D20 8015B918 00AC22A0 */  sb         $v0, %lo(DialogTRed)($at)
    /* 21D24 8015B91C 1280013C */  lui        $at, %hi(DialogTGreen)
    /* 21D28 8015B920 01AC22A0 */  sb         $v0, %lo(DialogTGreen)($at)
    /* 21D2C 8015B924 1280013C */  lui        $at, %hi(DialogTBlue)
    /* 21D30 8015B928 02AC22A0 */  sb         $v0, %lo(DialogTBlue)($at)
    /* 21D34 8015B92C 546E050C */  jal        GetOverlayOtBase__7CBlocks_8015b950
    /* 21D38 8015B930 00000000 */   nop
    /* 21D3C 8015B934 0C0002AE */  sw         $v0, 0xC($s0)
    /* 21D40 8015B938 21100002 */  addu       $v0, $s0, $zero
    /* 21D44 8015B93C 1400BF8F */  lw         $ra, 0x14($sp)
    /* 21D48 8015B940 1000B08F */  lw         $s0, 0x10($sp)
    /* 21D4C 8015B944 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 21D50 8015B948 0800E003 */  jr         $ra
    /* 21D54 8015B94C 00000000 */   nop
endlabel __6Dialog_8015b8d0
