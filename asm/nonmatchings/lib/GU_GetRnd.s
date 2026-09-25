.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GU_GetRnd, 0x90

glabel GU_GetRnd
    /* 10CF4 80020CF4 1380023C */  lui        $v0, %hi(RndTabs + 0x4)
    /* 10CF8 80020CF8 EC51428C */  lw         $v0, %lo(RndTabs + 0x4)($v0)
    /* 10CFC 80020CFC 1380033C */  lui        $v1, %hi(RndTabs + 0x10)
    /* 10D00 80020D00 F851638C */  lw         $v1, %lo(RndTabs + 0x10)($v1)
    /* 10D04 80020D04 00000000 */  nop
    /* 10D08 80020D08 21304300 */  addu       $a2, $v0, $v1
    /* 10D0C 80020D0C 2B10C200 */  sltu       $v0, $a2, $v0
    /* 10D10 80020D10 05004010 */  beqz       $v0, .L80020D28
    /* 10D14 80020D14 00000000 */   nop
    /* 10D18 80020D18 2B10C300 */  sltu       $v0, $a2, $v1
    /* 10D1C 80020D1C 02004010 */  beqz       $v0, .L80020D28
    /* 10D20 80020D20 00000000 */   nop
    /* 10D24 80020D24 0100C624 */  addiu      $a2, $a2, 0x1
  .L80020D28:
    /* 10D28 80020D28 1380023C */  lui        $v0, %hi(RndTabs + 0x10)
    /* 10D2C 80020D2C F851428C */  lw         $v0, %lo(RndTabs + 0x10)($v0)
    /* 10D30 80020D30 1380033C */  lui        $v1, %hi(RndTabs + 0xC)
    /* 10D34 80020D34 F451638C */  lw         $v1, %lo(RndTabs + 0xC)($v1)
    /* 10D38 80020D38 1380043C */  lui        $a0, %hi(RndTabs + 0x8)
    /* 10D3C 80020D3C F051848C */  lw         $a0, %lo(RndTabs + 0x8)($a0)
    /* 10D40 80020D40 1380053C */  lui        $a1, %hi(RndTabs + 0x4)
    /* 10D44 80020D44 EC51A58C */  lw         $a1, %lo(RndTabs + 0x4)($a1)
    /* 10D48 80020D48 0100C624 */  addiu      $a2, $a2, 0x1
    /* 10D4C 80020D4C 1380013C */  lui        $at, %hi(RndTabs)
    /* 10D50 80020D50 E85126AC */  sw         $a2, %lo(RndTabs)($at)
    /* 10D54 80020D54 1380013C */  lui        $at, %hi(RndTabs + 0x4)
    /* 10D58 80020D58 EC5126AC */  sw         $a2, %lo(RndTabs + 0x4)($at)
    /* 10D5C 80020D5C 1380013C */  lui        $at, %hi(RndTabs + 0x14)
    /* 10D60 80020D60 FC5122AC */  sw         $v0, %lo(RndTabs + 0x14)($at)
    /* 10D64 80020D64 1380013C */  lui        $at, %hi(RndTabs + 0x10)
    /* 10D68 80020D68 F85123AC */  sw         $v1, %lo(RndTabs + 0x10)($at)
    /* 10D6C 80020D6C 1380013C */  lui        $at, %hi(RndTabs + 0xC)
    /* 10D70 80020D70 F45124AC */  sw         $a0, %lo(RndTabs + 0xC)($at)
    /* 10D74 80020D74 1380013C */  lui        $at, %hi(RndTabs + 0x8)
    /* 10D78 80020D78 F05125AC */  sw         $a1, %lo(RndTabs + 0x8)($at)
    /* 10D7C 80020D7C 0800E003 */  jr         $ra
    /* 10D80 80020D80 2110C000 */   addu      $v0, $a2, $zero
endlabel GU_GetRnd
