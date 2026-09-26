.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AmDrawPlayer__Fiiiii, 0x84

glabel AmDrawPlayer__Fiiiii
    /* 284A8 801620A0 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 284AC 801620A4 3800A28F */  lw         $v0, 0x38($sp)
    /* 284B0 801620A8 1000B0AF */  sw         $s0, 0x10($sp)
    /* 284B4 801620AC 21808000 */  addu       $s0, $a0, $zero
    /* 284B8 801620B0 1400B1AF */  sw         $s1, 0x14($sp)
    /* 284BC 801620B4 2188A000 */  addu       $s1, $a1, $zero
    /* 284C0 801620B8 1800B2AF */  sw         $s2, 0x18($sp)
    /* 284C4 801620BC 2190C000 */  addu       $s2, $a2, $zero
    /* 284C8 801620C0 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 284CC 801620C4 2198E000 */  addu       $s3, $a3, $zero
    /* 284D0 801620C8 05004014 */  bnez       $v0, .L801620E0
    /* 284D4 801620CC 2000BFAF */   sw        $ra, 0x20($sp)
    /* 284D8 801620D0 20000424 */  addiu      $a0, $zero, 0x20
    /* 284DC 801620D4 FF000524 */  addiu      $a1, $zero, 0xFF
    /* 284E0 801620D8 3B880508 */  j          .L801620EC
    /* 284E4 801620DC 21300000 */   addu      $a2, $zero, $zero
  .L801620E0:
    /* 284E8 801620E0 FF000424 */  addiu      $a0, $zero, 0xFF
    /* 284EC 801620E4 21280000 */  addu       $a1, $zero, $zero
    /* 284F0 801620E8 E0000624 */  addiu      $a2, $zero, 0xE0
  .L801620EC:
    /* 284F4 801620EC FA87050C */  jal        AMGetLine__FUcUcUc
    /* 284F8 801620F0 00000000 */   nop
    /* 284FC 801620F4 080050A4 */  sh         $s0, 0x8($v0)
    /* 28500 801620F8 0A0051A4 */  sh         $s1, 0xA($v0)
    /* 28504 801620FC 0C0052A4 */  sh         $s2, 0xC($v0)
    /* 28508 80162100 0E0053A4 */  sh         $s3, 0xE($v0)
    /* 2850C 80162104 2000BF8F */  lw         $ra, 0x20($sp)
    /* 28510 80162108 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 28514 8016210C 1800B28F */  lw         $s2, 0x18($sp)
    /* 28518 80162110 1400B18F */  lw         $s1, 0x14($sp)
    /* 2851C 80162114 1000B08F */  lw         $s0, 0x10($sp)
    /* 28520 80162118 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 28524 8016211C 0800E003 */  jr         $ra
    /* 28528 80162120 00000000 */   nop
endlabel AmDrawPlayer__Fiiiii
