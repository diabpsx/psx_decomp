.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching OperateL3RDoor__FiiUc, 0x2DC

glabel OperateL3RDoor__FiiUc
    /* 46A94 80056A94 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 46A98 80056A98 2000B4AF */  sw         $s4, 0x20($sp)
    /* 46A9C 80056A9C 21A08000 */  addu       $s4, $a0, $zero
    /* 46AA0 80056AA0 1400B1AF */  sw         $s1, 0x14($sp)
    /* 46AA4 80056AA4 2188A000 */  addu       $s1, $a1, $zero
    /* 46AA8 80056AA8 2400B5AF */  sw         $s5, 0x24($sp)
    /* 46AAC 80056AAC 40101100 */  sll        $v0, $s1, 1
    /* 46AB0 80056AB0 21105100 */  addu       $v0, $v0, $s1
    /* 46AB4 80056AB4 80100200 */  sll        $v0, $v0, 2
    /* 46AB8 80056AB8 23105100 */  subu       $v0, $v0, $s1
    /* 46ABC 80056ABC 80180200 */  sll        $v1, $v0, 2
    /* 46AC0 80056AC0 2800BFAF */  sw         $ra, 0x28($sp)
    /* 46AC4 80056AC4 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 46AC8 80056AC8 1800B2AF */  sw         $s2, 0x18($sp)
    /* 46ACC 80056ACC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 46AD0 80056AD0 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 46AD4 80056AD4 21082300 */  addu       $at, $at, $v1
    /* 46AD8 80056AD8 608C2484 */  lh         $a0, %lo(object + 0x14)($at)
    /* 46ADC 80056ADC 02000224 */  addiu      $v0, $zero, 0x2
    /* 46AE0 80056AE0 10008214 */  bne        $a0, $v0, .L80056B24
    /* 46AE4 80056AE4 21A8C000 */   addu      $s5, $a2, $zero
    /* 46AE8 80056AE8 1280023C */  lui        $v0, %hi(deltaload)
    /* 46AEC 80056AEC 7DB94290 */  lbu        $v0, %lo(deltaload)($v0)
    /* 46AF0 80056AF0 00000000 */  nop
    /* 46AF4 80056AF4 94004014 */  bnez       $v0, .L80056D48
    /* 46AF8 80056AF8 00000000 */   nop
    /* 46AFC 80056AFC 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 46B00 80056B00 21082300 */  addu       $at, $at, $v1
    /* 46B04 80056B04 6B8C2580 */  lb         $a1, %lo(object + 0x1F)($at)
    /* 46B08 80056B08 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 46B0C 80056B0C 21082300 */  addu       $at, $at, $v1
    /* 46B10 80056B10 6C8C2680 */  lb         $a2, %lo(object + 0x20)($at)
    /* 46B14 80056B14 E1F5000C */  jal        PlaySfxLoc__Fiii
    /* 46B18 80056B18 13000424 */   addiu     $a0, $zero, 0x13
    /* 46B1C 80056B1C 525B0108 */  j          .L80056D48
    /* 46B20 80056B20 00000000 */   nop
  .L80056B24:
    /* 46B24 80056B24 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 46B28 80056B28 21082300 */  addu       $at, $at, $v1
    /* 46B2C 80056B2C 6B8C3280 */  lb         $s2, %lo(object + 0x1F)($at)
    /* 46B30 80056B30 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 46B34 80056B34 21082300 */  addu       $at, $at, $v1
    /* 46B38 80056B38 6C8C3380 */  lb         $s3, %lo(object + 0x20)($at)
    /* 46B3C 80056B3C 36008014 */  bnez       $a0, .L80056C18
    /* 46B40 80056B40 00000000 */   nop
    /* 46B44 80056B44 1280023C */  lui        $v0, %hi(myplr)
    /* 46B48 80056B48 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 46B4C 80056B4C 00000000 */  nop
    /* 46B50 80056B50 06008216 */  bne        $s4, $v0, .L80056B6C
    /* 46B54 80056B54 FF00A232 */   andi      $v0, $s5, 0xFF
    /* 46B58 80056B58 04004010 */  beqz       $v0, .L80056B6C
    /* 46B5C 80056B5C 01000424 */   addiu     $a0, $zero, 0x1
    /* 46B60 80056B60 2B000524 */  addiu      $a1, $zero, 0x2B
    /* 46B64 80056B64 0D3E010C */  jal        NetSendCmdParam1__FUcUcUs
    /* 46B68 80056B68 FFFF2632 */   andi      $a2, $s1, 0xFFFF
  .L80056B6C:
    /* 46B6C 80056B6C 1280023C */  lui        $v0, %hi(deltaload)
    /* 46B70 80056B70 7DB94290 */  lbu        $v0, %lo(deltaload)($v0)
    /* 46B74 80056B74 00000000 */  nop
    /* 46B78 80056B78 0F004014 */  bnez       $v0, .L80056BB8
    /* 46B7C 80056B7C 21204002 */   addu      $a0, $s2, $zero
    /* 46B80 80056B80 40101100 */  sll        $v0, $s1, 1
    /* 46B84 80056B84 21105100 */  addu       $v0, $v0, $s1
    /* 46B88 80056B88 80100200 */  sll        $v0, $v0, 2
    /* 46B8C 80056B8C 23105100 */  subu       $v0, $v0, $s1
    /* 46B90 80056B90 80100200 */  sll        $v0, $v0, 2
    /* 46B94 80056B94 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 46B98 80056B98 21082200 */  addu       $at, $at, $v0
    /* 46B9C 80056B9C 6B8C2580 */  lb         $a1, %lo(object + 0x1F)($at)
    /* 46BA0 80056BA0 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 46BA4 80056BA4 21082200 */  addu       $at, $at, $v0
    /* 46BA8 80056BA8 6C8C2680 */  lb         $a2, %lo(object + 0x20)($at)
    /* 46BAC 80056BAC E1F5000C */  jal        PlaySfxLoc__Fiii
    /* 46BB0 80056BB0 14000424 */   addiu     $a0, $zero, 0x14
    /* 46BB4 80056BB4 21204002 */  addu       $a0, $s2, $zero
  .L80056BB8:
    /* 46BB8 80056BB8 21286002 */  addu       $a1, $s3, $zero
    /* 46BBC 80056BBC D555010C */  jal        ObjSetMicro__Fiii
    /* 46BC0 80056BC0 1D020624 */   addiu     $a2, $zero, 0x21D
    /* 46BC4 80056BC4 40101100 */  sll        $v0, $s1, 1
    /* 46BC8 80056BC8 21105100 */  addu       $v0, $v0, $s1
    /* 46BCC 80056BCC 80100200 */  sll        $v0, $v0, 2
    /* 46BD0 80056BD0 23105100 */  subu       $v0, $v0, $s1
    /* 46BD4 80056BD4 80100200 */  sll        $v0, $v0, 2
    /* 46BD8 80056BD8 01000324 */  addiu      $v1, $zero, 0x1
    /* 46BDC 80056BDC 0E80013C */  lui        $at, %hi(object + 0x29)
    /* 46BE0 80056BE0 21082200 */  addu       $at, $at, $v0
    /* 46BE4 80056BE4 758C23A0 */  sb         $v1, %lo(object + 0x29)($at)
    /* 46BE8 80056BE8 01000324 */  addiu      $v1, $zero, 0x1
    /* 46BEC 80056BEC 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 46BF0 80056BF0 21082200 */  addu       $at, $at, $v0
    /* 46BF4 80056BF4 608C23A4 */  sh         $v1, %lo(object + 0x14)($at)
    /* 46BF8 80056BF8 02000324 */  addiu      $v1, $zero, 0x2
    /* 46BFC 80056BFC 0E80013C */  lui        $at, %hi(object + 0x23)
    /* 46C00 80056C00 21082200 */  addu       $at, $at, $v0
    /* 46C04 80056C04 6F8C23A0 */  sb         $v1, %lo(object + 0x23)($at)
    /* 46C08 80056C08 0857010C */  jal        RedoPlayerVision__Fv
    /* 46C0C 80056C0C 00000000 */   nop
    /* 46C10 80056C10 525B0108 */  j          .L80056D48
    /* 46C14 80056C14 00000000 */   nop
  .L80056C18:
    /* 46C18 80056C18 1280023C */  lui        $v0, %hi(deltaload)
    /* 46C1C 80056C1C 7DB94290 */  lbu        $v0, %lo(deltaload)($v0)
    /* 46C20 80056C20 00000000 */  nop
    /* 46C24 80056C24 06004014 */  bnez       $v0, .L80056C40
    /* 46C28 80056C28 C0181300 */   sll       $v1, $s3, 3
    /* 46C2C 80056C2C 13000424 */  addiu      $a0, $zero, 0x13
    /* 46C30 80056C30 21284002 */  addu       $a1, $s2, $zero
    /* 46C34 80056C34 E1F5000C */  jal        PlaySfxLoc__Fiii
    /* 46C38 80056C38 21306002 */   addu      $a2, $s3, $zero
    /* 46C3C 80056C3C C0181300 */  sll        $v1, $s3, 3
  .L80056C40:
    /* 46C40 80056C40 C0101200 */  sll        $v0, $s2, 3
    /* 46C44 80056C44 23105200 */  subu       $v0, $v0, $s2
    /* 46C48 80056C48 C0110200 */  sll        $v0, $v0, 7
    /* 46C4C 80056C4C 21186200 */  addu       $v1, $v1, $v0
    /* 46C50 80056C50 0E80013C */  lui        $at, %hi(dung_map)
    /* 46C54 80056C54 21082300 */  addu       $at, $at, $v1
    /* 46C58 80056C58 287A2284 */  lh         $v0, %lo(dung_map)($at)
    /* 46C5C 80056C5C 0E80013C */  lui        $at, %hi(dung_map + 0x4)
    /* 46C60 80056C60 21082300 */  addu       $at, $at, $v1
    /* 46C64 80056C64 2C7A2380 */  lb         $v1, %lo(dung_map + 0x4)($at)
    /* 46C68 80056C68 0100422C */  sltiu      $v0, $v0, 0x1
    /* 46C6C 80056C6C 02006014 */  bnez       $v1, .L80056C78
    /* 46C70 80056C70 21800000 */   addu      $s0, $zero, $zero
    /* 46C74 80056C74 21804000 */  addu       $s0, $v0, $zero
  .L80056C78:
    /* 46C78 80056C78 21204002 */  addu       $a0, $s2, $zero
    /* 46C7C 80056C7C E80A020C */  jal        GetdDead__Fii
    /* 46C80 80056C80 21286002 */   addu      $a1, $s3, $zero
    /* 46C84 80056C84 FF004230 */  andi       $v0, $v0, 0xFF
    /* 46C88 80056C88 03004010 */  beqz       $v0, .L80056C98
    /* 46C8C 80056C8C FF000232 */   andi      $v0, $s0, 0xFF
    /* 46C90 80056C90 21800000 */  addu       $s0, $zero, $zero
    /* 46C94 80056C94 FF000232 */  andi       $v0, $s0, 0xFF
  .L80056C98:
    /* 46C98 80056C98 23004010 */  beqz       $v0, .L80056D28
    /* 46C9C 80056C9C 40101100 */   sll       $v0, $s1, 1
    /* 46CA0 80056CA0 1280023C */  lui        $v0, %hi(myplr)
    /* 46CA4 80056CA4 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 46CA8 80056CA8 00000000 */  nop
    /* 46CAC 80056CAC 08008216 */  bne        $s4, $v0, .L80056CD0
    /* 46CB0 80056CB0 21204002 */   addu      $a0, $s2, $zero
    /* 46CB4 80056CB4 FF00A232 */  andi       $v0, $s5, 0xFF
    /* 46CB8 80056CB8 04004010 */  beqz       $v0, .L80056CCC
    /* 46CBC 80056CBC 01000424 */   addiu     $a0, $zero, 0x1
    /* 46CC0 80056CC0 2C000524 */  addiu      $a1, $zero, 0x2C
    /* 46CC4 80056CC4 0D3E010C */  jal        NetSendCmdParam1__FUcUcUs
    /* 46CC8 80056CC8 FFFF2632 */   andi      $a2, $s1, 0xFFFF
  .L80056CCC:
    /* 46CCC 80056CCC 21204002 */  addu       $a0, $s2, $zero
  .L80056CD0:
    /* 46CD0 80056CD0 21286002 */  addu       $a1, $s3, $zero
    /* 46CD4 80056CD4 40801100 */  sll        $s0, $s1, 1
    /* 46CD8 80056CD8 21801102 */  addu       $s0, $s0, $s1
    /* 46CDC 80056CDC 80801000 */  sll        $s0, $s0, 2
    /* 46CE0 80056CE0 23801102 */  subu       $s0, $s0, $s1
    /* 46CE4 80056CE4 80801000 */  sll        $s0, $s0, 2
    /* 46CE8 80056CE8 03000224 */  addiu      $v0, $zero, 0x3
    /* 46CEC 80056CEC 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 46CF0 80056CF0 21083000 */  addu       $at, $at, $s0
    /* 46CF4 80056CF4 608C20A4 */  sh         $zero, %lo(object + 0x14)($at)
    /* 46CF8 80056CF8 0E80013C */  lui        $at, %hi(object + 0x23)
    /* 46CFC 80056CFC 21083000 */  addu       $at, $at, $s0
    /* 46D00 80056D00 6F8C22A0 */  sb         $v0, %lo(object + 0x23)($at)
    /* 46D04 80056D04 D555010C */  jal        ObjSetMicro__Fiii
    /* 46D08 80056D08 16020624 */   addiu     $a2, $zero, 0x216
    /* 46D0C 80056D0C 0E80013C */  lui        $at, %hi(object + 0x29)
    /* 46D10 80056D10 21083000 */  addu       $at, $at, $s0
    /* 46D14 80056D14 758C20A0 */  sb         $zero, %lo(object + 0x29)($at)
    /* 46D18 80056D18 0857010C */  jal        RedoPlayerVision__Fv
    /* 46D1C 80056D1C 00000000 */   nop
    /* 46D20 80056D20 525B0108 */  j          .L80056D48
    /* 46D24 80056D24 00000000 */   nop
  .L80056D28:
    /* 46D28 80056D28 21105100 */  addu       $v0, $v0, $s1
    /* 46D2C 80056D2C 80100200 */  sll        $v0, $v0, 2
    /* 46D30 80056D30 23105100 */  subu       $v0, $v0, $s1
    /* 46D34 80056D34 80100200 */  sll        $v0, $v0, 2
    /* 46D38 80056D38 02000324 */  addiu      $v1, $zero, 0x2
    /* 46D3C 80056D3C 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 46D40 80056D40 21082200 */  addu       $at, $at, $v0
    /* 46D44 80056D44 608C23A4 */  sh         $v1, %lo(object + 0x14)($at)
  .L80056D48:
    /* 46D48 80056D48 2800BF8F */  lw         $ra, 0x28($sp)
    /* 46D4C 80056D4C 2400B58F */  lw         $s5, 0x24($sp)
    /* 46D50 80056D50 2000B48F */  lw         $s4, 0x20($sp)
    /* 46D54 80056D54 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 46D58 80056D58 1800B28F */  lw         $s2, 0x18($sp)
    /* 46D5C 80056D5C 1400B18F */  lw         $s1, 0x14($sp)
    /* 46D60 80056D60 1000B08F */  lw         $s0, 0x10($sp)
    /* 46D64 80056D64 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 46D68 80056D68 0800E003 */  jr         $ra
    /* 46D6C 80056D6C 00000000 */   nop
endlabel OperateL3RDoor__FiiUc
