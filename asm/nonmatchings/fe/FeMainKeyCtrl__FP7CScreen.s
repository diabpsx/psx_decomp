.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FeMainKeyCtrl__FP7CScreen, 0x1C8

glabel FeMainKeyCtrl__FP7CScreen
    /* CA8 8013A8A0 1280023C */  lui        $v0, %hi(qtextflag)
    /* CAC 8013A8A4 60B94290 */  lbu        $v0, %lo(qtextflag)($v0)
    /* CB0 8013A8A8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* CB4 8013A8AC 6A004014 */  bnez       $v0, .L8013AA58
    /* CB8 8013A8B0 1000BFAF */   sw        $ra, 0x10($sp)
    /* CBC 8013A8B4 1280023C */  lui        $v0, %hi(CDWAIT)
    /* CC0 8013A8B8 ECAD428C */  lw         $v0, %lo(CDWAIT)($v0)
    /* CC4 8013A8BC 00000000 */  nop
    /* CC8 8013A8C0 65004014 */  bnez       $v0, .L8013AA58
    /* CCC 8013A8C4 00000000 */   nop
    /* CD0 8013A8C8 1280023C */  lui        $v0, %hi(PauseMode)
    /* CD4 8013A8CC A4B74290 */  lbu        $v0, %lo(PauseMode)($v0)
    /* CD8 8013A8D0 00000000 */  nop
    /* CDC 8013A8D4 60004014 */  bnez       $v0, .L8013AA58
    /* CE0 8013A8D8 00000000 */   nop
    /* CE4 8013A8DC 1280023C */  lui        $v0, %hi(DavesPad)
    /* CE8 8013A8E0 12AB4294 */  lhu        $v0, %lo(DavesPad)($v0)
    /* CEC 8013A8E4 00000000 */  nop
    /* CF0 8013A8E8 01004230 */  andi       $v0, $v0, 0x1
    /* CF4 8013A8EC 03004010 */  beqz       $v0, .L8013A8FC
    /* CF8 8013A8F0 00000000 */   nop
    /* CFC 8013A8F4 9BE9040C */  jal        FeSelUp__Fi
    /* D00 8013A8F8 01000424 */   addiu     $a0, $zero, 0x1
  .L8013A8FC:
    /* D04 8013A8FC 1280023C */  lui        $v0, %hi(DavesPad)
    /* D08 8013A900 12AB4294 */  lhu        $v0, %lo(DavesPad)($v0)
    /* D0C 8013A904 00000000 */  nop
    /* D10 8013A908 02004230 */  andi       $v0, $v0, 0x2
    /* D14 8013A90C 03004010 */  beqz       $v0, .L8013A91C
    /* D18 8013A910 00000000 */   nop
    /* D1C 8013A914 D5E9040C */  jal        FeSelDown__Fi
    /* D20 8013A918 01000424 */   addiu     $a0, $zero, 0x1
  .L8013A91C:
    /* D24 8013A91C 1280023C */  lui        $v0, %hi(DavesPad)
    /* D28 8013A920 12AB4294 */  lhu        $v0, %lo(DavesPad)($v0)
    /* D2C 8013A924 00000000 */  nop
    /* D30 8013A928 50004230 */  andi       $v0, $v0, 0x50
    /* D34 8013A92C 42004010 */  beqz       $v0, .L8013AA38
    /* D38 8013A930 00000000 */   nop
    /* D3C 8013A934 C6F5000C */  jal        PlaySFX__Fi
    /* D40 8013A938 33000424 */   addiu     $a0, $zero, 0x33
    /* D44 8013A93C 140C838F */  lw         $v1, %gp_rel(FeCurMenu)($gp)
    /* D48 8013A940 0D80023C */  lui        $v0, %hi(FeBackgroundMenu)
    /* D4C 8013A944 60D74224 */  addiu      $v0, $v0, %lo(FeBackgroundMenu)
    /* D50 8013A948 0B006214 */  bne        $v1, $v0, .L8013A978
    /* D54 8013A94C 03000224 */   addiu     $v0, $zero, 0x3
    /* D58 8013A950 0D80033C */  lui        $v1, %hi(FeBackgroundMenu + 0x4)
    /* D5C 8013A954 64D7638C */  lw         $v1, %lo(FeBackgroundMenu + 0x4)($v1)
    /* D60 8013A958 00000000 */  nop
    /* D64 8013A95C 05006214 */  bne        $v1, $v0, .L8013A974
    /* D68 8013A960 00000000 */   nop
    /* D6C 8013A964 1E37010C */  jal        InitQTextMsg__Fi
    /* D70 8013A968 0A010424 */   addiu     $a0, $zero, 0x10A
    /* D74 8013A96C 8EEA0408 */  j          .L8013AA38
    /* D78 8013A970 00000000 */   nop
  .L8013A974:
    /* D7C 8013A974 140C838F */  lw         $v1, %gp_rel(FeCurMenu)($gp)
  .L8013A978:
    /* D80 8013A978 0D80023C */  lui        $v0, %hi(FeMainMenu)
    /* D84 8013A97C 9CD64224 */  addiu      $v0, $v0, %lo(FeMainMenu)
    /* D88 8013A980 21006214 */  bne        $v1, $v0, .L8013AA08
    /* D8C 8013A984 03000224 */   addiu     $v0, $zero, 0x3
    /* D90 8013A988 0D80033C */  lui        $v1, %hi(FeMainMenu + 0x4)
    /* D94 8013A98C A0D6638C */  lw         $v1, %lo(FeMainMenu + 0x4)($v1)
    /* D98 8013A990 00000000 */  nop
    /* D9C 8013A994 1C006214 */  bne        $v1, $v0, .L8013AA08
    /* DA0 8013A998 00000000 */   nop
    /* DA4 8013A99C 1280013C */  lui        $at, %hi(optionsflag)
    /* DA8 8013A9A0 48B220AC */  sw         $zero, %lo(optionsflag)($at)
    /* DAC 8013A9A4 B40B80AF */  sw         $zero, %gp_rel(FeMenuDelay)($gp)
    /* DB0 8013A9A8 C5A0020C */  jal        who_pressed__Fi
    /* DB4 8013A9AC 50000424 */   addiu     $a0, $zero, 0x50
    /* DB8 8013A9B0 1280013C */  lui        $at, %hi(options_pad)
    /* DBC 8013A9B4 50B222AC */  sw         $v0, %lo(options_pad)($at)
    /* DC0 8013A9B8 73AA020C */  jal        ToggleOptions__Fv
    /* DC4 8013A9BC 00000000 */   nop
    /* DC8 8013A9C0 1280023C */  lui        $v0, %hi(optionsflag)
    /* DCC 8013A9C4 48B2428C */  lw         $v0, %lo(optionsflag)($v0)
    /* DD0 8013A9C8 00000000 */  nop
    /* DD4 8013A9CC 0B004010 */  beqz       $v0, .L8013A9FC
    /* DD8 8013A9D0 00000000 */   nop
  .L8013A9D4:
    /* DDC 8013A9D4 3E10020C */  jal        VID_GetTick__Fv
    /* DE0 8013A9D8 00000000 */   nop
    /* DE4 8013A9DC 200C82AF */  sw         $v0, %gp_rel(FeCount)($gp)
    /* DE8 8013A9E0 EE80000C */  jal        TSK_Sleep
    /* DEC 8013A9E4 01000424 */   addiu     $a0, $zero, 0x1
    /* DF0 8013A9E8 1280023C */  lui        $v0, %hi(optionsflag)
    /* DF4 8013A9EC 48B2428C */  lw         $v0, %lo(optionsflag)($v0)
    /* DF8 8013A9F0 00000000 */  nop
    /* DFC 8013A9F4 F7FF4014 */  bnez       $v0, .L8013A9D4
    /* E00 8013A9F8 00000000 */   nop
  .L8013A9FC:
    /* E04 8013A9FC B40B80AF */  sw         $zero, %gp_rel(FeMenuDelay)($gp)
    /* E08 8013AA00 8EEA0408 */  j          .L8013AA38
    /* E0C 8013AA04 00000000 */   nop
  .L8013AA08:
    /* E10 8013AA08 140C828F */  lw         $v0, %gp_rel(FeCurMenu)($gp)
    /* E14 8013AA0C 00000000 */  nop
    /* E18 8013AA10 0400438C */  lw         $v1, 0x4($v0)
    /* E1C 8013AA14 00000000 */  nop
    /* E20 8013AA18 40100300 */  sll        $v0, $v1, 1
    /* E24 8013AA1C 21104300 */  addu       $v0, $v0, $v1
    /* E28 8013AA20 C0100200 */  sll        $v0, $v0, 3
    /* E2C 8013AA24 0D80013C */  lui        $at, %hi(FeBuffer + 0x14)
    /* E30 8013AA28 21082200 */  addu       $at, $at, $v0
    /* E34 8013AA2C 8CDB248C */  lw         $a0, %lo(FeBuffer + 0x14)($at)
    /* E38 8013AA30 29E9040C */  jal        FeNewMenu__FP7FeTable
    /* E3C 8013AA34 00000000 */   nop
  .L8013AA38:
    /* E40 8013AA38 1280023C */  lui        $v0, %hi(DavesPad)
    /* E44 8013AA3C 12AB4294 */  lhu        $v0, %lo(DavesPad)($v0)
    /* E48 8013AA40 00000000 */  nop
    /* E4C 8013AA44 00014230 */  andi       $v0, $v0, 0x100
    /* E50 8013AA48 03004010 */  beqz       $v0, .L8013AA58
    /* E54 8013AA4C 00000000 */   nop
    /* E58 8013AA50 49E9040C */  jal        FePrevMenu__Fv
    /* E5C 8013AA54 00000000 */   nop
  .L8013AA58:
    /* E60 8013AA58 1000BF8F */  lw         $ra, 0x10($sp)
    /* E64 8013AA5C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* E68 8013AA60 0800E003 */  jr         $ra
    /* E6C 8013AA64 00000000 */   nop
endlabel FeMainKeyCtrl__FP7CScreen
