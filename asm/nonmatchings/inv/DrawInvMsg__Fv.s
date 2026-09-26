.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawInvMsg__Fv, 0x1CC

glabel DrawInvMsg__Fv
    /* 1F008 80158C00 B0FFBD27 */  addiu      $sp, $sp, -0x50
    /* 1F00C 80158C04 3800B0AF */  sw         $s0, 0x38($sp)
    /* 1F010 80158C08 2800B027 */  addiu      $s0, $sp, 0x28
    /* 1F014 80158C0C 21200002 */  addu       $a0, $s0, $zero
    /* 1F018 80158C10 4C00BFAF */  sw         $ra, 0x4C($sp)
    /* 1F01C 80158C14 4800B4AF */  sw         $s4, 0x48($sp)
    /* 1F020 80158C18 4400B3AF */  sw         $s3, 0x44($sp)
    /* 1F024 80158C1C 4000B2AF */  sw         $s2, 0x40($sp)
    /* 1F028 80158C20 AA87050C */  jal        __6Dialog_80161ea8
    /* 1F02C 80158C24 3C00B1AF */   sw        $s1, 0x3C($sp)
    /* 1F030 80158C28 0C80133C */  lui        $s3, %hi(MediumFont)
    /* 1F034 80158C2C D8827326 */  addiu      $s3, $s3, %lo(MediumFont)
    /* 1F038 80158C30 21206002 */  addu       $a0, $s3, $zero
    /* 1F03C 80158C34 E82A020C */  jal        SetOTpos__5CFonti
    /* 1F040 80158C38 FA000524 */   addiu     $a1, $zero, 0xFA
    /* 1F044 80158C3C 21206002 */  addu       $a0, $s3, $zero
    /* 1F048 80158C40 21884000 */  addu       $s1, $v0, $zero
    /* 1F04C 80158C44 E82A020C */  jal        SetOTpos__5CFonti
    /* 1F050 80158C48 FFFF2526 */   addiu     $a1, $s1, -0x1
    /* 1F054 80158C4C C80E020C */  jal        PRIM_FullScreen__Fi
    /* 1F058 80158C50 21202002 */   addu      $a0, $s1, $zero
    /* 1F05C 80158C54 80000224 */  addiu      $v0, $zero, 0x80
    /* 1F060 80158C58 2000A2A7 */  sh         $v0, 0x20($sp)
    /* 1F064 80158C5C 81000224 */  addiu      $v0, $zero, 0x81
    /* 1F068 80158C60 2200A2A7 */  sh         $v0, 0x22($sp)
    /* 1F06C 80158C64 B0000224 */  addiu      $v0, $zero, 0xB0
    /* 1F070 80158C68 2400A2A7 */  sh         $v0, 0x24($sp)
    /* 1F074 80158C6C 4E000224 */  addiu      $v0, $zero, 0x4E
    /* 1F078 80158C70 50001424 */  addiu      $s4, $zero, 0x50
    /* 1F07C 80158C74 2600A2A7 */  sh         $v0, 0x26($sp)
    /* 1F080 80158C78 AC1B8293 */  lbu        $v0, %gp_rel(invflag)($gp)
    /* 1F084 80158C7C 00000000 */  nop
    /* 1F088 80158C80 03004010 */  beqz       $v0, .L80158C90
    /* 1F08C 80158C84 80001224 */   addiu     $s2, $zero, 0x80
    /* 1F090 80158C88 E9CB000C */  jal        DrawInfoBox__FP4RECT
    /* 1F094 80158C8C 2000A427 */   addiu     $a0, $sp, 0x20
  .L80158C90:
    /* 1F098 80158C90 21200002 */  addu       $a0, $s0, $zero
    /* 1F09C 80158C94 8A34020C */  jal        SetOTpos__6Dialogi
    /* 1F0A0 80158C98 F9000524 */   addiu     $a1, $zero, 0xF9
    /* 1F0A4 80158C9C 21200002 */  addu       $a0, $s0, $zero
    /* 1F0A8 80158CA0 9E87050C */  jal        SetBack__6Dialogi_80161e78
    /* 1F0AC 80158CA4 05000524 */   addiu     $a1, $zero, 0x5
    /* 1F0B0 80158CA8 1280053C */  lui        $a1, %hi(BORDERR)
    /* 1F0B4 80158CAC F7ABA590 */  lbu        $a1, %lo(BORDERR)($a1)
    /* 1F0B8 80158CB0 1280063C */  lui        $a2, %hi(BORDERG)
    /* 1F0BC 80158CB4 F8ABC690 */  lbu        $a2, %lo(BORDERG)($a2)
    /* 1F0C0 80158CB8 1280073C */  lui        $a3, %hi(BORDERB)
    /* 1F0C4 80158CBC F9ABE790 */  lbu        $a3, %lo(BORDERB)($a3)
    /* 1F0C8 80158CC0 9687050C */  jal        SetRGB__6DialogUcUcUc_80161e58
    /* 1F0CC 80158CC4 21200002 */   addu      $a0, $s0, $zero
    /* 1F0D0 80158CC8 21200002 */  addu       $a0, $s0, $zero
    /* 1F0D4 80158CCC 80000524 */  addiu      $a1, $zero, 0x80
    /* 1F0D8 80158CD0 80000624 */  addiu      $a2, $zero, 0x80
    /* 1F0DC 80158CD4 B0000724 */  addiu      $a3, $zero, 0xB0
    /* 1F0E0 80158CD8 B82F020C */  jal        Back__6Dialogiiii
    /* 1F0E4 80158CDC 1000B4AF */   sw        $s4, 0x10($sp)
    /* 1F0E8 80158CE0 94000524 */  addiu      $a1, $zero, 0x94
    /* 1F0EC 80158CE4 21300000 */  addu       $a2, $zero, $zero
    /* 1F0F0 80158CE8 881B848F */  lw         $a0, %gp_rel(InvPanelTData)($gp)
    /* 1F0F4 80158CEC 21380000 */  addu       $a3, $zero, $zero
    /* 1F0F8 80158CF0 1000A0AF */  sw         $zero, 0x10($sp)
    /* 1F0FC 80158CF4 1400B1AF */  sw         $s1, 0x14($sp)
    /* 1F100 80158CF8 064D020C */  jal        PrintFt4__7TextDatiiiiii
    /* 1F104 80158CFC 1800A0AF */   sw        $zero, 0x18($sp)
    /* 1F108 80158D00 21206002 */  addu       $a0, $s3, $zero
    /* 1F10C 80158D04 D0000324 */  addiu      $v1, $zero, 0xD0
    /* 1F110 80158D08 1A0043A4 */  sh         $v1, 0x1A($v0)
    /* 1F114 80158D0C 220043A4 */  sh         $v1, 0x22($v0)
    /* 1F118 80158D10 20000324 */  addiu      $v1, $zero, 0x20
    /* 1F11C 80158D14 040043A0 */  sb         $v1, 0x4($v0)
    /* 1F120 80158D18 050043A0 */  sb         $v1, 0x5($v0)
    /* 1F124 80158D1C 060043A0 */  sb         $v1, 0x6($v0)
    /* 1F128 80158D20 16004394 */  lhu        $v1, 0x16($v0)
    /* 1F12C 80158D24 30010624 */  addiu      $a2, $zero, 0x130
    /* 1F130 80158D28 100046A4 */  sh         $a2, 0x10($v0)
    /* 1F134 80158D2C 200046A4 */  sh         $a2, 0x20($v0)
    /* 1F138 80158D30 0C004690 */  lbu        $a2, 0xC($v0)
    /* 1F13C 80158D34 21282002 */  addu       $a1, $s1, $zero
    /* 1F140 80158D38 080052A4 */  sh         $s2, 0x8($v0)
    /* 1F144 80158D3C 0A0052A4 */  sh         $s2, 0xA($v0)
    /* 1F148 80158D40 120052A4 */  sh         $s2, 0x12($v0)
    /* 1F14C 80158D44 180052A4 */  sh         $s2, 0x18($v0)
    /* 1F150 80158D48 40006334 */  ori        $v1, $v1, 0x40
    /* 1F154 80158D4C 160043A4 */  sh         $v1, 0x16($v0)
    /* 1F158 80158D50 0C004390 */  lbu        $v1, 0xC($v0)
    /* 1F15C 80158D54 0100C624 */  addiu      $a2, $a2, 0x1
    /* 1F160 80158D58 140046A0 */  sb         $a2, 0x14($v0)
    /* 1F164 80158D5C 0D004690 */  lbu        $a2, 0xD($v0)
    /* 1F168 80158D60 01006324 */  addiu      $v1, $v1, 0x1
    /* 1F16C 80158D64 240043A0 */  sb         $v1, 0x24($v0)
    /* 1F170 80158D68 0D004390 */  lbu        $v1, 0xD($v0)
    /* 1F174 80158D6C 0100C624 */  addiu      $a2, $a2, 0x1
    /* 1F178 80158D70 1D0046A0 */  sb         $a2, 0x1D($v0)
    /* 1F17C 80158D74 07004690 */  lbu        $a2, 0x7($v0)
    /* 1F180 80158D78 01006324 */  addiu      $v1, $v1, 0x1
    /* 1F184 80158D7C 0200C634 */  ori        $a2, $a2, 0x2
    /* 1F188 80158D80 FE00C630 */  andi       $a2, $a2, 0xFE
    /* 1F18C 80158D84 250043A0 */  sb         $v1, 0x25($v0)
    /* 1F190 80158D88 E82A020C */  jal        SetOTpos__5CFonti
    /* 1F194 80158D8C 070046A0 */   sb        $a2, 0x7($v0)
    /* 1F198 80158D90 2000A427 */  addiu      $a0, $sp, 0x20
    /* 1F19C 80158D94 7B0E020C */  jal        PRIM_Clip__FP4RECTi
    /* 1F1A0 80158D98 21282002 */   addu      $a1, $s1, $zero
    /* 1F1A4 80158D9C 21200002 */  addu       $a0, $s0, $zero
    /* 1F1A8 80158DA0 A087050C */  jal        ___6Dialog_80161e80
    /* 1F1AC 80158DA4 02000524 */   addiu     $a1, $zero, 0x2
    /* 1F1B0 80158DA8 4C00BF8F */  lw         $ra, 0x4C($sp)
    /* 1F1B4 80158DAC 4800B48F */  lw         $s4, 0x48($sp)
    /* 1F1B8 80158DB0 4400B38F */  lw         $s3, 0x44($sp)
    /* 1F1BC 80158DB4 4000B28F */  lw         $s2, 0x40($sp)
    /* 1F1C0 80158DB8 3C00B18F */  lw         $s1, 0x3C($sp)
    /* 1F1C4 80158DBC 3800B08F */  lw         $s0, 0x38($sp)
    /* 1F1C8 80158DC0 5000BD27 */  addiu      $sp, $sp, 0x50
    /* 1F1CC 80158DC4 0800E003 */  jr         $ra
    /* 1F1D0 80158DC8 00000000 */   nop
endlabel DrawInvMsg__Fv
