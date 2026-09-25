.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching resizememadr, 0x38

glabel resizememadr
    /* 1BF38 8002BF38 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1BF3C 8002BF3C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1BF40 8002BF40 1400BFAF */  sw         $ra, 0x14($sp)
    /* 1BF44 8002BF44 B1AB000C */  jal        findmemblock
    /* 1BF48 8002BF48 2180A000 */   addu      $s0, $a1, $zero
    /* 1BF4C 8002BF4C 21204000 */  addu       $a0, $v0, $zero
    /* 1BF50 8002BF50 21280002 */  addu       $a1, $s0, $zero
    /* 1BF54 8002BF54 FAAF000C */  jal        resizememblocka
    /* 1BF58 8002BF58 01000624 */   addiu     $a2, $zero, 0x1
    /* 1BF5C 8002BF5C 1400BF8F */  lw         $ra, 0x14($sp)
    /* 1BF60 8002BF60 1000B08F */  lw         $s0, 0x10($sp)
    /* 1BF64 8002BF64 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1BF68 8002BF68 0800E003 */  jr         $ra
    /* 1BF6C 8002BF6C 00000000 */   nop
endlabel resizememadr
