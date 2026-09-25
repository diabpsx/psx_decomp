.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GAL_HowManyUsedRegions, 0x68

glabel GAL_HowManyUsedRegions
    /* 12738 80022738 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1273C 8002273C 1000BFAF */  sw         $ra, 0x10($sp)
    /* 12740 80022740 FFFF023C */  lui        $v0, (0xFFFF7FFF >> 16)
    /* 12744 80022744 FF7F4234 */  ori        $v0, $v0, (0xFFFF7FFF & 0xFFFF)
    /* 12748 80022748 2687000C */  jal        GetMemInitInfoBlockFromType
    /* 1274C 8002274C 24208200 */   and       $a0, $a0, $v0
    /* 12750 80022750 0B004010 */  beqz       $v0, .L80022780
    /* 12754 80022754 00000000 */   nop
    /* 12758 80022758 2400428C */  lw         $v0, 0x24($v0)
    /* 1275C 8002275C 00000000 */  nop
    /* 12760 80022760 0A004010 */  beqz       $v0, .L8002278C
    /* 12764 80022764 21180000 */   addu      $v1, $zero, $zero
  .L80022768:
    /* 12768 80022768 0400428C */  lw         $v0, 0x4($v0)
    /* 1276C 8002276C 00000000 */  nop
    /* 12770 80022770 FDFF4014 */  bnez       $v0, .L80022768
    /* 12774 80022774 01006324 */   addiu     $v1, $v1, 0x1
    /* 12778 80022778 E4890008 */  j          .L80022790
    /* 1277C 8002277C 21106000 */   addu      $v0, $v1, $zero
  .L80022780:
    /* 12780 80022780 0389000C */  jal        GSetError
    /* 12784 80022784 04000434 */   ori       $a0, $zero, 0x4
    /* 12788 80022788 FFFF0324 */  addiu      $v1, $zero, -0x1
  .L8002278C:
    /* 1278C 8002278C 21106000 */  addu       $v0, $v1, $zero
  .L80022790:
    /* 12790 80022790 1000BF8F */  lw         $ra, 0x10($sp)
    /* 12794 80022794 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 12798 80022798 0800E003 */  jr         $ra
    /* 1279C 8002279C 00000000 */   nop
endlabel GAL_HowManyUsedRegions
