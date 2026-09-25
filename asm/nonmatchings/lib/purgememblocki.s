.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching purgememblocki, 0x158

glabel purgememblocki
    /* 1AF50 8002AF50 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1AF54 8002AF54 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1AF58 8002AF58 21808000 */  addu       $s0, $a0, $zero
    /* 1AF5C 8002AF5C 4D000012 */  beqz       $s0, .L8002B094
    /* 1AF60 8002AF60 1400BFAF */   sw        $ra, 0x14($sp)
    /* 1AF64 8002AF64 481D828F */  lw         $v0, %gp_rel(purgememcallback)($gp)
    /* 1AF68 8002AF68 21200000 */  addu       $a0, $zero, $zero
    /* 1AF6C 8002AF6C 09F84000 */  jalr       $v0
    /* 1AF70 8002AF70 21280002 */   addu      $a1, $s0, $zero
    /* 1AF74 8002AF74 1800028E */  lw         $v0, 0x18($s0)
    /* 1AF78 8002AF78 00000000 */  nop
    /* 1AF7C 8002AF7C 00204230 */  andi       $v0, $v0, 0x2000
    /* 1AF80 8002AF80 05004010 */  beqz       $v0, .L8002AF98
    /* 1AF84 8002AF84 00000000 */   nop
    /* 1AF88 8002AF88 401D828F */  lw         $v0, %gp_rel(membreak)($gp)
    /* 1AF8C 8002AF8C 00000000 */  nop
    /* 1AF90 8002AF90 09F84000 */  jalr       $v0
    /* 1AF94 8002AF94 21200002 */   addu      $a0, $s0, $zero
  .L8002AF98:
    /* 1AF98 8002AF98 1800028E */  lw         $v0, 0x18($s0)
    /* 1AF9C 8002AF9C 00000000 */  nop
    /* 1AFA0 8002AFA0 00804230 */  andi       $v0, $v0, 0x8000
    /* 1AFA4 8002AFA4 0C004010 */  beqz       $v0, .L8002AFD8
    /* 1AFA8 8002AFA8 00000000 */   nop
    /* 1AFAC 8002AFAC 1180043C */  lui        $a0, %hi(D_8010F790)
    /* 1AFB0 8002AFB0 90F78424 */  addiu      $a0, $a0, %lo(D_8010F790)
    /* 1AFB4 8002AFB4 1180023C */  lui        $v0, %hi(D_8010F3D4)
    /* 1AFB8 8002AFB8 D4F34224 */  addiu      $v0, $v0, %lo(D_8010F3D4)
    /* 1AFBC 8002AFBC 1280013C */  lui        $at, %hi(abortfile)
    /* 1AFC0 8002AFC0 B8C322AC */  sw         $v0, %lo(abortfile)($at)
    /* 1AFC4 8002AFC4 3F030224 */  addiu      $v0, $zero, 0x33F
    /* 1AFC8 8002AFC8 1280013C */  lui        $at, %hi(abortline)
    /* 1AFCC 8002AFCC BCC322AC */  sw         $v0, %lo(abortline)($at)
    /* 1AFD0 8002AFD0 0F95000C */  jal        abortmessage
    /* 1AFD4 8002AFD4 00000000 */   nop
  .L8002AFD8:
    /* 1AFD8 8002AFD8 0000028E */  lw         $v0, 0x0($s0)
    /* 1AFDC 8002AFDC 00000000 */  nop
    /* 1AFE0 8002AFE0 0C004014 */  bnez       $v0, .L8002B014
    /* 1AFE4 8002AFE4 00000000 */   nop
    /* 1AFE8 8002AFE8 1180043C */  lui        $a0, %hi(D_8010F7C0)
    /* 1AFEC 8002AFEC C0F78424 */  addiu      $a0, $a0, %lo(D_8010F7C0)
    /* 1AFF0 8002AFF0 1180023C */  lui        $v0, %hi(D_8010F3D4)
    /* 1AFF4 8002AFF4 D4F34224 */  addiu      $v0, $v0, %lo(D_8010F3D4)
    /* 1AFF8 8002AFF8 1280013C */  lui        $at, %hi(abortfile)
    /* 1AFFC 8002AFFC B8C322AC */  sw         $v0, %lo(abortfile)($at)
    /* 1B000 8002B000 40030224 */  addiu      $v0, $zero, 0x340
    /* 1B004 8002B004 1280013C */  lui        $at, %hi(abortline)
    /* 1B008 8002B008 BCC322AC */  sw         $v0, %lo(abortline)($at)
    /* 1B00C 8002B00C 0F95000C */  jal        abortmessage
    /* 1B010 8002B010 00000000 */   nop
  .L8002B014:
    /* 1B014 8002B014 1800028E */  lw         $v0, 0x18($s0)
    /* 1B018 8002B018 00000000 */  nop
    /* 1B01C 8002B01C 00404230 */  andi       $v0, $v0, 0x4000
    /* 1B020 8002B020 12004010 */  beqz       $v0, .L8002B06C
    /* 1B024 8002B024 00000000 */   nop
    /* 1B028 8002B028 1BB1000C */  jal        checksentinelz
    /* 1B02C 8002B02C 21200002 */   addu      $a0, $s0, $zero
    /* 1B030 8002B030 0E004014 */  bnez       $v0, .L8002B06C
    /* 1B034 8002B034 00000000 */   nop
    /* 1B038 8002B038 0000068E */  lw         $a2, 0x0($s0)
    /* 1B03C 8002B03C 1400078E */  lw         $a3, 0x14($s0)
    /* 1B040 8002B040 1180043C */  lui        $a0, %hi(D_8010F7FC)
    /* 1B044 8002B044 FCF78424 */  addiu      $a0, $a0, %lo(D_8010F7FC)
    /* 1B048 8002B048 1180023C */  lui        $v0, %hi(D_8010F3D4)
    /* 1B04C 8002B04C D4F34224 */  addiu      $v0, $v0, %lo(D_8010F3D4)
    /* 1B050 8002B050 1280013C */  lui        $at, %hi(abortfile)
    /* 1B054 8002B054 B8C322AC */  sw         $v0, %lo(abortfile)($at)
    /* 1B058 8002B058 46030224 */  addiu      $v0, $zero, 0x346
    /* 1B05C 8002B05C 1280013C */  lui        $at, %hi(abortline)
    /* 1B060 8002B060 BCC322AC */  sw         $v0, %lo(abortline)($at)
    /* 1B064 8002B064 0F95000C */  jal        abortmessage
    /* 1B068 8002B068 04000526 */   addiu     $a1, $s0, 0x4
  .L8002B06C:
    /* 1B06C 8002B06C 2400038E */  lw         $v1, 0x24($s0)
    /* 1B070 8002B070 2000028E */  lw         $v0, 0x20($s0)
    /* 1B074 8002B074 00000000 */  nop
    /* 1B078 8002B078 200062AC */  sw         $v0, 0x20($v1)
    /* 1B07C 8002B07C 2000038E */  lw         $v1, 0x20($s0)
    /* 1B080 8002B080 2400028E */  lw         $v0, 0x24($s0)
    /* 1B084 8002B084 21200002 */  addu       $a0, $s0, $zero
    /* 1B088 8002B088 240062AC */  sw         $v0, 0x24($v1)
    /* 1B08C 8002B08C C4AD000C */  jal        putmemblock
    /* 1B090 8002B090 000080AC */   sw        $zero, 0x0($a0)
  .L8002B094:
    /* 1B094 8002B094 1400BF8F */  lw         $ra, 0x14($sp)
    /* 1B098 8002B098 1000B08F */  lw         $s0, 0x10($sp)
    /* 1B09C 8002B09C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1B0A0 8002B0A0 0800E003 */  jr         $ra
    /* 1B0A4 8002B0A4 00000000 */   nop
endlabel purgememblocki
