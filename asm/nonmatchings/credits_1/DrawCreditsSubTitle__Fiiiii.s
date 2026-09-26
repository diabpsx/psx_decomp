.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawCreditsSubTitle__Fiiiii, 0xB8

glabel DrawCreditsSubTitle__Fiiiii
    /* 3F38 8013DB30 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 3F3C 8013DB34 2118A000 */  addu       $v1, $a1, $zero
    /* 3F40 8013DB38 3000A58F */  lw         $a1, 0x30($sp)
    /* 3F44 8013DB3C 0500C014 */  bnez       $a2, .L8013DB54
    /* 3F48 8013DB40 1800BFAF */   sw        $ra, 0x18($sp)
    /* 3F4C 8013DB44 440C828F */  lw         $v0, %gp_rel(CreditSubTitleNo)($gp)
    /* 3F50 8013DB48 00000000 */  nop
    /* 3F54 8013DB4C 08008210 */  beq        $a0, $v0, .L8013DB70
    /* 3F58 8013DB50 00000000 */   nop
  .L8013DB54:
    /* 3F5C 8013DB54 02000224 */  addiu      $v0, $zero, 0x2
    /* 3F60 8013DB58 0800C214 */  bne        $a2, $v0, .L8013DB7C
    /* 3F64 8013DB5C 01000224 */   addiu     $v0, $zero, 0x1
    /* 3F68 8013DB60 440C828F */  lw         $v0, %gp_rel(CreditSubTitleNo)($gp)
    /* 3F6C 8013DB64 00000000 */  nop
    /* 3F70 8013DB68 0400E214 */  bne        $a3, $v0, .L8013DB7C
    /* 3F74 8013DB6C 01000224 */   addiu     $v0, $zero, 0x1
  .L8013DB70:
    /* 3F78 8013DB70 01000624 */  addiu      $a2, $zero, 0x1
    /* 3F7C 8013DB74 7F000324 */  addiu      $v1, $zero, 0x7F
    /* 3F80 8013DB78 01000224 */  addiu      $v0, $zero, 0x1
  .L8013DB7C:
    /* 3F84 8013DB7C 0C00C210 */  beq        $a2, $v0, .L8013DBB0
    /* 3F88 8013DB80 0200C228 */   slti      $v0, $a2, 0x2
    /* 3F8C 8013DB84 05004010 */  beqz       $v0, .L8013DB9C
    /* 3F90 8013DB88 00000000 */   nop
    /* 3F94 8013DB8C 0B00C010 */  beqz       $a2, .L8013DBBC
    /* 3F98 8013DB90 FFFF0224 */   addiu     $v0, $zero, -0x1
    /* 3F9C 8013DB94 F6F60408 */  j          .L8013DBD8
    /* 3FA0 8013DB98 00000000 */   nop
  .L8013DB9C:
    /* 3FA4 8013DB9C 02000224 */  addiu      $v0, $zero, 0x2
    /* 3FA8 8013DBA0 0400C210 */  beq        $a2, $v0, .L8013DBB4
    /* 3FAC 8013DBA4 00000000 */   nop
    /* 3FB0 8013DBA8 F6F60408 */  j          .L8013DBD8
    /* 3FB4 8013DBAC 00000000 */   nop
  .L8013DBB0:
    /* 3FB8 8013DBB0 440C84AF */  sw         $a0, %gp_rel(CreditSubTitleNo)($gp)
  .L8013DBB4:
    /* 3FBC 8013DBB4 440C848F */  lw         $a0, %gp_rel(CreditSubTitleNo)($gp)
    /* 3FC0 8013DBB8 FFFF0224 */  addiu      $v0, $zero, -0x1
  .L8013DBBC:
    /* 3FC4 8013DBBC 06008210 */  beq        $a0, $v0, .L8013DBD8
    /* 3FC8 8013DBC0 21306000 */   addu      $a2, $v1, $zero
    /* 3FCC 8013DBC4 FF000724 */  addiu      $a3, $zero, 0xFF
    /* 3FD0 8013DBC8 FF000224 */  addiu      $v0, $zero, 0xFF
    /* 3FD4 8013DBCC 1000A2AF */  sw         $v0, 0x10($sp)
    /* 3FD8 8013DBD0 92F4040C */  jal        PrintCredits__Fiiiiii
    /* 3FDC 8013DBD4 1400A2AF */   sw        $v0, 0x14($sp)
  .L8013DBD8:
    /* 3FE0 8013DBD8 1800BF8F */  lw         $ra, 0x18($sp)
    /* 3FE4 8013DBDC 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 3FE8 8013DBE0 0800E003 */  jr         $ra
    /* 3FEC 8013DBE4 00000000 */   nop
endlabel DrawCreditsSubTitle__Fiiiii
