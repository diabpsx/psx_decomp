.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CheckChrBtns__Fv, 0x388

glabel CheckChrBtns__Fv
    /* 25CEC 80035CEC E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 25CF0 80035CF0 E80E838F */  lw         $v1, %gp_rel(D_8011B668)($gp)
    /* 25CF4 80035CF4 40010224 */  addiu      $v0, $zero, 0x140
    /* 25CF8 80035CF8 1800BFAF */  sw         $ra, 0x18($sp)
    /* 25CFC 80035CFC 1400B1AF */  sw         $s1, 0x14($sp)
    /* 25D00 80035D00 D6006214 */  bne        $v1, $v0, .L8003605C
    /* 25D04 80035D04 1000B0AF */   sw        $s0, 0x10($sp)
    /* 25D08 80035D08 850F8293 */  lbu        $v0, %gp_rel(chrbtnactive)($gp)
    /* 25D0C 80035D0C 00000000 */  nop
    /* 25D10 80035D10 D2004010 */  beqz       $v0, .L8003605C
    /* 25D14 80035D14 00000000 */   nop
    /* 25D18 80035D18 1280023C */  lui        $v0, %hi(options_pad)
    /* 25D1C 80035D1C 50B2428C */  lw         $v0, %lo(options_pad)($v0)
    /* 25D20 80035D20 00000000 */  nop
    /* 25D24 80035D24 40180200 */  sll        $v1, $v0, 1
    /* 25D28 80035D28 21186200 */  addu       $v1, $v1, $v0
    /* 25D2C 80035D2C 80180300 */  sll        $v1, $v1, 2
    /* 25D30 80035D30 21186200 */  addu       $v1, $v1, $v0
    /* 25D34 80035D34 00190300 */  sll        $v1, $v1, 4
    /* 25D38 80035D38 23186200 */  subu       $v1, $v1, $v0
    /* 25D3C 80035D3C 80180300 */  sll        $v1, $v1, 2
    /* 25D40 80035D40 21186200 */  addu       $v1, $v1, $v0
    /* 25D44 80035D44 C0180300 */  sll        $v1, $v1, 3
    /* 25D48 80035D48 0E80013C */  lui        $at, %hi(plr + 0x108)
    /* 25D4C 80035D4C 21082300 */  addu       $at, $at, $v1
    /* 25D50 80035D50 40A6228C */  lw         $v0, %lo(plr + 0x108)($at)
    /* 25D54 80035D54 00000000 */  nop
    /* 25D58 80035D58 C0004010 */  beqz       $v0, .L8003605C
    /* 25D5C 80035D5C 00000000 */   nop
    /* 25D60 80035D60 0AD0000C */  jal        ChrCheckValidButton__Fi
    /* 25D64 80035D64 21200000 */   addu      $a0, $zero, $zero
    /* 25D68 80035D68 1280113C */  lui        $s1, %hi(D_8011C784)
    /* 25D6C 80035D6C 84C73126 */  addiu      $s1, $s1, %lo(D_8011C784)
    /* 25D70 80035D70 1280023C */  lui        $v0, %hi(myplr)
    /* 25D74 80035D74 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 25D78 80035D78 DC0E838F */  lw         $v1, %gp_rel(D_8011B65C)($gp)
    /* 25D7C 80035D7C 80100200 */  sll        $v0, $v0, 2
    /* 25D80 80035D80 21105100 */  addu       $v0, $v0, $s1
    /* 25D84 80035D84 21104300 */  addu       $v0, $v0, $v1
    /* 25D88 80035D88 00004290 */  lbu        $v0, 0x0($v0)
    /* 25D8C 80035D8C 00000000 */  nop
    /* 25D90 80035D90 17004014 */  bnez       $v0, .L80035DF0
    /* 25D94 80035D94 00000000 */   nop
    /* 25D98 80035D98 C6F5000C */  jal        PlaySFX__Fi
    /* 25D9C 80035D9C 33000424 */   addiu     $a0, $zero, 0x33
    /* 25DA0 80035DA0 1280023C */  lui        $v0, %hi(options_pad)
    /* 25DA4 80035DA4 50B2428C */  lw         $v0, %lo(options_pad)($v0)
    /* 25DA8 80035DA8 00000000 */  nop
    /* 25DAC 80035DAC 40180200 */  sll        $v1, $v0, 1
    /* 25DB0 80035DB0 21186200 */  addu       $v1, $v1, $v0
    /* 25DB4 80035DB4 80180300 */  sll        $v1, $v1, 2
    /* 25DB8 80035DB8 21186200 */  addu       $v1, $v1, $v0
    /* 25DBC 80035DBC 00190300 */  sll        $v1, $v1, 4
    /* 25DC0 80035DC0 23186200 */  subu       $v1, $v1, $v0
    /* 25DC4 80035DC4 80180300 */  sll        $v1, $v1, 2
    /* 25DC8 80035DC8 21186200 */  addu       $v1, $v1, $v0
    /* 25DCC 80035DCC C0180300 */  sll        $v1, $v1, 3
    /* 25DD0 80035DD0 0E80013C */  lui        $at, %hi(plr + 0x108)
    /* 25DD4 80035DD4 21082300 */  addu       $at, $at, $v1
    /* 25DD8 80035DD8 40A6228C */  lw         $v0, %lo(plr + 0x108)($at)
    /* 25DDC 80035DDC 00000000 */  nop
    /* 25DE0 80035DE0 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 25DE4 80035DE4 0E80013C */  lui        $at, %hi(plr + 0x108)
    /* 25DE8 80035DE8 21082300 */  addu       $at, $at, $v1
    /* 25DEC 80035DEC 40A622AC */  sw         $v0, %lo(plr + 0x108)($at)
  .L80035DF0:
    /* 25DF0 80035DF0 1280023C */  lui        $v0, %hi(options_pad)
    /* 25DF4 80035DF4 50B2428C */  lw         $v0, %lo(options_pad)($v0)
    /* 25DF8 80035DF8 DC0E848F */  lw         $a0, %gp_rel(D_8011B65C)($gp)
    /* 25DFC 80035DFC 40180200 */  sll        $v1, $v0, 1
    /* 25E00 80035E00 21186200 */  addu       $v1, $v1, $v0
    /* 25E04 80035E04 80180300 */  sll        $v1, $v1, 2
    /* 25E08 80035E08 21186200 */  addu       $v1, $v1, $v0
    /* 25E0C 80035E0C 00190300 */  sll        $v1, $v1, 4
    /* 25E10 80035E10 23186200 */  subu       $v1, $v1, $v0
    /* 25E14 80035E14 80180300 */  sll        $v1, $v1, 2
    /* 25E18 80035E18 21186200 */  addu       $v1, $v1, $v0
    /* 25E1C 80035E1C C0180300 */  sll        $v1, $v1, 3
    /* 25E20 80035E20 01000224 */  addiu      $v0, $zero, 0x1
    /* 25E24 80035E24 0E80013C */  lui        $at, %hi(plr + 0xF6)
    /* 25E28 80035E28 21082300 */  addu       $at, $at, $v1
    /* 25E2C 80035E2C 2EA63080 */  lb         $s0, %lo(plr + 0xF6)($at)
    /* 25E30 80035E30 2C008210 */  beq        $a0, $v0, .L80035EE4
    /* 25E34 80035E34 02008228 */   slti      $v0, $a0, 0x2
    /* 25E38 80035E38 05004010 */  beqz       $v0, .L80035E50
    /* 25E3C 80035E3C 00000000 */   nop
    /* 25E40 80035E40 0A008010 */  beqz       $a0, .L80035E6C
    /* 25E44 80035E44 01000424 */   addiu     $a0, $zero, 0x1
    /* 25E48 80035E48 13D80008 */  j          .L8003604C
    /* 25E4C 80035E4C 00000000 */   nop
  .L80035E50:
    /* 25E50 80035E50 02000224 */  addiu      $v0, $zero, 0x2
    /* 25E54 80035E54 3E008210 */  beq        $a0, $v0, .L80035F50
    /* 25E58 80035E58 03000224 */   addiu     $v0, $zero, 0x3
    /* 25E5C 80035E5C 57008210 */  beq        $a0, $v0, .L80035FBC
    /* 25E60 80035E60 01000424 */   addiu     $a0, $zero, 0x1
    /* 25E64 80035E64 13D80008 */  j          .L8003604C
    /* 25E68 80035E68 00000000 */   nop
  .L80035E6C:
    /* 25E6C 80035E6C 03000524 */  addiu      $a1, $zero, 0x3
    /* 25E70 80035E70 0D3E010C */  jal        NetSendCmdParam1__FUcUcUs
    /* 25E74 80035E74 01000624 */   addiu     $a2, $zero, 0x1
    /* 25E78 80035E78 0E80033C */  lui        $v1, %hi(MaxStats)
    /* 25E7C 80035E7C 38A46324 */  addiu      $v1, $v1, %lo(MaxStats)
    /* 25E80 80035E80 00211000 */  sll        $a0, $s0, 4
    /* 25E84 80035E84 21208300 */  addu       $a0, $a0, $v1
    /* 25E88 80035E88 1280053C */  lui        $a1, %hi(options_pad)
    /* 25E8C 80035E8C 50B2A58C */  lw         $a1, %lo(options_pad)($a1)
    /* 25E90 80035E90 DC0E868F */  lw         $a2, %gp_rel(D_8011B65C)($gp)
    /* 25E94 80035E94 40100500 */  sll        $v0, $a1, 1
    /* 25E98 80035E98 21104500 */  addu       $v0, $v0, $a1
    /* 25E9C 80035E9C 80100200 */  sll        $v0, $v0, 2
    /* 25EA0 80035EA0 21104500 */  addu       $v0, $v0, $a1
    /* 25EA4 80035EA4 00110200 */  sll        $v0, $v0, 4
    /* 25EA8 80035EA8 23104500 */  subu       $v0, $v0, $a1
    /* 25EAC 80035EAC 80100200 */  sll        $v0, $v0, 2
    /* 25EB0 80035EB0 21104500 */  addu       $v0, $v0, $a1
    /* 25EB4 80035EB4 C0100200 */  sll        $v0, $v0, 3
    /* 25EB8 80035EB8 80180600 */  sll        $v1, $a2, 2
    /* 25EBC 80035EBC 21186400 */  addu       $v1, $v1, $a0
    /* 25EC0 80035EC0 0E80013C */  lui        $at, %hi(plr + 0xFA)
    /* 25EC4 80035EC4 21082200 */  addu       $at, $at, $v0
    /* 25EC8 80035EC8 32A62484 */  lh         $a0, %lo(plr + 0xFA)($at)
  .L80035ECC:
    /* 25ECC 80035ECC 0000628C */  lw         $v0, 0x0($v1)
    /* 25ED0 80035ED0 00000000 */  nop
    /* 25ED4 80035ED4 55008210 */  beq        $a0, $v0, .L8003602C
    /* 25ED8 80035ED8 80100500 */   sll       $v0, $a1, 2
    /* 25EDC 80035EDC 11D80008 */  j          .L80036044
    /* 25EE0 80035EE0 21105100 */   addu      $v0, $v0, $s1
  .L80035EE4:
    /* 25EE4 80035EE4 01000424 */  addiu      $a0, $zero, 0x1
    /* 25EE8 80035EE8 04000524 */  addiu      $a1, $zero, 0x4
    /* 25EEC 80035EEC 0D3E010C */  jal        NetSendCmdParam1__FUcUcUs
    /* 25EF0 80035EF0 01000624 */   addiu     $a2, $zero, 0x1
    /* 25EF4 80035EF4 0E80033C */  lui        $v1, %hi(MaxStats)
    /* 25EF8 80035EF8 38A46324 */  addiu      $v1, $v1, %lo(MaxStats)
    /* 25EFC 80035EFC 00211000 */  sll        $a0, $s0, 4
    /* 25F00 80035F00 21208300 */  addu       $a0, $a0, $v1
    /* 25F04 80035F04 1280053C */  lui        $a1, %hi(options_pad)
    /* 25F08 80035F08 50B2A58C */  lw         $a1, %lo(options_pad)($a1)
    /* 25F0C 80035F0C DC0E868F */  lw         $a2, %gp_rel(D_8011B65C)($gp)
    /* 25F10 80035F10 40100500 */  sll        $v0, $a1, 1
    /* 25F14 80035F14 21104500 */  addu       $v0, $v0, $a1
    /* 25F18 80035F18 80100200 */  sll        $v0, $v0, 2
    /* 25F1C 80035F1C 21104500 */  addu       $v0, $v0, $a1
    /* 25F20 80035F20 00110200 */  sll        $v0, $v0, 4
    /* 25F24 80035F24 23104500 */  subu       $v0, $v0, $a1
    /* 25F28 80035F28 80100200 */  sll        $v0, $v0, 2
    /* 25F2C 80035F2C 21104500 */  addu       $v0, $v0, $a1
    /* 25F30 80035F30 C0100200 */  sll        $v0, $v0, 3
    /* 25F34 80035F34 80180600 */  sll        $v1, $a2, 2
    /* 25F38 80035F38 21186400 */  addu       $v1, $v1, $a0
    /* 25F3C 80035F3C 0E80013C */  lui        $at, %hi(plr + 0xFE)
    /* 25F40 80035F40 21082200 */  addu       $at, $at, $v0
    /* 25F44 80035F44 36A62484 */  lh         $a0, %lo(plr + 0xFE)($at)
    /* 25F48 80035F48 B3D70008 */  j          .L80035ECC
    /* 25F4C 80035F4C 00000000 */   nop
  .L80035F50:
    /* 25F50 80035F50 01000424 */  addiu      $a0, $zero, 0x1
    /* 25F54 80035F54 05000524 */  addiu      $a1, $zero, 0x5
    /* 25F58 80035F58 0D3E010C */  jal        NetSendCmdParam1__FUcUcUs
    /* 25F5C 80035F5C 01000624 */   addiu     $a2, $zero, 0x1
    /* 25F60 80035F60 0E80033C */  lui        $v1, %hi(MaxStats)
    /* 25F64 80035F64 38A46324 */  addiu      $v1, $v1, %lo(MaxStats)
    /* 25F68 80035F68 00211000 */  sll        $a0, $s0, 4
    /* 25F6C 80035F6C 21208300 */  addu       $a0, $a0, $v1
    /* 25F70 80035F70 1280053C */  lui        $a1, %hi(options_pad)
    /* 25F74 80035F74 50B2A58C */  lw         $a1, %lo(options_pad)($a1)
    /* 25F78 80035F78 DC0E868F */  lw         $a2, %gp_rel(D_8011B65C)($gp)
    /* 25F7C 80035F7C 40100500 */  sll        $v0, $a1, 1
    /* 25F80 80035F80 21104500 */  addu       $v0, $v0, $a1
    /* 25F84 80035F84 80100200 */  sll        $v0, $v0, 2
    /* 25F88 80035F88 21104500 */  addu       $v0, $v0, $a1
    /* 25F8C 80035F8C 00110200 */  sll        $v0, $v0, 4
    /* 25F90 80035F90 23104500 */  subu       $v0, $v0, $a1
    /* 25F94 80035F94 80100200 */  sll        $v0, $v0, 2
    /* 25F98 80035F98 21104500 */  addu       $v0, $v0, $a1
    /* 25F9C 80035F9C C0100200 */  sll        $v0, $v0, 3
    /* 25FA0 80035FA0 80180600 */  sll        $v1, $a2, 2
    /* 25FA4 80035FA4 21186400 */  addu       $v1, $v1, $a0
    /* 25FA8 80035FA8 0E80013C */  lui        $at, %hi(plr + 0x102)
    /* 25FAC 80035FAC 21082200 */  addu       $at, $at, $v0
    /* 25FB0 80035FB0 3AA62484 */  lh         $a0, %lo(plr + 0x102)($at)
    /* 25FB4 80035FB4 B3D70008 */  j          .L80035ECC
    /* 25FB8 80035FB8 00000000 */   nop
  .L80035FBC:
    /* 25FBC 80035FBC 06000524 */  addiu      $a1, $zero, 0x6
    /* 25FC0 80035FC0 0D3E010C */  jal        NetSendCmdParam1__FUcUcUs
    /* 25FC4 80035FC4 01000624 */   addiu     $a2, $zero, 0x1
    /* 25FC8 80035FC8 0E80033C */  lui        $v1, %hi(MaxStats)
    /* 25FCC 80035FCC 38A46324 */  addiu      $v1, $v1, %lo(MaxStats)
    /* 25FD0 80035FD0 00211000 */  sll        $a0, $s0, 4
    /* 25FD4 80035FD4 21208300 */  addu       $a0, $a0, $v1
    /* 25FD8 80035FD8 1280053C */  lui        $a1, %hi(options_pad)
    /* 25FDC 80035FDC 50B2A58C */  lw         $a1, %lo(options_pad)($a1)
    /* 25FE0 80035FE0 DC0E868F */  lw         $a2, %gp_rel(D_8011B65C)($gp)
    /* 25FE4 80035FE4 40100500 */  sll        $v0, $a1, 1
    /* 25FE8 80035FE8 21104500 */  addu       $v0, $v0, $a1
    /* 25FEC 80035FEC 80100200 */  sll        $v0, $v0, 2
    /* 25FF0 80035FF0 21104500 */  addu       $v0, $v0, $a1
    /* 25FF4 80035FF4 00110200 */  sll        $v0, $v0, 4
    /* 25FF8 80035FF8 23104500 */  subu       $v0, $v0, $a1
    /* 25FFC 80035FFC 80100200 */  sll        $v0, $v0, 2
    /* 26000 80036000 21104500 */  addu       $v0, $v0, $a1
    /* 26004 80036004 C0100200 */  sll        $v0, $v0, 3
    /* 26008 80036008 80180600 */  sll        $v1, $a2, 2
    /* 2600C 8003600C 21186400 */  addu       $v1, $v1, $a0
    /* 26010 80036010 0E80013C */  lui        $at, %hi(plr + 0x106)
    /* 26014 80036014 21082200 */  addu       $at, $at, $v0
    /* 26018 80036018 3EA62484 */  lh         $a0, %lo(plr + 0x106)($at)
    /* 2601C 8003601C 0000628C */  lw         $v0, 0x0($v1)
    /* 26020 80036020 00000000 */  nop
    /* 26024 80036024 06008214 */  bne        $a0, $v0, .L80036040
    /* 26028 80036028 80100500 */   sll       $v0, $a1, 2
  .L8003602C:
    /* 2602C 8003602C 21105100 */  addu       $v0, $v0, $s1
    /* 26030 80036030 21104600 */  addu       $v0, $v0, $a2
    /* 26034 80036034 01000324 */  addiu      $v1, $zero, 0x1
    /* 26038 80036038 13D80008 */  j          .L8003604C
    /* 2603C 8003603C 000043A0 */   sb        $v1, 0x0($v0)
  .L80036040:
    /* 26040 80036040 21105100 */  addu       $v0, $v0, $s1
  .L80036044:
    /* 26044 80036044 21104600 */  addu       $v0, $v0, $a2
    /* 26048 80036048 000040A0 */  sb         $zero, 0x0($v0)
  .L8003604C:
    /* 2604C 8003604C 0AD0000C */  jal        ChrCheckValidButton__Fi
    /* 26050 80036050 21200000 */   addu      $a0, $zero, $zero
    /* 26054 80036054 0DD1000C */  jal        BuildChr__Fv
    /* 26058 80036058 00000000 */   nop
  .L8003605C:
    /* 2605C 8003605C 1800BF8F */  lw         $ra, 0x18($sp)
    /* 26060 80036060 1400B18F */  lw         $s1, 0x14($sp)
    /* 26064 80036064 1000B08F */  lw         $s0, 0x10($sp)
    /* 26068 80036068 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 2606C 8003606C 0800E003 */  jr         $ra
    /* 26070 80036070 00000000 */   nop
endlabel CheckChrBtns__Fv
