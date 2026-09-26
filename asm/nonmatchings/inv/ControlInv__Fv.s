.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching ControlInv__Fv, 0x3BC

glabel ControlInv__Fv
    /* 270FC 80160CF4 1280043C */  lui        $a0, %hi(myplr)
    /* 27100 80160CF8 08BA848C */  lw         $a0, %lo(myplr)($a0)
    /* 27104 80160CFC E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 27108 80160D00 1800BFAF */  sw         $ra, 0x18($sp)
    /* 2710C 80160D04 239C010C */  jal        CheckNewPath__Fi
    /* 27110 80160D08 00000000 */   nop
    /* 27114 80160D0C D784050C */  jal        InvSetItemCurs__Fv
    /* 27118 80160D10 00000000 */   nop
    /* 2711C 80160D14 1280023C */  lui        $v0, %hi(sfxdelay)
    /* 27120 80160D18 50B8428C */  lw         $v0, %lo(sfxdelay)($v0)
    /* 27124 80160D1C 00000000 */  nop
    /* 27128 80160D20 09004018 */  blez       $v0, .L80160D48
    /* 2712C 80160D24 FFFF4224 */   addiu     $v0, $v0, -0x1
    /* 27130 80160D28 1280013C */  lui        $at, %hi(sfxdelay)
    /* 27134 80160D2C 50B822AC */  sw         $v0, %lo(sfxdelay)($at)
    /* 27138 80160D30 05004014 */  bnez       $v0, .L80160D48
    /* 2713C 80160D34 00000000 */   nop
    /* 27140 80160D38 1280043C */  lui        $a0, %hi(sfxdnum)
    /* 27144 80160D3C 54B8848C */  lw         $a0, %lo(sfxdnum)($a0)
    /* 27148 80160D40 C6F5000C */  jal        PlaySFX__Fi
    /* 2714C 80160D44 00000000 */   nop
  .L80160D48:
    /* 27150 80160D48 1280033C */  lui        $v1, %hi(sel_data)
    /* 27154 80160D4C 2CB7638C */  lw         $v1, %lo(sel_data)($v1)
    /* 27158 80160D50 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 2715C 80160D54 1280013C */  lui        $at, %hi(_pcursitem)
    /* 27160 80160D58 21082300 */  addu       $at, $at, $v1
    /* 27164 80160D5C 64B722A0 */  sb         $v0, %lo(_pcursitem)($at)
    /* 27168 80160D60 1280013C */  lui        $at, %hi(uitemflag)
    /* 2716C 80160D64 DCB820A0 */  sb         $zero, %lo(uitemflag)($at)
    /* 27170 80160D68 8F11020C */  jal        ReadPad__Fi
    /* 27174 80160D6C FFFF0424 */   addiu     $a0, $zero, -0x1
    /* 27178 80160D70 1280023C */  lui        $v0, %hi(myplr)
    /* 2717C 80160D74 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 27180 80160D78 00000000 */  nop
    /* 27184 80160D7C 80100200 */  sll        $v0, $v0, 2
    /* 27188 80160D80 1280013C */  lui        $at, %hi(_pcurs)
    /* 2718C 80160D84 21082200 */  addu       $at, $at, $v0
    /* 27190 80160D88 30B7238C */  lw         $v1, %lo(_pcurs)($at)
    /* 27194 80160D8C 09000224 */  addiu      $v0, $zero, 0x9
    /* 27198 80160D90 02006214 */  bne        $v1, $v0, .L80160D9C
    /* 2719C 80160D94 00000000 */   nop
    /* 271A0 80160D98 AC1B80A3 */  sb         $zero, %gp_rel(invflag)($gp)
  .L80160D9C:
    /* 271A4 80160D9C B41B828F */  lw         $v0, %gp_rel(InvCursPos)($gp)
    /* 271A8 80160DA0 00000000 */  nop
    /* 271AC 80160DA4 19004228 */  slti       $v0, $v0, 0x19
    /* 271B0 80160DA8 04004010 */  beqz       $v0, .L80160DBC
    /* 271B4 80160DAC 60000224 */   addiu     $v0, $zero, 0x60
    /* 271B8 80160DB0 C01B80AF */  sw         $zero, %gp_rel(InvBackAY)($gp)
    /* 271BC 80160DB4 70830508 */  j          .L80160DC0
    /* 271C0 80160DB8 00000000 */   nop
  .L80160DBC:
    /* 271C4 80160DBC C01B82AF */  sw         $v0, %gp_rel(InvBackAY)($gp)
  .L80160DC0:
    /* 271C8 80160DC0 B01B838F */  lw         $v1, %gp_rel(InvBackY)($gp)
    /* 271CC 80160DC4 C01B848F */  lw         $a0, %gp_rel(InvBackAY)($gp)
    /* 271D0 80160DC8 00000000 */  nop
    /* 271D4 80160DCC 2A108300 */  slt        $v0, $a0, $v1
    /* 271D8 80160DD0 04004010 */  beqz       $v0, .L80160DE4
    /* 271DC 80160DD4 F0FF6224 */   addiu     $v0, $v1, -0x10
    /* 271E0 80160DD8 B01B82AF */  sw         $v0, %gp_rel(InvBackY)($gp)
    /* 271E4 80160DDC 7E830508 */  j          .L80160DF8
    /* 271E8 80160DE0 2A104400 */   slt       $v0, $v0, $a0
  .L80160DE4:
    /* 271EC 80160DE4 2A106400 */  slt        $v0, $v1, $a0
    /* 271F0 80160DE8 06004010 */  beqz       $v0, .L80160E04
    /* 271F4 80160DEC 10006224 */   addiu     $v0, $v1, 0x10
    /* 271F8 80160DF0 B01B82AF */  sw         $v0, %gp_rel(InvBackY)($gp)
    /* 271FC 80160DF4 2A108200 */  slt        $v0, $a0, $v0
  .L80160DF8:
    /* 27200 80160DF8 02004010 */  beqz       $v0, .L80160E04
    /* 27204 80160DFC 00000000 */   nop
    /* 27208 80160E00 B01B84AF */  sw         $a0, %gp_rel(InvBackY)($gp)
  .L80160E04:
    /* 2720C 80160E04 AC1B8293 */  lbu        $v0, %gp_rel(invflag)($gp)
    /* 27210 80160E08 00000000 */  nop
    /* 27214 80160E0C 16004010 */  beqz       $v0, .L80160E68
    /* 27218 80160E10 00000000 */   nop
    /* 2721C 80160E14 997E050C */  jal        CheckInvHLight__Fv
    /* 27220 80160E18 00000000 */   nop
    /* 27224 80160E1C 1280033C */  lui        $v1, %hi(sel_data)
    /* 27228 80160E20 2CB7638C */  lw         $v1, %lo(sel_data)($v1)
    /* 2722C 80160E24 1280013C */  lui        $at, %hi(_pcursinvitem)
    /* 27230 80160E28 21082300 */  addu       $at, $at, $v1
    /* 27234 80160E2C 68B722A0 */  sb         $v0, %lo(_pcursinvitem)($at)
    /* 27238 80160E30 1280023C */  lui        $v0, %hi(sel_data)
    /* 2723C 80160E34 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 27240 80160E38 1280013C */  lui        $at, %hi(_pcursinvitem)
    /* 27244 80160E3C 21082200 */  addu       $at, $at, $v0
    /* 27248 80160E40 68B72380 */  lb         $v1, %lo(_pcursinvitem)($at)
    /* 2724C 80160E44 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 27250 80160E48 09006214 */  bne        $v1, $v0, .L80160E70
    /* 27254 80160E4C 00000000 */   nop
    /* 27258 80160E50 1280043C */  lui        $a0, %hi(options_pad)
    /* 2725C 80160E54 50B2848C */  lw         $a0, %lo(options_pad)($a0)
    /* 27260 80160E58 E4DF010C */  jal        ClrCursor__Fi
    /* 27264 80160E5C 00000000 */   nop
    /* 27268 80160E60 9C830508 */  j          .L80160E70
    /* 2726C 80160E64 00000000 */   nop
  .L80160E68:
    /* 27270 80160E68 C8C7000C */  jal        ClearPanel__Fv
    /* 27274 80160E6C 00000000 */   nop
  .L80160E70:
    /* 27278 80160E70 BC1B828F */  lw         $v0, %gp_rel(InvPageFlag)($gp)
    /* 2727C 80160E74 00000000 */  nop
    /* 27280 80160E78 10004010 */  beqz       $v0, .L80160EBC
    /* 27284 80160E7C 00000000 */   nop
    /* 27288 80160E80 1280023C */  lui        $v0, %hi(DavesPad)
    /* 2728C 80160E84 12AB4294 */  lhu        $v0, %lo(DavesPad)($v0)
    /* 27290 80160E88 00000000 */  nop
    /* 27294 80160E8C 00044230 */  andi       $v0, $v0, 0x400
    /* 27298 80160E90 0B004010 */  beqz       $v0, .L80160EC0
    /* 2729C 80160E94 00000000 */   nop
    /* 272A0 80160E98 C6F5000C */  jal        PlaySFX__Fi
    /* 272A4 80160E9C 32000424 */   addiu     $a0, $zero, 0x32
    /* 272A8 80160EA0 B81B828F */  lw         $v0, %gp_rel(InvPageNo)($gp)
    /* 272AC 80160EA4 00000000 */  nop
    /* 272B0 80160EA8 04004014 */  bnez       $v0, .L80160EBC
    /* 272B4 80160EAC 01000224 */   addiu     $v0, $zero, 0x1
    /* 272B8 80160EB0 B81B82AF */  sw         $v0, %gp_rel(InvPageNo)($gp)
    /* 272BC 80160EB4 B0830508 */  j          .L80160EC0
    /* 272C0 80160EB8 00000000 */   nop
  .L80160EBC:
    /* 272C4 80160EBC B81B80AF */  sw         $zero, %gp_rel(InvPageNo)($gp)
  .L80160EC0:
    /* 272C8 80160EC0 1280023C */  lui        $v0, %hi(uitemflag)
    /* 272CC 80160EC4 DCB84290 */  lbu        $v0, %lo(uitemflag)($v0)
    /* 272D0 80160EC8 00000000 */  nop
    /* 272D4 80160ECC 03004010 */  beqz       $v0, .L80160EDC
    /* 272D8 80160ED0 00000000 */   nop
    /* 272DC 80160ED4 0A24010C */  jal        DrawUniqueInfo__Fv
    /* 272E0 80160ED8 00000000 */   nop
  .L80160EDC:
    /* 272E4 80160EDC 1280023C */  lui        $v0, %hi(DavesPad)
    /* 272E8 80160EE0 12AB4294 */  lhu        $v0, %lo(DavesPad)($v0)
    /* 272EC 80160EE4 00000000 */  nop
    /* 272F0 80160EE8 04004230 */  andi       $v0, $v0, 0x4
    /* 272F4 80160EEC 03004010 */  beqz       $v0, .L80160EFC
    /* 272F8 80160EF0 00000000 */   nop
    /* 272FC 80160EF4 3F85050C */  jal        InvMoveCursLeft__Fv
    /* 27300 80160EF8 00000000 */   nop
  .L80160EFC:
    /* 27304 80160EFC 1280023C */  lui        $v0, %hi(DavesPad)
    /* 27308 80160F00 12AB4294 */  lhu        $v0, %lo(DavesPad)($v0)
    /* 2730C 80160F04 00000000 */  nop
    /* 27310 80160F08 08004230 */  andi       $v0, $v0, 0x8
    /* 27314 80160F0C 03004010 */  beqz       $v0, .L80160F1C
    /* 27318 80160F10 00000000 */   nop
    /* 2731C 80160F14 A985050C */  jal        InvMoveCursRight__Fv
    /* 27320 80160F18 00000000 */   nop
  .L80160F1C:
    /* 27324 80160F1C 1280023C */  lui        $v0, %hi(DavesPad)
    /* 27328 80160F20 12AB4294 */  lhu        $v0, %lo(DavesPad)($v0)
    /* 2732C 80160F24 00000000 */  nop
    /* 27330 80160F28 01004230 */  andi       $v0, $v0, 0x1
    /* 27334 80160F2C 03004010 */  beqz       $v0, .L80160F3C
    /* 27338 80160F30 00000000 */   nop
    /* 2733C 80160F34 5686050C */  jal        InvMoveCursUp__Fv
    /* 27340 80160F38 00000000 */   nop
  .L80160F3C:
    /* 27344 80160F3C 1280023C */  lui        $v0, %hi(DavesPad)
    /* 27348 80160F40 12AB4294 */  lhu        $v0, %lo(DavesPad)($v0)
    /* 2734C 80160F44 00000000 */  nop
    /* 27350 80160F48 02004230 */  andi       $v0, $v0, 0x2
    /* 27354 80160F4C 03004010 */  beqz       $v0, .L80160F5C
    /* 27358 80160F50 00000000 */   nop
    /* 2735C 80160F54 D486050C */  jal        InvMoveCursDown__Fv
    /* 27360 80160F58 00000000 */   nop
  .L80160F5C:
    /* 27364 80160F5C 1280023C */  lui        $v0, %hi(DavesPad)
    /* 27368 80160F60 12AB4294 */  lhu        $v0, %lo(DavesPad)($v0)
    /* 2736C 80160F64 00000000 */  nop
    /* 27370 80160F68 40004230 */  andi       $v0, $v0, 0x40
    /* 27374 80160F6C 15004010 */  beqz       $v0, .L80160FC4
    /* 27378 80160F70 00000000 */   nop
    /* 2737C 80160F74 1280023C */  lui        $v0, %hi(myplr)
    /* 27380 80160F78 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 27384 80160F7C 00000000 */  nop
    /* 27388 80160F80 80100200 */  sll        $v0, $v0, 2
    /* 2738C 80160F84 1280013C */  lui        $at, %hi(_pcurs)
    /* 27390 80160F88 21082200 */  addu       $at, $at, $v0
    /* 27394 80160F8C 30B7238C */  lw         $v1, %lo(_pcurs)($at)
    /* 27398 80160F90 00000000 */  nop
    /* 2739C 80160F94 FEFF6224 */  addiu      $v0, $v1, -0x2
    /* 273A0 80160F98 0200422C */  sltiu      $v0, $v0, 0x2
    /* 273A4 80160F9C 03004014 */  bnez       $v0, .L80160FAC
    /* 273A8 80160FA0 04000224 */   addiu     $v0, $zero, 0x4
    /* 273AC 80160FA4 05006214 */  bne        $v1, $v0, .L80160FBC
    /* 273B0 80160FA8 00000000 */   nop
  .L80160FAC:
    /* 273B4 80160FAC 5DE1000C */  jal        TryIconCurs__Fv
    /* 273B8 80160FB0 00000000 */   nop
    /* 273BC 80160FB4 F1830508 */  j          .L80160FC4
    /* 273C0 80160FB8 00000000 */   nop
  .L80160FBC:
    /* 273C4 80160FBC A876050C */  jal        CheckInvScrn__Fv
    /* 273C8 80160FC0 00000000 */   nop
  .L80160FC4:
    /* 273CC 80160FC4 1280023C */  lui        $v0, %hi(DavesPad)
    /* 273D0 80160FC8 12AB4294 */  lhu        $v0, %lo(DavesPad)($v0)
    /* 273D4 80160FCC 00000000 */  nop
    /* 273D8 80160FD0 00024230 */  andi       $v0, $v0, 0x200
    /* 273DC 80160FD4 0C004010 */  beqz       $v0, .L80161008
    /* 273E0 80160FD8 01000224 */   addiu     $v0, $zero, 0x1
    /* 273E4 80160FDC 1280043C */  lui        $a0, %hi(myplr)
    /* 273E8 80160FE0 08BA848C */  lw         $a0, %lo(myplr)($a0)
    /* 273EC 80160FE4 1280033C */  lui        $v1, %hi(sel_data)
    /* 273F0 80160FE8 2CB7638C */  lw         $v1, %lo(sel_data)($v1)
    /* 273F4 80160FEC 1280013C */  lui        $at, %hi(ignore_buttons)
    /* 273F8 80160FF0 D0BB22AC */  sw         $v0, %lo(ignore_buttons)($at)
    /* 273FC 80160FF4 1280013C */  lui        $at, %hi(_pcursinvitem)
    /* 27400 80160FF8 21082300 */  addu       $at, $at, $v1
    /* 27404 80160FFC 68B72580 */  lb         $a1, %lo(_pcursinvitem)($at)
    /* 27408 80161000 1C81050C */  jal        UseInvItem__Fii
    /* 2740C 80161004 00000000 */   nop
  .L80161008:
    /* 27410 80161008 1280023C */  lui        $v0, %hi(DavesPad)
    /* 27414 8016100C 12AB4294 */  lhu        $v0, %lo(DavesPad)($v0)
    /* 27418 80161010 00000000 */  nop
    /* 2741C 80161014 80004230 */  andi       $v0, $v0, 0x80
    /* 27420 80161018 1F004010 */  beqz       $v0, .L80161098
    /* 27424 8016101C 00000000 */   nop
    /* 27428 80161020 1280023C */  lui        $v0, %hi(myplr)
    /* 2742C 80161024 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 27430 80161028 00000000 */  nop
    /* 27434 8016102C 80100200 */  sll        $v0, $v0, 2
    /* 27438 80161030 1280013C */  lui        $at, %hi(_pcurs)
    /* 2743C 80161034 21082200 */  addu       $at, $at, $v0
    /* 27440 80161038 30B7228C */  lw         $v0, %lo(_pcurs)($at)
    /* 27444 8016103C 00000000 */  nop
    /* 27448 80161040 0C004228 */  slti       $v0, $v0, 0xC
    /* 2744C 80161044 14004014 */  bnez       $v0, .L80161098
    /* 27450 80161048 00000000 */   nop
    /* 27454 8016104C 1280023C */  lui        $v0, %hi(numitems)
    /* 27458 80161050 88B8428C */  lw         $v0, %lo(numitems)($v0)
    /* 2745C 80161054 00000000 */  nop
    /* 27460 80161058 7A004228 */  slti       $v0, $v0, 0x7A
    /* 27464 8016105C 0C004010 */  beqz       $v0, .L80161090
    /* 27468 80161060 00000000 */   nop
    /* 2746C 80161064 087C050C */  jal        TryInvPut__Fv
    /* 27470 80161068 00000000 */   nop
    /* 27474 8016106C FF004230 */  andi       $v0, $v0, 0xFF
    /* 27478 80161070 07004010 */  beqz       $v0, .L80161090
    /* 2747C 80161074 01000424 */   addiu     $a0, $zero, 0x1
    /* 27480 80161078 0A000524 */  addiu      $a1, $zero, 0xA
    /* 27484 8016107C 21300000 */  addu       $a2, $zero, $zero
    /* 27488 80161080 F63E010C */  jal        NetSendCmdPItem__FUcUcUcUc
    /* 2748C 80161084 21380000 */   addu      $a3, $zero, $zero
    /* 27490 80161088 26840508 */  j          .L80161098
    /* 27494 8016108C 00000000 */   nop
  .L80161090:
    /* 27498 80161090 C6F5000C */  jal        PlaySFX__Fi
    /* 2749C 80161094 D3030424 */   addiu     $a0, $zero, 0x3D3
  .L80161098:
    /* 274A0 80161098 6A84050C */  jal        InvAlignObject__Fv
    /* 274A4 8016109C 00000000 */   nop
    /* 274A8 801610A0 1800BF8F */  lw         $ra, 0x18($sp)
    /* 274AC 801610A4 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 274B0 801610A8 0800E003 */  jr         $ra
    /* 274B4 801610AC 00000000 */   nop
endlabel ControlInv__Fv
