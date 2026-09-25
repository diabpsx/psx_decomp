.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CdReadBreak, 0x94

glabel CdReadBreak
    /* DA38 8001DA38 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* DA3C 8001DA3C 1000B0AF */  sw         $s0, 0x10($sp)
    /* DA40 8001DA40 0B80103C */  lui        $s0, %hi(D_800B6250)
    /* DA44 8001DA44 50621026 */  addiu      $s0, $s0, %lo(D_800B6250)
    /* DA48 8001DA48 1800BFAF */  sw         $ra, 0x18($sp)
    /* DA4C 8001DA4C 1400B1AF */  sw         $s1, 0x14($sp)
    /* DA50 8001DA50 0000028E */  lw         $v0, 0x0($s0)
    /* DA54 8001DA54 00000000 */  nop
    /* DA58 8001DA58 01004230 */  andi       $v0, $v0, 0x1
    /* DA5C 8001DA5C 04004010 */  beqz       $v0, .L8001DA70
    /* DA60 8001DA60 D0FF1126 */   addiu     $s1, $s0, -0x30
    /* DA64 8001DA64 A66C000C */  jal        CdDataSync
    /* DA68 8001DA68 21200000 */   addu      $a0, $zero, $zero
    /* DA6C 8001DA6C D0FF1126 */  addiu      $s1, $s0, -0x30
  .L8001DA70:
    /* DA70 8001DA70 140020AE */  sw         $zero, 0x14($s1)
    /* DA74 8001DA74 F4FF048E */  lw         $a0, -0xC($s0)
    /* DA78 8001DA78 8C6B000C */  jal        CdSyncCallback
    /* DA7C 8001DA7C 00000000 */   nop
    /* DA80 8001DA80 F8FF048E */  lw         $a0, -0x8($s0)
    /* DA84 8001DA84 916B000C */  jal        CdReadyCallback
    /* DA88 8001DA88 00000000 */   nop
    /* DA8C 8001DA8C 0000028E */  lw         $v0, 0x0($s0)
    /* DA90 8001DA90 00000000 */  nop
    /* DA94 8001DA94 01004230 */  andi       $v0, $v0, 0x1
    /* DA98 8001DA98 05004010 */  beqz       $v0, .L8001DAB0
    /* DA9C 8001DA9C 09000424 */   addiu     $a0, $zero, 0x9
    /* DAA0 8001DAA0 2C00248E */  lw         $a0, 0x2C($s1)
    /* DAA4 8001DAA4 9D6C000C */  jal        CdDataCallback
    /* DAA8 8001DAA8 00000000 */   nop
    /* DAAC 8001DAAC 09000424 */  addiu      $a0, $zero, 0x9
  .L8001DAB0:
    /* DAB0 8001DAB0 E56B000C */  jal        CdControlF
    /* DAB4 8001DAB4 21280000 */   addu      $a1, $zero, $zero
    /* DAB8 8001DAB8 1800BF8F */  lw         $ra, 0x18($sp)
    /* DABC 8001DABC 1400B18F */  lw         $s1, 0x14($sp)
    /* DAC0 8001DAC0 1000B08F */  lw         $s0, 0x10($sp)
    /* DAC4 8001DAC4 0800E003 */  jr         $ra
    /* DAC8 8001DAC8 2000BD27 */   addiu     $sp, $sp, 0x20
endlabel CdReadBreak
