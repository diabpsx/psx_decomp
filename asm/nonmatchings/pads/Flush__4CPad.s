.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Flush__4CPad, 0x54

glabel Flush__4CPad
    /* 79AD0 80089AD0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 79AD4 80089AD4 1000B0AF */  sw         $s0, 0x10($sp)
    /* 79AD8 80089AD8 21808000 */  addu       $s0, $a0, $zero
    /* 79ADC 80089ADC CC000426 */  addiu      $a0, $s0, 0xCC
    /* 79AE0 80089AE0 1400BFAF */  sw         $ra, 0x14($sp)
    /* 79AE4 80089AE4 080000A6 */  sh         $zero, 0x8($s0)
    /* 79AE8 80089AE8 120000A6 */  sh         $zero, 0x12($s0)
    /* 79AEC 80089AEC 0A0000A6 */  sh         $zero, 0xA($s0)
    /* 79AF0 80089AF0 140000A6 */  sh         $zero, 0x14($s0)
    /* 79AF4 80089AF4 0C0000A6 */  sh         $zero, 0xC($s0)
    /* 79AF8 80089AF8 160000A6 */  sh         $zero, 0x16($s0)
    /* 79AFC 80089AFC 100000A6 */  sh         $zero, 0x10($s0)
    /* 79B00 80089B00 C926020C */  jal        InitClickBits__FPUs
    /* 79B04 80089B04 1A0000A6 */   sh        $zero, 0x1A($s0)
    /* 79B08 80089B08 C926020C */  jal        InitClickBits__FPUs
    /* 79B0C 80089B0C AC000426 */   addiu     $a0, $s0, 0xAC
    /* 79B10 80089B10 1400BF8F */  lw         $ra, 0x14($sp)
    /* 79B14 80089B14 1000B08F */  lw         $s0, 0x10($sp)
    /* 79B18 80089B18 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 79B1C 80089B1C 0800E003 */  jr         $ra
    /* 79B20 80089B20 00000000 */   nop
endlabel Flush__4CPad
