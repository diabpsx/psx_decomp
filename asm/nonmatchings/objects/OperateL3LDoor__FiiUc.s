.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching OperateL3LDoor__FiiUc, 0x2DC

glabel OperateL3LDoor__FiiUc
    /* 46D70 80056D70 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 46D74 80056D74 2000B4AF */  sw         $s4, 0x20($sp)
    /* 46D78 80056D78 21A08000 */  addu       $s4, $a0, $zero
    /* 46D7C 80056D7C 1400B1AF */  sw         $s1, 0x14($sp)
    /* 46D80 80056D80 2188A000 */  addu       $s1, $a1, $zero
    /* 46D84 80056D84 2400B5AF */  sw         $s5, 0x24($sp)
    /* 46D88 80056D88 40101100 */  sll        $v0, $s1, 1
    /* 46D8C 80056D8C 21105100 */  addu       $v0, $v0, $s1
    /* 46D90 80056D90 80100200 */  sll        $v0, $v0, 2
    /* 46D94 80056D94 23105100 */  subu       $v0, $v0, $s1
    /* 46D98 80056D98 80180200 */  sll        $v1, $v0, 2
    /* 46D9C 80056D9C 2800BFAF */  sw         $ra, 0x28($sp)
    /* 46DA0 80056DA0 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 46DA4 80056DA4 1800B2AF */  sw         $s2, 0x18($sp)
    /* 46DA8 80056DA8 1000B0AF */  sw         $s0, 0x10($sp)
    /* 46DAC 80056DAC 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 46DB0 80056DB0 21082300 */  addu       $at, $at, $v1
    /* 46DB4 80056DB4 608C2484 */  lh         $a0, %lo(object + 0x14)($at)
    /* 46DB8 80056DB8 02000224 */  addiu      $v0, $zero, 0x2
    /* 46DBC 80056DBC 10008214 */  bne        $a0, $v0, .L80056E00
    /* 46DC0 80056DC0 21A8C000 */   addu      $s5, $a2, $zero
    /* 46DC4 80056DC4 1280023C */  lui        $v0, %hi(deltaload)
    /* 46DC8 80056DC8 7DB94290 */  lbu        $v0, %lo(deltaload)($v0)
    /* 46DCC 80056DCC 00000000 */  nop
    /* 46DD0 80056DD0 94004014 */  bnez       $v0, .L80057024
    /* 46DD4 80056DD4 00000000 */   nop
    /* 46DD8 80056DD8 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 46DDC 80056DDC 21082300 */  addu       $at, $at, $v1
    /* 46DE0 80056DE0 6B8C2580 */  lb         $a1, %lo(object + 0x1F)($at)
    /* 46DE4 80056DE4 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 46DE8 80056DE8 21082300 */  addu       $at, $at, $v1
    /* 46DEC 80056DEC 6C8C2680 */  lb         $a2, %lo(object + 0x20)($at)
    /* 46DF0 80056DF0 E1F5000C */  jal        PlaySfxLoc__Fiii
    /* 46DF4 80056DF4 13000424 */   addiu     $a0, $zero, 0x13
    /* 46DF8 80056DF8 095C0108 */  j          .L80057024
    /* 46DFC 80056DFC 00000000 */   nop
  .L80056E00:
    /* 46E00 80056E00 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 46E04 80056E04 21082300 */  addu       $at, $at, $v1
    /* 46E08 80056E08 6B8C3280 */  lb         $s2, %lo(object + 0x1F)($at)
    /* 46E0C 80056E0C 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 46E10 80056E10 21082300 */  addu       $at, $at, $v1
    /* 46E14 80056E14 6C8C3380 */  lb         $s3, %lo(object + 0x20)($at)
    /* 46E18 80056E18 36008014 */  bnez       $a0, .L80056EF4
    /* 46E1C 80056E1C 00000000 */   nop
    /* 46E20 80056E20 1280023C */  lui        $v0, %hi(myplr)
    /* 46E24 80056E24 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 46E28 80056E28 00000000 */  nop
    /* 46E2C 80056E2C 06008216 */  bne        $s4, $v0, .L80056E48
    /* 46E30 80056E30 FF00A232 */   andi      $v0, $s5, 0xFF
    /* 46E34 80056E34 04004010 */  beqz       $v0, .L80056E48
    /* 46E38 80056E38 01000424 */   addiu     $a0, $zero, 0x1
    /* 46E3C 80056E3C 2B000524 */  addiu      $a1, $zero, 0x2B
    /* 46E40 80056E40 0D3E010C */  jal        NetSendCmdParam1__FUcUcUs
    /* 46E44 80056E44 FFFF2632 */   andi      $a2, $s1, 0xFFFF
  .L80056E48:
    /* 46E48 80056E48 1280023C */  lui        $v0, %hi(deltaload)
    /* 46E4C 80056E4C 7DB94290 */  lbu        $v0, %lo(deltaload)($v0)
    /* 46E50 80056E50 00000000 */  nop
    /* 46E54 80056E54 0F004014 */  bnez       $v0, .L80056E94
    /* 46E58 80056E58 21204002 */   addu      $a0, $s2, $zero
    /* 46E5C 80056E5C 40101100 */  sll        $v0, $s1, 1
    /* 46E60 80056E60 21105100 */  addu       $v0, $v0, $s1
    /* 46E64 80056E64 80100200 */  sll        $v0, $v0, 2
    /* 46E68 80056E68 23105100 */  subu       $v0, $v0, $s1
    /* 46E6C 80056E6C 80100200 */  sll        $v0, $v0, 2
    /* 46E70 80056E70 0E80013C */  lui        $at, %hi(object + 0x1F)
    /* 46E74 80056E74 21082200 */  addu       $at, $at, $v0
    /* 46E78 80056E78 6B8C2580 */  lb         $a1, %lo(object + 0x1F)($at)
    /* 46E7C 80056E7C 0E80013C */  lui        $at, %hi(object + 0x20)
    /* 46E80 80056E80 21082200 */  addu       $at, $at, $v0
    /* 46E84 80056E84 6C8C2680 */  lb         $a2, %lo(object + 0x20)($at)
    /* 46E88 80056E88 E1F5000C */  jal        PlaySfxLoc__Fiii
    /* 46E8C 80056E8C 14000424 */   addiu     $a0, $zero, 0x14
    /* 46E90 80056E90 21204002 */  addu       $a0, $s2, $zero
  .L80056E94:
    /* 46E94 80056E94 21286002 */  addu       $a1, $s3, $zero
    /* 46E98 80056E98 D555010C */  jal        ObjSetMicro__Fiii
    /* 46E9C 80056E9C 1A020624 */   addiu     $a2, $zero, 0x21A
    /* 46EA0 80056EA0 40101100 */  sll        $v0, $s1, 1
    /* 46EA4 80056EA4 21105100 */  addu       $v0, $v0, $s1
    /* 46EA8 80056EA8 80100200 */  sll        $v0, $v0, 2
    /* 46EAC 80056EAC 23105100 */  subu       $v0, $v0, $s1
    /* 46EB0 80056EB0 80100200 */  sll        $v0, $v0, 2
    /* 46EB4 80056EB4 01000324 */  addiu      $v1, $zero, 0x1
    /* 46EB8 80056EB8 0E80013C */  lui        $at, %hi(object + 0x29)
    /* 46EBC 80056EBC 21082200 */  addu       $at, $at, $v0
    /* 46EC0 80056EC0 758C23A0 */  sb         $v1, %lo(object + 0x29)($at)
    /* 46EC4 80056EC4 01000324 */  addiu      $v1, $zero, 0x1
    /* 46EC8 80056EC8 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 46ECC 80056ECC 21082200 */  addu       $at, $at, $v0
    /* 46ED0 80056ED0 608C23A4 */  sh         $v1, %lo(object + 0x14)($at)
    /* 46ED4 80056ED4 02000324 */  addiu      $v1, $zero, 0x2
    /* 46ED8 80056ED8 0E80013C */  lui        $at, %hi(object + 0x23)
    /* 46EDC 80056EDC 21082200 */  addu       $at, $at, $v0
    /* 46EE0 80056EE0 6F8C23A0 */  sb         $v1, %lo(object + 0x23)($at)
    /* 46EE4 80056EE4 0857010C */  jal        RedoPlayerVision__Fv
    /* 46EE8 80056EE8 00000000 */   nop
    /* 46EEC 80056EEC 095C0108 */  j          .L80057024
    /* 46EF0 80056EF0 00000000 */   nop
  .L80056EF4:
    /* 46EF4 80056EF4 1280023C */  lui        $v0, %hi(deltaload)
    /* 46EF8 80056EF8 7DB94290 */  lbu        $v0, %lo(deltaload)($v0)
    /* 46EFC 80056EFC 00000000 */  nop
    /* 46F00 80056F00 06004014 */  bnez       $v0, .L80056F1C
    /* 46F04 80056F04 C0181300 */   sll       $v1, $s3, 3
    /* 46F08 80056F08 13000424 */  addiu      $a0, $zero, 0x13
    /* 46F0C 80056F0C 21284002 */  addu       $a1, $s2, $zero
    /* 46F10 80056F10 E1F5000C */  jal        PlaySfxLoc__Fiii
    /* 46F14 80056F14 21306002 */   addu      $a2, $s3, $zero
    /* 46F18 80056F18 C0181300 */  sll        $v1, $s3, 3
  .L80056F1C:
    /* 46F1C 80056F1C C0101200 */  sll        $v0, $s2, 3
    /* 46F20 80056F20 23105200 */  subu       $v0, $v0, $s2
    /* 46F24 80056F24 C0110200 */  sll        $v0, $v0, 7
    /* 46F28 80056F28 21186200 */  addu       $v1, $v1, $v0
    /* 46F2C 80056F2C 0E80013C */  lui        $at, %hi(dung_map)
    /* 46F30 80056F30 21082300 */  addu       $at, $at, $v1
    /* 46F34 80056F34 287A2284 */  lh         $v0, %lo(dung_map)($at)
    /* 46F38 80056F38 0E80013C */  lui        $at, %hi(dung_map + 0x4)
    /* 46F3C 80056F3C 21082300 */  addu       $at, $at, $v1
    /* 46F40 80056F40 2C7A2380 */  lb         $v1, %lo(dung_map + 0x4)($at)
    /* 46F44 80056F44 0100422C */  sltiu      $v0, $v0, 0x1
    /* 46F48 80056F48 02006014 */  bnez       $v1, .L80056F54
    /* 46F4C 80056F4C 21800000 */   addu      $s0, $zero, $zero
    /* 46F50 80056F50 21804000 */  addu       $s0, $v0, $zero
  .L80056F54:
    /* 46F54 80056F54 21204002 */  addu       $a0, $s2, $zero
    /* 46F58 80056F58 E80A020C */  jal        GetdDead__Fii
    /* 46F5C 80056F5C 21286002 */   addu      $a1, $s3, $zero
    /* 46F60 80056F60 FF004230 */  andi       $v0, $v0, 0xFF
    /* 46F64 80056F64 03004010 */  beqz       $v0, .L80056F74
    /* 46F68 80056F68 FF000232 */   andi      $v0, $s0, 0xFF
    /* 46F6C 80056F6C 21800000 */  addu       $s0, $zero, $zero
    /* 46F70 80056F70 FF000232 */  andi       $v0, $s0, 0xFF
  .L80056F74:
    /* 46F74 80056F74 23004010 */  beqz       $v0, .L80057004
    /* 46F78 80056F78 40101100 */   sll       $v0, $s1, 1
    /* 46F7C 80056F7C 1280023C */  lui        $v0, %hi(myplr)
    /* 46F80 80056F80 08BA428C */  lw         $v0, %lo(myplr)($v0)
    /* 46F84 80056F84 00000000 */  nop
    /* 46F88 80056F88 08008216 */  bne        $s4, $v0, .L80056FAC
    /* 46F8C 80056F8C 21204002 */   addu      $a0, $s2, $zero
    /* 46F90 80056F90 FF00A232 */  andi       $v0, $s5, 0xFF
    /* 46F94 80056F94 04004010 */  beqz       $v0, .L80056FA8
    /* 46F98 80056F98 01000424 */   addiu     $a0, $zero, 0x1
    /* 46F9C 80056F9C 2C000524 */  addiu      $a1, $zero, 0x2C
    /* 46FA0 80056FA0 0D3E010C */  jal        NetSendCmdParam1__FUcUcUs
    /* 46FA4 80056FA4 FFFF2632 */   andi      $a2, $s1, 0xFFFF
  .L80056FA8:
    /* 46FA8 80056FA8 21204002 */  addu       $a0, $s2, $zero
  .L80056FAC:
    /* 46FAC 80056FAC 21286002 */  addu       $a1, $s3, $zero
    /* 46FB0 80056FB0 40801100 */  sll        $s0, $s1, 1
    /* 46FB4 80056FB4 21801102 */  addu       $s0, $s0, $s1
    /* 46FB8 80056FB8 80801000 */  sll        $s0, $s0, 2
    /* 46FBC 80056FBC 23801102 */  subu       $s0, $s0, $s1
    /* 46FC0 80056FC0 80801000 */  sll        $s0, $s0, 2
    /* 46FC4 80056FC4 03000224 */  addiu      $v0, $zero, 0x3
    /* 46FC8 80056FC8 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 46FCC 80056FCC 21083000 */  addu       $at, $at, $s0
    /* 46FD0 80056FD0 608C20A4 */  sh         $zero, %lo(object + 0x14)($at)
    /* 46FD4 80056FD4 0E80013C */  lui        $at, %hi(object + 0x23)
    /* 46FD8 80056FD8 21083000 */  addu       $at, $at, $s0
    /* 46FDC 80056FDC 6F8C22A0 */  sb         $v0, %lo(object + 0x23)($at)
    /* 46FE0 80056FE0 D555010C */  jal        ObjSetMicro__Fiii
    /* 46FE4 80056FE4 13020624 */   addiu     $a2, $zero, 0x213
    /* 46FE8 80056FE8 0E80013C */  lui        $at, %hi(object + 0x29)
    /* 46FEC 80056FEC 21083000 */  addu       $at, $at, $s0
    /* 46FF0 80056FF0 758C20A0 */  sb         $zero, %lo(object + 0x29)($at)
    /* 46FF4 80056FF4 0857010C */  jal        RedoPlayerVision__Fv
    /* 46FF8 80056FF8 00000000 */   nop
    /* 46FFC 80056FFC 095C0108 */  j          .L80057024
    /* 47000 80057000 00000000 */   nop
  .L80057004:
    /* 47004 80057004 21105100 */  addu       $v0, $v0, $s1
    /* 47008 80057008 80100200 */  sll        $v0, $v0, 2
    /* 4700C 8005700C 23105100 */  subu       $v0, $v0, $s1
    /* 47010 80057010 80100200 */  sll        $v0, $v0, 2
    /* 47014 80057014 02000324 */  addiu      $v1, $zero, 0x2
    /* 47018 80057018 0E80013C */  lui        $at, %hi(object + 0x14)
    /* 4701C 8005701C 21082200 */  addu       $at, $at, $v0
    /* 47020 80057020 608C23A4 */  sh         $v1, %lo(object + 0x14)($at)
  .L80057024:
    /* 47024 80057024 2800BF8F */  lw         $ra, 0x28($sp)
    /* 47028 80057028 2400B58F */  lw         $s5, 0x24($sp)
    /* 4702C 8005702C 2000B48F */  lw         $s4, 0x20($sp)
    /* 47030 80057030 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 47034 80057034 1800B28F */  lw         $s2, 0x18($sp)
    /* 47038 80057038 1400B18F */  lw         $s1, 0x14($sp)
    /* 4703C 8005703C 1000B08F */  lw         $s0, 0x10($sp)
    /* 47040 80057040 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 47044 80057044 0800E003 */  jr         $ra
    /* 47048 80057048 00000000 */   nop
endlabel OperateL3LDoor__FiiUc
