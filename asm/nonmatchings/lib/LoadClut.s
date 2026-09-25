.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching LoadClut, 0x64

glabel LoadClut
    /* 2E64 80012E64 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 2E68 80012E68 21108000 */  addu       $v0, $a0, $zero
    /* 2E6C 80012E6C 1800B0AF */  sw         $s0, 0x18($sp)
    /* 2E70 80012E70 2180A000 */  addu       $s0, $a1, $zero
    /* 2E74 80012E74 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 2E78 80012E78 2188C000 */  addu       $s1, $a2, $zero
    /* 2E7C 80012E7C 1000A427 */  addiu      $a0, $sp, 0x10
    /* 2E80 80012E80 21284000 */  addu       $a1, $v0, $zero
    /* 2E84 80012E84 00010224 */  addiu      $v0, $zero, 0x100
    /* 2E88 80012E88 1400A2A7 */  sh         $v0, 0x14($sp)
    /* 2E8C 80012E8C 01000224 */  addiu      $v0, $zero, 0x1
    /* 2E90 80012E90 2000BFAF */  sw         $ra, 0x20($sp)
    /* 2E94 80012E94 1000B0A7 */  sh         $s0, 0x10($sp)
    /* 2E98 80012E98 1200B1A7 */  sh         $s1, 0x12($sp)
    /* 2E9C 80012E9C 494F000C */  jal        LoadImage
    /* 2EA0 80012EA0 1600A2A7 */   sh        $v0, 0x16($sp)
    /* 2EA4 80012EA4 21200002 */  addu       $a0, $s0, $zero
    /* 2EA8 80012EA8 164C000C */  jal        GetClut
    /* 2EAC 80012EAC 21282002 */   addu      $a1, $s1, $zero
    /* 2EB0 80012EB0 FFFF4230 */  andi       $v0, $v0, 0xFFFF
    /* 2EB4 80012EB4 2000BF8F */  lw         $ra, 0x20($sp)
    /* 2EB8 80012EB8 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 2EBC 80012EBC 1800B08F */  lw         $s0, 0x18($sp)
    /* 2EC0 80012EC0 0800E003 */  jr         $ra
    /* 2EC4 80012EC4 2800BD27 */   addiu     $sp, $sp, 0x28
endlabel LoadClut
