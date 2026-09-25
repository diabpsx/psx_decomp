.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CdRead2, 0xA4

glabel CdRead2
    /* DCCC 8001DCCC E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* DCD0 8001DCD0 1800B0AF */  sw         $s0, 0x18($sp)
    /* DCD4 8001DCD4 21808000 */  addu       $s0, $a0, $zero
    /* DCD8 8001DCD8 0E000424 */  addiu      $a0, $zero, 0xE
    /* DCDC 8001DCDC 1000A527 */  addiu      $a1, $sp, 0x10
    /* DCE0 8001DCE0 21300000 */  addu       $a2, $zero, $zero
    /* DCE4 8001DCE4 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* DCE8 8001DCE8 966B000C */  jal        CdControl
    /* DCEC 8001DCEC 1000B0A3 */   sb        $s0, 0x10($sp)
    /* DCF0 8001DCF0 00010232 */  andi       $v0, $s0, 0x100
    /* DCF4 8001DCF4 0E004010 */  beqz       $v0, .L8001DD30
    /* DCF8 8001DCF8 20000232 */   andi      $v0, $s0, 0x20
    /* DCFC 8001DCFC 04004010 */  beqz       $v0, .L8001DD10
    /* DD00 8001DD00 01000224 */   addiu     $v0, $zero, 0x1
    /* DD04 8001DD04 1380013C */  lui        $at, %hi(StMode)
    /* DD08 8001DD08 46770008 */  j          .L8001DD18
    /* DD0C 8001DD0C D85120AC */   sw        $zero, %lo(StMode)($at)
  .L8001DD10:
    /* DD10 8001DD10 1380013C */  lui        $at, %hi(StMode)
    /* DD14 8001DD14 D85122AC */  sw         $v0, %lo(StMode)($at)
  .L8001DD18:
    /* DD18 8001DD18 0280043C */  lui        $a0, %hi(data_ready_callback)
    /* DD1C 8001DD1C 9D6C000C */  jal        CdDataCallback
    /* DD20 8001DD20 7CDD8424 */   addiu     $a0, $a0, %lo(data_ready_callback)
    /* DD24 8001DD24 0280043C */  lui        $a0, %hi(D_8001DD50)
    /* DD28 8001DD28 916B000C */  jal        CdReadyCallback
    /* DD2C 8001DD2C 50DD8424 */   addiu     $a0, $a0, %lo(D_8001DD50)
  .L8001DD30:
    /* DD30 8001DD30 1B000424 */  addiu      $a0, $zero, 0x1B
    /* DD34 8001DD34 21280000 */  addu       $a1, $zero, $zero
    /* DD38 8001DD38 966B000C */  jal        CdControl
    /* DD3C 8001DD3C 21300000 */   addu      $a2, $zero, $zero
    /* DD40 8001DD40 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* DD44 8001DD44 1800B08F */  lw         $s0, 0x18($sp)
    /* DD48 8001DD48 0800E003 */  jr         $ra
    /* DD4C 8001DD4C 2000BD27 */   addiu     $sp, $sp, 0x20
  alabel D_8001DD50
    /* DD50 8001DD50 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* DD54 8001DD54 1000BFAF */  sw         $ra, 0x10($sp)
    /* DD58 8001DD58 FB77000C */  jal        StCdInterrupt
    /* DD5C 8001DD5C 00000000 */   nop
    /* DD60 8001DD60 1000BF8F */  lw         $ra, 0x10($sp)
    /* DD64 8001DD64 1800BD27 */  addiu      $sp, $sp, 0x18
    /* DD68 8001DD68 0800E003 */  jr         $ra
    /* DD6C 8001DD6C 00000000 */   nop
endlabel CdRead2
    /* DD70 8001DD70 00000000 */  nop
    /* DD74 8001DD74 00000000 */  nop
    /* DD78 8001DD78 00000000 */  nop
