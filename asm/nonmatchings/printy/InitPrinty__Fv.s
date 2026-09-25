.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitPrinty__Fv, 0xB0

glabel InitPrinty__Fv
    /* 79CFC 80089CFC E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 79D00 80089D00 1400B1AF */  sw         $s1, 0x14($sp)
    /* 79D04 80089D04 0C80113C */  lui        $s1, %hi(LargeFont)
    /* 79D08 80089D08 F4843126 */  addiu      $s1, $s1, %lo(LargeFont)
    /* 79D0C 80089D0C 21202002 */  addu       $a0, $s1, $zero
    /* 79D10 80089D10 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 79D14 80089D14 1800B2AF */  sw         $s2, 0x18($sp)
    /* 79D18 80089D18 502B020C */  jal        Init__5CFont
    /* 79D1C 80089D1C 1000B0AF */   sw        $s0, 0x10($sp)
    /* 79D20 80089D20 0C80123C */  lui        $s2, %hi(MediumFont)
    /* 79D24 80089D24 D8825226 */  addiu      $s2, $s2, %lo(MediumFont)
    /* 79D28 80089D28 502B020C */  jal        Init__5CFont
    /* 79D2C 80089D2C 21204002 */   addu      $a0, $s2, $zero
    /* 79D30 80089D30 0C80043C */  lui        $a0, %hi(LFont)
    /* 79D34 80089D34 D8888424 */  addiu      $a0, $a0, %lo(LFont)
    /* 79D38 80089D38 0D000224 */  addiu      $v0, $zero, 0xD
    /* 79D3C 80089D3C 0C80013C */  lui        $at, %hi(LargeFont + 0x218)
    /* 79D40 80089D40 0C8722A0 */  sb         $v0, %lo(LargeFont + 0x218)($at)
    /* 79D44 80089D44 0C80013C */  lui        $at, %hi(MediumFont + 0x218)
    /* 79D48 80089D48 F08422A0 */  sb         $v0, %lo(MediumFont + 0x218)($at)
    /* 79D4C 80089D4C 1827020C */  jal        Set__7FontTab
    /* 79D50 80089D50 00000000 */   nop
    /* 79D54 80089D54 0C80043C */  lui        $a0, %hi(MFont)
    /* 79D58 80089D58 C08A8424 */  addiu      $a0, $a0, %lo(MFont)
    /* 79D5C 80089D5C 1827020C */  jal        Set__7FontTab
    /* 79D60 80089D60 00000000 */   nop
    /* 79D64 80089D64 372B020C */  jal        GetOverlayOtBase__7CBlocks_8008acdc
    /* 79D68 80089D68 00000000 */   nop
    /* 79D6C 80089D6C 21202002 */  addu       $a0, $s1, $zero
    /* 79D70 80089D70 21804000 */  addu       $s0, $v0, $zero
    /* 79D74 80089D74 E82A020C */  jal        SetOTpos__5CFonti
    /* 79D78 80089D78 21280002 */   addu      $a1, $s0, $zero
    /* 79D7C 80089D7C 21204002 */  addu       $a0, $s2, $zero
    /* 79D80 80089D80 E82A020C */  jal        SetOTpos__5CFonti
    /* 79D84 80089D84 21280002 */   addu      $a1, $s0, $zero
    /* 79D88 80089D88 392B020C */  jal        ClearFont__5CFont
    /* 79D8C 80089D8C 21202002 */   addu      $a0, $s1, $zero
    /* 79D90 80089D90 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 79D94 80089D94 1800B28F */  lw         $s2, 0x18($sp)
    /* 79D98 80089D98 1400B18F */  lw         $s1, 0x14($sp)
    /* 79D9C 80089D9C 1000B08F */  lw         $s0, 0x10($sp)
    /* 79DA0 80089DA0 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 79DA4 80089DA4 0800E003 */  jr         $ra
    /* 79DA8 80089DA8 00000000 */   nop
endlabel InitPrinty__Fv
