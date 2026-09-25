.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PutLong, 0x4C

glabel PutLong
    /* 132BC 800232BC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 132C0 800232C0 1400BFAF */  sw         $ra, 0x14($sp)
    /* 132C4 800232C4 1000B0AF */  sw         $s0, 0x10($sp)
    /* 132C8 800232C8 21808000 */  addu       $s0, $a0, $zero
    /* 132CC 800232CC 9B8C000C */  jal        SwapByte
    /* 132D0 800232D0 02261000 */   srl       $a0, $s0, 24
    /* 132D4 800232D4 02241000 */  srl        $a0, $s0, 16
    /* 132D8 800232D8 9B8C000C */  jal        SwapByte
    /* 132DC 800232DC FF008430 */   andi      $a0, $a0, 0xFF
    /* 132E0 800232E0 02221000 */  srl        $a0, $s0, 8
    /* 132E4 800232E4 9B8C000C */  jal        SwapByte
    /* 132E8 800232E8 FF008430 */   andi      $a0, $a0, 0xFF
    /* 132EC 800232EC 9B8C000C */  jal        SwapByte
    /* 132F0 800232F0 FF000432 */   andi      $a0, $s0, 0xFF
    /* 132F4 800232F4 1400BF8F */  lw         $ra, 0x14($sp)
    /* 132F8 800232F8 1000B08F */  lw         $s0, 0x10($sp)
    /* 132FC 800232FC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 13300 80023300 0800E003 */  jr         $ra
    /* 13304 80023304 00000000 */   nop
endlabel PutLong
