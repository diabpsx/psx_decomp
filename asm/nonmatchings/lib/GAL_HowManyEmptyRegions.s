.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GAL_HowManyEmptyRegions, 0x68

glabel GAL_HowManyEmptyRegions
    /* 126D0 800226D0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 126D4 800226D4 1000BFAF */  sw         $ra, 0x10($sp)
    /* 126D8 800226D8 FFFF023C */  lui        $v0, (0xFFFF7FFF >> 16)
    /* 126DC 800226DC FF7F4234 */  ori        $v0, $v0, (0xFFFF7FFF & 0xFFFF)
    /* 126E0 800226E0 2687000C */  jal        GetMemInitInfoBlockFromType
    /* 126E4 800226E4 24208200 */   and       $a0, $a0, $v0
    /* 126E8 800226E8 0B004010 */  beqz       $v0, .L80022718
    /* 126EC 800226EC 00000000 */   nop
    /* 126F0 800226F0 2000428C */  lw         $v0, 0x20($v0)
    /* 126F4 800226F4 00000000 */  nop
    /* 126F8 800226F8 0A004010 */  beqz       $v0, .L80022724
    /* 126FC 800226FC 21180000 */   addu      $v1, $zero, $zero
  .L80022700:
    /* 12700 80022700 0400428C */  lw         $v0, 0x4($v0)
    /* 12704 80022704 00000000 */  nop
    /* 12708 80022708 FDFF4014 */  bnez       $v0, .L80022700
    /* 1270C 8002270C 01006324 */   addiu     $v1, $v1, 0x1
    /* 12710 80022710 CA890008 */  j          .L80022728
    /* 12714 80022714 21106000 */   addu      $v0, $v1, $zero
  .L80022718:
    /* 12718 80022718 0389000C */  jal        GSetError
    /* 1271C 8002271C 04000434 */   ori       $a0, $zero, 0x4
    /* 12720 80022720 FFFF0324 */  addiu      $v1, $zero, -0x1
  .L80022724:
    /* 12724 80022724 21106000 */  addu       $v0, $v1, $zero
  .L80022728:
    /* 12728 80022728 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1272C 8002272C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 12730 80022730 0800E003 */  jr         $ra
    /* 12734 80022734 00000000 */   nop
endlabel GAL_HowManyEmptyRegions
