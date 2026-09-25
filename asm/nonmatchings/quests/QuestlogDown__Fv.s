.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching QuestlogDown__Fv, 0xB4

glabel QuestlogDown__Fv
    /* 58F0C 80068F0C EC12848F */  lw         $a0, %gp_rel(numqlines)($gp)
    /* 58F10 80068F10 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 58F14 80068F14 02008228 */  slti       $v0, $a0, 0x2
    /* 58F18 80068F18 25004014 */  bnez       $v0, .L80068FB0
    /* 58F1C 80068F1C 1000BFAF */   sw        $ra, 0x10($sp)
    /* 58F20 80068F20 07008228 */  slti       $v0, $a0, 0x7
    /* 58F24 80068F24 0F004010 */  beqz       $v0, .L80068F64
    /* 58F28 80068F28 FFFF8224 */   addiu     $v0, $a0, -0x1
    /* 58F2C 80068F2C 40100200 */  sll        $v0, $v0, 1
    /* 58F30 80068F30 F012848F */  lw         $a0, %gp_rel(qtopline)($gp)
    /* 58F34 80068F34 E812838F */  lw         $v1, %gp_rel(qline)($gp)
    /* 58F38 80068F38 21104400 */  addu       $v0, $v0, $a0
    /* 58F3C 80068F3C 03006214 */  bne        $v1, $v0, .L80068F4C
    /* 58F40 80068F40 00000000 */   nop
    /* 58F44 80068F44 E81282AF */  sw         $v0, %gp_rel(qline)($gp)
    /* 58F48 80068F48 E812838F */  lw         $v1, %gp_rel(qline)($gp)
  .L80068F4C:
    /* 58F4C 80068F4C 00000000 */  nop
    /* 58F50 80068F50 14006214 */  bne        $v1, $v0, .L80068FA4
    /* 58F54 80068F54 02006224 */   addiu     $v0, $v1, 0x2
    /* 58F58 80068F58 E81284AF */  sw         $a0, %gp_rel(qline)($gp)
    /* 58F5C 80068F5C EAA30108 */  j          .L80068FA8
    /* 58F60 80068F60 00000000 */   nop
  .L80068F64:
    /* 58F64 80068F64 F012858F */  lw         $a1, %gp_rel(qtopline)($gp)
    /* 58F68 80068F68 E812838F */  lw         $v1, %gp_rel(qline)($gp)
    /* 58F6C 80068F6C 0C00A224 */  addiu      $v0, $a1, 0xC
    /* 58F70 80068F70 0C006214 */  bne        $v1, $v0, .L80068FA4
    /* 58F74 80068F74 02006224 */   addiu     $v0, $v1, 0x2
    /* 58F78 80068F78 CC12838F */  lw         $v1, %gp_rel(D_8011BA4C)($gp)
    /* 58F7C 80068F7C F9FF8224 */  addiu      $v0, $a0, -0x7
    /* 58F80 80068F80 01006324 */  addiu      $v1, $v1, 0x1
    /* 58F84 80068F84 2A104300 */  slt        $v0, $v0, $v1
    /* 58F88 80068F88 CC1283AF */  sw         $v1, %gp_rel(D_8011BA4C)($gp)
    /* 58F8C 80068F8C 06004010 */  beqz       $v0, .L80068FA8
    /* 58F90 80068F90 00000000 */   nop
    /* 58F94 80068F94 CC1280AF */  sw         $zero, %gp_rel(D_8011BA4C)($gp)
    /* 58F98 80068F98 E81285AF */  sw         $a1, %gp_rel(qline)($gp)
    /* 58F9C 80068F9C EAA30108 */  j          .L80068FA8
    /* 58FA0 80068FA0 00000000 */   nop
  .L80068FA4:
    /* 58FA4 80068FA4 E81282AF */  sw         $v0, %gp_rel(qline)($gp)
  .L80068FA8:
    /* 58FA8 80068FA8 C6F5000C */  jal        PlaySFX__Fi
    /* 58FAC 80068FAC 32000424 */   addiu     $a0, $zero, 0x32
  .L80068FB0:
    /* 58FB0 80068FB0 1000BF8F */  lw         $ra, 0x10($sp)
    /* 58FB4 80068FB4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 58FB8 80068FB8 0800E003 */  jr         $ra
    /* 58FBC 80068FBC 00000000 */   nop
endlabel QuestlogDown__Fv
