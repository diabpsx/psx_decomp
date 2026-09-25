.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ButtonDown__7GamePadi, 0x418

glabel ButtonDown__7GamePadi
    /* 68C64 80078C64 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 68C68 80078C68 1000B0AF */  sw         $s0, 0x10($sp)
    /* 68C6C 80078C6C 21808000 */  addu       $s0, $a0, $zero
    /* 68C70 80078C70 80000224 */  addiu      $v0, $zero, 0x80
    /* 68C74 80078C74 F900A210 */  beq        $a1, $v0, .L8007905C
    /* 68C78 80078C78 1400BFAF */   sw        $ra, 0x14($sp)
    /* 68C7C 80078C7C 8100A228 */  slti       $v0, $a1, 0x81
    /* 68C80 80078C80 19004010 */  beqz       $v0, .L80078CE8
    /* 68C84 80078C84 04000224 */   addiu     $v0, $zero, 0x4
    /* 68C88 80078C88 7200A210 */  beq        $a1, $v0, .L80078E54
    /* 68C8C 80078C8C 0500A228 */   slti      $v0, $a1, 0x5
    /* 68C90 80078C90 07004010 */  beqz       $v0, .L80078CB0
    /* 68C94 80078C94 01000224 */   addiu     $v0, $zero, 0x1
    /* 68C98 80078C98 F000A210 */  beq        $a1, $v0, .L8007905C
    /* 68C9C 80078C9C 02000224 */   addiu     $v0, $zero, 0x2
    /* 68CA0 80078CA0 8600A210 */  beq        $a1, $v0, .L80078EBC
    /* 68CA4 80078CA4 21200002 */   addu      $a0, $s0, $zero
    /* 68CA8 80078CA8 1AE40108 */  j          .L80079068
    /* 68CAC 80078CAC 00000000 */   nop
  .L80078CB0:
    /* 68CB0 80078CB0 20000224 */  addiu      $v0, $zero, 0x20
    /* 68CB4 80078CB4 8300A210 */  beq        $a1, $v0, .L80078EC4
    /* 68CB8 80078CB8 2100A228 */   slti      $v0, $a1, 0x21
    /* 68CBC 80078CBC 05004010 */  beqz       $v0, .L80078CD4
    /* 68CC0 80078CC0 08000224 */   addiu     $v0, $zero, 0x8
    /* 68CC4 80078CC4 7000A210 */  beq        $a1, $v0, .L80078E88
    /* 68CC8 80078CC8 00000000 */   nop
    /* 68CCC 80078CCC 1AE40108 */  j          .L80079068
    /* 68CD0 80078CD0 00000000 */   nop
  .L80078CD4:
    /* 68CD4 80078CD4 40000224 */  addiu      $v0, $zero, 0x40
    /* 68CD8 80078CD8 1C00A210 */  beq        $a1, $v0, .L80078D4C
    /* 68CDC 80078CDC 00000000 */   nop
    /* 68CE0 80078CE0 1AE40108 */  j          .L80079068
    /* 68CE4 80078CE4 00000000 */   nop
  .L80078CE8:
    /* 68CE8 80078CE8 00040224 */  addiu      $v0, $zero, 0x400
    /* 68CEC 80078CEC DB00A210 */  beq        $a1, $v0, .L8007905C
    /* 68CF0 80078CF0 0104A228 */   slti      $v0, $a1, 0x401
    /* 68CF4 80078CF4 07004010 */  beqz       $v0, .L80078D14
    /* 68CF8 80078CF8 00010224 */   addiu     $v0, $zero, 0x100
    /* 68CFC 80078CFC 8000A210 */  beq        $a1, $v0, .L80078F00
    /* 68D00 80078D00 00020224 */   addiu     $v0, $zero, 0x200
    /* 68D04 80078D04 D600A210 */  beq        $a1, $v0, .L80079060
    /* 68D08 80078D08 21200002 */   addu      $a0, $s0, $zero
    /* 68D0C 80078D0C 1AE40108 */  j          .L80079068
    /* 68D10 80078D10 00000000 */   nop
  .L80078D14:
    /* 68D14 80078D14 00100224 */  addiu      $v0, $zero, 0x1000
    /* 68D18 80078D18 D000A210 */  beq        $a1, $v0, .L8007905C
    /* 68D1C 80078D1C 0110A228 */   slti      $v0, $a1, 0x1001
    /* 68D20 80078D20 05004010 */  beqz       $v0, .L80078D38
    /* 68D24 80078D24 00080224 */   addiu     $v0, $zero, 0x800
    /* 68D28 80078D28 CD00A210 */  beq        $a1, $v0, .L80079060
    /* 68D2C 80078D2C 21200002 */   addu      $a0, $s0, $zero
    /* 68D30 80078D30 1AE40108 */  j          .L80079068
    /* 68D34 80078D34 00000000 */   nop
  .L80078D38:
    /* 68D38 80078D38 00200224 */  addiu      $v0, $zero, 0x2000
    /* 68D3C 80078D3C C800A210 */  beq        $a1, $v0, .L80079060
    /* 68D40 80078D40 21200002 */   addu      $a0, $s0, $zero
    /* 68D44 80078D44 1AE40108 */  j          .L80079068
    /* 68D48 80078D48 00000000 */   nop
  .L80078D4C:
    /* 68D4C 80078D4C 5400038E */  lw         $v1, 0x54($s0)
    /* 68D50 80078D50 0A80023C */  lui        $v0, %hi(select_belt_item__Fi)
    /* 68D54 80078D54 600A4224 */  addiu      $v0, $v0, %lo(select_belt_item__Fi)
    /* 68D58 80078D58 0C006214 */  bne        $v1, $v0, .L80078D8C
    /* 68D5C 80078D5C 00000000 */   nop
    /* 68D60 80078D60 C6F5000C */  jal        PlaySFX__Fi
    /* 68D64 80078D64 33000424 */   addiu     $a0, $zero, 0x33
    /* 68D68 80078D68 4C000382 */  lb         $v1, 0x4C($s0)
    /* 68D6C 80078D6C 01000224 */  addiu      $v0, $zero, 0x1
    /* 68D70 80078D70 540000AE */  sw         $zero, 0x54($s0)
    /* 68D74 80078D74 4D0002A2 */  sb         $v0, 0x4D($s0)
    /* 68D78 80078D78 1280013C */  lui        $at, %hi(_SpdBeltSelFlag)
    /* 68D7C 80078D7C 21082300 */  addu       $at, $at, $v1
    /* 68D80 80078D80 C4BB20A0 */  sb         $zero, %lo(_SpdBeltSelFlag)($at)
    /* 68D84 80078D84 1AE40108 */  j          .L80079068
    /* 68D88 80078D88 00000000 */   nop
  .L80078D8C:
    /* 68D8C 80078D8C 1280023C */  lui        $v0, %hi(sbookflag)
    /* 68D90 80078D90 C6B64290 */  lbu        $v0, %lo(sbookflag)($v0)
    /* 68D94 80078D94 00000000 */  nop
    /* 68D98 80078D98 05004010 */  beqz       $v0, .L80078DB0
    /* 68D9C 80078D9C 00000000 */   nop
    /* 68DA0 80078DA0 A0DC000C */  jal        CheckSBook__Fv
    /* 68DA4 80078DA4 00000000 */   nop
    /* 68DA8 80078DA8 1AE40108 */  j          .L80079068
    /* 68DAC 80078DAC 00000000 */   nop
  .L80078DB0:
    /* 68DB0 80078DB0 1280023C */  lui        $v0, %hi(questlog)
    /* 68DB4 80078DB4 29BA4290 */  lbu        $v0, %lo(questlog)($v0)
    /* 68DB8 80078DB8 00000000 */  nop
    /* 68DBC 80078DBC 05004010 */  beqz       $v0, .L80078DD4
    /* 68DC0 80078DC0 00000000 */   nop
    /* 68DC4 80078DC4 1EA4010C */  jal        QuestlogEnter__Fv
    /* 68DC8 80078DC8 00000000 */   nop
    /* 68DCC 80078DCC 1AE40108 */  j          .L80079068
    /* 68DD0 80078DD0 00000000 */   nop
  .L80078DD4:
    /* 68DD4 80078DD4 1280023C */  lui        $v0, %hi(chrflag)
    /* 68DD8 80078DD8 C0B64290 */  lbu        $v0, %lo(chrflag)($v0)
    /* 68DDC 80078DDC 00000000 */  nop
    /* 68DE0 80078DE0 05004010 */  beqz       $v0, .L80078DF8
    /* 68DE4 80078DE4 00000000 */   nop
    /* 68DE8 80078DE8 3BD7000C */  jal        CheckChrBtns__Fv
    /* 68DEC 80078DEC 00000000 */   nop
    /* 68DF0 80078DF0 1AE40108 */  j          .L80079068
    /* 68DF4 80078DF4 00000000 */   nop
  .L80078DF8:
    /* 68DF8 80078DF8 4C000482 */  lb         $a0, 0x4C($s0)
    /* 68DFC 80078DFC 00000000 */  nop
    /* 68E00 80078E00 80100400 */  sll        $v0, $a0, 2
    /* 68E04 80078E04 1280013C */  lui        $at, %hi(_spselflag)
    /* 68E08 80078E08 21082200 */  addu       $at, $at, $v0
    /* 68E0C 80078E0C 50B6228C */  lw         $v0, %lo(_spselflag)($at)
    /* 68E10 80078E10 00000000 */  nop
    /* 68E14 80078E14 05004010 */  beqz       $v0, .L80078E2C
    /* 68E18 80078E18 00000000 */   nop
    /* 68E1C 80078E1C 55C7000C */  jal        SetSpell__Fi
    /* 68E20 80078E20 00000000 */   nop
    /* 68E24 80078E24 FEE30108 */  j          .L80078FF8
    /* 68E28 80078E28 FFFF0224 */   addiu     $v0, $zero, -0x1
  .L80078E2C:
    /* 68E2C 80078E2C 1280033C */  lui        $v1, %hi(invflag)
    /* 68E30 80078E30 2CC36390 */  lbu        $v1, %lo(invflag)($v1)
    /* 68E34 80078E34 1280023C */  lui        $v0, %hi(optionsflag)
    /* 68E38 80078E38 48B2428C */  lw         $v0, %lo(optionsflag)($v0)
    /* 68E3C 80078E3C 00000000 */  nop
    /* 68E40 80078E40 25104300 */  or         $v0, $v0, $v1
    /* 68E44 80078E44 88004014 */  bnez       $v0, .L80079068
    /* 68E48 80078E48 21200002 */   addu      $a0, $s0, $zero
    /* 68E4C 80078E4C 18E40108 */  j          .L80079060
    /* 68E50 80078E50 40000524 */   addiu     $a1, $zero, 0x40
  .L80078E54:
    /* 68E54 80078E54 5400038E */  lw         $v1, 0x54($s0)
    /* 68E58 80078E58 0A80023C */  lui        $v0, %hi(select_belt_item__Fi)
    /* 68E5C 80078E5C 600A4224 */  addiu      $v0, $v0, %lo(select_belt_item__Fi)
    /* 68E60 80078E60 07006214 */  bne        $v1, $v0, .L80078E80
    /* 68E64 80078E64 21200002 */   addu      $a0, $s0, $zero
    /* 68E68 80078E68 C6F5000C */  jal        PlaySFX__Fi
    /* 68E6C 80078E6C 32000424 */   addiu     $a0, $zero, 0x32
    /* 68E70 80078E70 B482020C */  jal        get_last_inv__Fv
    /* 68E74 80078E74 00000000 */   nop
    /* 68E78 80078E78 1AE40108 */  j          .L80079068
    /* 68E7C 80078E7C 00000000 */   nop
  .L80078E80:
    /* 68E80 80078E80 18E40108 */  j          .L80079060
    /* 68E84 80078E84 04000524 */   addiu     $a1, $zero, 0x4
  .L80078E88:
    /* 68E88 80078E88 5400038E */  lw         $v1, 0x54($s0)
    /* 68E8C 80078E8C 0A80023C */  lui        $v0, %hi(select_belt_item__Fi)
    /* 68E90 80078E90 600A4224 */  addiu      $v0, $v0, %lo(select_belt_item__Fi)
    /* 68E94 80078E94 07006214 */  bne        $v1, $v0, .L80078EB4
    /* 68E98 80078E98 21200002 */   addu      $a0, $s0, $zero
    /* 68E9C 80078E9C FF82020C */  jal        get_next_inv__Fv
    /* 68EA0 80078EA0 00000000 */   nop
    /* 68EA4 80078EA4 C6F5000C */  jal        PlaySFX__Fi
    /* 68EA8 80078EA8 32000424 */   addiu     $a0, $zero, 0x32
    /* 68EAC 80078EAC 1AE40108 */  j          .L80079068
    /* 68EB0 80078EB0 00000000 */   nop
  .L80078EB4:
    /* 68EB4 80078EB4 18E40108 */  j          .L80079060
    /* 68EB8 80078EB8 08000524 */   addiu     $a1, $zero, 0x8
  .L80078EBC:
    /* 68EBC 80078EBC 18E40108 */  j          .L80079060
    /* 68EC0 80078EC0 02000524 */   addiu     $a1, $zero, 0x2
  .L80078EC4:
    /* 68EC4 80078EC4 1280023C */  lui        $v0, %hi(PauseMode)
    /* 68EC8 80078EC8 A4B74290 */  lbu        $v0, %lo(PauseMode)($v0)
    /* 68ECC 80078ECC 00000000 */  nop
    /* 68ED0 80078ED0 65004014 */  bnez       $v0, .L80079068
    /* 68ED4 80078ED4 00000000 */   nop
    /* 68ED8 80078ED8 1280023C */  lui        $v0, %hi(questlog)
    /* 68EDC 80078EDC 29BA4290 */  lbu        $v0, %lo(questlog)($v0)
    /* 68EE0 80078EE0 00000000 */  nop
    /* 68EE4 80078EE4 30004014 */  bnez       $v0, .L80078FA8
    /* 68EE8 80078EE8 01000224 */   addiu     $v0, $zero, 0x1
    /* 68EEC 80078EEC 1280013C */  lui        $at, %hi(msgholdflag)
    /* 68EF0 80078EF0 69B822A0 */  sb         $v0, %lo(msgholdflag)($at)
    /* 68EF4 80078EF4 21200002 */  addu       $a0, $s0, $zero
    /* 68EF8 80078EF8 18E40108 */  j          .L80079060
    /* 68EFC 80078EFC 20000524 */   addiu     $a1, $zero, 0x20
  .L80078F00:
    /* 68F00 80078F00 5400038E */  lw         $v1, 0x54($s0)
    /* 68F04 80078F04 0A80023C */  lui        $v0, %hi(select_belt_item__Fi)
    /* 68F08 80078F08 600A4224 */  addiu      $v0, $v0, %lo(select_belt_item__Fi)
    /* 68F0C 80078F0C 0C006214 */  bne        $v1, $v0, .L80078F40
    /* 68F10 80078F10 00000000 */   nop
    /* 68F14 80078F14 C6F5000C */  jal        PlaySFX__Fi
    /* 68F18 80078F18 33000424 */   addiu     $a0, $zero, 0x33
    /* 68F1C 80078F1C 4C000382 */  lb         $v1, 0x4C($s0)
    /* 68F20 80078F20 01000224 */  addiu      $v0, $zero, 0x1
    /* 68F24 80078F24 4D0002A2 */  sb         $v0, 0x4D($s0)
    /* 68F28 80078F28 540000AE */  sw         $zero, 0x54($s0)
    /* 68F2C 80078F2C 1280013C */  lui        $at, %hi(_SpdBeltSelFlag)
    /* 68F30 80078F30 21082300 */  addu       $at, $at, $v1
    /* 68F34 80078F34 C4BB20A0 */  sb         $zero, %lo(_SpdBeltSelFlag)($at)
    /* 68F38 80078F38 1AE40108 */  j          .L80079068
    /* 68F3C 80078F3C 00000000 */   nop
  .L80078F40:
    /* 68F40 80078F40 1280023C */  lui        $v0, %hi(select_flag)
    /* 68F44 80078F44 1DB14290 */  lbu        $v0, %lo(select_flag)($v0)
    /* 68F48 80078F48 00000000 */  nop
    /* 68F4C 80078F4C 05004010 */  beqz       $v0, .L80078F64
    /* 68F50 80078F50 00000000 */   nop
    /* 68F54 80078F54 1280013C */  lui        $at, %hi(select_flag)
    /* 68F58 80078F58 1DB120A0 */  sb         $zero, %lo(select_flag)($at)
    /* 68F5C 80078F5C 1AE40108 */  j          .L80079068
    /* 68F60 80078F60 00000000 */   nop
  .L80078F64:
    /* 68F64 80078F64 1280023C */  lui        $v0, %hi(invflag)
    /* 68F68 80078F68 2CC34290 */  lbu        $v0, %lo(invflag)($v0)
    /* 68F6C 80078F6C 1280033C */  lui        $v1, %hi(chrflag)
    /* 68F70 80078F70 C0B66390 */  lbu        $v1, %lo(chrflag)($v1)
    /* 68F74 80078F74 00000000 */  nop
    /* 68F78 80078F78 25104300 */  or         $v0, $v0, $v1
    /* 68F7C 80078F7C 05004010 */  beqz       $v0, .L80078F94
    /* 68F80 80078F80 00000000 */   nop
    /* 68F84 80078F84 FEE0010C */  jal        CloseInvChr__Fv
    /* 68F88 80078F88 00000000 */   nop
    /* 68F8C 80078F8C 1AE40108 */  j          .L80079068
    /* 68F90 80078F90 00000000 */   nop
  .L80078F94:
    /* 68F94 80078F94 1280023C */  lui        $v0, %hi(questlog)
    /* 68F98 80078F98 29BA4290 */  lbu        $v0, %lo(questlog)($v0)
    /* 68F9C 80078F9C 00000000 */  nop
    /* 68FA0 80078FA0 05004010 */  beqz       $v0, .L80078FB8
    /* 68FA4 80078FA4 00000000 */   nop
  .L80078FA8:
    /* 68FA8 80078FA8 51A4010C */  jal        QuestlogESC__Fv
    /* 68FAC 80078FAC 00000000 */   nop
    /* 68FB0 80078FB0 1AE40108 */  j          .L80079068
    /* 68FB4 80078FB4 00000000 */   nop
  .L80078FB8:
    /* 68FB8 80078FB8 1280023C */  lui        $v0, %hi(sbookflag)
    /* 68FBC 80078FBC C6B64290 */  lbu        $v0, %lo(sbookflag)($v0)
    /* 68FC0 80078FC0 00000000 */  nop
    /* 68FC4 80078FC4 10004010 */  beqz       $v0, .L80079008
    /* 68FC8 80078FC8 00000000 */   nop
    /* 68FCC 80078FCC 1280023C */  lui        $v0, %hi(Qfromoptions)
    /* 68FD0 80078FD0 28B24290 */  lbu        $v0, %lo(Qfromoptions)($v0)
    /* 68FD4 80078FD4 1280013C */  lui        $at, %hi(sbookflag)
    /* 68FD8 80078FD8 C6B620A0 */  sb         $zero, %lo(sbookflag)($at)
    /* 68FDC 80078FDC 22004014 */  bnez       $v0, .L80079068
    /* 68FE0 80078FE0 05000424 */   addiu     $a0, $zero, 0x5
    /* 68FE4 80078FE4 21280000 */  addu       $a1, $zero, $zero
    /* 68FE8 80078FE8 21300000 */  addu       $a2, $zero, $zero
    /* 68FEC 80078FEC 53EB010C */  jal        PostGamePad__Fiiii
    /* 68FF0 80078FF0 21380000 */   addu      $a3, $zero, $zero
    /* 68FF4 80078FF4 FFFF0224 */  addiu      $v0, $zero, -0x1
  .L80078FF8:
    /* 68FF8 80078FF8 1280013C */  lui        $at, %hi(options_pad)
    /* 68FFC 80078FFC 50B222AC */  sw         $v0, %lo(options_pad)($at)
    /* 69000 80079000 1AE40108 */  j          .L80079068
    /* 69004 80079004 00000000 */   nop
  .L80079008:
    /* 69008 80079008 1280023C */  lui        $v0, %hi(optionsflag)
    /* 6900C 8007900C 48B2428C */  lw         $v0, %lo(optionsflag)($v0)
    /* 69010 80079010 00000000 */  nop
    /* 69014 80079014 14004014 */  bnez       $v0, .L80079068
    /* 69018 80079018 00000000 */   nop
    /* 6901C 8007901C 4C000282 */  lb         $v0, 0x4C($s0)
    /* 69020 80079020 00000000 */  nop
    /* 69024 80079024 80100200 */  sll        $v0, $v0, 2
    /* 69028 80079028 1280013C */  lui        $at, %hi(_spselflag)
    /* 6902C 8007902C 21082200 */  addu       $at, $at, $v0
    /* 69030 80079030 50B6228C */  lw         $v0, %lo(_spselflag)($at)
    /* 69034 80079034 00000000 */  nop
    /* 69038 80079038 09004010 */  beqz       $v0, .L80079060
    /* 6903C 8007903C 21200002 */   addu      $a0, $s0, $zero
    /* 69040 80079040 C6F5000C */  jal        PlaySFX__Fi
    /* 69044 80079044 33000424 */   addiu     $a0, $zero, 0x33
    /* 69048 80079048 4C000482 */  lb         $a0, 0x4C($s0)
    /* 6904C 8007904C 01C4000C */  jal        ToggleSpell__Fi
    /* 69050 80079050 00000000 */   nop
    /* 69054 80079054 1AE40108 */  j          .L80079068
    /* 69058 80079058 00000000 */   nop
  .L8007905C:
    /* 6905C 8007905C 21200002 */  addu       $a0, $s0, $zero
  .L80079060:
    /* 69060 80079060 DEE2010C */  jal        RunFunc__7GamePadi
    /* 69064 80079064 00000000 */   nop
  .L80079068:
    /* 69068 80079068 1400BF8F */  lw         $ra, 0x14($sp)
    /* 6906C 8007906C 1000B08F */  lw         $s0, 0x10($sp)
    /* 69070 80079070 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 69074 80079074 0800E003 */  jr         $ra
    /* 69078 80079078 00000000 */   nop
endlabel ButtonDown__7GamePadi
