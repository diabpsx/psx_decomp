.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CdInit, 0xFC

glabel CdInit
    /* ABAC 8001ABAC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* ABB0 8001ABB0 1000B0AF */  sw         $s0, 0x10($sp)
    /* ABB4 8001ABB4 04001024 */  addiu      $s0, $zero, 0x4
    /* ABB8 8001ABB8 1400BFAF */  sw         $ra, 0x14($sp)
  .L8001ABBC:
    /* ABBC 8001ABBC 3A6B000C */  jal        CdReset
    /* ABC0 8001ABC0 01000424 */   addiu     $a0, $zero, 0x1
    /* ABC4 8001ABC4 01000324 */  addiu      $v1, $zero, 0x1
    /* ABC8 8001ABC8 0E004314 */  bne        $v0, $v1, .L8001AC04
    /* ABCC 8001ABCC FFFF1026 */   addiu     $s0, $s0, -0x1
    /* ABD0 8001ABD0 0280043C */  lui        $a0, %hi(D_8001AC30)
    /* ABD4 8001ABD4 8C6B000C */  jal        CdSyncCallback
    /* ABD8 8001ABD8 30AC8424 */   addiu     $a0, $a0, %lo(D_8001AC30)
    /* ABDC 8001ABDC 0280043C */  lui        $a0, %hi(D_8001AC58)
    /* ABE0 8001ABE0 916B000C */  jal        CdReadyCallback
    /* ABE4 8001ABE4 58AC8424 */   addiu     $a0, $a0, %lo(D_8001AC58)
    /* ABE8 8001ABE8 0280043C */  lui        $a0, %hi(D_8001AC80)
    /* ABEC 8001ABEC 2577000C */  jal        CdReadCallback
    /* ABF0 8001ABF0 80AC8424 */   addiu     $a0, $a0, %lo(D_8001AC80)
    /* ABF4 8001ABF4 2A77000C */  jal        CdReadMode
    /* ABF8 8001ABF8 21200000 */   addu      $a0, $zero, $zero
    /* ABFC 8001ABFC 086B0008 */  j          .L8001AC20
    /* AC00 8001AC00 01000224 */   addiu     $v0, $zero, 0x1
  .L8001AC04:
    /* AC04 8001AC04 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* AC08 8001AC08 ECFF0216 */  bne        $s0, $v0, .L8001ABBC
    /* AC0C 8001AC0C 00000000 */   nop
    /* AC10 8001AC10 1180043C */  lui        $a0, %hi(D_8010E248)
    /* AC14 8001AC14 9367000C */  jal        printf
    /* AC18 8001AC18 48E28424 */   addiu     $a0, $a0, %lo(D_8010E248)
    /* AC1C 8001AC1C 21100000 */  addu       $v0, $zero, $zero
  .L8001AC20:
    /* AC20 8001AC20 1400BF8F */  lw         $ra, 0x14($sp)
    /* AC24 8001AC24 1000B08F */  lw         $s0, 0x10($sp)
    /* AC28 8001AC28 0800E003 */  jr         $ra
    /* AC2C 8001AC2C 1800BD27 */   addiu     $sp, $sp, 0x18
  alabel D_8001AC30
    /* AC30 8001AC30 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* AC34 8001AC34 1000BFAF */  sw         $ra, 0x10($sp)
    /* AC38 8001AC38 00F0043C */  lui        $a0, (0xF0000003 >> 16)
    /* AC3C 8001AC3C 03008434 */  ori        $a0, $a0, (0xF0000003 & 0xFFFF)
    /* AC40 8001AC40 C75C000C */  jal        DeliverEvent
    /* AC44 8001AC44 20000524 */   addiu     $a1, $zero, 0x20
    /* AC48 8001AC48 1000BF8F */  lw         $ra, 0x10($sp)
    /* AC4C 8001AC4C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* AC50 8001AC50 0800E003 */  jr         $ra
    /* AC54 8001AC54 00000000 */   nop
  alabel D_8001AC58
    /* AC58 8001AC58 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* AC5C 8001AC5C 1000BFAF */  sw         $ra, 0x10($sp)
    /* AC60 8001AC60 00F0043C */  lui        $a0, (0xF0000003 >> 16)
    /* AC64 8001AC64 03008434 */  ori        $a0, $a0, (0xF0000003 & 0xFFFF)
    /* AC68 8001AC68 C75C000C */  jal        DeliverEvent
    /* AC6C 8001AC6C 40000524 */   addiu     $a1, $zero, 0x40
    /* AC70 8001AC70 1000BF8F */  lw         $ra, 0x10($sp)
    /* AC74 8001AC74 1800BD27 */  addiu      $sp, $sp, 0x18
    /* AC78 8001AC78 0800E003 */  jr         $ra
    /* AC7C 8001AC7C 00000000 */   nop
  alabel D_8001AC80
    /* AC80 8001AC80 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* AC84 8001AC84 1000BFAF */  sw         $ra, 0x10($sp)
    /* AC88 8001AC88 00F0043C */  lui        $a0, (0xF0000003 >> 16)
    /* AC8C 8001AC8C 03008434 */  ori        $a0, $a0, (0xF0000003 & 0xFFFF)
    /* AC90 8001AC90 C75C000C */  jal        DeliverEvent
    /* AC94 8001AC94 40000524 */   addiu     $a1, $zero, 0x40
    /* AC98 8001AC98 1000BF8F */  lw         $ra, 0x10($sp)
    /* AC9C 8001AC9C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* ACA0 8001ACA0 0800E003 */  jr         $ra
    /* ACA4 8001ACA4 00000000 */   nop
endlabel CdInit
    /* ACA8 8001ACA8 00000000 */  nop
