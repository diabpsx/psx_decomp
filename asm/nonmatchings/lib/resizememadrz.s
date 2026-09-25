.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching resizememadrz, 0x38

glabel resizememadrz
    /* 1BF70 8002BF70 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1BF74 8002BF74 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1BF78 8002BF78 1400BFAF */  sw         $ra, 0x14($sp)
    /* 1BF7C 8002BF7C B1AB000C */  jal        findmemblock
    /* 1BF80 8002BF80 2180A000 */   addu      $s0, $a1, $zero
    /* 1BF84 8002BF84 21204000 */  addu       $a0, $v0, $zero
    /* 1BF88 8002BF88 21280002 */  addu       $a1, $s0, $zero
    /* 1BF8C 8002BF8C FAAF000C */  jal        resizememblocka
    /* 1BF90 8002BF90 21300000 */   addu      $a2, $zero, $zero
    /* 1BF94 8002BF94 1400BF8F */  lw         $ra, 0x14($sp)
    /* 1BF98 8002BF98 1000B08F */  lw         $s0, 0x10($sp)
    /* 1BF9C 8002BF9C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1BFA0 8002BFA0 0800E003 */  jr         $ra
    /* 1BFA4 8002BFA4 00000000 */   nop
endlabel resizememadrz
