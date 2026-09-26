.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching McMainCharKeyCtrl__Fv, 0x46C

glabel McMainCharKeyCtrl__Fv
    /* 20358 80159F50 B8FFBD27 */  addiu      $sp, $sp, -0x48
    /* 2035C 80159F54 21280000 */  addu       $a1, $zero, $zero
    /* 20360 80159F58 1280043C */  lui        $a0, %hi(FePlayerNo)
    /* 20364 80159F5C 78B3848C */  lw         $a0, %lo(FePlayerNo)($a0)
    /* 20368 80159F60 40010224 */  addiu      $v0, $zero, 0x140
    /* 2036C 80159F64 1C00A2A7 */  sh         $v0, 0x1C($sp)
    /* 20370 80159F68 A0000224 */  addiu      $v0, $zero, 0xA0
    /* 20374 80159F6C 1E00A2A7 */  sh         $v0, 0x1E($sp)
    /* 20378 80159F70 20000224 */  addiu      $v0, $zero, 0x20
    /* 2037C 80159F74 4000BFAF */  sw         $ra, 0x40($sp)
    /* 20380 80159F78 3C00B3AF */  sw         $s3, 0x3C($sp)
    /* 20384 80159F7C 3800B2AF */  sw         $s2, 0x38($sp)
    /* 20388 80159F80 3400B1AF */  sw         $s1, 0x34($sp)
    /* 2038C 80159F84 3000B0AF */  sw         $s0, 0x30($sp)
    /* 20390 80159F88 1800A0A7 */  sh         $zero, 0x18($sp)
    /* 20394 80159F8C FD25020C */  jal        PAD_GetPad__FiUc
    /* 20398 80159F90 1A00A2A7 */   sh        $v0, 0x1A($sp)
    /* 2039C 80159F94 21904000 */  addu       $s2, $v0, $zero
    /* 203A0 80159F98 21204002 */  addu       $a0, $s2, $zero
    /* 203A4 80159F9C 1C6E050C */  jal        SetPadTick__4CPadUs_8015b870
    /* 203A8 80159FA0 0C000524 */   addiu     $a1, $zero, 0xC
    /* 203AC 80159FA4 21204002 */  addu       $a0, $s2, $zero
    /* 203B0 80159FA8 1A6E050C */  jal        SetPadTickMask__4CPadUs_8015b868
    /* 203B4 80159FAC 03000524 */   addiu     $a1, $zero, 0x3
    /* 203B8 80159FB0 11001324 */  addiu      $s3, $zero, 0x11
    /* 203BC 80159FB4 1280023C */  lui        $v0, %hi(cardondelay)
    /* 203C0 80159FB8 FCB1428C */  lw         $v0, %lo(cardondelay)($v0)
    /* 203C4 80159FBC 00000000 */  nop
    /* 203C8 80159FC0 16004018 */  blez       $v0, .L8015A01C
    /* 203CC 80159FC4 4A001124 */   addiu     $s1, $zero, 0x4A
    /* 203D0 80159FC8 1280033C */  lui        $v1, %hi(countdownloadcharblock)
    /* 203D4 80159FCC 6CB1638C */  lw         $v1, %lo(countdownloadcharblock)($v1)
    /* 203D8 80159FD0 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 203DC 80159FD4 1280013C */  lui        $at, %hi(cardondelay)
    /* 203E0 80159FD8 FCB122AC */  sw         $v0, %lo(cardondelay)($at)
    /* 203E4 80159FDC 0B006010 */  beqz       $v1, .L8015A00C
    /* 203E8 80159FE0 00000000 */   nop
    /* 203EC 80159FE4 E00C828F */  lw         $v0, %gp_rel(current_card)($gp)
    /* 203F0 80159FE8 00000000 */  nop
    /* 203F4 80159FEC 80100200 */  sll        $v0, $v0, 2
    /* 203F8 80159FF0 1280013C */  lui        $at, %hi(card_side_read)
    /* 203FC 80159FF4 21082200 */  addu       $at, $at, $v0
    /* 20400 80159FF8 90B1248C */  lw         $a0, %lo(card_side_read)($at)
    /* 20404 80159FFC 9797020C */  jal        ShowLoadingBox__Fi
    /* 20408 8015A000 00000000 */   nop
    /* 2040C 8015A004 E7680508 */  j          .L8015A39C
    /* 20410 8015A008 00000000 */   nop
  .L8015A00C:
    /* 20414 8015A00C 9797020C */  jal        ShowLoadingBox__Fi
    /* 20418 8015A010 48030424 */   addiu     $a0, $zero, 0x348
    /* 2041C 8015A014 E7680508 */  j          .L8015A39C
    /* 20420 8015A018 00000000 */   nop
  .L8015A01C:
    /* 20424 8015A01C 1280023C */  lui        $v0, %hi(countdownloadcharblock)
    /* 20428 8015A020 6CB1428C */  lw         $v0, %lo(countdownloadcharblock)($v0)
    /* 2042C 8015A024 00000000 */  nop
    /* 20430 8015A028 07004010 */  beqz       $v0, .L8015A048
    /* 20434 8015A02C 00000000 */   nop
    /* 20438 8015A030 E00C858F */  lw         $a1, %gp_rel(current_card)($gp)
    /* 2043C 8015A034 00000000 */  nop
    /* 20440 8015A038 0100A42C */  sltiu      $a0, $a1, 0x1
    /* 20444 8015A03C 0100A538 */  xori       $a1, $a1, 0x1
    /* 20448 8015A040 F395020C */  jal        ActivateCharacterMemcard__Fii
    /* 2044C 8015A044 0100A52C */   sltiu     $a1, $a1, 0x1
  .L8015A048:
    /* 20450 8015A048 E00C828F */  lw         $v0, %gp_rel(current_card)($gp)
    /* 20454 8015A04C 1280103C */  lui        $s0, %hi(card_status)
    /* 20458 8015A050 DCB31026 */  addiu      $s0, $s0, %lo(card_status)
    /* 2045C 8015A054 80200200 */  sll        $a0, $v0, 2
    /* 20460 8015A058 1280013C */  lui        $at, %hi(card_status)
    /* 20464 8015A05C 21082400 */  addu       $at, $at, $a0
    /* 20468 8015A060 DCB3238C */  lw         $v1, %lo(card_status)($at)
    /* 2046C 8015A064 02000224 */  addiu      $v0, $zero, 0x2
    /* 20470 8015A068 06006214 */  bne        $v1, $v0, .L8015A084
    /* 20474 8015A06C 00000000 */   nop
    /* 20478 8015A070 1280013C */  lui        $at, %hi(card_side_empty)
    /* 2047C 8015A074 21082400 */  addu       $at, $at, $a0
    /* 20480 8015A078 88B1228C */  lw         $v0, %lo(card_side_empty)($at)
    /* 20484 8015A07C 00000000 */  nop
    /* 20488 8015A080 D80C82AF */  sw         $v0, %gp_rel(AlertTxt)($gp)
  .L8015A084:
    /* 2048C 8015A084 D80C828F */  lw         $v0, %gp_rel(AlertTxt)($gp)
    /* 20490 8015A088 00000000 */  nop
    /* 20494 8015A08C 0B004010 */  beqz       $v0, .L8015A0BC
    /* 20498 8015A090 00000000 */   nop
    /* 2049C 8015A094 EF68050C */  jal        ShowAlertBox__Fv
    /* 204A0 8015A098 00000000 */   nop
    /* 204A4 8015A09C 106E050C */  jal        GetDown__C4CPad_8015b840
    /* 204A8 8015A0A0 21204002 */   addu      $a0, $s2, $zero
    /* 204AC 8015A0A4 40004230 */  andi       $v0, $v0, 0x40
    /* 204B0 8015A0A8 BC004010 */  beqz       $v0, .L8015A39C
    /* 204B4 8015A0AC 00000000 */   nop
    /* 204B8 8015A0B0 D80C80AF */  sw         $zero, %gp_rel(AlertTxt)($gp)
    /* 204BC 8015A0B4 E5680508 */  j          .L8015A394
    /* 204C0 8015A0B8 00000000 */   nop
  .L8015A0BC:
    /* 204C4 8015A0BC 2296020C */  jal        ShowCardActionText__Fv
    /* 204C8 8015A0C0 00000000 */   nop
    /* 204CC 8015A0C4 A80C828F */  lw         $v0, %gp_rel(fileinfoflag)($gp)
    /* 204D0 8015A0C8 00000000 */  nop
    /* 204D4 8015A0CC 2F004010 */  beqz       $v0, .L8015A18C
    /* 204D8 8015A0D0 00000000 */   nop
    /* 204DC 8015A0D4 E00C828F */  lw         $v0, %gp_rel(current_card)($gp)
    /* 204E0 8015A0D8 00000000 */  nop
    /* 204E4 8015A0DC 80100200 */  sll        $v0, $v0, 2
    /* 204E8 8015A0E0 21105000 */  addu       $v0, $v0, $s0
    /* 204EC 8015A0E4 0000428C */  lw         $v0, 0x0($v0)
    /* 204F0 8015A0E8 00000000 */  nop
    /* 204F4 8015A0EC 27004014 */  bnez       $v0, .L8015A18C
    /* 204F8 8015A0F0 11000524 */   addiu     $a1, $zero, 0x11
    /* 204FC 8015A0F4 1000B1AF */  sw         $s1, 0x10($sp)
    /* 20500 8015A0F8 1800A397 */  lhu        $v1, 0x18($sp)
    /* 20504 8015A0FC 1280043C */  lui        $a0, %hi(fileselect)
    /* 20508 8015A100 A4B3848C */  lw         $a0, %lo(fileselect)($a0)
    /* 2050C 8015A104 1C00A297 */  lhu        $v0, 0x1C($sp)
    /* 20510 8015A108 1A00A697 */  lhu        $a2, 0x1A($sp)
    /* 20514 8015A10C 1E00A797 */  lhu        $a3, 0x1E($sp)
    /* 20518 8015A110 00340600 */  sll        $a2, $a2, 16
    /* 2051C 8015A114 003C0700 */  sll        $a3, $a3, 16
    /* 20520 8015A118 25306600 */  or         $a2, $v1, $a2
    /* 20524 8015A11C 436A050C */  jal        ShowCharacterFiles__FiiG4RECTi
    /* 20528 8015A120 25384700 */   or        $a3, $v0, $a3
    /* 2052C 8015A124 1280043C */  lui        $a0, %hi(fileselect)
    /* 20530 8015A128 A4B3848C */  lw         $a0, %lo(fileselect)($a0)
    /* 20534 8015A12C DF6C050C */  jal        GetSpinnerWidth__Fi
    /* 20538 8015A130 A0001024 */   addiu     $s0, $zero, 0xA0
    /* 2053C 8015A134 1280033C */  lui        $v1, %hi(fileselect)
    /* 20540 8015A138 A4B3638C */  lw         $v1, %lo(fileselect)($v1)
    /* 20544 8015A13C 00000000 */  nop
    /* 20548 8015A140 18007300 */  mult       $v1, $s3
    /* 2054C 8015A144 21884000 */  addu       $s1, $v0, $zero
    /* 20550 8015A148 C2171100 */  srl        $v0, $s1, 31
    /* 20554 8015A14C 21102202 */  addu       $v0, $s1, $v0
    /* 20558 8015A150 43100200 */  sra        $v0, $v0, 1
    /* 2055C 8015A154 23800202 */  subu       $s0, $s0, $v0
    /* 20560 8015A158 F2FF0426 */  addiu      $a0, $s0, -0xE
    /* 20564 8015A15C 12400000 */  mflo       $t0
    /* 20568 8015A160 6EF2040C */  jal        DrawFeTwinkle__Fii
    /* 2056C 8015A164 4A000525 */   addiu     $a1, $t0, 0x4A
    /* 20570 8015A168 1280023C */  lui        $v0, %hi(fileselect)
    /* 20574 8015A16C A4B3428C */  lw         $v0, %lo(fileselect)($v0)
    /* 20578 8015A170 00000000 */  nop
    /* 2057C 8015A174 18005300 */  mult       $v0, $s3
    /* 20580 8015A178 06003126 */  addiu      $s1, $s1, 0x6
    /* 20584 8015A17C 21201102 */  addu       $a0, $s0, $s1
    /* 20588 8015A180 12400000 */  mflo       $t0
    /* 2058C 8015A184 6EF2040C */  jal        DrawFeTwinkle__Fii
    /* 20590 8015A188 4A000525 */   addiu     $a1, $t0, 0x4A
  .L8015A18C:
    /* 20594 8015A18C 066E050C */  jal        GetTick__C4CPad_8015b818
    /* 20598 8015A190 21204002 */   addu      $a0, $s2, $zero
    /* 2059C 8015A194 01004230 */  andi       $v0, $v0, 0x1
    /* 205A0 8015A198 0D004010 */  beqz       $v0, .L8015A1D0
    /* 205A4 8015A19C FFFF0324 */   addiu     $v1, $zero, -0x1
    /* 205A8 8015A1A0 1280023C */  lui        $v0, %hi(fileselect)
    /* 205AC 8015A1A4 A4B3428C */  lw         $v0, %lo(fileselect)($v0)
    /* 205B0 8015A1A8 00000000 */  nop
    /* 205B4 8015A1AC FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 205B8 8015A1B0 1280013C */  lui        $at, %hi(fileselect)
    /* 205BC 8015A1B4 A4B322AC */  sw         $v0, %lo(fileselect)($at)
    /* 205C0 8015A1B8 03004314 */  bne        $v0, $v1, .L8015A1C8
    /* 205C4 8015A1BC 05000224 */   addiu     $v0, $zero, 0x5
    /* 205C8 8015A1C0 1280013C */  lui        $at, %hi(fileselect)
    /* 205CC 8015A1C4 A4B322AC */  sw         $v0, %lo(fileselect)($at)
  .L8015A1C8:
    /* 205D0 8015A1C8 C6F5000C */  jal        PlaySFX__Fi
    /* 205D4 8015A1CC 32000424 */   addiu     $a0, $zero, 0x32
  .L8015A1D0:
    /* 205D8 8015A1D0 066E050C */  jal        GetTick__C4CPad_8015b818
    /* 205DC 8015A1D4 21204002 */   addu      $a0, $s2, $zero
    /* 205E0 8015A1D8 02004230 */  andi       $v0, $v0, 0x2
    /* 205E4 8015A1DC 0F004010 */  beqz       $v0, .L8015A21C
    /* 205E8 8015A1E0 21800000 */   addu      $s0, $zero, $zero
    /* 205EC 8015A1E4 1280023C */  lui        $v0, %hi(fileselect)
    /* 205F0 8015A1E8 A4B3428C */  lw         $v0, %lo(fileselect)($v0)
    /* 205F4 8015A1EC 00000000 */  nop
    /* 205F8 8015A1F0 01004224 */  addiu      $v0, $v0, 0x1
    /* 205FC 8015A1F4 1280013C */  lui        $at, %hi(fileselect)
    /* 20600 8015A1F8 A4B322AC */  sw         $v0, %lo(fileselect)($at)
    /* 20604 8015A1FC 06004228 */  slti       $v0, $v0, 0x6
    /* 20608 8015A200 03004014 */  bnez       $v0, .L8015A210
    /* 2060C 8015A204 00000000 */   nop
    /* 20610 8015A208 1280013C */  lui        $at, %hi(fileselect)
    /* 20614 8015A20C A4B320AC */  sw         $zero, %lo(fileselect)($at)
  .L8015A210:
    /* 20618 8015A210 C6F5000C */  jal        PlaySFX__Fi
    /* 2061C 8015A214 32000424 */   addiu     $a0, $zero, 0x32
    /* 20620 8015A218 21800000 */  addu       $s0, $zero, $zero
  .L8015A21C:
    /* 20624 8015A21C 106E050C */  jal        GetDown__C4CPad_8015b840
    /* 20628 8015A220 21204002 */   addu      $a0, $s2, $zero
    /* 2062C 8015A224 40004230 */  andi       $v0, $v0, 0x40
    /* 20630 8015A228 06004014 */  bnez       $v0, .L8015A244
    /* 20634 8015A22C 00000000 */   nop
    /* 20638 8015A230 106E050C */  jal        GetDown__C4CPad_8015b840
    /* 2063C 8015A234 21204002 */   addu      $a0, $s2, $zero
    /* 20640 8015A238 10004230 */  andi       $v0, $v0, 0x10
    /* 20644 8015A23C 02004010 */  beqz       $v0, .L8015A248
    /* 20648 8015A240 00000000 */   nop
  .L8015A244:
    /* 2064C 8015A244 01001024 */  addiu      $s0, $zero, 0x1
  .L8015A248:
    /* 20650 8015A248 4B000012 */  beqz       $s0, .L8015A378
    /* 20654 8015A24C 00000000 */   nop
    /* 20658 8015A250 E00C828F */  lw         $v0, %gp_rel(current_card)($gp)
    /* 2065C 8015A254 00000000 */  nop
    /* 20660 8015A258 80100200 */  sll        $v0, $v0, 2
    /* 20664 8015A25C 1280013C */  lui        $at, %hi(card_status)
    /* 20668 8015A260 21082200 */  addu       $at, $at, $v0
    /* 2066C 8015A264 DCB3238C */  lw         $v1, %lo(card_status)($at)
    /* 20670 8015A268 02000224 */  addiu      $v0, $zero, 0x2
    /* 20674 8015A26C 14006210 */  beq        $v1, $v0, .L8015A2C0
    /* 20678 8015A270 00000000 */   nop
    /* 2067C 8015A274 1280023C */  lui        $v0, %hi(CharacterBlockLoaded)
    /* 20680 8015A278 40B2428C */  lw         $v0, %lo(CharacterBlockLoaded)($v0)
    /* 20684 8015A27C 00000000 */  nop
    /* 20688 8015A280 0F004010 */  beqz       $v0, .L8015A2C0
    /* 2068C 8015A284 00000000 */   nop
    /* 20690 8015A288 1280023C */  lui        $v0, %hi(fileselect)
    /* 20694 8015A28C A4B3428C */  lw         $v0, %lo(fileselect)($v0)
    /* 20698 8015A290 00000000 */  nop
    /* 2069C 8015A294 80180200 */  sll        $v1, $v0, 2
    /* 206A0 8015A298 21186200 */  addu       $v1, $v1, $v0
    /* 206A4 8015A29C 40190300 */  sll        $v1, $v1, 5
    /* 206A8 8015A2A0 23186200 */  subu       $v1, $v1, $v0
    /* 206AC 8015A2A4 C0180300 */  sll        $v1, $v1, 3
    /* 206B0 8015A2A8 1580013C */  lui        $at, %hi(CharDataStruct + 0x478)
    /* 206B4 8015A2AC 21082300 */  addu       $at, $at, $v1
    /* 206B8 8015A2B0 687B2280 */  lb         $v0, %lo(CharDataStruct + 0x478)($at)
    /* 206BC 8015A2B4 00000000 */  nop
    /* 206C0 8015A2B8 05004014 */  bnez       $v0, .L8015A2D0
    /* 206C4 8015A2BC 00000000 */   nop
  .L8015A2C0:
    /* 206C8 8015A2C0 C6F5000C */  jal        PlaySFX__Fi
    /* 206CC 8015A2C4 D3030424 */   addiu     $a0, $zero, 0x3D3
    /* 206D0 8015A2C8 E7680508 */  j          .L8015A39C
    /* 206D4 8015A2CC 00000000 */   nop
  .L8015A2D0:
    /* 206D8 8015A2D0 C6F5000C */  jal        PlaySFX__Fi
    /* 206DC 8015A2D4 33000424 */   addiu     $a0, $zero, 0x33
    /* 206E0 8015A2D8 980C848F */  lw         $a0, %gp_rel(DiabloCharacterFile)($gp)
    /* 206E4 8015A2DC 7269050C */  jal        GetLoadStatusMessage__FPc
    /* 206E8 8015A2E0 00000000 */   nop
    /* 206EC 8015A2E4 24004010 */  beqz       $v0, .L8015A378
    /* 206F0 8015A2E8 00000000 */   nop
    /* 206F4 8015A2EC 1280043C */  lui        $a0, %hi(fileselect)
    /* 206F8 8015A2F0 A4B3848C */  lw         $a0, %lo(fileselect)($a0)
    /* 206FC 8015A2F4 2566050C */  jal        DoFrontEndLoadCharacter__Fi
    /* 20700 8015A2F8 00000000 */   nop
    /* 20704 8015A2FC 04004010 */  beqz       $v0, .L8015A310
    /* 20708 8015A300 5D020224 */   addiu     $v0, $zero, 0x25D
    /* 2070C 8015A304 D80C82AF */  sw         $v0, %gp_rel(AlertTxt)($gp)
    /* 20710 8015A308 DE680508 */  j          .L8015A378
    /* 20714 8015A30C 00000000 */   nop
  .L8015A310:
    /* 20718 8015A310 1280053C */  lui        $a1, %hi(FePlayerNo)
    /* 2071C 8015A314 78B3A58C */  lw         $a1, %lo(FePlayerNo)($a1)
    /* 20720 8015A318 1280063C */  lui        $a2, %hi(FeNoOfPlayers)
    /* 20724 8015A31C 84B3C68C */  lw         $a2, %lo(FeNoOfPlayers)($a2)
    /* 20728 8015A320 01000324 */  addiu      $v1, $zero, 0x1
    /* 2072C 8015A324 1280013C */  lui        $at, %hi(DoLoadedChar)
    /* 20730 8015A328 ECB923AC */  sw         $v1, %lo(DoLoadedChar)($at)
    /* 20734 8015A32C 80100500 */  sll        $v0, $a1, 2
    /* 20738 8015A330 1280013C */  lui        $at, %hi(LoadedChar)
    /* 2073C 8015A334 21082200 */  addu       $at, $at, $v0
    /* 20740 8015A338 28B323AC */  sw         $v1, %lo(LoadedChar)($at)
    /* 20744 8015A33C 0A00C018 */  blez       $a2, .L8015A368
    /* 20748 8015A340 0100A224 */   addiu     $v0, $a1, 0x1
    /* 2074C 8015A344 0D80043C */  lui        $a0, %hi(FeNewP2ClassMenu)
    /* 20750 8015A348 0CD78424 */  addiu      $a0, $a0, %lo(FeNewP2ClassMenu)
    /* 20754 8015A34C 1280013C */  lui        $at, %hi(FePlayerNo)
    /* 20758 8015A350 78B322AC */  sw         $v0, %lo(FePlayerNo)($at)
    /* 2075C 8015A354 FFFFC224 */  addiu      $v0, $a2, -0x1
    /* 20760 8015A358 1280013C */  lui        $at, %hi(FeNoOfPlayers)
    /* 20764 8015A35C 84B322AC */  sw         $v0, %lo(FeNoOfPlayers)($at)
    /* 20768 8015A360 DC680508 */  j          .L8015A370
    /* 2076C 8015A364 00000000 */   nop
  .L8015A368:
    /* 20770 8015A368 0D80043C */  lui        $a0, %hi(FeDifficultyMenu)
    /* 20774 8015A36C 44D78424 */  addiu      $a0, $a0, %lo(FeDifficultyMenu)
  .L8015A370:
    /* 20778 8015A370 29E9040C */  jal        FeNewMenu__FP7FeTable
    /* 2077C 8015A374 00000000 */   nop
  .L8015A378:
    /* 20780 8015A378 106E050C */  jal        GetDown__C4CPad_8015b840
    /* 20784 8015A37C 21204002 */   addu      $a0, $s2, $zero
    /* 20788 8015A380 00014230 */  andi       $v0, $v0, 0x100
    /* 2078C 8015A384 05004010 */  beqz       $v0, .L8015A39C
    /* 20790 8015A388 00000000 */   nop
    /* 20794 8015A38C 1280013C */  lui        $at, %hi(CharacterBlockLoaded)
    /* 20798 8015A390 40B220AC */  sw         $zero, %lo(CharacterBlockLoaded)($at)
  .L8015A394:
    /* 2079C 8015A394 49E9040C */  jal        FePrevMenu__Fv
    /* 207A0 8015A398 00000000 */   nop
  .L8015A39C:
    /* 207A4 8015A39C 4000BF8F */  lw         $ra, 0x40($sp)
    /* 207A8 8015A3A0 3C00B38F */  lw         $s3, 0x3C($sp)
    /* 207AC 8015A3A4 3800B28F */  lw         $s2, 0x38($sp)
    /* 207B0 8015A3A8 3400B18F */  lw         $s1, 0x34($sp)
    /* 207B4 8015A3AC 3000B08F */  lw         $s0, 0x30($sp)
    /* 207B8 8015A3B0 4800BD27 */  addiu      $sp, $sp, 0x48
    /* 207BC 8015A3B4 0800E003 */  jr         $ra
    /* 207C0 8015A3B8 00000000 */   nop
endlabel McMainCharKeyCtrl__Fv
