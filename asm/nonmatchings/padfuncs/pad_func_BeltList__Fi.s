.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching pad_func_BeltList__Fi, 0x168

glabel pad_func_BeltList__Fi
    /* 91E78 800A1E78 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 91E7C 800A1E7C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 91E80 800A1E80 1400BFAF */  sw         $ra, 0x14($sp)
    /* 91E84 800A1E84 9A82020C */  jal        any_belt_items__Fv
    /* 91E88 800A1E88 21808000 */   addu      $s0, $a0, $zero
    /* 91E8C 800A1E8C FF004230 */  andi       $v0, $v0, 0xFF
    /* 91E90 800A1E90 0F004010 */  beqz       $v0, .L800A1ED0
    /* 91E94 800A1E94 40101000 */   sll       $v0, $s0, 1
    /* 91E98 800A1E98 21105000 */  addu       $v0, $v0, $s0
    /* 91E9C 800A1E9C 80100200 */  sll        $v0, $v0, 2
    /* 91EA0 800A1EA0 21105000 */  addu       $v0, $v0, $s0
    /* 91EA4 800A1EA4 00110200 */  sll        $v0, $v0, 4
    /* 91EA8 800A1EA8 23105000 */  subu       $v0, $v0, $s0
    /* 91EAC 800A1EAC 80100200 */  sll        $v0, $v0, 2
    /* 91EB0 800A1EB0 21105000 */  addu       $v0, $v0, $s0
    /* 91EB4 800A1EB4 C0100200 */  sll        $v0, $v0, 3
    /* 91EB8 800A1EB8 0E80013C */  lui        $at, %hi(plr)
    /* 91EBC 800A1EBC 21082200 */  addu       $at, $at, $v0
    /* 91EC0 800A1EC0 38A5238C */  lw         $v1, %lo(plr)($at)
    /* 91EC4 800A1EC4 09000224 */  addiu      $v0, $zero, 0x9
    /* 91EC8 800A1EC8 05006214 */  bne        $v1, $v0, .L800A1EE0
    /* 91ECC 800A1ECC 00000000 */   nop
  .L800A1ED0:
    /* 91ED0 800A1ED0 C6F5000C */  jal        PlaySFX__Fi
    /* 91ED4 800A1ED4 D3030424 */   addiu     $a0, $zero, 0x3D3
    /* 91ED8 800A1ED8 F3870208 */  j          .L800A1FCC
    /* 91EDC 800A1EDC 00000000 */   nop
  .L800A1EE0:
    /* 91EE0 800A1EE0 1280013C */  lui        $at, %hi(_SpdBeltSelFlag)
    /* 91EE4 800A1EE4 21083000 */  addu       $at, $at, $s0
    /* 91EE8 800A1EE8 C4BB2290 */  lbu        $v0, %lo(_SpdBeltSelFlag)($at)
    /* 91EEC 800A1EEC 00000000 */  nop
    /* 91EF0 800A1EF0 0B004010 */  beqz       $v0, .L800A1F20
    /* 91EF4 800A1EF4 00000000 */   nop
    /* 91EF8 800A1EF8 C6F5000C */  jal        PlaySFX__Fi
    /* 91EFC 800A1EFC 33000424 */   addiu     $a0, $zero, 0x33
    /* 91F00 800A1F00 1280013C */  lui        $at, %hi(_SpdBeltSelFlag)
    /* 91F04 800A1F04 21083000 */  addu       $at, $at, $s0
    /* 91F08 800A1F08 C4BB20A0 */  sb         $zero, %lo(_SpdBeltSelFlag)($at)
    /* 91F0C 800A1F0C 06000426 */  addiu      $a0, $s0, 0x6
    /* 91F10 800A1F10 21280000 */  addu       $a1, $zero, $zero
    /* 91F14 800A1F14 21300000 */  addu       $a2, $zero, $zero
    /* 91F18 800A1F18 F1870208 */  j          .L800A1FC4
    /* 91F1C 800A1F1C 21380000 */   addu      $a3, $zero, $zero
  .L800A1F20:
    /* 91F20 800A1F20 1280023C */  lui        $v0, %hi(chrflag)
    /* 91F24 800A1F24 C0B64290 */  lbu        $v0, %lo(chrflag)($v0)
    /* 91F28 800A1F28 1280033C */  lui        $v1, %hi(stextflag)
    /* 91F2C 800A1F2C E0BA6380 */  lb         $v1, %lo(stextflag)($v1)
    /* 91F30 800A1F30 1280043C */  lui        $a0, %hi(qtextflag)
    /* 91F34 800A1F34 60B98490 */  lbu        $a0, %lo(qtextflag)($a0)
    /* 91F38 800A1F38 25104300 */  or         $v0, $v0, $v1
    /* 91F3C 800A1F3C 25104400 */  or         $v0, $v0, $a0
    /* 91F40 800A1F40 80181000 */  sll        $v1, $s0, 2
    /* 91F44 800A1F44 1280013C */  lui        $at, %hi(_spselflag)
    /* 91F48 800A1F48 21082300 */  addu       $at, $at, $v1
    /* 91F4C 800A1F4C 50B6238C */  lw         $v1, %lo(_spselflag)($at)
    /* 91F50 800A1F50 1280043C */  lui        $a0, %hi(sbookflag)
    /* 91F54 800A1F54 C6B68490 */  lbu        $a0, %lo(sbookflag)($a0)
    /* 91F58 800A1F58 25104300 */  or         $v0, $v0, $v1
    /* 91F5C 800A1F5C 25104400 */  or         $v0, $v0, $a0
    /* 91F60 800A1F60 1280033C */  lui        $v1, %hi(questlog)
    /* 91F64 800A1F64 29BA6390 */  lbu        $v1, %lo(questlog)($v1)
    /* 91F68 800A1F68 1280043C */  lui        $a0, %hi(optionsflag)
    /* 91F6C 800A1F6C 48B2848C */  lw         $a0, %lo(optionsflag)($a0)
    /* 91F70 800A1F70 25104300 */  or         $v0, $v0, $v1
    /* 91F74 800A1F74 25104400 */  or         $v0, $v0, $a0
    /* 91F78 800A1F78 14004014 */  bnez       $v0, .L800A1FCC
    /* 91F7C 800A1F7C 00000000 */   nop
    /* 91F80 800A1F80 C6F5000C */  jal        PlaySFX__Fi
    /* 91F84 800A1F84 33000424 */   addiu     $a0, $zero, 0x33
    /* 91F88 800A1F88 01000224 */  addiu      $v0, $zero, 0x1
    /* 91F8C 800A1F8C 1280013C */  lui        $at, %hi(_SpdBeltSelFlag)
    /* 91F90 800A1F90 21083000 */  addu       $at, $at, $s0
    /* 91F94 800A1F94 C4BB22A0 */  sb         $v0, %lo(_SpdBeltSelFlag)($at)
    /* 91F98 800A1F98 03000426 */  addiu      $a0, $s0, 0x3
    /* 91F9C 800A1F9C 21280000 */  addu       $a1, $zero, $zero
    /* 91FA0 800A1FA0 21300000 */  addu       $a2, $zero, $zero
    /* 91FA4 800A1FA4 53EB010C */  jal        PostGamePad__Fiiii
    /* 91FA8 800A1FA8 21380000 */   addu      $a3, $zero, $zero
    /* 91FAC 800A1FAC 0A000424 */  addiu      $a0, $zero, 0xA
    /* 91FB0 800A1FB0 21280002 */  addu       $a1, $s0, $zero
    /* 91FB4 800A1FB4 0A80063C */  lui        $a2, %hi(pad_func_Use_Item__Fi)
    /* 91FB8 800A1FB8 441CC624 */  addiu      $a2, $a2, %lo(pad_func_Use_Item__Fi)
    /* 91FBC 800A1FBC 0A80073C */  lui        $a3, %hi(select_belt_item__Fi)
    /* 91FC0 800A1FC0 600AE724 */  addiu      $a3, $a3, %lo(select_belt_item__Fi)
  .L800A1FC4:
    /* 91FC4 800A1FC4 53EB010C */  jal        PostGamePad__Fiiii
    /* 91FC8 800A1FC8 00000000 */   nop
  .L800A1FCC:
    /* 91FCC 800A1FCC 1400BF8F */  lw         $ra, 0x14($sp)
    /* 91FD0 800A1FD0 1000B08F */  lw         $s0, 0x10($sp)
    /* 91FD4 800A1FD4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 91FD8 800A1FD8 0800E003 */  jr         $ra
    /* 91FDC 800A1FDC 00000000 */   nop
endlabel pad_func_BeltList__Fi
