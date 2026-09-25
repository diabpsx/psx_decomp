.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching OperateSChambBk__Fii, 0x23C

glabel OperateSChambBk__Fii
    /* 48994 80058994 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 48998 80058998 1400B1AF */  sw         $s1, 0x14($sp)
    /* 4899C 8005899C 2188A000 */  addu       $s1, $a1, $zero
    /* 489A0 800589A0 40101100 */  sll        $v0, $s1, 1
    /* 489A4 800589A4 21105100 */  addu       $v0, $v0, $s1
    /* 489A8 800589A8 80100200 */  sll        $v0, $v0, 2
    /* 489AC 800589AC 23105100 */  subu       $v0, $v0, $s1
    /* 489B0 800589B0 80380200 */  sll        $a3, $v0, 2
    /* 489B4 800589B4 2000BFAF */  sw         $ra, 0x20($sp)
    /* 489B8 800589B8 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 489BC 800589BC 1800B2AF */  sw         $s2, 0x18($sp)
    /* 489C0 800589C0 1000B0AF */  sw         $s0, 0x10($sp)
    /* 489C4 800589C4 0E80013C */  lui        $at, %hi(object + 0x23)
    /* 489C8 800589C8 21082700 */  addu       $at, $at, $a3
    /* 489CC 800589CC 6F8C2280 */  lb         $v0, %lo(object + 0x23)($at)
    /* 489D0 800589D0 00000000 */  nop
    /* 489D4 800589D4 76004010 */  beqz       $v0, .L80058BB0
    /* 489D8 800589D8 21900000 */   addu      $s2, $zero, $zero
    /* 489DC 800589DC 1280023C */  lui        $v0, %hi(qtextflag)
    /* 489E0 800589E0 60B94290 */  lbu        $v0, %lo(qtextflag)($v0)
    /* 489E4 800589E4 00000000 */  nop
    /* 489E8 800589E8 71004014 */  bnez       $v0, .L80058BB0
    /* 489EC 800589EC 00000000 */   nop
    /* 489F0 800589F0 0E80013C */  lui        $at, %hi(object + 0x21)
    /* 489F4 800589F4 21082700 */  addu       $at, $at, $a3
    /* 489F8 800589F8 6D8C2380 */  lb         $v1, %lo(object + 0x21)($at)
    /* 489FC 800589FC 0E80013C */  lui        $at, %hi(object + 0x18)
    /* 48A00 80058A00 21082700 */  addu       $at, $at, $a3
    /* 48A04 80058A04 648C2284 */  lh         $v0, %lo(object + 0x18)($at)
    /* 48A08 80058A08 00000000 */  nop
    /* 48A0C 80058A0C 1E006210 */  beq        $v1, $v0, .L80058A88
    /* 48A10 80058A10 40101100 */   sll       $v0, $s1, 1
    /* 48A14 80058A14 0E80013C */  lui        $at, %hi(object + 0xE)
    /* 48A18 80058A18 21082700 */  addu       $at, $at, $a3
    /* 48A1C 80058A1C 5A8C2484 */  lh         $a0, %lo(object + 0xE)($at)
    /* 48A20 80058A20 0E80013C */  lui        $at, %hi(object + 0x10)
    /* 48A24 80058A24 21082700 */  addu       $at, $at, $a3
    /* 48A28 80058A28 5C8C2584 */  lh         $a1, %lo(object + 0x10)($at)
    /* 48A2C 80058A2C 0E80013C */  lui        $at, %hi(object + 0x12)
    /* 48A30 80058A30 21082700 */  addu       $at, $at, $a3
    /* 48A34 80058A34 5E8C2684 */  lh         $a2, %lo(object + 0x12)($at)
    /* 48A38 80058A38 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 48A3C 80058A3C 21082700 */  addu       $at, $at, $a3
    /* 48A40 80058A40 608C2784 */  lh         $a3, %lo(object + 0x14)($at)
    /* 48A44 80058A44 5E5E010C */  jal        ObjChangeMapResync__Fiiii
    /* 48A48 80058A48 21800000 */   addu      $s0, $zero, $zero
    /* 48A4C 80058A4C 4C12828F */  lw         $v0, %gp_rel(numobjects)($gp)
    /* 48A50 80058A50 00000000 */  nop
    /* 48A54 80058A54 2A104202 */  slt        $v0, $s2, $v0
    /* 48A58 80058A58 0B004010 */  beqz       $v0, .L80058A88
    /* 48A5C 80058A5C 40101100 */   sll       $v0, $s1, 1
  .L80058A60:
    /* 48A60 80058A60 0E80013C */  lui        $at, %hi(objectactive)
    /* 48A64 80058A64 21083000 */  addu       $at, $at, $s0
    /* 48A68 80058A68 20A22480 */  lb         $a0, %lo(objectactive)($at)
    /* 48A6C 80058A6C E27C010C */  jal        SyncObjectAnim__Fi
    /* 48A70 80058A70 01001026 */   addiu     $s0, $s0, 0x1
    /* 48A74 80058A74 4C12828F */  lw         $v0, %gp_rel(numobjects)($gp)
    /* 48A78 80058A78 00000000 */  nop
    /* 48A7C 80058A7C 2A100202 */  slt        $v0, $s0, $v0
    /* 48A80 80058A80 F7FF4014 */  bnez       $v0, .L80058A60
    /* 48A84 80058A84 40101100 */   sll       $v0, $s1, 1
  .L80058A88:
    /* 48A88 80058A88 21105100 */  addu       $v0, $v0, $s1
    /* 48A8C 80058A8C 80100200 */  sll        $v0, $v0, 2
    /* 48A90 80058A90 23105100 */  subu       $v0, $v0, $s1
    /* 48A94 80058A94 80800200 */  sll        $s0, $v0, 2
    /* 48A98 80058A98 0E80013C */  lui        $at, %hi(object + 0x18)
    /* 48A9C 80058A9C 21083000 */  addu       $at, $at, $s0
    /* 48AA0 80058AA0 648C2294 */  lhu        $v0, %lo(object + 0x18)($at)
    /* 48AA4 80058AA4 0E80033C */  lui        $v1, %hi(quests + 0x11A)
    /* 48AA8 80058AA8 5ADB6324 */  addiu      $v1, $v1, %lo(quests + 0x11A)
    /* 48AAC 80058AAC 0E80013C */  lui        $at, %hi(object + 0x21)
    /* 48AB0 80058AB0 21083000 */  addu       $at, $at, $s0
    /* 48AB4 80058AB4 6D8C22A0 */  sb         $v0, %lo(object + 0x21)($at)
    /* 48AB8 80058AB8 00006290 */  lbu        $v0, 0x0($v1)
    /* 48ABC 80058ABC 01001324 */  addiu      $s3, $zero, 0x1
    /* 48AC0 80058AC0 0B005314 */  bne        $v0, $s3, .L80058AF0
    /* 48AC4 80058AC4 02000224 */   addiu     $v0, $zero, 0x2
    /* 48AC8 80058AC8 000062A0 */  sb         $v0, 0x0($v1)
    /* 48ACC 80058ACC 1280033C */  lui        $v1, %hi(deltaload)
    /* 48AD0 80058AD0 7DB96390 */  lbu        $v1, %lo(deltaload)($v1)
    /* 48AD4 80058AD4 01000224 */  addiu      $v0, $zero, 0x1
    /* 48AD8 80058AD8 0E80013C */  lui        $at, %hi(quests + 0x129)
    /* 48ADC 80058ADC 69DB22A0 */  sb         $v0, %lo(quests + 0x129)($at)
    /* 48AE0 80058AE0 33006014 */  bnez       $v1, .L80058BB0
    /* 48AE4 80058AE4 01000424 */   addiu     $a0, $zero, 0x1
    /* 48AE8 80058AE8 323E010C */  jal        NetSendCmdQuest__FUcUc
    /* 48AEC 80058AEC 0E000524 */   addiu     $a1, $zero, 0xE
  .L80058AF0:
    /* 48AF0 80058AF0 1280023C */  lui        $v0, %hi(deltaload)
    /* 48AF4 80058AF4 7DB94290 */  lbu        $v0, %lo(deltaload)($v0)
    /* 48AF8 80058AF8 00000000 */  nop
    /* 48AFC 80058AFC 2C004014 */  bnez       $v0, .L80058BB0
    /* 48B00 80058B00 00000000 */   nop
    /* 48B04 80058B04 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 48B08 80058B08 21083000 */  addu       $at, $at, $s0
    /* 48B0C 80058B0C 6B8C2580 */  lb         $a1, %lo(object + 0x1F)($at)
    /* 48B10 80058B10 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 48B14 80058B14 21083000 */  addu       $at, $at, $s0
    /* 48B18 80058B18 6C8C2680 */  lb         $a2, %lo(object + 0x20)($at)
    /* 48B1C 80058B1C E1F5000C */  jal        PlaySfxLoc__Fiii
    /* 48B20 80058B20 26000424 */   addiu     $a0, $zero, 0x26
    /* 48B24 80058B24 1280033C */  lui        $v1, %hi(myplr)
    /* 48B28 80058B28 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 48B2C 80058B2C 00000000 */  nop
    /* 48B30 80058B30 40100300 */  sll        $v0, $v1, 1
    /* 48B34 80058B34 21104300 */  addu       $v0, $v0, $v1
    /* 48B38 80058B38 80100200 */  sll        $v0, $v0, 2
    /* 48B3C 80058B3C 21104300 */  addu       $v0, $v0, $v1
    /* 48B40 80058B40 00110200 */  sll        $v0, $v0, 4
    /* 48B44 80058B44 23104300 */  subu       $v0, $v0, $v1
    /* 48B48 80058B48 80100200 */  sll        $v0, $v0, 2
    /* 48B4C 80058B4C 21104300 */  addu       $v0, $v0, $v1
    /* 48B50 80058B50 C0100200 */  sll        $v0, $v0, 3
    /* 48B54 80058B54 0E80013C */  lui        $at, %hi(plr + 0xF6)
    /* 48B58 80058B58 21082200 */  addu       $at, $at, $v0
    /* 48B5C 80058B5C 2EA62380 */  lb         $v1, %lo(plr + 0xF6)($at)
    /* 48B60 80058B60 00000000 */  nop
    /* 48B64 80058B64 03006014 */  bnez       $v1, .L80058B74
    /* 48B68 80058B68 00000000 */   nop
    /* 48B6C 80058B6C E4620108 */  j          .L80058B90
    /* 48B70 80058B70 EB001224 */   addiu     $s2, $zero, 0xEB
  .L80058B74:
    /* 48B74 80058B74 03007314 */  bne        $v1, $s3, .L80058B84
    /* 48B78 80058B78 02000224 */   addiu     $v0, $zero, 0x2
    /* 48B7C 80058B7C E4620108 */  j          .L80058B90
    /* 48B80 80058B80 F3001224 */   addiu     $s2, $zero, 0xF3
  .L80058B84:
    /* 48B84 80058B84 02006214 */  bne        $v1, $v0, .L80058B90
    /* 48B88 80058B88 00000000 */   nop
    /* 48B8C 80058B8C EF001224 */  addiu      $s2, $zero, 0xEF
  .L80058B90:
    /* 48B90 80058B90 0E80013C */  lui        $at, %hi(quests + 0x126)
    /* 48B94 80058B94 66DB32A0 */  sb         $s2, %lo(quests + 0x126)($at)
    /* 48B98 80058B98 1E37010C */  jal        InitQTextMsg__Fi
    /* 48B9C 80058B9C 21204002 */   addu      $a0, $s2, $zero
    /* 48BA0 80058BA0 21200000 */  addu       $a0, $zero, $zero
    /* 48BA4 80058BA4 2D000524 */  addiu      $a1, $zero, 0x2D
    /* 48BA8 80058BA8 0D3E010C */  jal        NetSendCmdParam1__FUcUcUs
    /* 48BAC 80058BAC FFFF2632 */   andi      $a2, $s1, 0xFFFF
  .L80058BB0:
    /* 48BB0 80058BB0 2000BF8F */  lw         $ra, 0x20($sp)
    /* 48BB4 80058BB4 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 48BB8 80058BB8 1800B28F */  lw         $s2, 0x18($sp)
    /* 48BBC 80058BBC 1400B18F */  lw         $s1, 0x14($sp)
    /* 48BC0 80058BC0 1000B08F */  lw         $s0, 0x10($sp)
    /* 48BC4 80058BC4 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 48BC8 80058BC8 0800E003 */  jr         $ra
    /* 48BCC 80058BCC 00000000 */   nop
endlabel OperateSChambBk__Fii
