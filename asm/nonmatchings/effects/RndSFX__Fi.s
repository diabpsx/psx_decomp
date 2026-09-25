.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching RndSFX__Fi, 0xA8

glabel RndSFX__Fi
    /* 2D670 8003D670 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 2D674 8003D674 1000B0AF */  sw         $s0, 0x10($sp)
    /* 2D678 8003D678 21808000 */  addu       $s0, $a0, $zero
    /* 2D67C 8003D67C 16030224 */  addiu      $v0, $zero, 0x316
    /* 2D680 8003D680 14000212 */  beq        $s0, $v0, .L8003D6D4
    /* 2D684 8003D684 1400BFAF */   sw        $ra, 0x14($sp)
    /* 2D688 8003D688 D9020224 */  addiu      $v0, $zero, 0x2D9
    /* 2D68C 8003D68C 19000212 */  beq        $s0, $v0, .L8003D6F4
    /* 2D690 8003D690 DC020224 */   addiu     $v0, $zero, 0x2DC
    /* 2D694 8003D694 17000212 */  beq        $s0, $v0, .L8003D6F4
    /* 2D698 8003D698 DF020224 */   addiu     $v0, $zero, 0x2DF
    /* 2D69C 8003D69C 15000212 */  beq        $s0, $v0, .L8003D6F4
    /* 2D6A0 8003D6A0 40020224 */   addiu     $v0, $zero, 0x240
    /* 2D6A4 8003D6A4 0B000212 */  beq        $s0, $v0, .L8003D6D4
    /* 2D6A8 8003D6A8 A8020224 */   addiu     $v0, $zero, 0x2A8
    /* 2D6AC 8003D6AC 09000212 */  beq        $s0, $v0, .L8003D6D4
    /* 2D6B0 8003D6B0 09000224 */   addiu     $v0, $zero, 0x9
    /* 2D6B4 8003D6B4 07000212 */  beq        $s0, $v0, .L8003D6D4
    /* 2D6B8 8003D6B8 43000224 */   addiu     $v0, $zero, 0x43
    /* 2D6BC 8003D6BC 05000212 */  beq        $s0, $v0, .L8003D6D4
    /* 2D6C0 8003D6C0 2C000224 */   addiu     $v0, $zero, 0x2C
    /* 2D6C4 8003D6C4 03000212 */  beq        $s0, $v0, .L8003D6D4
    /* 2D6C8 8003D6C8 10000224 */   addiu     $v0, $zero, 0x10
    /* 2D6CC 8003D6CC 03000216 */  bne        $s0, $v0, .L8003D6DC
    /* 2D6D0 8003D6D0 00000000 */   nop
  .L8003D6D4:
    /* 2D6D4 8003D6D4 BEF50008 */  j          .L8003D6F8
    /* 2D6D8 8003D6D8 02000424 */   addiu     $a0, $zero, 0x2
  .L8003D6DC:
    /* 2D6DC 8003D6DC 03000016 */  bnez       $s0, .L8003D6EC
    /* 2D6E0 8003D6E0 CD020224 */   addiu     $v0, $zero, 0x2CD
    /* 2D6E4 8003D6E4 C1F50008 */  j          .L8003D704
    /* 2D6E8 8003D6E8 02000224 */   addiu     $v0, $zero, 0x2
  .L8003D6EC:
    /* 2D6EC 8003D6EC 05000216 */  bne        $s0, $v0, .L8003D704
    /* 2D6F0 8003D6F0 21100002 */   addu      $v0, $s0, $zero
  .L8003D6F4:
    /* 2D6F4 8003D6F4 03000424 */  addiu      $a0, $zero, 0x3
  .L8003D6F8:
    /* 2D6F8 8003D6F8 C9F6000C */  jal        ENG_random__Fl
    /* 2D6FC 8003D6FC 00000000 */   nop
    /* 2D700 8003D700 21100202 */  addu       $v0, $s0, $v0
  .L8003D704:
    /* 2D704 8003D704 1400BF8F */  lw         $ra, 0x14($sp)
    /* 2D708 8003D708 1000B08F */  lw         $s0, 0x10($sp)
    /* 2D70C 8003D70C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 2D710 8003D710 0800E003 */  jr         $ra
    /* 2D714 8003D714 00000000 */   nop
endlabel RndSFX__Fi
