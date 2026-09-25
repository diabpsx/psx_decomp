.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching streamspace, 0x90

glabel streamspace
    /* 1EF60 8002EF60 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1EF64 8002EF64 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1EF68 8002EF68 1400BFAF */  sw         $ra, 0x14($sp)
    /* 1EF6C 8002EF6C A2BB000C */  jal        releasechunks
    /* 1EF70 8002EF70 21808000 */   addu      $s0, $a0, $zero
    /* 1EF74 8002EF74 1800028E */  lw         $v0, 0x18($s0)
    /* 1EF78 8002EF78 0C00038E */  lw         $v1, 0xC($s0)
    /* 1EF7C 8002EF7C 00000000 */  nop
    /* 1EF80 8002EF80 2B104300 */  sltu       $v0, $v0, $v1
    /* 1EF84 8002EF84 04004010 */  beqz       $v0, .L8002EF98
    /* 1EF88 8002EF88 00000000 */   nop
    /* 1EF8C 8002EF8C 0800038E */  lw         $v1, 0x8($s0)
    /* 1EF90 8002EF90 F4BB0008 */  j          .L8002EFD0
    /* 1EF94 8002EF94 00000000 */   nop
  .L8002EF98:
    /* 1EF98 8002EF98 1800038E */  lw         $v1, 0x18($s0)
    /* 1EF9C 8002EF9C 0C00028E */  lw         $v0, 0xC($s0)
    /* 1EFA0 8002EFA0 00000000 */  nop
    /* 1EFA4 8002EFA4 09006214 */  bne        $v1, $v0, .L8002EFCC
    /* 1EFA8 8002EFA8 00000000 */   nop
    /* 1EFAC 8002EFAC 1800038E */  lw         $v1, 0x18($s0)
    /* 1EFB0 8002EFB0 1400028E */  lw         $v0, 0x14($s0)
    /* 1EFB4 8002EFB4 00000000 */  nop
    /* 1EFB8 8002EFB8 04006214 */  bne        $v1, $v0, .L8002EFCC
    /* 1EFBC 8002EFBC 00000000 */   nop
    /* 1EFC0 8002EFC0 0800038E */  lw         $v1, 0x8($s0)
    /* 1EFC4 8002EFC4 F4BB0008 */  j          .L8002EFD0
    /* 1EFC8 8002EFC8 00000000 */   nop
  .L8002EFCC:
    /* 1EFCC 8002EFCC 1800038E */  lw         $v1, 0x18($s0)
  .L8002EFD0:
    /* 1EFD0 8002EFD0 0C00028E */  lw         $v0, 0xC($s0)
    /* 1EFD4 8002EFD4 00000000 */  nop
    /* 1EFD8 8002EFD8 23106200 */  subu       $v0, $v1, $v0
    /* 1EFDC 8002EFDC 1400BF8F */  lw         $ra, 0x14($sp)
    /* 1EFE0 8002EFE0 1000B08F */  lw         $s0, 0x10($sp)
    /* 1EFE4 8002EFE4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1EFE8 8002EFE8 0800E003 */  jr         $ra
    /* 1EFEC 8002EFEC 00000000 */   nop
endlabel streamspace
