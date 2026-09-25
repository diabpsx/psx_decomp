.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetOtPos__7CBlocksi_800a0984, 0x3C

glabel GetOtPos__7CBlocksi_800a0984
    /* 90984 800A0984 C2008284 */  lh         $v0, 0xC2($a0)
    /* 90988 800A0988 1280033C */  lui        $v1, %hi(PosAdj)
    /* 9098C 800A098C ACAC638C */  lw         $v1, %lo(PosAdj)($v1)
    /* 90990 800A0990 21104500 */  addu       $v0, $v0, $a1
    /* 90994 800A0994 21184300 */  addu       $v1, $v0, $v1
    /* 90998 800A0998 BDFF6228 */  slti       $v0, $v1, -0x43
    /* 9099C 800A099C 03004010 */  beqz       $v0, .L800A09AC
    /* 909A0 800A09A0 9C016228 */   slti      $v0, $v1, 0x19C
    /* 909A4 800A09A4 BDFF0324 */  addiu      $v1, $zero, -0x43
    /* 909A8 800A09A8 9C016228 */  slti       $v0, $v1, 0x19C
  .L800A09AC:
    /* 909AC 800A09AC 02004014 */  bnez       $v0, .L800A09B8
    /* 909B0 800A09B0 00000000 */   nop
    /* 909B4 800A09B4 9B010324 */  addiu      $v1, $zero, 0x19B
  .L800A09B8:
    /* 909B8 800A09B8 0800E003 */  jr         $ra
    /* 909BC 800A09BC 4D006224 */   addiu     $v0, $v1, 0x4D
endlabel GetOtPos__7CBlocksi_800a0984
