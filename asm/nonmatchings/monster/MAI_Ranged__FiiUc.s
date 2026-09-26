.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MAI_Ranged__FiiUc, 0x224

glabel MAI_Ranged__FiiUc
    /* 17E04 801519FC C0FFBD27 */  addiu      $sp, $sp, -0x40
    /* 17E08 80151A00 2400B3AF */  sw         $s3, 0x24($sp)
    /* 17E0C 80151A04 21988000 */  addu       $s3, $a0, $zero
    /* 17E10 80151A08 40101300 */  sll        $v0, $s3, 1
    /* 17E14 80151A0C 21105300 */  addu       $v0, $v0, $s3
    /* 17E18 80151A10 80100200 */  sll        $v0, $v0, 2
    /* 17E1C 80151A14 21105300 */  addu       $v0, $v0, $s3
    /* 17E20 80151A18 C0200200 */  sll        $a0, $v0, 3
    /* 17E24 80151A1C 1080023C */  lui        $v0, %hi(monster)
    /* 17E28 80151A20 94534224 */  addiu      $v0, $v0, %lo(monster)
    /* 17E2C 80151A24 1800B0AF */  sw         $s0, 0x18($sp)
    /* 17E30 80151A28 21808200 */  addu       $s0, $a0, $v0
    /* 17E34 80151A2C 3C00BFAF */  sw         $ra, 0x3C($sp)
    /* 17E38 80151A30 3800BEAF */  sw         $fp, 0x38($sp)
    /* 17E3C 80151A34 3400B7AF */  sw         $s7, 0x34($sp)
    /* 17E40 80151A38 3000B6AF */  sw         $s6, 0x30($sp)
    /* 17E44 80151A3C 2C00B5AF */  sw         $s5, 0x2C($sp)
    /* 17E48 80151A40 2800B4AF */  sw         $s4, 0x28($sp)
    /* 17E4C 80151A44 2000B2AF */  sw         $s2, 0x20($sp)
    /* 17E50 80151A48 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 17E54 80151A4C 33000282 */  lb         $v0, 0x33($s0)
    /* 17E58 80151A50 21F0A000 */  addu       $fp, $a1, $zero
    /* 17E5C 80151A54 65004014 */  bnez       $v0, .L80151BEC
    /* 17E60 80151A58 1000A6A3 */   sb        $a2, 0x10($sp)
    /* 17E64 80151A5C 4E000392 */  lbu        $v1, 0x4E($s0)
    /* 17E68 80151A60 FF000224 */  addiu      $v0, $zero, 0xFF
    /* 17E6C 80151A64 08006210 */  beq        $v1, $v0, .L80151A88
    /* 17E70 80151A68 00000000 */   nop
    /* 17E74 80151A6C 1080013C */  lui        $at, %hi(monster + 0x2C)
    /* 17E78 80151A70 21082400 */  addu       $at, $at, $a0
    /* 17E7C 80151A74 C0532294 */  lhu        $v0, %lo(monster + 0x2C)($at)
    /* 17E80 80151A78 00000000 */  nop
    /* 17E84 80151A7C 10004230 */  andi       $v0, $v0, 0x10
    /* 17E88 80151A80 4F004010 */  beqz       $v0, .L80151BC0
    /* 17E8C 80151A84 00000000 */   nop
  .L80151A88:
    /* 17E90 80151A88 21206002 */  addu       $a0, $s3, $zero
    /* 17E94 80151A8C 4A001692 */  lbu        $s6, 0x4A($s0)
    /* 17E98 80151A90 4B001792 */  lbu        $s7, 0x4B($s0)
    /* 17E9C 80151A94 34000282 */  lb         $v0, 0x34($s0)
    /* 17EA0 80151A98 35000382 */  lb         $v1, 0x35($s0)
    /* 17EA4 80151A9C 23885600 */  subu       $s1, $v0, $s6
    /* 17EA8 80151AA0 EB2A050C */  jal        M_GetDir__Fi
    /* 17EAC 80151AA4 23907700 */   subu      $s2, $v1, $s7
    /* 17EB0 80151AA8 4E000392 */  lbu        $v1, 0x4E($s0)
    /* 17EB4 80151AAC 00000000 */  nop
    /* 17EB8 80151AB0 FF00632C */  sltiu      $v1, $v1, 0xFF
    /* 17EBC 80151AB4 03006010 */  beqz       $v1, .L80151AC4
    /* 17EC0 80151AB8 21A04000 */   addu      $s4, $v0, $zero
    /* 17EC4 80151ABC 135C010C */  jal        MonstCheckDoors__Fi
    /* 17EC8 80151AC0 21206002 */   addu      $a0, $s3, $zero
  .L80151AC4:
    /* 17ECC 80151AC4 18000386 */  lh         $v1, 0x18($s0)
    /* 17ED0 80151AC8 0A000224 */  addiu      $v0, $zero, 0xA
    /* 17ED4 80151ACC 08006214 */  bne        $v1, $v0, .L80151AF0
    /* 17ED8 80151AD0 3C0014A2 */   sb        $s4, 0x3C($s0)
    /* 17EDC 80151AD4 C9F6000C */  jal        ENG_random__Fl
    /* 17EE0 80151AD8 14000424 */   addiu     $a0, $zero, 0x14
    /* 17EE4 80151ADC 21206002 */  addu       $a0, $s3, $zero
    /* 17EE8 80151AE0 042B050C */  jal        M_StartDelay__Fii
    /* 17EEC 80151AE4 21284000 */   addu      $a1, $v0, $zero
    /* 17EF0 80151AE8 D5460508 */  j          .L80151B54
    /* 17EF4 80151AEC 00000000 */   nop
  .L80151AF0:
    /* 17EF8 80151AF0 21A80000 */  addu       $s5, $zero, $zero
    /* 17EFC 80151AF4 6D41000C */  jal        abs
    /* 17F00 80151AF8 21202002 */   addu      $a0, $s1, $zero
    /* 17F04 80151AFC 04004228 */  slti       $v0, $v0, 0x4
    /* 17F08 80151B00 0F004010 */  beqz       $v0, .L80151B40
    /* 17F0C 80151B04 00000000 */   nop
    /* 17F10 80151B08 6D41000C */  jal        abs
    /* 17F14 80151B0C 21204002 */   addu      $a0, $s2, $zero
    /* 17F18 80151B10 04004228 */  slti       $v0, $v0, 0x4
    /* 17F1C 80151B14 0A004010 */  beqz       $v0, .L80151B40
    /* 17F20 80151B18 00000000 */   nop
    /* 17F24 80151B1C C9F6000C */  jal        ENG_random__Fl
    /* 17F28 80151B20 64000424 */   addiu     $a0, $zero, 0x64
    /* 17F2C 80151B24 4D000492 */  lbu        $a0, 0x4D($s0)
    /* 17F30 80151B28 00000000 */  nop
    /* 17F34 80151B2C 80180400 */  sll        $v1, $a0, 2
    /* 17F38 80151B30 21186400 */  addu       $v1, $v1, $a0
    /* 17F3C 80151B34 40180300 */  sll        $v1, $v1, 1
    /* 17F40 80151B38 46006324 */  addiu      $v1, $v1, 0x46
    /* 17F44 80151B3C 2AA84300 */  slt        $s5, $v0, $v1
  .L80151B40:
    /* 17F48 80151B40 0400A012 */  beqz       $s5, .L80151B54
    /* 17F4C 80151B44 21206002 */   addu      $a0, $s3, $zero
    /* 17F50 80151B48 04008526 */  addiu      $a1, $s4, 0x4
    /* 17F54 80151B4C D43D050C */  jal        M_CallWalk__Fii
    /* 17F58 80151B50 0700A530 */   andi      $a1, $a1, 0x7
  .L80151B54:
    /* 17F5C 80151B54 33000282 */  lb         $v0, 0x33($s0)
    /* 17F60 80151B58 00000000 */  nop
    /* 17F64 80151B5C 23004014 */  bnez       $v0, .L80151BEC
    /* 17F68 80151B60 2130C002 */   addu      $a2, $s6, $zero
    /* 17F6C 80151B64 34000482 */  lb         $a0, 0x34($s0)
    /* 17F70 80151B68 35000582 */  lb         $a1, 0x35($s0)
    /* 17F74 80151B6C 1E55050C */  jal        LineClear__Fiiii
    /* 17F78 80151B70 2138E002 */   addu      $a3, $s7, $zero
    /* 17F7C 80151B74 FF004230 */  andi       $v0, $v0, 0xFF
    /* 17F80 80151B78 0F004010 */  beqz       $v0, .L80151BB8
    /* 17F84 80151B7C 00000000 */   nop
    /* 17F88 80151B80 1000A293 */  lbu        $v0, 0x10($sp)
    /* 17F8C 80151B84 00000000 */  nop
    /* 17F90 80151B88 06004010 */  beqz       $v0, .L80151BA4
    /* 17F94 80151B8C 21206002 */   addu      $a0, $s3, $zero
    /* 17F98 80151B90 2128C003 */  addu       $a1, $fp, $zero
    /* 17F9C 80151B94 602B050C */  jal        M_StartRSpAttack__Fiii
    /* 17FA0 80151B98 04000624 */   addiu     $a2, $zero, 0x4
    /* 17FA4 80151B9C FB460508 */  j          .L80151BEC
    /* 17FA8 80151BA0 00000000 */   nop
  .L80151BA4:
    /* 17FAC 80151BA4 2128C003 */  addu       $a1, $fp, $zero
    /* 17FB0 80151BA8 182B050C */  jal        M_StartRAttack__Fiii
    /* 17FB4 80151BAC 04000624 */   addiu     $a2, $zero, 0x4
    /* 17FB8 80151BB0 FB460508 */  j          .L80151BEC
    /* 17FBC 80151BB4 00000000 */   nop
  .L80151BB8:
    /* 17FC0 80151BB8 FB460508 */  j          .L80151BEC
    /* 17FC4 80151BBC 5A0000A2 */   sb        $zero, 0x5A($s0)
  .L80151BC0:
    /* 17FC8 80151BC0 0A006010 */  beqz       $v1, .L80151BEC
    /* 17FCC 80151BC4 00000000 */   nop
    /* 17FD0 80151BC8 34000482 */  lb         $a0, 0x34($s0)
    /* 17FD4 80151BCC 35000582 */  lb         $a1, 0x35($s0)
    /* 17FD8 80151BD0 43000682 */  lb         $a2, 0x43($s0)
    /* 17FDC 80151BD4 44000782 */  lb         $a3, 0x44($s0)
    /* 17FE0 80151BD8 8AF6000C */  jal        GetDirection__Fiiii
    /* 17FE4 80151BDC 00000000 */   nop
    /* 17FE8 80151BE0 21206002 */  addu       $a0, $s3, $zero
    /* 17FEC 80151BE4 D43D050C */  jal        M_CallWalk__Fii
    /* 17FF0 80151BE8 21284000 */   addu      $a1, $v0, $zero
  .L80151BEC:
    /* 17FF4 80151BEC 3C00BF8F */  lw         $ra, 0x3C($sp)
    /* 17FF8 80151BF0 3800BE8F */  lw         $fp, 0x38($sp)
    /* 17FFC 80151BF4 3400B78F */  lw         $s7, 0x34($sp)
    /* 18000 80151BF8 3000B68F */  lw         $s6, 0x30($sp)
    /* 18004 80151BFC 2C00B58F */  lw         $s5, 0x2C($sp)
    /* 18008 80151C00 2800B48F */  lw         $s4, 0x28($sp)
    /* 1800C 80151C04 2400B38F */  lw         $s3, 0x24($sp)
    /* 18010 80151C08 2000B28F */  lw         $s2, 0x20($sp)
    /* 18014 80151C0C 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 18018 80151C10 1800B08F */  lw         $s0, 0x18($sp)
    /* 1801C 80151C14 4000BD27 */  addiu      $sp, $sp, 0x40
    /* 18020 80151C18 0800E003 */  jr         $ra
    /* 18024 80151C1C 00000000 */   nop
endlabel MAI_Ranged__FiiUc
