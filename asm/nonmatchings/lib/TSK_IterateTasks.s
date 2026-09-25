.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TSK_IterateTasks, 0x78

glabel TSK_IterateTasks
    /* 1086C 8002086C D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 10870 80020870 1400B1AF */  sw         $s1, 0x14($sp)
    /* 10874 80020874 21888000 */  addu       $s1, $a0, $zero
    /* 10878 80020878 1280043C */  lui        $a0, %hi(D_8011C98C)
    /* 1087C 8002087C 8CC9848C */  lw         $a0, %lo(D_8011C98C)($a0)
    /* 10880 80020880 1800B2AF */  sw         $s2, 0x18($sp)
    /* 10884 80020884 2190A000 */  addu       $s2, $a1, $zero
    /* 10888 80020888 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 1088C 8002088C 2198C000 */  addu       $s3, $a2, $zero
    /* 10890 80020890 2000BFAF */  sw         $ra, 0x20($sp)
    /* 10894 80020894 0B008010 */  beqz       $a0, .L800208C4
    /* 10898 80020898 1000B0AF */   sw        $s0, 0x10($sp)
  .L8002089C:
    /* 1089C 8002089C 0800828C */  lw         $v0, 0x8($a0)
    /* 108A0 800208A0 0000908C */  lw         $s0, 0x0($a0)
    /* 108A4 800208A4 24104202 */  and        $v0, $s2, $v0
    /* 108A8 800208A8 03005114 */  bne        $v0, $s1, .L800208B8
    /* 108AC 800208AC 00000000 */   nop
    /* 108B0 800208B0 09F86002 */  jalr       $s3
    /* 108B4 800208B4 00000000 */   nop
  .L800208B8:
    /* 108B8 800208B8 21200002 */  addu       $a0, $s0, $zero
    /* 108BC 800208BC F7FF8014 */  bnez       $a0, .L8002089C
    /* 108C0 800208C0 00000000 */   nop
  .L800208C4:
    /* 108C4 800208C4 2000BF8F */  lw         $ra, 0x20($sp)
    /* 108C8 800208C8 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 108CC 800208CC 1800B28F */  lw         $s2, 0x18($sp)
    /* 108D0 800208D0 1400B18F */  lw         $s1, 0x14($sp)
    /* 108D4 800208D4 1000B08F */  lw         $s0, 0x10($sp)
    /* 108D8 800208D8 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 108DC 800208DC 0800E003 */  jr         $ra
    /* 108E0 800208E0 00000000 */   nop
endlabel TSK_IterateTasks
