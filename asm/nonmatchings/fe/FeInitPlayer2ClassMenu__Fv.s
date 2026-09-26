.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FeInitPlayer2ClassMenu__Fv, 0x84

glabel FeInitPlayer2ClassMenu__Fv
    /* 12F0 8013AEE8 1280023C */  lui        $v0, %hi(MemCardActive)
    /* 12F4 8013AEEC 60B1428C */  lw         $v0, %lo(MemCardActive)($v0)
    /* 12F8 8013AEF0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 12FC 8013AEF4 1000BFAF */  sw         $ra, 0x10($sp)
    /* 1300 8013AEF8 AC0B80AF */  sw         $zero, %gp_rel(LoadedChar + 0x4)($gp)
    /* 1304 8013AEFC 03004010 */  beqz       $v0, .L8013AF0C
    /* 1308 8013AF00 00000000 */   nop
    /* 130C 8013AF04 5695020C */  jal        MemcardOFF__Fv
    /* 1310 8013AF08 00000000 */   nop
  .L8013AF0C:
    /* 1314 8013AF0C 0D80043C */  lui        $a0, %hi(FePlayerClassMenuTable + 0x28)
    /* 1318 8013AF10 F0D88424 */  addiu      $a0, $a0, %lo(FePlayerClassMenuTable + 0x28)
    /* 131C 8013AF14 0D80023C */  lui        $v0, %hi(FeNewP2NameMenu)
    /* 1320 8013AF18 28D74224 */  addiu      $v0, $v0, %lo(FeNewP2NameMenu)
    /* 1324 8013AF1C 000082AC */  sw         $v0, 0x0($a0)
    /* 1328 8013AF20 D8FF8424 */  addiu      $a0, $a0, -0x28
    /* 132C 8013AF24 0D80013C */  lui        $at, %hi(FePlayerClassMenuTable + 0x40)
    /* 1330 8013AF28 08D922AC */  sw         $v0, %lo(FePlayerClassMenuTable + 0x40)($at)
    /* 1334 8013AF2C 0D80013C */  lui        $at, %hi(FePlayerClassMenuTable + 0x58)
    /* 1338 8013AF30 20D922AC */  sw         $v0, %lo(FePlayerClassMenuTable + 0x58)($at)
    /* 133C 8013AF34 35E7040C */  jal        FeAddTable__FP11FeMenuTablei
    /* 1340 8013AF38 05000524 */   addiu     $a1, $zero, 0x5
    /* 1344 8013AF3C 0C000224 */  addiu      $v0, $zero, 0xC
    /* 1348 8013AF40 E40B82AF */  sw         $v0, %gp_rel(FeBackX)($gp)
    /* 134C 8013AF44 20000224 */  addiu      $v0, $zero, 0x20
    /* 1350 8013AF48 E80B82AF */  sw         $v0, %gp_rel(FeBackY)($gp)
    /* 1354 8013AF4C A0000224 */  addiu      $v0, $zero, 0xA0
    /* 1358 8013AF50 EC0B82AF */  sw         $v0, %gp_rel(FeBackW)($gp)
    /* 135C 8013AF54 80000224 */  addiu      $v0, $zero, 0x80
    /* 1360 8013AF58 F00B82AF */  sw         $v0, %gp_rel(FeBackH)($gp)
    /* 1364 8013AF5C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1368 8013AF60 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 136C 8013AF64 0800E003 */  jr         $ra
    /* 1370 8013AF68 00000000 */   nop
endlabel FeInitPlayer2ClassMenu__Fv
