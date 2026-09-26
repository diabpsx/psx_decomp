.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FeInitPlayer1ClassMenu__Fv, 0x84

glabel FeInitPlayer1ClassMenu__Fv
    /* 126C 8013AE64 1280023C */  lui        $v0, %hi(MemCardActive)
    /* 1270 8013AE68 60B1428C */  lw         $v0, %lo(MemCardActive)($v0)
    /* 1274 8013AE6C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1278 8013AE70 1000BFAF */  sw         $ra, 0x10($sp)
    /* 127C 8013AE74 A80B80AF */  sw         $zero, %gp_rel(LoadedChar)($gp)
    /* 1280 8013AE78 03004010 */  beqz       $v0, .L8013AE88
    /* 1284 8013AE7C 00000000 */   nop
    /* 1288 8013AE80 5695020C */  jal        MemcardOFF__Fv
    /* 128C 8013AE84 00000000 */   nop
  .L8013AE88:
    /* 1290 8013AE88 0D80043C */  lui        $a0, %hi(FePlayerClassMenuTable + 0x28)
    /* 1294 8013AE8C F0D88424 */  addiu      $a0, $a0, %lo(FePlayerClassMenuTable + 0x28)
    /* 1298 8013AE90 0D80023C */  lui        $v0, %hi(FeNewP1NameMenu)
    /* 129C 8013AE94 F0D64224 */  addiu      $v0, $v0, %lo(FeNewP1NameMenu)
    /* 12A0 8013AE98 000082AC */  sw         $v0, 0x0($a0)
    /* 12A4 8013AE9C D8FF8424 */  addiu      $a0, $a0, -0x28
    /* 12A8 8013AEA0 0D80013C */  lui        $at, %hi(FePlayerClassMenuTable + 0x40)
    /* 12AC 8013AEA4 08D922AC */  sw         $v0, %lo(FePlayerClassMenuTable + 0x40)($at)
    /* 12B0 8013AEA8 0D80013C */  lui        $at, %hi(FePlayerClassMenuTable + 0x58)
    /* 12B4 8013AEAC 20D922AC */  sw         $v0, %lo(FePlayerClassMenuTable + 0x58)($at)
    /* 12B8 8013AEB0 35E7040C */  jal        FeAddTable__FP11FeMenuTablei
    /* 12BC 8013AEB4 05000524 */   addiu     $a1, $zero, 0x5
    /* 12C0 8013AEB8 0C000224 */  addiu      $v0, $zero, 0xC
    /* 12C4 8013AEBC E40B82AF */  sw         $v0, %gp_rel(FeBackX)($gp)
    /* 12C8 8013AEC0 20000224 */  addiu      $v0, $zero, 0x20
    /* 12CC 8013AEC4 E80B82AF */  sw         $v0, %gp_rel(FeBackY)($gp)
    /* 12D0 8013AEC8 A0000224 */  addiu      $v0, $zero, 0xA0
    /* 12D4 8013AECC EC0B82AF */  sw         $v0, %gp_rel(FeBackW)($gp)
    /* 12D8 8013AED0 80000224 */  addiu      $v0, $zero, 0x80
    /* 12DC 8013AED4 F00B82AF */  sw         $v0, %gp_rel(FeBackH)($gp)
    /* 12E0 8013AED8 1000BF8F */  lw         $ra, 0x10($sp)
    /* 12E4 8013AEDC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 12E8 8013AEE0 0800E003 */  jr         $ra
    /* 12EC 8013AEE4 00000000 */   nop
endlabel FeInitPlayer1ClassMenu__Fv
