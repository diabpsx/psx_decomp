.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching findnamedmemblockinclass, 0x98

glabel findnamedmemblockinclass
    /* 1B258 8002B258 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 1B25C 8002B25C 000FA530 */  andi       $a1, $a1, 0xF00
    /* 1B260 8002B260 032A0500 */  sra        $a1, $a1, 8
    /* 1B264 8002B264 40100500 */  sll        $v0, $a1, 1
    /* 1B268 8002B268 21104500 */  addu       $v0, $v0, $a1
    /* 1B26C 8002B26C C0100200 */  sll        $v0, $v0, 3
    /* 1B270 8002B270 1380033C */  lui        $v1, %hi(memclass)
    /* 1B274 8002B274 307A6324 */  addiu      $v1, $v1, %lo(memclass)
    /* 1B278 8002B278 1400B1AF */  sw         $s1, 0x14($sp)
    /* 1B27C 8002B27C 21884300 */  addu       $s1, $v0, $v1
    /* 1B280 8002B280 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 1B284 8002B284 1800B2AF */  sw         $s2, 0x18($sp)
    /* 1B288 8002B288 46BD000C */  jal        filename
    /* 1B28C 8002B28C 1000B0AF */   sw        $s0, 0x10($sp)
    /* 1B290 8002B290 0000308E */  lw         $s0, 0x0($s1)
    /* 1B294 8002B294 0400238E */  lw         $v1, 0x4($s1)
    /* 1B298 8002B298 00000000 */  nop
    /* 1B29C 8002B29C 0C000312 */  beq        $s0, $v1, .L8002B2D0
    /* 1B2A0 8002B2A0 21904000 */   addu      $s2, $v0, $zero
    /* 1B2A4 8002B2A4 21204002 */  addu       $a0, $s2, $zero
  .L8002B2A8:
    /* 1B2A8 8002B2A8 04000526 */  addiu      $a1, $s0, 0x4
    /* 1B2AC 8002B2AC 4375000C */  jal        strncmp
    /* 1B2B0 8002B2B0 0C000624 */   addiu     $a2, $zero, 0xC
    /* 1B2B4 8002B2B4 07004010 */  beqz       $v0, .L8002B2D4
    /* 1B2B8 8002B2B8 21100002 */   addu      $v0, $s0, $zero
    /* 1B2BC 8002B2BC 2000108E */  lw         $s0, 0x20($s0)
    /* 1B2C0 8002B2C0 0400228E */  lw         $v0, 0x4($s1)
    /* 1B2C4 8002B2C4 00000000 */  nop
    /* 1B2C8 8002B2C8 F7FF0216 */  bne        $s0, $v0, .L8002B2A8
    /* 1B2CC 8002B2CC 21204002 */   addu      $a0, $s2, $zero
  .L8002B2D0:
    /* 1B2D0 8002B2D0 21100000 */  addu       $v0, $zero, $zero
  .L8002B2D4:
    /* 1B2D4 8002B2D4 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 1B2D8 8002B2D8 1800B28F */  lw         $s2, 0x18($sp)
    /* 1B2DC 8002B2DC 1400B18F */  lw         $s1, 0x14($sp)
    /* 1B2E0 8002B2E0 1000B08F */  lw         $s0, 0x10($sp)
    /* 1B2E4 8002B2E4 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 1B2E8 8002B2E8 0800E003 */  jr         $ra
    /* 1B2EC 8002B2EC 00000000 */   nop
endlabel findnamedmemblockinclass
