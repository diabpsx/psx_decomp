.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SetGraphics__7CBlocksPP7TextDatPii, 0x5C

glabel SetGraphics__7CBlocksPP7TextDatPii
    /* 7DAB8 8008DAB8 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 7DABC 8008DABC 1800B2AF */  sw         $s2, 0x18($sp)
    /* 7DAC0 8008DAC0 1000B0AF */  sw         $s0, 0x10($sp)
    /* 7DAC4 8008DAC4 2180C000 */  addu       $s0, $a2, $zero
    /* 7DAC8 8008DAC8 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 7DACC 8008DACC 1400B1AF */  sw         $s1, 0x14($sp)
    /* 7DAD0 8008DAD0 0000028E */  lw         $v0, 0x0($s0)
    /* 7DAD4 8008DAD4 2188E000 */  addu       $s1, $a3, $zero
    /* 7DAD8 8008DAD8 07002212 */  beq        $s1, $v0, .L8008DAF8
    /* 7DADC 8008DADC 2190A000 */   addu      $s2, $a1, $zero
    /* 7DAE0 8008DAE0 C536020C */  jal        DumpGraphics__7CBlocksPP7TextDatPi
    /* 7DAE4 8008DAE4 00000000 */   nop
    /* 7DAE8 8008DAE8 21202002 */  addu       $a0, $s1, $zero
    /* 7DAEC 8008DAEC 044F020C */  jal        GM_UseTexData__Fi
    /* 7DAF0 8008DAF0 000004AE */   sw        $a0, 0x0($s0)
    /* 7DAF4 8008DAF4 000042AE */  sw         $v0, 0x0($s2)
  .L8008DAF8:
    /* 7DAF8 8008DAF8 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 7DAFC 8008DAFC 1800B28F */  lw         $s2, 0x18($sp)
    /* 7DB00 8008DB00 1400B18F */  lw         $s1, 0x14($sp)
    /* 7DB04 8008DB04 1000B08F */  lw         $s0, 0x10($sp)
    /* 7DB08 8008DB08 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 7DB0C 8008DB0C 0800E003 */  jr         $ra
    /* 7DB10 8008DB10 00000000 */   nop
endlabel SetGraphics__7CBlocksPP7TextDatPii
