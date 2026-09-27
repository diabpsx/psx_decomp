.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MakePal__8PalEntryUsUsi, 0xA0

glabel MakePal__8PalEntryUsUsi
    /* 8AF50 8009AF50 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 8AF54 8009AF54 2000B2AF */  sw         $s2, 0x20($sp)
    /* 8AF58 8009AF58 21908000 */  addu       $s2, $a0, $zero
    /* 8AF5C 8009AF5C 1800B0AF */  sw         $s0, 0x18($sp)
    /* 8AF60 8009AF60 2180A000 */  addu       $s0, $a1, $zero
    /* 8AF64 8009AF64 1C00B1AF */  sw         $s1, 0x1C($sp)
    /* 8AF68 8009AF68 FFFF1132 */  andi       $s1, $s0, 0xFFFF
    /* 8AF6C 8009AF6C 21282002 */  addu       $a1, $s1, $zero
    /* 8AF70 8009AF70 2400BFAF */  sw         $ra, 0x24($sp)
    /* 8AF74 8009AF74 8B6C020C */  jal        Set__8PalEntryUsUsi
    /* 8AF78 8009AF78 FFFFC630 */   andi      $a2, $a2, 0xFFFF
    /* 8AF7C 8009AF7C 3F001032 */  andi       $s0, $s0, 0x3F
    /* 8AF80 8009AF80 00811000 */  sll        $s0, $s0, 4
    /* 8AF84 8009AF84 82891100 */  srl        $s1, $s1, 6
    /* 8AF88 8009AF88 1000B0A7 */  sh         $s0, 0x10($sp)
    /* 8AF8C 8009AF8C 1200B1A7 */  sh         $s1, 0x12($sp)
    /* 8AF90 8009AF90 12004296 */  lhu        $v0, 0x12($s2)
    /* 8AF94 8009AF94 01000324 */  addiu      $v1, $zero, 0x1
    /* 8AF98 8009AF98 1600A3A7 */  sh         $v1, 0x16($sp)
    /* 8AF9C 8009AF9C FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 8AFA0 8009AFA0 1400A2A7 */  sh         $v0, 0x14($sp)
    /* 8AFA4 8009AFA4 0A004596 */  lhu        $a1, 0xA($s2)
    /* 8AFA8 8009AFA8 0C004696 */  lhu        $a2, 0xC($s2)
    /* 8AFAC 8009AFAC D50D020C */  jal        GPUQ_MoveImage__FP4RECTii
    /* 8AFB0 8009AFB0 1000A427 */   addiu     $a0, $sp, 0x10
    /* 8AFB4 8009AFB4 01000624 */  addiu      $a2, $zero, 0x1
    /* 8AFB8 8009AFB8 08004726 */  addiu      $a3, $s2, 0x8
    /* 8AFBC 8009AFBC 0A004496 */  lhu        $a0, 0xA($s2)
    /* 8AFC0 8009AFC0 12004296 */  lhu        $v0, 0x12($s2)
    /* 8AFC4 8009AFC4 0C004596 */  lhu        $a1, 0xC($s2)
    /* 8AFC8 8009AFC8 21208200 */  addu       $a0, $a0, $v0
    /* 8AFCC 8009AFCC AE0D020C */  jal        GPUQ_LoadClutAddr__FiiiPv
    /* 8AFD0 8009AFD0 FFFF8424 */   addiu     $a0, $a0, -0x1
    /* 8AFD4 8009AFD4 2400BF8F */  lw         $ra, 0x24($sp)
    /* 8AFD8 8009AFD8 2000B28F */  lw         $s2, 0x20($sp)
    /* 8AFDC 8009AFDC 1C00B18F */  lw         $s1, 0x1C($sp)
    /* 8AFE0 8009AFE0 1800B08F */  lw         $s0, 0x18($sp)
    /* 8AFE4 8009AFE4 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 8AFE8 8009AFE8 0800E003 */  jr         $ra
    /* 8AFEC 8009AFEC 00000000 */   nop
endlabel MakePal__8PalEntryUsUsi
