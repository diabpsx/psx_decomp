.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching OperateL1RDoor__FiiUc, 0x360

glabel OperateL1RDoor__FiiUc
    /* 45CC4 80055CC4 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 45CC8 80055CC8 1400B1AF */  sw         $s1, 0x14($sp)
    /* 45CCC 80055CCC 21888000 */  addu       $s1, $a0, $zero
    /* 45CD0 80055CD0 1800B2AF */  sw         $s2, 0x18($sp)
    /* 45CD4 80055CD4 2190A000 */  addu       $s2, $a1, $zero
    /* 45CD8 80055CD8 2400B5AF */  sw         $s5, 0x24($sp)
    /* 45CDC 80055CDC 40101200 */  sll        $v0, $s2, 1
    /* 45CE0 80055CE0 21105200 */  addu       $v0, $v0, $s2
    /* 45CE4 80055CE4 80100200 */  sll        $v0, $v0, 2
    /* 45CE8 80055CE8 23105200 */  subu       $v0, $v0, $s2
    /* 45CEC 80055CEC 80180200 */  sll        $v1, $v0, 2
    /* 45CF0 80055CF0 2800BFAF */  sw         $ra, 0x28($sp)
    /* 45CF4 80055CF4 2000B4AF */  sw         $s4, 0x20($sp)
    /* 45CF8 80055CF8 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 45CFC 80055CFC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 45D00 80055D00 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 45D04 80055D04 21082300 */  addu       $at, $at, $v1
    /* 45D08 80055D08 608C2484 */  lh         $a0, %lo(object + 0x14)($at)
    /* 45D0C 80055D0C 02000224 */  addiu      $v0, $zero, 0x2
    /* 45D10 80055D10 10008214 */  bne        $a0, $v0, .L80055D54
    /* 45D14 80055D14 21A8C000 */   addu      $s5, $a2, $zero
    /* 45D18 80055D18 1280023C */  lui        $v0, %hi(deltaload)
    /* 45D1C 80055D1C 7DB94290 */  lbu        $v0, %lo(deltaload)($v0)
    /* 45D20 80055D20 00000000 */  nop
    /* 45D24 80055D24 B5004014 */  bnez       $v0, .L80055FFC
    /* 45D28 80055D28 00000000 */   nop
    /* 45D2C 80055D2C 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 45D30 80055D30 21082300 */  addu       $at, $at, $v1
    /* 45D34 80055D34 6B8C2580 */  lb         $a1, %lo(object + 0x1F)($at)
    /* 45D38 80055D38 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 45D3C 80055D3C 21082300 */  addu       $at, $at, $v1
    /* 45D40 80055D40 6C8C2680 */  lb         $a2, %lo(object + 0x20)($at)
    /* 45D44 80055D44 E1F5000C */  jal        PlaySfxLoc__Fiii
    /* 45D48 80055D48 13000424 */   addiu     $a0, $zero, 0x13
    /* 45D4C 80055D4C FF570108 */  j          .L80055FFC
    /* 45D50 80055D50 00000000 */   nop
  .L80055D54:
    /* 45D54 80055D54 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 45D58 80055D58 21082300 */  addu       $at, $at, $v1
    /* 45D5C 80055D5C 6B8C3380 */  lb         $s3, %lo(object + 0x1F)($at)
    /* 45D60 80055D60 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 45D64 80055D64 21082300 */  addu       $at, $at, $v1
    /* 45D68 80055D68 6C8C3480 */  lb         $s4, %lo(object + 0x20)($at)
    /* 45D6C 80055D6C 3A008014 */  bnez       $a0, .L80055E58
    /* 45D70 80055D70 00000000 */   nop
    /* 45D74 80055D74 1280023C */  lui        $v0, %hi(myplr)
    /* 45D78 80055D78 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 45D7C 80055D7C 00000000 */  nop
    /* 45D80 80055D80 06002216 */  bne        $s1, $v0, .L80055D9C
    /* 45D84 80055D84 FF00A232 */   andi      $v0, $s5, 0xFF
    /* 45D88 80055D88 04004010 */  beqz       $v0, .L80055D9C
    /* 45D8C 80055D8C 01000424 */   addiu     $a0, $zero, 0x1
    /* 45D90 80055D90 2B000524 */  addiu      $a1, $zero, 0x2B
    /* 45D94 80055D94 0D3E010C */  jal        NetSendCmdParam1__FUcUcUs
    /* 45D98 80055D98 FFFF4632 */   andi      $a2, $s2, 0xFFFF
  .L80055D9C:
    /* 45D9C 80055D9C 1280023C */  lui        $v0, %hi(deltaload)
    /* 45DA0 80055DA0 7DB94290 */  lbu        $v0, %lo(deltaload)($v0)
    /* 45DA4 80055DA4 00000000 */  nop
    /* 45DA8 80055DA8 0F004014 */  bnez       $v0, .L80055DE8
    /* 45DAC 80055DAC 21206002 */   addu      $a0, $s3, $zero
    /* 45DB0 80055DB0 40101200 */  sll        $v0, $s2, 1
    /* 45DB4 80055DB4 21105200 */  addu       $v0, $v0, $s2
    /* 45DB8 80055DB8 80100200 */  sll        $v0, $v0, 2
    /* 45DBC 80055DBC 23105200 */  subu       $v0, $v0, $s2
    /* 45DC0 80055DC0 80100200 */  sll        $v0, $v0, 2
    /* 45DC4 80055DC4 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 45DC8 80055DC8 21082200 */  addu       $at, $at, $v0
    /* 45DCC 80055DCC 6B8C2580 */  lb         $a1, %lo(object + 0x1F)($at)
    /* 45DD0 80055DD0 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 45DD4 80055DD4 21082200 */  addu       $at, $at, $v0
    /* 45DD8 80055DD8 6C8C2680 */  lb         $a2, %lo(object + 0x20)($at)
    /* 45DDC 80055DDC E1F5000C */  jal        PlaySfxLoc__Fiii
    /* 45DE0 80055DE0 14000424 */   addiu     $a0, $zero, 0x14
    /* 45DE4 80055DE4 21206002 */  addu       $a0, $s3, $zero
  .L80055DE8:
    /* 45DE8 80055DE8 21288002 */  addu       $a1, $s4, $zero
    /* 45DEC 80055DEC D555010C */  jal        ObjSetMicro__Fiii
    /* 45DF0 80055DF0 8B010624 */   addiu     $a2, $zero, 0x18B
    /* 45DF4 80055DF4 21204002 */  addu       $a0, $s2, $zero
    /* 45DF8 80055DF8 FFFF6526 */  addiu      $a1, $s3, -0x1
    /* 45DFC 80055DFC 40800400 */  sll        $s0, $a0, 1
    /* 45E00 80055E00 21800402 */  addu       $s0, $s0, $a0
    /* 45E04 80055E04 80801000 */  sll        $s0, $s0, 2
    /* 45E08 80055E08 23800402 */  subu       $s0, $s0, $a0
    /* 45E0C 80055E0C 80801000 */  sll        $s0, $s0, 2
    /* 45E10 80055E10 01000224 */  addiu      $v0, $zero, 0x1
    /* 45E14 80055E14 0E80013C */  lui        $at, %hi(object + 0x29)
    /* 45E18 80055E18 21083000 */  addu       $at, $at, $s0
    /* 45E1C 80055E1C 758C22A0 */  sb         $v0, %lo(object + 0x29)($at)
    /* 45E20 80055E20 6F56010C */  jal        DoorSet__Fiii
    /* 45E24 80055E24 21308002 */   addu      $a2, $s4, $zero
    /* 45E28 80055E28 01000224 */  addiu      $v0, $zero, 0x1
    /* 45E2C 80055E2C 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 45E30 80055E30 21083000 */  addu       $at, $at, $s0
    /* 45E34 80055E34 608C22A4 */  sh         $v0, %lo(object + 0x14)($at)
    /* 45E38 80055E38 02000224 */  addiu      $v0, $zero, 0x2
    /* 45E3C 80055E3C 0E80013C */  lui        $at, %hi(object + 0x23)
    /* 45E40 80055E40 21083000 */  addu       $at, $at, $s0
    /* 45E44 80055E44 6F8C22A0 */  sb         $v0, %lo(object + 0x23)($at)
    /* 45E48 80055E48 0857010C */  jal        RedoPlayerVision__Fv
    /* 45E4C 80055E4C 00000000 */   nop
    /* 45E50 80055E50 FF570108 */  j          .L80055FFC
    /* 45E54 80055E54 00000000 */   nop
  .L80055E58:
    /* 45E58 80055E58 1280023C */  lui        $v0, %hi(deltaload)
    /* 45E5C 80055E5C 7DB94290 */  lbu        $v0, %lo(deltaload)($v0)
    /* 45E60 80055E60 00000000 */  nop
    /* 45E64 80055E64 06004014 */  bnez       $v0, .L80055E80
    /* 45E68 80055E68 C0181400 */   sll       $v1, $s4, 3
    /* 45E6C 80055E6C 13000424 */  addiu      $a0, $zero, 0x13
    /* 45E70 80055E70 21286002 */  addu       $a1, $s3, $zero
    /* 45E74 80055E74 E1F5000C */  jal        PlaySfxLoc__Fiii
    /* 45E78 80055E78 21308002 */   addu      $a2, $s4, $zero
    /* 45E7C 80055E7C C0181400 */  sll        $v1, $s4, 3
  .L80055E80:
    /* 45E80 80055E80 C0101300 */  sll        $v0, $s3, 3
    /* 45E84 80055E84 23105300 */  subu       $v0, $v0, $s3
    /* 45E88 80055E88 C0110200 */  sll        $v0, $v0, 7
    /* 45E8C 80055E8C 21186200 */  addu       $v1, $v1, $v0
    /* 45E90 80055E90 0E80013C */  lui        $at, %hi(dung_map)
    /* 45E94 80055E94 21082300 */  addu       $at, $at, $v1
    /* 45E98 80055E98 287A2284 */  lh         $v0, %lo(dung_map)($at)
    /* 45E9C 80055E9C 0E80013C */  lui        $at, %hi(dung_map + 0x4)
    /* 45EA0 80055EA0 21082300 */  addu       $at, $at, $v1
    /* 45EA4 80055EA4 2C7A2380 */  lb         $v1, %lo(dung_map + 0x4)($at)
    /* 45EA8 80055EA8 0100422C */  sltiu      $v0, $v0, 0x1
    /* 45EAC 80055EAC 02006014 */  bnez       $v1, .L80055EB8
    /* 45EB0 80055EB0 21800000 */   addu      $s0, $zero, $zero
    /* 45EB4 80055EB4 21804000 */  addu       $s0, $v0, $zero
  .L80055EB8:
    /* 45EB8 80055EB8 21206002 */  addu       $a0, $s3, $zero
    /* 45EBC 80055EBC E80A020C */  jal        GetdDead__Fii
    /* 45EC0 80055EC0 21288002 */   addu      $a1, $s4, $zero
    /* 45EC4 80055EC4 FF004230 */  andi       $v0, $v0, 0xFF
    /* 45EC8 80055EC8 03004010 */  beqz       $v0, .L80055ED8
    /* 45ECC 80055ECC FF000232 */   andi      $v0, $s0, 0xFF
    /* 45ED0 80055ED0 21800000 */  addu       $s0, $zero, $zero
    /* 45ED4 80055ED4 FF000232 */  andi       $v0, $s0, 0xFF
  .L80055ED8:
    /* 45ED8 80055ED8 40004010 */  beqz       $v0, .L80055FDC
    /* 45EDC 80055EDC 40101200 */   sll       $v0, $s2, 1
    /* 45EE0 80055EE0 1280023C */  lui        $v0, %hi(myplr)
    /* 45EE4 80055EE4 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 45EE8 80055EE8 00000000 */  nop
    /* 45EEC 80055EEC 08002216 */  bne        $s1, $v0, .L80055F10
    /* 45EF0 80055EF0 21206002 */   addu      $a0, $s3, $zero
    /* 45EF4 80055EF4 FF00A232 */  andi       $v0, $s5, 0xFF
    /* 45EF8 80055EF8 04004010 */  beqz       $v0, .L80055F0C
    /* 45EFC 80055EFC 01000424 */   addiu     $a0, $zero, 0x1
    /* 45F00 80055F00 2C000524 */  addiu      $a1, $zero, 0x2C
    /* 45F04 80055F04 0D3E010C */  jal        NetSendCmdParam1__FUcUcUs
    /* 45F08 80055F08 FFFF4632 */   andi      $a2, $s2, 0xFFFF
  .L80055F0C:
    /* 45F0C 80055F0C 21206002 */  addu       $a0, $s3, $zero
  .L80055F10:
    /* 45F10 80055F10 40101200 */  sll        $v0, $s2, 1
    /* 45F14 80055F14 21105200 */  addu       $v0, $v0, $s2
    /* 45F18 80055F18 80100200 */  sll        $v0, $v0, 2
    /* 45F1C 80055F1C 23105200 */  subu       $v0, $v0, $s2
    /* 45F20 80055F20 80880200 */  sll        $s1, $v0, 2
    /* 45F24 80055F24 0E80013C */  lui        $at, %hi(object + 0xE)
    /* 45F28 80055F28 21083100 */  addu       $at, $at, $s1
    /* 45F2C 80055F2C 5A8C2684 */  lh         $a2, %lo(object + 0xE)($at)
    /* 45F30 80055F30 03000224 */  addiu      $v0, $zero, 0x3
    /* 45F34 80055F34 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 45F38 80055F38 21083100 */  addu       $at, $at, $s1
    /* 45F3C 80055F3C 608C20A4 */  sh         $zero, %lo(object + 0x14)($at)
    /* 45F40 80055F40 0E80013C */  lui        $at, %hi(object + 0x23)
    /* 45F44 80055F44 21083100 */  addu       $at, $at, $s1
    /* 45F48 80055F48 6F8C22A0 */  sb         $v0, %lo(object + 0x23)($at)
    /* 45F4C 80055F4C D555010C */  jal        ObjSetMicro__Fiii
    /* 45F50 80055F50 21288002 */   addu      $a1, $s4, $zero
    /* 45F54 80055F54 0E80013C */  lui        $at, %hi(object + 0x10)
    /* 45F58 80055F58 21083100 */  addu       $at, $at, $s1
    /* 45F5C 80055F5C 5C8C2684 */  lh         $a2, %lo(object + 0x10)($at)
    /* 45F60 80055F60 32000224 */  addiu      $v0, $zero, 0x32
    /* 45F64 80055F64 0E00C214 */  bne        $a2, $v0, .L80055FA0
    /* 45F68 80055F68 FFFF6426 */   addiu     $a0, $s3, -0x1
    /* 45F6C 80055F6C FFFF7026 */  addiu      $s0, $s3, -0x1
    /* 45F70 80055F70 21200002 */  addu       $a0, $s0, $zero
    /* 45F74 80055F74 80D4010C */  jal        FindBlock__Fii
    /* 45F78 80055F78 21288002 */   addu      $a1, $s4, $zero
    /* 45F7C 80055F7C 8C010324 */  addiu      $v1, $zero, 0x18C
    /* 45F80 80055F80 04004314 */  bne        $v0, $v1, .L80055F94
    /* 45F84 80055F84 21200002 */   addu      $a0, $s0, $zero
    /* 45F88 80055F88 21288002 */  addu       $a1, $s4, $zero
    /* 45F8C 80055F8C E9570108 */  j          .L80055FA4
    /* 45F90 80055F90 9B010624 */   addiu     $a2, $zero, 0x19B
  .L80055F94:
    /* 45F94 80055F94 0E80013C */  lui        $at, %hi(object + 0x10)
    /* 45F98 80055F98 21083100 */  addu       $at, $at, $s1
    /* 45F9C 80055F9C 5C8C2684 */  lh         $a2, %lo(object + 0x10)($at)
  .L80055FA0:
    /* 45FA0 80055FA0 21288002 */  addu       $a1, $s4, $zero
  .L80055FA4:
    /* 45FA4 80055FA4 D555010C */  jal        ObjSetMicro__Fiii
    /* 45FA8 80055FA8 00000000 */   nop
    /* 45FAC 80055FAC 40101200 */  sll        $v0, $s2, 1
    /* 45FB0 80055FB0 21105200 */  addu       $v0, $v0, $s2
    /* 45FB4 80055FB4 80100200 */  sll        $v0, $v0, 2
    /* 45FB8 80055FB8 23105200 */  subu       $v0, $v0, $s2
    /* 45FBC 80055FBC 80100200 */  sll        $v0, $v0, 2
    /* 45FC0 80055FC0 0E80013C */  lui        $at, %hi(object + 0x29)
    /* 45FC4 80055FC4 21082200 */  addu       $at, $at, $v0
    /* 45FC8 80055FC8 758C20A0 */  sb         $zero, %lo(object + 0x29)($at)
    /* 45FCC 80055FCC 0857010C */  jal        RedoPlayerVision__Fv
    /* 45FD0 80055FD0 00000000 */   nop
    /* 45FD4 80055FD4 FF570108 */  j          .L80055FFC
    /* 45FD8 80055FD8 00000000 */   nop
  .L80055FDC:
    /* 45FDC 80055FDC 21105200 */  addu       $v0, $v0, $s2
    /* 45FE0 80055FE0 80100200 */  sll        $v0, $v0, 2
    /* 45FE4 80055FE4 23105200 */  subu       $v0, $v0, $s2
    /* 45FE8 80055FE8 80100200 */  sll        $v0, $v0, 2
    /* 45FEC 80055FEC 02000324 */  addiu      $v1, $zero, 0x2
    /* 45FF0 80055FF0 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 45FF4 80055FF4 21082200 */  addu       $at, $at, $v0
    /* 45FF8 80055FF8 608C23A4 */  sh         $v1, %lo(object + 0x14)($at)
  .L80055FFC:
    /* 45FFC 80055FFC 2800BF8F */  lw         $ra, 0x28($sp)
    /* 46000 80056000 2400B58F */  lw         $s5, 0x24($sp)
    /* 46004 80056004 2000B48F */  lw         $s4, 0x20($sp)
    /* 46008 80056008 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 4600C 8005600C 1800B28F */  lw         $s2, 0x18($sp)
    /* 46010 80056010 1400B18F */  lw         $s1, 0x14($sp)
    /* 46014 80056014 1000B08F */  lw         $s0, 0x10($sp)
    /* 46018 80056018 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 4601C 8005601C 0800E003 */  jr         $ra
    /* 46020 80056020 00000000 */   nop
endlabel OperateL1RDoor__FiiUc
