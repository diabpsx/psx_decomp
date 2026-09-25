.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PSX_PostWndProc__FUilUl, 0xB8

glabel PSX_PostWndProc__FUilUl
    /* 86EE0 80096EE0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 86EE4 80096EE4 BEFF8424 */  addiu      $a0, $a0, -0x42
    /* 86EE8 80096EE8 0C00822C */  sltiu      $v0, $a0, 0xC
    /* 86EEC 80096EEC 1E004010 */  beqz       $v0, .L80096F68
    /* 86EF0 80096EF0 1000BFAF */   sw        $ra, 0x10($sp)
    /* 86EF4 80096EF4 80100400 */  sll        $v0, $a0, 2
    /* 86EF8 80096EF8 1180013C */  lui        $at, %hi(jtbl_80110814)
    /* 86EFC 80096EFC 21082200 */  addu       $at, $at, $v0
    /* 86F00 80096F00 1408228C */  lw         $v0, %lo(jtbl_80110814)($at)
    /* 86F04 80096F04 00000000 */  nop
    /* 86F08 80096F08 08004000 */  jr         $v0
    /* 86F0C 80096F0C 00000000 */   nop
  jlabel .L80096F10
    /* 86F10 80096F10 215D020C */  jal        PostGoForwardLevel__Fv
    /* 86F14 80096F14 00000000 */   nop
    /* 86F18 80096F18 E25B0208 */  j          .L80096F88
    /* 86F1C 80096F1C 00000000 */   nop
  jlabel .L80096F20
    /* 86F20 80096F20 73A0010C */  jal        SetReturnLvlPos__Fv
    /* 86F24 80096F24 00000000 */   nop
    /* 86F28 80096F28 E15C020C */  jal        PostGoBackLevel__Fv
    /* 86F2C 80096F2C 00000000 */   nop
    /* 86F30 80096F30 E25B0208 */  j          .L80096F88
    /* 86F34 80096F34 00000000 */   nop
  jlabel .L80096F38
    /* 86F38 80096F38 555D020C */  jal        PostNewGame__Fv
    /* 86F3C 80096F3C 00000000 */   nop
    /* 86F40 80096F40 E25B0208 */  j          .L80096F88
    /* 86F44 80096F44 00000000 */   nop
  jlabel .L80096F48
    /* 86F48 80096F48 2E5C020C */  jal        PostLoadGame__Fv
    /* 86F4C 80096F4C 00000000 */   nop
    /* 86F50 80096F50 E25B0208 */  j          .L80096F88
    /* 86F54 80096F54 00000000 */   nop
  jlabel .L80096F58
    /* 86F58 80096F58 A25C020C */  jal        PostNewLevel__Fv
    /* 86F5C 80096F5C 00000000 */   nop
    /* 86F60 80096F60 E25B0208 */  j          .L80096F88
    /* 86F64 80096F64 00000000 */   nop
  jlabel .L80096F68
    /* 86F68 80096F68 1180023C */  lui        $v0, %hi(D_80110708)
    /* 86F6C 80096F6C 08074224 */  addiu      $v0, $v0, %lo(D_80110708)
    /* 86F70 80096F70 05004010 */  beqz       $v0, .L80096F88
    /* 86F74 80096F74 21200000 */   addu      $a0, $zero, $zero
    /* 86F78 80096F78 1180053C */  lui        $a1, %hi(D_8011071C)
    /* 86F7C 80096F7C 1C07A524 */  addiu      $a1, $a1, %lo(D_8011071C)
    /* 86F80 80096F80 A583000C */  jal        DBG_Error
    /* 86F84 80096F84 AF010624 */   addiu     $a2, $zero, 0x1AF
  .L80096F88:
    /* 86F88 80096F88 1000BF8F */  lw         $ra, 0x10($sp)
    /* 86F8C 80096F8C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 86F90 80096F90 0800E003 */  jr         $ra
    /* 86F94 80096F94 00000000 */   nop
endlabel PSX_PostWndProc__FUilUl
