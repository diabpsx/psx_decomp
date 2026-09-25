.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DDXclose, 0x4C

glabel DDXclose
    /* 134D4 800234D4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 134D8 800234D8 1400BFAF */  sw         $ra, 0x14($sp)
    /* 134DC 800234DC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 134E0 800234E0 21808000 */  addu       $s0, $a0, $zero
    /* 134E4 800234E4 9B8C000C */  jal        SwapByte
    /* 134E8 800234E8 FE000434 */   ori       $a0, $zero, 0xFE
    /* 134EC 800234EC 9B8C000C */  jal        SwapByte
    /* 134F0 800234F0 63000434 */   ori       $a0, $zero, 0x63
    /* 134F4 800234F4 AF8C000C */  jal        PutLong
    /* 134F8 800234F8 21200002 */   addu      $a0, $s0, $zero
    /* 134FC 800234FC 9B8C000C */  jal        SwapByte
    /* 13500 80023500 21200000 */   addu      $a0, $zero, $zero
    /* 13504 80023504 C28C000C */  jal        GetLong
    /* 13508 80023508 00000000 */   nop
    /* 1350C 8002350C 1400BF8F */  lw         $ra, 0x14($sp)
    /* 13510 80023510 1000B08F */  lw         $s0, 0x10($sp)
    /* 13514 80023514 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 13518 80023518 0800E003 */  jr         $ra
    /* 1351C 8002351C 00000000 */   nop
endlabel DDXclose
