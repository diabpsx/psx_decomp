.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching initmemblocks, 0xA0

glabel initmemblocks
    /* 1B670 8002B670 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 1B674 8002B674 1800B0AF */  sw         $s0, 0x18($sp)
    /* 1B678 8002B678 21808000 */  addu       $s0, $a0, $zero
    /* 1B67C 8002B67C 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 1B680 8002B680 2188A000 */  addu       $s1, $a1, $zero
    /* 1B684 8002B684 0F00023C */  lui        $v0, (0xF4236 >> 16)
    /* 1B688 8002B688 36424234 */  ori        $v0, $v0, (0xF4236 & 0xFFFF)
    /* 1B68C 8002B68C F6FF2326 */  addiu      $v1, $s1, -0xA
    /* 1B690 8002B690 2B104300 */  sltu       $v0, $v0, $v1
    /* 1B694 8002B694 0C004010 */  beqz       $v0, .L8002B6C8
    /* 1B698 8002B698 2000BFAF */   sw        $ra, 0x20($sp)
    /* 1B69C 8002B69C 1180023C */  lui        $v0, %hi(D_8010F3D4)
    /* 1B6A0 8002B6A0 D4F34224 */  addiu      $v0, $v0, %lo(D_8010F3D4)
    /* 1B6A4 8002B6A4 1280013C */  lui        $at, %hi(abortfile)
    /* 1B6A8 8002B6A8 B8C322AC */  sw         $v0, %lo(abortfile)($at)
    /* 1B6AC 8002B6AC 8D050224 */  addiu      $v0, $zero, 0x58D
    /* 1B6B0 8002B6B0 1180043C */  lui        $a0, %hi(D_8010F840)
    /* 1B6B4 8002B6B4 40F88424 */  addiu      $a0, $a0, %lo(D_8010F840)
    /* 1B6B8 8002B6B8 1280013C */  lui        $at, %hi(abortline)
    /* 1B6BC 8002B6BC BCC322AC */  sw         $v0, %lo(abortline)($at)
    /* 1B6C0 8002B6C0 0F95000C */  jal        abortmessage
    /* 1B6C4 8002B6C4 00000000 */   nop
  .L8002B6C8:
    /* 1B6C8 8002B6C8 A02290AF */  sw         $s0, %gp_rel(emptyblock)($gp)
    /* 1B6CC 8002B6CC FFFF2326 */  addiu      $v1, $s1, -0x1
    /* 1B6D0 8002B6D0 08006018 */  blez       $v1, .L8002B6F4
    /* 1B6D4 8002B6D4 21200000 */   addu      $a0, $zero, $zero
    /* 1B6D8 8002B6D8 28000226 */  addiu      $v0, $s0, 0x28
  .L8002B6DC:
    /* 1B6DC 8002B6DC 200002AE */  sw         $v0, 0x20($s0)
    /* 1B6E0 8002B6E0 21804000 */  addu       $s0, $v0, $zero
    /* 1B6E4 8002B6E4 01008424 */  addiu      $a0, $a0, 0x1
    /* 1B6E8 8002B6E8 2A108300 */  slt        $v0, $a0, $v1
    /* 1B6EC 8002B6EC FBFF4014 */  bnez       $v0, .L8002B6DC
    /* 1B6F0 8002B6F0 28000226 */   addiu     $v0, $s0, 0x28
  .L8002B6F4:
    /* 1B6F4 8002B6F4 200000AE */  sw         $zero, 0x20($s0)
    /* 1B6F8 8002B6F8 2000BF8F */  lw         $ra, 0x20($sp)
    /* 1B6FC 8002B6FC 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 1B700 8002B700 1800B08F */  lw         $s0, 0x18($sp)
    /* 1B704 8002B704 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 1B708 8002B708 0800E003 */  jr         $ra
    /* 1B70C 8002B70C 00000000 */   nop
endlabel initmemblocks
