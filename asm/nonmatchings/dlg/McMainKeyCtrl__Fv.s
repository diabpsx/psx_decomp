.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching McMainKeyCtrl__Fv, 0x29C

glabel McMainKeyCtrl__Fv
    /* 1FE74 80159A6C D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 1FE78 80159A70 1280033C */  lui        $v1, %hi(cardondelay)
    /* 1FE7C 80159A74 FCB1638C */  lw         $v1, %lo(cardondelay)($v1)
    /* 1FE80 80159A78 40010224 */  addiu      $v0, $zero, 0x140
    /* 1FE84 80159A7C 1C00A2A7 */  sh         $v0, 0x1C($sp)
    /* 1FE88 80159A80 A0000224 */  addiu      $v0, $zero, 0xA0
    /* 1FE8C 80159A84 1E00A2A7 */  sh         $v0, 0x1E($sp)
    /* 1FE90 80159A88 F8FF0224 */  addiu      $v0, $zero, -0x8
    /* 1FE94 80159A8C 1800A2A7 */  sh         $v0, 0x18($sp)
    /* 1FE98 80159A90 20000224 */  addiu      $v0, $zero, 0x20
    /* 1FE9C 80159A94 2800BFAF */  sw         $ra, 0x28($sp)
    /* 1FEA0 80159A98 0D006018 */  blez       $v1, .L80159AD0
    /* 1FEA4 80159A9C 1A00A2A7 */   sh        $v0, 0x1A($sp)
    /* 1FEA8 80159AA0 FFFF6224 */  addiu      $v0, $v1, -0x1
    /* 1FEAC 80159AA4 1280013C */  lui        $at, %hi(cardondelay)
    /* 1FEB0 80159AA8 FCB122AC */  sw         $v0, %lo(cardondelay)($at)
    /* 1FEB4 80159AAC 9797020C */  jal        ShowLoadingBox__Fi
    /* 1FEB8 80159AB0 48030424 */   addiu     $a0, $zero, 0x348
    /* 1FEBC 80159AB4 1280023C */  lui        $v0, %hi(cardondelay)
    /* 1FEC0 80159AB8 FCB1428C */  lw         $v0, %lo(cardondelay)($v0)
    /* 1FEC4 80159ABC 00000000 */  nop
    /* 1FEC8 80159AC0 8D004014 */  bnez       $v0, .L80159CF8
    /* 1FECC 80159AC4 01000424 */   addiu     $a0, $zero, 0x1
    /* 1FED0 80159AC8 E495020C */  jal        ActivateMemcard__Fii
    /* 1FED4 80159ACC 01000524 */   addiu     $a1, $zero, 0x1
  .L80159AD0:
    /* 1FED8 80159AD0 1280023C */  lui        $v0, %hi(loadflag)
    /* 1FEDC 80159AD4 7CB1428C */  lw         $v0, %lo(loadflag)($v0)
    /* 1FEE0 80159AD8 00000000 */  nop
    /* 1FEE4 80159ADC 14004010 */  beqz       $v0, .L80159B30
    /* 1FEE8 80159AE0 FFFF4224 */   addiu     $v0, $v0, -0x1
    /* 1FEEC 80159AE4 1280013C */  lui        $at, %hi(loadflag)
    /* 1FEF0 80159AE8 7CB122AC */  sw         $v0, %lo(loadflag)($at)
    /* 1FEF4 80159AEC 06004014 */  bnez       $v0, .L80159B08
    /* 1FEF8 80159AF0 00000000 */   nop
    /* 1FEFC 80159AF4 FC65050C */  jal        DoLoadGame__Fv
    /* 1FF00 80159AF8 00000000 */   nop
    /* 1FF04 80159AFC D80C828F */  lw         $v0, %gp_rel(AlertTxt)($gp)
    /* 1FF08 80159B00 3A670508 */  j          .L80159CE8
    /* 1FF0C 80159B04 00000000 */   nop
  .L80159B08:
    /* 1FF10 80159B08 E00C828F */  lw         $v0, %gp_rel(current_card)($gp)
    /* 1FF14 80159B0C 00000000 */  nop
    /* 1FF18 80159B10 80100200 */  sll        $v0, $v0, 2
    /* 1FF1C 80159B14 1280013C */  lui        $at, %hi(card_side_load)
    /* 1FF20 80159B18 21082200 */  addu       $at, $at, $v0
    /* 1FF24 80159B1C B8B1248C */  lw         $a0, %lo(card_side_load)($at)
    /* 1FF28 80159B20 9797020C */  jal        ShowLoadingBox__Fi
    /* 1FF2C 80159B24 00000000 */   nop
    /* 1FF30 80159B28 3E670508 */  j          .L80159CF8
    /* 1FF34 80159B2C 00000000 */   nop
  .L80159B30:
    /* 1FF38 80159B30 D80C828F */  lw         $v0, %gp_rel(AlertTxt)($gp)
    /* 1FF3C 80159B34 00000000 */  nop
    /* 1FF40 80159B38 0E004010 */  beqz       $v0, .L80159B74
    /* 1FF44 80159B3C 00000000 */   nop
    /* 1FF48 80159B40 EF68050C */  jal        ShowAlertBox__Fv
    /* 1FF4C 80159B44 00000000 */   nop
    /* 1FF50 80159B48 1280023C */  lui        $v0, %hi(DavesPad)
    /* 1FF54 80159B4C 12AB4294 */  lhu        $v0, %lo(DavesPad)($v0)
    /* 1FF58 80159B50 00000000 */  nop
    /* 1FF5C 80159B54 40004230 */  andi       $v0, $v0, 0x40
    /* 1FF60 80159B58 67004010 */  beqz       $v0, .L80159CF8
    /* 1FF64 80159B5C 00000000 */   nop
    /* 1FF68 80159B60 C6F5000C */  jal        PlaySFX__Fi
    /* 1FF6C 80159B64 33000424 */   addiu     $a0, $zero, 0x33
    /* 1FF70 80159B68 D80C80AF */  sw         $zero, %gp_rel(AlertTxt)($gp)
    /* 1FF74 80159B6C 3E670508 */  j          .L80159CF8
    /* 1FF78 80159B70 00000000 */   nop
  .L80159B74:
    /* 1FF7C 80159B74 2296020C */  jal        ShowCardActionText__Fv
    /* 1FF80 80159B78 00000000 */   nop
    /* 1FF84 80159B7C A80C828F */  lw         $v0, %gp_rel(fileinfoflag)($gp)
    /* 1FF88 80159B80 00000000 */  nop
    /* 1FF8C 80159B84 0F004010 */  beqz       $v0, .L80159BC4
    /* 1FF90 80159B88 0C000224 */   addiu     $v0, $zero, 0xC
    /* 1FF94 80159B8C 1400A2AF */  sw         $v0, 0x14($sp)
    /* 1FF98 80159B90 1800A897 */  lhu        $t0, 0x18($sp)
    /* 1FF9C 80159B94 1A00A797 */  lhu        $a3, 0x1A($sp)
    /* 1FFA0 80159B98 1F00A28B */  lwl        $v0, 0x1F($sp)
    /* 1FFA4 80159B9C 1C00A29B */  lwr        $v0, 0x1C($sp)
    /* 1FFA8 80159BA0 00000000 */  nop
    /* 1FFAC 80159BA4 1300A2AB */  swl        $v0, 0x13($sp)
    /* 1FFB0 80159BA8 1000A2BB */  swr        $v0, 0x10($sp)
    /* 1FFB4 80159BAC 21280000 */  addu       $a1, $zero, $zero
    /* 1FFB8 80159BB0 12000624 */  addiu      $a2, $zero, 0x12
    /* 1FFBC 80159BB4 900C848F */  lw         $a0, %gp_rel(DiabloGameFile)($gp)
    /* 1FFC0 80159BB8 003C0700 */  sll        $a3, $a3, 16
    /* 1FFC4 80159BBC E769050C */  jal        ShowGameFiles__FPciiG4RECTi
    /* 1FFC8 80159BC0 25380701 */   or        $a3, $t0, $a3
  .L80159BC4:
    /* 1FFCC 80159BC4 1280023C */  lui        $v0, %hi(DavesPad)
    /* 1FFD0 80159BC8 12AB4294 */  lhu        $v0, %lo(DavesPad)($v0)
    /* 1FFD4 80159BCC 00000000 */  nop
    /* 1FFD8 80159BD0 01004230 */  andi       $v0, $v0, 0x1
    /* 1FFDC 80159BD4 03004010 */  beqz       $v0, .L80159BE4
    /* 1FFE0 80159BD8 00000000 */   nop
    /* 1FFE4 80159BDC 9BE9040C */  jal        FeSelUp__Fi
    /* 1FFE8 80159BE0 01000424 */   addiu     $a0, $zero, 0x1
  .L80159BE4:
    /* 1FFEC 80159BE4 1280023C */  lui        $v0, %hi(DavesPad)
    /* 1FFF0 80159BE8 12AB4294 */  lhu        $v0, %lo(DavesPad)($v0)
    /* 1FFF4 80159BEC 00000000 */  nop
    /* 1FFF8 80159BF0 02004230 */  andi       $v0, $v0, 0x2
    /* 1FFFC 80159BF4 03004010 */  beqz       $v0, .L80159C04
    /* 20000 80159BF8 00000000 */   nop
    /* 20004 80159BFC D5E9040C */  jal        FeSelDown__Fi
    /* 20008 80159C00 01000424 */   addiu     $a0, $zero, 0x1
  .L80159C04:
    /* 2000C 80159C04 1280023C */  lui        $v0, %hi(DavesPad)
    /* 20010 80159C08 12AB4294 */  lhu        $v0, %lo(DavesPad)($v0)
    /* 20014 80159C0C 00000000 */  nop
    /* 20018 80159C10 40004230 */  andi       $v0, $v0, 0x40
    /* 2001C 80159C14 30004010 */  beqz       $v0, .L80159CD8
    /* 20020 80159C18 00000000 */   nop
    /* 20024 80159C1C 0FEA040C */  jal        FeGetCursor__Fv
    /* 20028 80159C20 00000000 */   nop
    /* 2002C 80159C24 FFFF4424 */  addiu      $a0, $v0, -0x1
    /* 20030 80159C28 80280400 */  sll        $a1, $a0, 2
    /* 20034 80159C2C 1280013C */  lui        $at, %hi(card_status)
    /* 20038 80159C30 21082500 */  addu       $at, $at, $a1
    /* 2003C 80159C34 DCB3238C */  lw         $v1, %lo(card_status)($at)
    /* 20040 80159C38 02000224 */  addiu      $v0, $zero, 0x2
    /* 20044 80159C3C E80C84AF */  sw         $a0, %gp_rel(McMenuPos)($gp)
    /* 20048 80159C40 06006214 */  bne        $v1, $v0, .L80159C5C
    /* 2004C 80159C44 00000000 */   nop
    /* 20050 80159C48 1280013C */  lui        $at, %hi(card_side_empty)
    /* 20054 80159C4C 21082500 */  addu       $at, $at, $a1
    /* 20058 80159C50 88B1228C */  lw         $v0, %lo(card_side_empty)($at)
    /* 2005C 80159C54 2E670508 */  j          .L80159CB8
    /* 20060 80159C58 00000000 */   nop
  .L80159C5C:
    /* 20064 80159C5C 1280013C */  lui        $at, %hi(card_usable)
    /* 20068 80159C60 21082500 */  addu       $at, $at, $a1
    /* 2006C 80159C64 E4B3228C */  lw         $v0, %lo(card_usable)($at)
    /* 20070 80159C68 00000000 */  nop
    /* 20074 80159C6C 06004014 */  bnez       $v0, .L80159C88
    /* 20078 80159C70 09050224 */   addiu     $v0, $zero, 0x509
    /* 2007C 80159C74 D80C82AF */  sw         $v0, %gp_rel(AlertTxt)($gp)
    /* 20080 80159C78 C6F5000C */  jal        PlaySFX__Fi
    /* 20084 80159C7C D3030424 */   addiu     $a0, $zero, 0x3D3
    /* 20088 80159C80 3E670508 */  j          .L80159CF8
    /* 2008C 80159C84 00000000 */   nop
  .L80159C88:
    /* 20090 80159C88 900C858F */  lw         $a1, %gp_rel(DiabloGameFile)($gp)
    /* 20094 80159C8C 6465050C */  jal        GetFileNumber__FiPc
    /* 20098 80159C90 00000000 */   nop
    /* 2009C 80159C94 FFFF0324 */  addiu      $v1, $zero, -0x1
    /* 200A0 80159C98 0D004314 */  bne        $v0, $v1, .L80159CD0
    /* 200A4 80159C9C 00000000 */   nop
    /* 200A8 80159CA0 E80C828F */  lw         $v0, %gp_rel(McMenuPos)($gp)
    /* 200AC 80159CA4 00000000 */  nop
    /* 200B0 80159CA8 80100200 */  sll        $v0, $v0, 2
    /* 200B4 80159CAC 1280013C */  lui        $at, %hi(card_side_nogame)
    /* 200B8 80159CB0 21082200 */  addu       $at, $at, $v0
    /* 200BC 80159CB4 98B1228C */  lw         $v0, %lo(card_side_nogame)($at)
  .L80159CB8:
    /* 200C0 80159CB8 00000000 */  nop
    /* 200C4 80159CBC D80C82AF */  sw         $v0, %gp_rel(AlertTxt)($gp)
    /* 200C8 80159CC0 C6F5000C */  jal        PlaySFX__Fi
    /* 200CC 80159CC4 D3030424 */   addiu     $a0, $zero, 0x3D3
    /* 200D0 80159CC8 3E670508 */  j          .L80159CF8
    /* 200D4 80159CCC 00000000 */   nop
  .L80159CD0:
    /* 200D8 80159CD0 14EA040C */  jal        FeSelect__Fv
    /* 200DC 80159CD4 00000000 */   nop
  .L80159CD8:
    /* 200E0 80159CD8 1280023C */  lui        $v0, %hi(DavesPad)
    /* 200E4 80159CDC 12AB4294 */  lhu        $v0, %lo(DavesPad)($v0)
    /* 200E8 80159CE0 00000000 */  nop
    /* 200EC 80159CE4 00014230 */  andi       $v0, $v0, 0x100
  .L80159CE8:
    /* 200F0 80159CE8 03004010 */  beqz       $v0, .L80159CF8
    /* 200F4 80159CEC 00000000 */   nop
    /* 200F8 80159CF0 49E9040C */  jal        FePrevMenu__Fv
    /* 200FC 80159CF4 00000000 */   nop
  .L80159CF8:
    /* 20100 80159CF8 2800BF8F */  lw         $ra, 0x28($sp)
    /* 20104 80159CFC 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 20108 80159D00 0800E003 */  jr         $ra
    /* 2010C 80159D04 00000000 */   nop
endlabel McMainKeyCtrl__Fv
