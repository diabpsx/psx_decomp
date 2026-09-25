.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching secondarystream, 0x7C

glabel secondarystream
    /* 1D848 8002D848 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 1D84C 8002D84C 1800B2AF */  sw         $s2, 0x18($sp)
    /* 1D850 8002D850 21908000 */  addu       $s2, $a0, $zero
    /* 1D854 8002D854 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* 1D858 8002D858 2198A000 */  addu       $s3, $a1, $zero
    /* 1D85C 8002D85C 1180043C */  lui        $a0, %hi(D_8010FCE8)
    /* 1D860 8002D860 E8FC8424 */  addiu      $a0, $a0, %lo(D_8010FCE8)
    /* 1D864 8002D864 1400B1AF */  sw         $s1, 0x14($sp)
    /* 1D868 8002D868 A000D124 */  addiu      $s1, $a2, 0xA0
    /* 1D86C 8002D86C 21282002 */  addu       $a1, $s1, $zero
    /* 1D870 8002D870 2130E000 */  addu       $a2, $a3, $zero
    /* 1D874 8002D874 2000BFAF */  sw         $ra, 0x20($sp)
    /* 1D878 8002D878 74A9000C */  jal        reservememadr
    /* 1D87C 8002D87C 1000B0AF */   sw        $s0, 0x10($sp)
    /* 1D880 8002D880 21804000 */  addu       $s0, $v0, $zero
    /* 1D884 8002D884 21200002 */  addu       $a0, $s0, $zero
    /* 1D888 8002D888 A0B1000C */  jal        blockclear
    /* 1D88C 8002D88C 21282002 */   addu      $a1, $s1, $zero
    /* 1D890 8002D890 21200002 */  addu       $a0, $s0, $zero
    /* 1D894 8002D894 21284002 */  addu       $a1, $s2, $zero
    /* 1D898 8002D898 21306002 */  addu       $a2, $s3, $zero
    /* 1D89C 8002D89C E7B5000C */  jal        secondarystreamstruct
    /* 1D8A0 8002D8A0 21382002 */   addu      $a3, $s1, $zero
    /* 1D8A4 8002D8A4 2000BF8F */  lw         $ra, 0x20($sp)
    /* 1D8A8 8002D8A8 1C00B38F */  lw         $s3, 0x1C($sp)
    /* 1D8AC 8002D8AC 1800B28F */  lw         $s2, 0x18($sp)
    /* 1D8B0 8002D8B0 1400B18F */  lw         $s1, 0x14($sp)
    /* 1D8B4 8002D8B4 1000B08F */  lw         $s0, 0x10($sp)
    /* 1D8B8 8002D8B8 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 1D8BC 8002D8BC 0800E003 */  jr         $ra
    /* 1D8C0 8002D8C0 00000000 */   nop
endlabel secondarystream
