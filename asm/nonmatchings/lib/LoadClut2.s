.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching LoadClut2, 0x64

glabel LoadClut2
    /* 2EC8 80012EC8 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 2ECC 80012ECC 21108000 */  addu       $v0, $a0, $zero
    /* 2ED0 80012ED0 1800B0AF */  sw         $s0, 0x18($sp)
    /* 2ED4 80012ED4 2180A000 */  addu       $s0, $a1, $zero
    /* 2ED8 80012ED8 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 2EDC 80012EDC 2188C000 */  addu       $s1, $a2, $zero
    /* 2EE0 80012EE0 1000A427 */  addiu      $a0, $sp, 0x10
    /* 2EE4 80012EE4 21284000 */  addu       $a1, $v0, $zero
    /* 2EE8 80012EE8 10000224 */  addiu      $v0, $zero, 0x10
    /* 2EEC 80012EEC 1400A2A7 */  sh         $v0, 0x14($sp)
    /* 2EF0 80012EF0 01000224 */  addiu      $v0, $zero, 0x1
    /* 2EF4 80012EF4 2000BFAF */  sw         $ra, 0x20($sp)
    /* 2EF8 80012EF8 1000B0A7 */  sh         $s0, 0x10($sp)
    /* 2EFC 80012EFC 1200B1A7 */  sh         $s1, 0x12($sp)
    /* 2F00 80012F00 494F000C */  jal        LoadImage
    /* 2F04 80012F04 1600A2A7 */   sh        $v0, 0x16($sp)
    /* 2F08 80012F08 21200002 */  addu       $a0, $s0, $zero
    /* 2F0C 80012F0C 164C000C */  jal        GetClut
    /* 2F10 80012F10 21282002 */   addu      $a1, $s1, $zero
    /* 2F14 80012F14 FFFF4230 */  andi       $v0, $v0, 0xFFFF
    /* 2F18 80012F18 2000BF8F */  lw         $ra, 0x20($sp)
    /* 2F1C 80012F1C 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 2F20 80012F20 1800B08F */  lw         $s0, 0x18($sp)
    /* 2F24 80012F24 0800E003 */  jr         $ra
    /* 2F28 80012F28 2800BD27 */   addiu     $sp, $sp, 0x28
endlabel LoadClut2
