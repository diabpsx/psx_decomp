.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetOtPos__7CBlocksi_80096760, 0x3C

glabel GetOtPos__7CBlocksi_80096760
    /* 86760 80096760 C2008284 */  lh         $v0, 0xC2($a0)
    /* 86764 80096764 1280033C */  lui        $v1, %hi(PosAdj)
    /* 86768 80096768 ACAC638C */  lw         $v1, %lo(PosAdj)($v1)
    /* 8676C 8009676C 21104500 */  addu       $v0, $v0, $a1
    /* 86770 80096770 21184300 */  addu       $v1, $v0, $v1
    /* 86774 80096774 BDFF6228 */  slti       $v0, $v1, -0x43
    /* 86778 80096778 03004010 */  beqz       $v0, .L80096788
    /* 8677C 8009677C 9C016228 */   slti      $v0, $v1, 0x19C
    /* 86780 80096780 BDFF0324 */  addiu      $v1, $zero, -0x43
    /* 86784 80096784 9C016228 */  slti       $v0, $v1, 0x19C
  .L80096788:
    /* 86788 80096788 02004014 */  bnez       $v0, .L80096794
    /* 8678C 8009678C 00000000 */   nop
    /* 86790 80096790 9B010324 */  addiu      $v1, $zero, 0x19B
  .L80096794:
    /* 86794 80096794 0800E003 */  jr         $ra
    /* 86798 80096798 4D006224 */   addiu     $v0, $v1, 0x4D
endlabel GetOtPos__7CBlocksi_80096760
