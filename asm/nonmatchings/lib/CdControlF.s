.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CdControlF, 0x134

glabel CdControlF
    /* AF94 8001AF94 C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* AF98 8001AF98 1400B1AF */  sw         $s1, 0x14($sp)
    /* AF9C 8001AF9C 2188A000 */  addu       $s1, $a1, $zero
    /* AFA0 8001AFA0 1C00B3AF */  sw         $s3, 0x1C($sp)
    /* AFA4 8001AFA4 21988000 */  addu       $s3, $a0, $zero
    /* AFA8 8001AFA8 1000B0AF */  sw         $s0, 0x10($sp)
    /* AFAC 8001AFAC 03001024 */  addiu      $s0, $zero, 0x3
    /* AFB0 8001AFB0 3000BEAF */  sw         $fp, 0x30($sp)
    /* AFB4 8001AFB4 01001E24 */  addiu      $fp, $zero, 0x1
    /* AFB8 8001AFB8 1800B2AF */  sw         $s2, 0x18($sp)
    /* AFBC 8001AFBC FF007232 */  andi       $s2, $s3, 0xFF
    /* AFC0 8001AFC0 0B80033C */  lui        $v1, %hi(D_800B5E6C)
    /* AFC4 8001AFC4 6C5E6324 */  addiu      $v1, $v1, %lo(D_800B5E6C)
    /* AFC8 8001AFC8 2000B4AF */  sw         $s4, 0x20($sp)
    /* AFCC 8001AFCC 0B80143C */  lui        $s4, %hi(CD_cbsync)
    /* AFD0 8001AFD0 F45E948E */  lw         $s4, %lo(CD_cbsync)($s4)
    /* AFD4 8001AFD4 80101200 */  sll        $v0, $s2, 2
    /* AFD8 8001AFD8 2400B5AF */  sw         $s5, 0x24($sp)
    /* AFDC 8001AFDC 21A84300 */  addu       $s5, $v0, $v1
    /* AFE0 8001AFE0 2800B6AF */  sw         $s6, 0x28($sp)
    /* AFE4 8001AFE4 21B00000 */  addu       $s6, $zero, $zero
    /* AFE8 8001AFE8 2C00B7AF */  sw         $s7, 0x2C($sp)
    /* AFEC 8001AFEC FFFF1724 */  addiu      $s7, $zero, -0x1
    /* AFF0 8001AFF0 3400BFAF */  sw         $ra, 0x34($sp)
  .L8001AFF4:
    /* AFF4 8001AFF4 0B80013C */  lui        $at, %hi(CD_cbsync)
    /* AFF8 8001AFF8 0B005E12 */  beq        $s2, $fp, .L8001B028
    /* AFFC 8001AFFC F45E20AC */   sw        $zero, %lo(CD_cbsync)($at)
    /* B000 8001B000 0B80023C */  lui        $v0, %hi(CD_status)
    /* B004 8001B004 045F4290 */  lbu        $v0, %lo(CD_status)($v0)
    /* B008 8001B008 00000000 */  nop
    /* B00C 8001B00C 10004230 */  andi       $v0, $v0, 0x10
    /* B010 8001B010 05004010 */  beqz       $v0, .L8001B028
    /* B014 8001B014 01000424 */   addiu     $a0, $zero, 0x1
    /* B018 8001B018 21280000 */  addu       $a1, $zero, $zero
    /* B01C 8001B01C 21300000 */  addu       $a2, $zero, $zero
    /* B020 8001B020 B86F000C */  jal        CD_cw
    /* B024 8001B024 21380000 */   addu      $a3, $zero, $zero
  .L8001B028:
    /* B028 8001B028 0B002012 */  beqz       $s1, .L8001B058
    /* B02C 8001B02C 00000000 */   nop
    /* B030 8001B030 0000A28E */  lw         $v0, 0x0($s5)
    /* B034 8001B034 00000000 */  nop
    /* B038 8001B038 07004010 */  beqz       $v0, .L8001B058
    /* B03C 8001B03C 02000424 */   addiu     $a0, $zero, 0x2
    /* B040 8001B040 21282002 */  addu       $a1, $s1, $zero
    /* B044 8001B044 21300000 */  addu       $a2, $zero, $zero
    /* B048 8001B048 B86F000C */  jal        CD_cw
    /* B04C 8001B04C 21380000 */   addu      $a3, $zero, $zero
    /* B050 8001B050 0A004014 */  bnez       $v0, .L8001B07C
    /* B054 8001B054 00000000 */   nop
  .L8001B058:
    /* B058 8001B058 0B80013C */  lui        $at, %hi(CD_cbsync)
    /* B05C 8001B05C F45E34AC */  sw         $s4, %lo(CD_cbsync)($at)
    /* B060 8001B060 FF006432 */  andi       $a0, $s3, 0xFF
    /* B064 8001B064 21282002 */  addu       $a1, $s1, $zero
    /* B068 8001B068 21300000 */  addu       $a2, $zero, $zero
    /* B06C 8001B06C B86F000C */  jal        CD_cw
    /* B070 8001B070 01000724 */   addiu     $a3, $zero, 0x1
    /* B074 8001B074 08004010 */  beqz       $v0, .L8001B098
    /* B078 8001B078 0100C226 */   addiu     $v0, $s6, 0x1
  .L8001B07C:
    /* B07C 8001B07C FFFF1026 */  addiu      $s0, $s0, -0x1
    /* B080 8001B080 DCFF1716 */  bne        $s0, $s7, .L8001AFF4
    /* B084 8001B084 00000000 */   nop
    /* B088 8001B088 0B80013C */  lui        $at, %hi(CD_cbsync)
    /* B08C 8001B08C F45E34AC */  sw         $s4, %lo(CD_cbsync)($at)
    /* B090 8001B090 FFFF1624 */  addiu      $s6, $zero, -0x1
    /* B094 8001B094 0100C226 */  addiu      $v0, $s6, 0x1
  .L8001B098:
    /* B098 8001B098 3400BF8F */  lw         $ra, 0x34($sp)
    /* B09C 8001B09C 3000BE8F */  lw         $fp, 0x30($sp)
    /* B0A0 8001B0A0 2C00B78F */  lw         $s7, 0x2C($sp)
    /* B0A4 8001B0A4 2800B68F */  lw         $s6, 0x28($sp)
    /* B0A8 8001B0A8 2400B58F */  lw         $s5, 0x24($sp)
    /* B0AC 8001B0AC 2000B48F */  lw         $s4, 0x20($sp)
    /* B0B0 8001B0B0 1C00B38F */  lw         $s3, 0x1C($sp)
    /* B0B4 8001B0B4 1800B28F */  lw         $s2, 0x18($sp)
    /* B0B8 8001B0B8 1400B18F */  lw         $s1, 0x14($sp)
    /* B0BC 8001B0BC 1000B08F */  lw         $s0, 0x10($sp)
    /* B0C0 8001B0C0 0800E003 */  jr         $ra
    /* B0C4 8001B0C4 3800BD27 */   addiu     $sp, $sp, 0x38
endlabel CdControlF
