.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching QuestlogUp__Fv, 0x98

glabel QuestlogUp__Fv
    /* 58E74 80068E74 EC12848F */  lw         $a0, %gp_rel(numqlines)($gp)
    /* 58E78 80068E78 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 58E7C 80068E7C 02008228 */  slti       $v0, $a0, 0x2
    /* 58E80 80068E80 1E004014 */  bnez       $v0, .L80068EFC
    /* 58E84 80068E84 1000BFAF */   sw        $ra, 0x10($sp)
    /* 58E88 80068E88 07008228 */  slti       $v0, $a0, 0x7
    /* 58E8C 80068E8C 09004010 */  beqz       $v0, .L80068EB4
    /* 58E90 80068E90 00000000 */   nop
    /* 58E94 80068E94 E812838F */  lw         $v1, %gp_rel(qline)($gp)
    /* 58E98 80068E98 F012828F */  lw         $v0, %gp_rel(qtopline)($gp)
    /* 58E9C 80068E9C 00000000 */  nop
    /* 58EA0 80068EA0 12006214 */  bne        $v1, $v0, .L80068EEC
    /* 58EA4 80068EA4 FFFF8224 */   addiu     $v0, $a0, -0x1
    /* 58EA8 80068EA8 40100200 */  sll        $v0, $v0, 1
    /* 58EAC 80068EAC BCA30108 */  j          .L80068EF0
    /* 58EB0 80068EB0 21106200 */   addu      $v0, $v1, $v0
  .L80068EB4:
    /* 58EB4 80068EB4 E812838F */  lw         $v1, %gp_rel(qline)($gp)
    /* 58EB8 80068EB8 F012828F */  lw         $v0, %gp_rel(qtopline)($gp)
    /* 58EBC 80068EBC 00000000 */  nop
    /* 58EC0 80068EC0 0B006214 */  bne        $v1, $v0, .L80068EF0
    /* 58EC4 80068EC4 FEFF6224 */   addiu     $v0, $v1, -0x2
    /* 58EC8 80068EC8 CC12828F */  lw         $v0, %gp_rel(D_8011BA4C)($gp)
    /* 58ECC 80068ECC 00000000 */  nop
    /* 58ED0 80068ED0 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 58ED4 80068ED4 CC1282AF */  sw         $v0, %gp_rel(D_8011BA4C)($gp)
    /* 58ED8 80068ED8 06004104 */  bgez       $v0, .L80068EF4
    /* 58EDC 80068EDC F9FF8224 */   addiu     $v0, $a0, -0x7
    /* 58EE0 80068EE0 CC1282AF */  sw         $v0, %gp_rel(D_8011BA4C)($gp)
    /* 58EE4 80068EE4 BCA30108 */  j          .L80068EF0
    /* 58EE8 80068EE8 0C006224 */   addiu     $v0, $v1, 0xC
  .L80068EEC:
    /* 58EEC 80068EEC FEFF6224 */  addiu      $v0, $v1, -0x2
  .L80068EF0:
    /* 58EF0 80068EF0 E81282AF */  sw         $v0, %gp_rel(qline)($gp)
  .L80068EF4:
    /* 58EF4 80068EF4 C6F5000C */  jal        PlaySFX__Fi
    /* 58EF8 80068EF8 32000424 */   addiu     $a0, $zero, 0x32
  .L80068EFC:
    /* 58EFC 80068EFC 1000BF8F */  lw         $ra, 0x10($sp)
    /* 58F00 80068F00 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 58F04 80068F04 0800E003 */  jr         $ra
    /* 58F08 80068F08 00000000 */   nop
endlabel QuestlogUp__Fv
