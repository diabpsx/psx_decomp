.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetOtPos__7CBlocksi_80091cc0, 0x38

glabel GetOtPos__7CBlocksi_80091cc0
    /* 81CC0 80091CC0 C2008284 */  lh         $v0, 0xC2($a0)
    /* 81CC4 80091CC4 2C05838F */  lw         $v1, %gp_rel(PosAdj)($gp)
    /* 81CC8 80091CC8 21104500 */  addu       $v0, $v0, $a1
    /* 81CCC 80091CCC 21184300 */  addu       $v1, $v0, $v1
    /* 81CD0 80091CD0 BDFF6228 */  slti       $v0, $v1, -0x43
    /* 81CD4 80091CD4 03004010 */  beqz       $v0, .L80091CE4
    /* 81CD8 80091CD8 9C016228 */   slti      $v0, $v1, 0x19C
    /* 81CDC 80091CDC BDFF0324 */  addiu      $v1, $zero, -0x43
    /* 81CE0 80091CE0 9C016228 */  slti       $v0, $v1, 0x19C
  .L80091CE4:
    /* 81CE4 80091CE4 02004014 */  bnez       $v0, .L80091CF0
    /* 81CE8 80091CE8 00000000 */   nop
    /* 81CEC 80091CEC 9B010324 */  addiu      $v1, $zero, 0x19B
  .L80091CF0:
    /* 81CF0 80091CF0 0800E003 */  jr         $ra
    /* 81CF4 80091CF4 4D006224 */   addiu     $v0, $v1, 0x4D
endlabel GetOtPos__7CBlocksi_80091cc0
