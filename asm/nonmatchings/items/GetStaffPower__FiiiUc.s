.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetStaffPower__FiiiUc, 0x1E8

glabel GetStaffPower__FiiiUc
    /* 30DDC 80040DDC 48FBBD27 */  addiu      $sp, $sp, -0x4B8
    /* 30DE0 80040DE0 A804B2AF */  sw         $s2, 0x4A8($sp)
    /* 30DE4 80040DE4 21908000 */  addu       $s2, $a0, $zero
    /* 30DE8 80040DE8 AC04B3AF */  sw         $s3, 0x4AC($sp)
    /* 30DEC 80040DEC 2198A000 */  addu       $s3, $a1, $zero
    /* 30DF0 80040DF0 0A000424 */  addiu      $a0, $zero, 0xA
    /* 30DF4 80040DF4 A004B0AF */  sw         $s0, 0x4A0($sp)
    /* 30DF8 80040DF8 2180E000 */  addu       $s0, $a3, $zero
    /* 30DFC 80040DFC B004BFAF */  sw         $ra, 0x4B0($sp)
    /* 30E00 80040E00 C9F6000C */  jal        ENG_random__Fl
    /* 30E04 80040E04 A404B1AF */   sw        $s1, 0x4A4($sp)
    /* 30E08 80040E08 04004010 */  beqz       $v0, .L80040E1C
    /* 30E0C 80040E0C FFFF1124 */   addiu     $s1, $zero, -0x1
    /* 30E10 80040E10 FF000232 */  andi       $v0, $s0, 0xFF
    /* 30E14 80040E14 61004010 */  beqz       $v0, .L80040F9C
    /* 30E18 80040E18 00000000 */   nop
  .L80040E1C:
    /* 30E1C 80040E1C 21200000 */  addu       $a0, $zero, $zero
    /* 30E20 80040E20 1180023C */  lui        $v0, %hi(PL_Prefix + 0x4)
    /* 30E24 80040E24 4827428C */  lw         $v0, %lo(PL_Prefix + 0x4)($v0)
    /* 30E28 80040E28 00000000 */  nop
    /* 30E2C 80040E2C 2F005110 */  beq        $v0, $s1, .L80040EEC
    /* 30E30 80040E30 21300000 */   addu      $a2, $zero, $zero
    /* 30E34 80040E34 FF000732 */  andi       $a3, $s0, 0xFF
    /* 30E38 80040E38 FFFF0824 */  addiu      $t0, $zero, -0x1
    /* 30E3C 80040E3C 21180000 */  addu       $v1, $zero, $zero
    /* 30E40 80040E40 2000A527 */  addiu      $a1, $sp, 0x20
  .L80040E44:
    /* 30E44 80040E44 1180013C */  lui        $at, %hi(PL_Prefix + 0x14)
    /* 30E48 80040E48 21082300 */  addu       $at, $at, $v1
    /* 30E4C 80040E4C 5827228C */  lw         $v0, %lo(PL_Prefix + 0x14)($at)
    /* 30E50 80040E50 00000000 */  nop
    /* 30E54 80040E54 00014230 */  andi       $v0, $v0, 0x100
    /* 30E58 80040E58 1D004010 */  beqz       $v0, .L80040ED0
    /* 30E5C 80040E5C 00000000 */   nop
    /* 30E60 80040E60 1180013C */  lui        $at, %hi(PL_Prefix + 0x10)
    /* 30E64 80040E64 21082300 */  addu       $at, $at, $v1
    /* 30E68 80040E68 54272280 */  lb         $v0, %lo(PL_Prefix + 0x10)($at)
    /* 30E6C 80040E6C 00000000 */  nop
    /* 30E70 80040E70 2A106202 */  slt        $v0, $s3, $v0
    /* 30E74 80040E74 16004014 */  bnez       $v0, .L80040ED0
    /* 30E78 80040E78 00000000 */   nop
    /* 30E7C 80040E7C 0600E010 */  beqz       $a3, .L80040E98
    /* 30E80 80040E80 01000224 */   addiu     $v0, $zero, 0x1
    /* 30E84 80040E84 1180013C */  lui        $at, %hi(PL_Prefix + 0x1A)
    /* 30E88 80040E88 21082300 */  addu       $at, $at, $v1
    /* 30E8C 80040E8C 5E272290 */  lbu        $v0, %lo(PL_Prefix + 0x1A)($at)
    /* 30E90 80040E90 00000000 */  nop
    /* 30E94 80040E94 2B100200 */  sltu       $v0, $zero, $v0
  .L80040E98:
    /* 30E98 80040E98 FF004230 */  andi       $v0, $v0, 0xFF
    /* 30E9C 80040E9C 0C004010 */  beqz       $v0, .L80040ED0
    /* 30EA0 80040EA0 00000000 */   nop
    /* 30EA4 80040EA4 0000A6AC */  sw         $a2, 0x0($a1)
    /* 30EA8 80040EA8 0400A524 */  addiu      $a1, $a1, 0x4
    /* 30EAC 80040EAC 1180013C */  lui        $at, %hi(PL_Prefix + 0x19)
    /* 30EB0 80040EB0 21082300 */  addu       $at, $at, $v1
    /* 30EB4 80040EB4 5D272290 */  lbu        $v0, %lo(PL_Prefix + 0x19)($at)
    /* 30EB8 80040EB8 00000000 */  nop
    /* 30EBC 80040EBC 04004010 */  beqz       $v0, .L80040ED0
    /* 30EC0 80040EC0 01008424 */   addiu     $a0, $a0, 0x1
    /* 30EC4 80040EC4 0000A6AC */  sw         $a2, 0x0($a1)
    /* 30EC8 80040EC8 0400A524 */  addiu      $a1, $a1, 0x4
    /* 30ECC 80040ECC 01008424 */  addiu      $a0, $a0, 0x1
  .L80040ED0:
    /* 30ED0 80040ED0 28006324 */  addiu      $v1, $v1, 0x28
    /* 30ED4 80040ED4 1180013C */  lui        $at, %hi(PL_Prefix + 0x4)
    /* 30ED8 80040ED8 21082300 */  addu       $at, $at, $v1
    /* 30EDC 80040EDC 4827228C */  lw         $v0, %lo(PL_Prefix + 0x4)($at)
    /* 30EE0 80040EE0 00000000 */  nop
    /* 30EE4 80040EE4 D7FF4814 */  bne        $v0, $t0, .L80040E44
    /* 30EE8 80040EE8 0100C624 */   addiu     $a2, $a2, 0x1
  .L80040EEC:
    /* 30EEC 80040EEC 2B008010 */  beqz       $a0, .L80040F9C
    /* 30EF0 80040EF0 00000000 */   nop
    /* 30EF4 80040EF4 C9F6000C */  jal        ENG_random__Fl
    /* 30EF8 80040EF8 C0801200 */   sll       $s0, $s2, 3
    /* 30EFC 80040EFC 80100200 */  sll        $v0, $v0, 2
    /* 30F00 80040F00 2110A203 */  addu       $v0, $sp, $v0
    /* 30F04 80040F04 23801202 */  subu       $s0, $s0, $s2
    /* 30F08 80040F08 80801000 */  sll        $s0, $s0, 2
    /* 30F0C 80040F0C 23801202 */  subu       $s0, $s0, $s2
    /* 30F10 80040F10 2000518C */  lw         $s1, 0x20($v0)
    /* 30F14 80040F14 80801000 */  sll        $s0, $s0, 2
    /* 30F18 80040F18 80101100 */  sll        $v0, $s1, 2
    /* 30F1C 80040F1C 21105100 */  addu       $v0, $v0, $s1
    /* 30F20 80040F20 C0100200 */  sll        $v0, $v0, 3
    /* 30F24 80040F24 1180013C */  lui        $at, %hi(PL_Prefix + 0x4)
    /* 30F28 80040F28 21082200 */  addu       $at, $at, $v0
    /* 30F2C 80040F2C 4827258C */  lw         $a1, %lo(PL_Prefix + 0x4)($at)
    /* 30F30 80040F30 1180013C */  lui        $at, %hi(PL_Prefix + 0x1C)
    /* 30F34 80040F34 21082200 */  addu       $at, $at, $v0
    /* 30F38 80040F38 6027268C */  lw         $a2, %lo(PL_Prefix + 0x1C)($at)
    /* 30F3C 80040F3C 1180013C */  lui        $at, %hi(PL_Prefix + 0x20)
    /* 30F40 80040F40 21082200 */  addu       $at, $at, $v0
    /* 30F44 80040F44 6427278C */  lw         $a3, %lo(PL_Prefix + 0x20)($at)
    /* 30F48 80040F48 1180013C */  lui        $at, %hi(PL_Prefix + 0x24)
    /* 30F4C 80040F4C 21082200 */  addu       $at, $at, $v0
    /* 30F50 80040F50 6827288C */  lw         $t0, %lo(PL_Prefix + 0x24)($at)
    /* 30F54 80040F54 01000324 */  addiu      $v1, $zero, 0x1
    /* 30F58 80040F58 0D80013C */  lui        $at, %hi(item + 0x51)
    /* 30F5C 80040F5C 21083000 */  addu       $at, $at, $s0
    /* 30F60 80040F60 A51D23A0 */  sb         $v1, %lo(item + 0x51)($at)
    /* 30F64 80040F64 1000A6AF */  sw         $a2, 0x10($sp)
    /* 30F68 80040F68 1180013C */  lui        $at, %hi(PL_Prefix + 0x8)
    /* 30F6C 80040F6C 21082200 */  addu       $at, $at, $v0
    /* 30F70 80040F70 4C27268C */  lw         $a2, %lo(PL_Prefix + 0x8)($at)
    /* 30F74 80040F74 1400A7AF */  sw         $a3, 0x14($sp)
    /* 30F78 80040F78 1180013C */  lui        $at, %hi(PL_Prefix + 0xC)
    /* 30F7C 80040F7C 21082200 */  addu       $at, $at, $v0
    /* 30F80 80040F80 5027278C */  lw         $a3, %lo(PL_Prefix + 0xC)($at)
    /* 30F84 80040F84 21204002 */  addu       $a0, $s2, $zero
    /* 30F88 80040F88 2D06010C */  jal        SaveItemPower__Fiiiiiii
    /* 30F8C 80040F8C 1800A8AF */   sw        $t0, 0x18($sp)
    /* 30F90 80040F90 0D80013C */  lui        $at, %hi(item + 0x5F)
    /* 30F94 80040F94 21083000 */  addu       $at, $at, $s0
    /* 30F98 80040F98 B31D31A0 */  sb         $s1, %lo(item + 0x5F)($at)
  .L80040F9C:
    /* 30F9C 80040F9C B102010C */  jal        CalcItemValue__Fi
    /* 30FA0 80040FA0 21204002 */   addu      $a0, $s2, $zero
    /* 30FA4 80040FA4 B004BF8F */  lw         $ra, 0x4B0($sp)
    /* 30FA8 80040FA8 AC04B38F */  lw         $s3, 0x4AC($sp)
    /* 30FAC 80040FAC A804B28F */  lw         $s2, 0x4A8($sp)
    /* 30FB0 80040FB0 A404B18F */  lw         $s1, 0x4A4($sp)
    /* 30FB4 80040FB4 A004B08F */  lw         $s0, 0x4A0($sp)
    /* 30FB8 80040FB8 B804BD27 */  addiu      $sp, $sp, 0x4B8
    /* 30FBC 80040FBC 0800E003 */  jr         $ra
    /* 30FC0 80040FC0 00000000 */   nop
endlabel GetStaffPower__FiiiUc
