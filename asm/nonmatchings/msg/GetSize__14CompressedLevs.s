.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetSize__14CompressedLevs, 0x3C

glabel GetSize__14CompressedLevs
    /* 42A54 80052A54 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 42A58 80052A58 1000B0AF */  sw         $s0, 0x10($sp)
    /* 42A5C 80052A5C 21808000 */  addu       $s0, $a0, $zero
    /* 42A60 80052A60 1400BFAF */  sw         $ra, 0x14($sp)
    /* 42A64 80052A64 B000048E */  lw         $a0, 0xB0($s0)
    /* 42A68 80052A68 F889000C */  jal        GAL_AlignSizeToType
    /* 42A6C 80052A6C 01000524 */   addiu     $a1, $zero, 0x1
    /* 42A70 80052A70 5800038E */  lw         $v1, 0x58($s0)
    /* 42A74 80052A74 00000000 */  nop
    /* 42A78 80052A78 21106200 */  addu       $v0, $v1, $v0
    /* 42A7C 80052A7C 1400BF8F */  lw         $ra, 0x14($sp)
    /* 42A80 80052A80 1000B08F */  lw         $s0, 0x10($sp)
    /* 42A84 80052A84 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 42A88 80052A88 0800E003 */  jr         $ra
    /* 42A8C 80052A8C 00000000 */   nop
endlabel GetSize__14CompressedLevs
