.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DoTelekinesis__Fv, 0x130

glabel DoTelekinesis__Fv
    /* 26E3C 80160A34 1280023C */  lui        $v0, %hi(sel_data)
    /* 26E40 80160A38 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 26E44 80160A3C C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 26E48 80160A40 3000BFAF */  sw         $ra, 0x30($sp)
    /* 26E4C 80160A44 2C00B1AF */  sw         $s1, 0x2C($sp)
    /* 26E50 80160A48 2800B0AF */  sw         $s0, 0x28($sp)
    /* 26E54 80160A4C 1280013C */  lui        $at, %hi(_pcursobj)
    /* 26E58 80160A50 21082200 */  addu       $at, $at, $v0
    /* 26E5C 80160A54 60B72680 */  lb         $a2, %lo(_pcursobj)($at)
    /* 26E60 80160A58 FFFF1124 */  addiu      $s1, $zero, -0x1
    /* 26E64 80160A5C 0400D110 */  beq        $a2, $s1, .L80160A70
    /* 26E68 80160A60 01000424 */   addiu     $a0, $zero, 0x1
    /* 26E6C 80160A64 1B000524 */  addiu      $a1, $zero, 0x1B
    /* 26E70 80160A68 0D3E010C */  jal        NetSendCmdParam1__FUcUcUs
    /* 26E74 80160A6C FFFFC630 */   andi      $a2, $a2, 0xFFFF
  .L80160A70:
    /* 26E78 80160A70 1280023C */  lui        $v0, %hi(sel_data)
    /* 26E7C 80160A74 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 26E80 80160A78 1280013C */  lui        $at, %hi(_pcursitem)
    /* 26E84 80160A7C 21082200 */  addu       $at, $at, $v0
    /* 26E88 80160A80 64B72280 */  lb         $v0, %lo(_pcursitem)($at)
    /* 26E8C 80160A84 00000000 */  nop
    /* 26E90 80160A88 09005110 */  beq        $v0, $s1, .L80160AB0
    /* 26E94 80160A8C 21184000 */   addu      $v1, $v0, $zero
    /* 26E98 80160A90 01000424 */  addiu      $a0, $zero, 0x1
    /* 26E9C 80160A94 28000524 */  addiu      $a1, $zero, 0x28
    /* 26EA0 80160A98 1280063C */  lui        $a2, %hi(myplr)
    /* 26EA4 80160A9C 08BAC690 */  lbu        $a2, %lo(myplr)($a2)
    /* 26EA8 80160AA0 FF006230 */  andi       $v0, $v1, 0xFF
    /* 26EAC 80160AA4 1000A2AF */  sw         $v0, 0x10($sp)
    /* 26EB0 80160AA8 4F3E010C */  jal        NetSendCmdGItem__FUcUcUcUcUc
    /* 26EB4 80160AAC 2138C000 */   addu      $a3, $a2, $zero
  .L80160AB0:
    /* 26EB8 80160AB0 1280023C */  lui        $v0, %hi(sel_data)
    /* 26EBC 80160AB4 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 26EC0 80160AB8 00000000 */  nop
    /* 26EC4 80160ABC 80100200 */  sll        $v0, $v0, 2
    /* 26EC8 80160AC0 1280013C */  lui        $at, %hi(_pcursmonst)
    /* 26ECC 80160AC4 21082200 */  addu       $at, $at, $v0
    /* 26ED0 80160AC8 58B7248C */  lw         $a0, %lo(_pcursmonst)($at)
    /* 26ED4 80160ACC 1280103C */  lui        $s0, %hi(_pcursmonst)
    /* 26ED8 80160AD0 58B71026 */  addiu      $s0, $s0, %lo(_pcursmonst)
    /* 26EDC 80160AD4 1B009110 */  beq        $a0, $s1, .L80160B44
    /* 26EE0 80160AD8 00000000 */   nop
    /* 26EE4 80160ADC 54FD010C */  jal        M_Talker__Fi
    /* 26EE8 80160AE0 00000000 */   nop
    /* 26EEC 80160AE4 FF004230 */  andi       $v0, $v0, 0xFF
    /* 26EF0 80160AE8 16004014 */  bnez       $v0, .L80160B44
    /* 26EF4 80160AEC 00000000 */   nop
    /* 26EF8 80160AF0 1280023C */  lui        $v0, %hi(sel_data)
    /* 26EFC 80160AF4 2CB7428C */  lw         $v0, %lo(sel_data)($v0)
    /* 26F00 80160AF8 00000000 */  nop
    /* 26F04 80160AFC 80100200 */  sll        $v0, $v0, 2
    /* 26F08 80160B00 21105000 */  addu       $v0, $v0, $s0
    /* 26F0C 80160B04 0000468C */  lw         $a2, 0x0($v0)
    /* 26F10 80160B08 00000000 */  nop
    /* 26F14 80160B0C 40100600 */  sll        $v0, $a2, 1
    /* 26F18 80160B10 21104600 */  addu       $v0, $v0, $a2
    /* 26F1C 80160B14 80100200 */  sll        $v0, $v0, 2
    /* 26F20 80160B18 21104600 */  addu       $v0, $v0, $a2
    /* 26F24 80160B1C C0100200 */  sll        $v0, $v0, 3
    /* 26F28 80160B20 1080013C */  lui        $at, %hi(monster)
    /* 26F2C 80160B24 21082200 */  addu       $at, $at, $v0
    /* 26F30 80160B28 9453228C */  lw         $v0, %lo(monster)($at)
    /* 26F34 80160B2C 00000000 */  nop
    /* 26F38 80160B30 04004014 */  bnez       $v0, .L80160B44
    /* 26F3C 80160B34 01000424 */   addiu     $a0, $zero, 0x1
    /* 26F40 80160B38 1C000524 */  addiu      $a1, $zero, 0x1C
    /* 26F44 80160B3C 0D3E010C */  jal        NetSendCmdParam1__FUcUcUs
    /* 26F48 80160B40 FFFFC630 */   andi      $a2, $a2, 0xFFFF
  .L80160B44:
    /* 26F4C 80160B44 01DE000C */  jal        NewCursor__Fi
    /* 26F50 80160B48 01000424 */   addiu     $a0, $zero, 0x1
    /* 26F54 80160B4C 3000BF8F */  lw         $ra, 0x30($sp)
    /* 26F58 80160B50 2C00B18F */  lw         $s1, 0x2C($sp)
    /* 26F5C 80160B54 2800B08F */  lw         $s0, 0x28($sp)
    /* 26F60 80160B58 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 26F64 80160B5C 0800E003 */  jr         $ra
    /* 26F68 80160B60 00000000 */   nop
endlabel DoTelekinesis__Fv
