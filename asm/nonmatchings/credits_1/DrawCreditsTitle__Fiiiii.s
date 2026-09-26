.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawCreditsTitle__Fiiiii, 0xB8

glabel DrawCreditsTitle__Fiiiii
    /* 3E80 8013DA78 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 3E84 8013DA7C 2118A000 */  addu       $v1, $a1, $zero
    /* 3E88 8013DA80 3000A58F */  lw         $a1, 0x30($sp)
    /* 3E8C 8013DA84 0500C014 */  bnez       $a2, .L8013DA9C
    /* 3E90 8013DA88 1800BFAF */   sw        $ra, 0x18($sp)
    /* 3E94 8013DA8C 400C828F */  lw         $v0, %gp_rel(CreditTitleNo)($gp)
    /* 3E98 8013DA90 00000000 */  nop
    /* 3E9C 8013DA94 08008210 */  beq        $a0, $v0, .L8013DAB8
    /* 3EA0 8013DA98 00000000 */   nop
  .L8013DA9C:
    /* 3EA4 8013DA9C 02000224 */  addiu      $v0, $zero, 0x2
    /* 3EA8 8013DAA0 0800C214 */  bne        $a2, $v0, .L8013DAC4
    /* 3EAC 8013DAA4 01000224 */   addiu     $v0, $zero, 0x1
    /* 3EB0 8013DAA8 400C828F */  lw         $v0, %gp_rel(CreditTitleNo)($gp)
    /* 3EB4 8013DAAC 00000000 */  nop
    /* 3EB8 8013DAB0 0400E214 */  bne        $a3, $v0, .L8013DAC4
    /* 3EBC 8013DAB4 01000224 */   addiu     $v0, $zero, 0x1
  .L8013DAB8:
    /* 3EC0 8013DAB8 01000624 */  addiu      $a2, $zero, 0x1
    /* 3EC4 8013DABC 7F000324 */  addiu      $v1, $zero, 0x7F
    /* 3EC8 8013DAC0 01000224 */  addiu      $v0, $zero, 0x1
  .L8013DAC4:
    /* 3ECC 8013DAC4 0E00C210 */  beq        $a2, $v0, .L8013DB00
    /* 3ED0 8013DAC8 0200C228 */   slti      $v0, $a2, 0x2
    /* 3ED4 8013DACC 05004010 */  beqz       $v0, .L8013DAE4
    /* 3ED8 8013DAD0 00000000 */   nop
    /* 3EDC 8013DAD4 0800C010 */  beqz       $a2, .L8013DAF8
    /* 3EE0 8013DAD8 21306000 */   addu      $a2, $v1, $zero
    /* 3EE4 8013DADC C8F60408 */  j          .L8013DB20
    /* 3EE8 8013DAE0 00000000 */   nop
  .L8013DAE4:
    /* 3EEC 8013DAE4 02000224 */  addiu      $v0, $zero, 0x2
    /* 3EF0 8013DAE8 0700C210 */  beq        $a2, $v0, .L8013DB08
    /* 3EF4 8013DAEC 21306000 */   addu      $a2, $v1, $zero
    /* 3EF8 8013DAF0 C8F60408 */  j          .L8013DB20
    /* 3EFC 8013DAF4 00000000 */   nop
  .L8013DAF8:
    /* 3F00 8013DAF8 C4F60408 */  j          .L8013DB10
    /* 3F04 8013DAFC FF000724 */   addiu     $a3, $zero, 0xFF
  .L8013DB00:
    /* 3F08 8013DB00 400C84AF */  sw         $a0, %gp_rel(CreditTitleNo)($gp)
    /* 3F0C 8013DB04 21306000 */  addu       $a2, $v1, $zero
  .L8013DB08:
    /* 3F10 8013DB08 FF000724 */  addiu      $a3, $zero, 0xFF
    /* 3F14 8013DB0C 400C848F */  lw         $a0, %gp_rel(CreditTitleNo)($gp)
  .L8013DB10:
    /* 3F18 8013DB10 FF000224 */  addiu      $v0, $zero, 0xFF
    /* 3F1C 8013DB14 1000A2AF */  sw         $v0, 0x10($sp)
    /* 3F20 8013DB18 92F4040C */  jal        PrintCredits__Fiiiiii
    /* 3F24 8013DB1C 1400A0AF */   sw        $zero, 0x14($sp)
  .L8013DB20:
    /* 3F28 8013DB20 1800BF8F */  lw         $ra, 0x18($sp)
    /* 3F2C 8013DB24 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 3F30 8013DB28 0800E003 */  jr         $ra
    /* 3F34 8013DB2C 00000000 */   nop
endlabel DrawCreditsTitle__Fiiiii
