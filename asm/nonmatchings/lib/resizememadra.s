.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching resizememadra, 0x44

glabel resizememadra
    /* 1BEF4 8002BEF4 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 1BEF8 8002BEF8 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1BEFC 8002BEFC 2180A000 */  addu       $s0, $a1, $zero
    /* 1BF00 8002BF00 1400B1AF */  sw         $s1, 0x14($sp)
    /* 1BF04 8002BF04 1800BFAF */  sw         $ra, 0x18($sp)
    /* 1BF08 8002BF08 B1AB000C */  jal        findmemblock
    /* 1BF0C 8002BF0C 2188C000 */   addu      $s1, $a2, $zero
    /* 1BF10 8002BF10 21204000 */  addu       $a0, $v0, $zero
    /* 1BF14 8002BF14 21280002 */  addu       $a1, $s0, $zero
    /* 1BF18 8002BF18 FAAF000C */  jal        resizememblocka
    /* 1BF1C 8002BF1C 21302002 */   addu      $a2, $s1, $zero
    /* 1BF20 8002BF20 1800BF8F */  lw         $ra, 0x18($sp)
    /* 1BF24 8002BF24 1400B18F */  lw         $s1, 0x14($sp)
    /* 1BF28 8002BF28 1000B08F */  lw         $s0, 0x10($sp)
    /* 1BF2C 8002BF2C 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 1BF30 8002BF30 0800E003 */  jr         $ra
    /* 1BF34 8002BF34 00000000 */   nop
endlabel resizememadra
