.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching S_SBuyEnter__Fv, 0x264

glabel S_SBuyEnter__Fv
    /* 60E14 80070E14 6413828F */  lw         $v0, %gp_rel(SmithItemCount)($gp)
    /* 60E18 80070E18 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 60E1C 80070E1C 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 60E20 80070E20 05004014 */  bnez       $v0, .L80070E38
    /* 60E24 80070E24 1800B0AF */   sw        $s0, 0x18($sp)
    /* 60E28 80070E28 5BBE010C */  jal        StartStore__Fc
    /* 60E2C 80070E2C 01000424 */   addiu     $a0, $zero, 0x1
    /* 60E30 80070E30 19C40108 */  j          .L80071064
    /* 60E34 80070E34 00000000 */   nop
  .L80070E38:
    /* 60E38 80070E38 0421848F */  lw         $a0, %gp_rel(D_8011C884)($gp)
    /* 60E3C 80070E3C 1421858F */  lw         $a1, %gp_rel(D_8011C894)($gp)
    /* 60E40 80070E40 26218383 */  lb         $v1, %gp_rel(D_8011C8A6)($gp)
    /* 60E44 80070E44 02000224 */  addiu      $v0, $zero, 0x2
    /* 60E48 80070E48 0C2182AF */  sw         $v0, %gp_rel(D_8011C88C)($gp)
    /* 60E4C 80070E4C 01000224 */  addiu      $v0, $zero, 0x1
    /* 60E50 80070E50 082184AF */  sw         $a0, %gp_rel(D_8011C888)($gp)
    /* 60E54 80070E54 102185AF */  sw         $a1, %gp_rel(D_8011C890)($gp)
    /* 60E58 80070E58 09006214 */  bne        $v1, $v0, .L80070E80
    /* 60E5C 80070E5C 00000000 */   nop
    /* 60E60 80070E60 1C21828F */  lw         $v0, %gp_rel(D_8011C89C)($gp)
    /* 60E64 80070E64 00000000 */  nop
    /* 60E68 80070E68 23108200 */  subu       $v0, $a0, $v0
    /* 60E6C 80070E6C 02004104 */  bgez       $v0, .L80070E78
    /* 60E70 80070E70 00000000 */   nop
    /* 60E74 80070E74 03004224 */  addiu      $v0, $v0, 0x3
  .L80070E78:
    /* 60E78 80070E78 A7C30108 */  j          .L80070E9C
    /* 60E7C 80070E7C 83100200 */   sra       $v0, $v0, 2
  .L80070E80:
    /* 60E80 80070E80 1C21828F */  lw         $v0, %gp_rel(D_8011C89C)($gp)
    /* 60E84 80070E84 00000000 */  nop
    /* 60E88 80070E88 23108200 */  subu       $v0, $a0, $v0
    /* 60E8C 80070E8C 02004104 */  bgez       $v0, .L80070E98
    /* 60E90 80070E90 00000000 */   nop
    /* 60E94 80070E94 07004224 */  addiu      $v0, $v0, 0x7
  .L80070E98:
    /* 60E98 80070E98 C3100200 */  sra        $v0, $v0, 3
  .L80070E9C:
    /* 60E9C 80070E9C 21484500 */  addu       $t1, $v0, $a1
    /* 60EA0 80070EA0 1280033C */  lui        $v1, %hi(myplr)
    /* 60EA4 80070EA4 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 60EA8 80070EA8 00000000 */  nop
    /* 60EAC 80070EAC 40100300 */  sll        $v0, $v1, 1
    /* 60EB0 80070EB0 21104300 */  addu       $v0, $v0, $v1
    /* 60EB4 80070EB4 80100200 */  sll        $v0, $v0, 2
    /* 60EB8 80070EB8 21104300 */  addu       $v0, $v0, $v1
    /* 60EBC 80070EBC 00110200 */  sll        $v0, $v0, 4
    /* 60EC0 80070EC0 23104300 */  subu       $v0, $v0, $v1
    /* 60EC4 80070EC4 80100200 */  sll        $v0, $v0, 2
    /* 60EC8 80070EC8 21104300 */  addu       $v0, $v0, $v1
    /* 60ECC 80070ECC C0300200 */  sll        $a2, $v0, 3
    /* 60ED0 80070ED0 C0100900 */  sll        $v0, $t1, 3
    /* 60ED4 80070ED4 23104900 */  subu       $v0, $v0, $t1
    /* 60ED8 80070ED8 80100200 */  sll        $v0, $v0, 2
    /* 60EDC 80070EDC 23104900 */  subu       $v0, $v0, $t1
    /* 60EE0 80070EE0 3413838F */  lw         $v1, %gp_rel(StorePlrNo)($gp)
    /* 60EE4 80070EE4 80280200 */  sll        $a1, $v0, 2
    /* 60EE8 80070EE8 00110300 */  sll        $v0, $v1, 4
    /* 60EEC 80070EEC 21104300 */  addu       $v0, $v0, $v1
    /* 60EF0 80070EF0 C0100200 */  sll        $v0, $v0, 3
    /* 60EF4 80070EF4 23104300 */  subu       $v0, $v0, $v1
    /* 60EF8 80070EF8 00210200 */  sll        $a0, $v0, 4
    /* 60EFC 80070EFC 2118A400 */  addu       $v1, $a1, $a0
    /* 60F00 80070F00 0E80013C */  lui        $at, %hi(plr + 0x150)
    /* 60F04 80070F04 21082600 */  addu       $at, $at, $a2
    /* 60F08 80070F08 88A6228C */  lw         $v0, %lo(plr + 0x150)($at)
    /* 60F0C 80070F0C 0E80013C */  lui        $at, %hi(_smithitem + 0x18)
    /* 60F10 80070F10 21082300 */  addu       $at, $at, $v1
    /* 60F14 80070F14 40E4238C */  lw         $v1, %lo(_smithitem + 0x18)($at)
    /* 60F18 80070F18 00000000 */  nop
    /* 60F1C 80070F1C 2A104300 */  slt        $v0, $v0, $v1
    /* 60F20 80070F20 05004010 */  beqz       $v0, .L80070F38
    /* 60F24 80070F24 00000000 */   nop
    /* 60F28 80070F28 5BBE010C */  jal        StartStore__Fc
    /* 60F2C 80070F2C 09000424 */   addiu     $a0, $zero, 0x9
    /* 60F30 80070F30 19C40108 */  j          .L80071064
    /* 60F34 80070F34 00000000 */   nop
  .L80070F38:
    /* 60F38 80070F38 0E80023C */  lui        $v0, %hi(plr + 0x1910)
    /* 60F3C 80070F3C 48BE4224 */  addiu      $v0, $v0, %lo(plr + 0x1910)
    /* 60F40 80070F40 2138C200 */  addu       $a3, $a2, $v0
    /* 60F44 80070F44 0E80023C */  lui        $v0, %hi(_smithitem)
    /* 60F48 80070F48 28E44224 */  addiu      $v0, $v0, %lo(_smithitem)
    /* 60F4C 80070F4C 21108200 */  addu       $v0, $a0, $v0
    /* 60F50 80070F50 2130A200 */  addu       $a2, $a1, $v0
    /* 60F54 80070F54 6000C824 */  addiu      $t0, $a2, 0x60
  .L80070F58:
    /* 60F58 80070F58 0000C28C */  lw         $v0, 0x0($a2)
    /* 60F5C 80070F5C 0400C38C */  lw         $v1, 0x4($a2)
    /* 60F60 80070F60 0800C48C */  lw         $a0, 0x8($a2)
    /* 60F64 80070F64 0C00C58C */  lw         $a1, 0xC($a2)
    /* 60F68 80070F68 0000E2AC */  sw         $v0, 0x0($a3)
    /* 60F6C 80070F6C 0400E3AC */  sw         $v1, 0x4($a3)
    /* 60F70 80070F70 0800E4AC */  sw         $a0, 0x8($a3)
    /* 60F74 80070F74 0C00E5AC */  sw         $a1, 0xC($a3)
    /* 60F78 80070F78 1000C624 */  addiu      $a2, $a2, 0x10
    /* 60F7C 80070F7C F6FFC814 */  bne        $a2, $t0, .L80070F58
    /* 60F80 80070F80 1000E724 */   addiu     $a3, $a3, 0x10
    /* 60F84 80070F84 0000C28C */  lw         $v0, 0x0($a2)
    /* 60F88 80070F88 0400C38C */  lw         $v1, 0x4($a2)
    /* 60F8C 80070F8C 0800C48C */  lw         $a0, 0x8($a2)
    /* 60F90 80070F90 0000E2AC */  sw         $v0, 0x0($a3)
    /* 60F94 80070F94 0400E3AC */  sw         $v1, 0x4($a3)
    /* 60F98 80070F98 0800E4AC */  sw         $a0, 0x8($a3)
    /* 60F9C 80070F9C 1280033C */  lui        $v1, %hi(myplr)
    /* 60FA0 80070FA0 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 60FA4 80070FA4 681389AF */  sw         $t1, %gp_rel(SellIdx)($gp)
    /* 60FA8 80070FA8 40100300 */  sll        $v0, $v1, 1
    /* 60FAC 80070FAC 21104300 */  addu       $v0, $v0, $v1
    /* 60FB0 80070FB0 80100200 */  sll        $v0, $v0, 2
    /* 60FB4 80070FB4 21104300 */  addu       $v0, $v0, $v1
    /* 60FB8 80070FB8 00110200 */  sll        $v0, $v0, 4
    /* 60FBC 80070FBC 23104300 */  subu       $v0, $v0, $v1
    /* 60FC0 80070FC0 80100200 */  sll        $v0, $v0, 2
    /* 60FC4 80070FC4 21104300 */  addu       $v0, $v0, $v1
    /* 60FC8 80070FC8 C0100200 */  sll        $v0, $v0, 3
    /* 60FCC 80070FCC 0E80013C */  lui        $at, %hi(plr + 0x195C)
    /* 60FD0 80070FD0 21082200 */  addu       $at, $at, $v0
    /* 60FD4 80070FD4 94BE2490 */  lbu        $a0, %lo(plr + 0x195C)($at)
    /* 60FD8 80070FD8 21800000 */  addu       $s0, $zero, $zero
    /* 60FDC 80070FDC E8DD000C */  jal        SetCursor__Fi
    /* 60FE0 80070FE0 0C008424 */   addiu     $a0, $a0, 0xC
  .L80070FE4:
    /* 60FE4 80070FE4 1280063C */  lui        $a2, %hi(cursW)
    /* 60FE8 80070FE8 38B7C68C */  lw         $a2, %lo(cursW)($a2)
    /* 60FEC 80070FEC 1280043C */  lui        $a0, %hi(myplr)
    /* 60FF0 80070FF0 08BA848C */  lw         $a0, %lo(myplr)($a0)
    /* 60FF4 80070FF4 0200C104 */  bgez       $a2, .L80071000
    /* 60FF8 80070FF8 00000000 */   nop
    /* 60FFC 80070FFC 0F00C624 */  addiu      $a2, $a2, 0xF
  .L80071000:
    /* 61000 80071000 1280073C */  lui        $a3, %hi(cursH)
    /* 61004 80071004 3CB7E78C */  lw         $a3, %lo(cursH)($a3)
    /* 61008 80071008 00000000 */  nop
    /* 6100C 8007100C 0200E104 */  bgez       $a3, .L80071018
    /* 61010 80071010 03310600 */   sra       $a2, $a2, 4
    /* 61014 80071014 0F00E724 */  addiu      $a3, $a3, 0xF
  .L80071018:
    /* 61018 80071018 1000A0AF */  sw         $zero, 0x10($sp)
    /* 6101C 8007101C 21280002 */  addu       $a1, $s0, $zero
    /* 61020 80071020 01001026 */  addiu      $s0, $s0, 0x1
    /* 61024 80071024 C967050C */  jal        func_80159F24
    /* 61028 80071028 03390700 */   sra       $a3, $a3, 4
    /* 6102C 8007102C 21184000 */  addu       $v1, $v0, $zero
    /* 61030 80071030 2800022A */  slti       $v0, $s0, 0x28
    /* 61034 80071034 03004010 */  beqz       $v0, .L80071044
    /* 61038 80071038 FF006230 */   andi      $v0, $v1, 0xFF
    /* 6103C 8007103C E9FF4010 */  beqz       $v0, .L80070FE4
    /* 61040 80071040 00000000 */   nop
  .L80071044:
    /* 61044 80071044 FF006230 */  andi       $v0, $v1, 0xFF
    /* 61048 80071048 02004010 */  beqz       $v0, .L80071054
    /* 6104C 8007104C 0A000424 */   addiu     $a0, $zero, 0xA
    /* 61050 80071050 0B000424 */  addiu      $a0, $zero, 0xB
  .L80071054:
    /* 61054 80071054 5BBE010C */  jal        StartStore__Fc
    /* 61058 80071058 00000000 */   nop
    /* 6105C 8007105C E8DD000C */  jal        SetCursor__Fi
    /* 61060 80071060 01000424 */   addiu     $a0, $zero, 0x1
  .L80071064:
    /* 61064 80071064 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 61068 80071068 1800B08F */  lw         $s0, 0x18($sp)
    /* 6106C 8007106C 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 61070 80071070 0800E003 */  jr         $ra
    /* 61074 80071074 00000000 */   nop
endlabel S_SBuyEnter__Fv
