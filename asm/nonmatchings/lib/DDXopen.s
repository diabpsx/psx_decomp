.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DDXopen, 0x9C

glabel DDXopen
    /* 13438 80023438 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 1343C 8002343C 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 13440 80023440 1800B2AF */  sw         $s2, 0x18($sp)
    /* 13444 80023444 1400B1AF */  sw         $s1, 0x14($sp)
    /* 13448 80023448 1000B0AF */  sw         $s0, 0x10($sp)
    /* 1344C 8002344C 21888000 */  addu       $s1, $a0, $zero
    /* 13450 80023450 2190A000 */  addu       $s2, $a1, $zero
    /* 13454 80023454 9B8C000C */  jal        SwapByte
    /* 13458 80023458 FE000434 */   ori       $a0, $zero, 0xFE
    /* 1345C 8002345C 9B8C000C */  jal        SwapByte
    /* 13460 80023460 6F000434 */   ori       $a0, $zero, 0x6F
    /* 13464 80023464 00002292 */  lbu        $v0, 0x0($s1)
    /* 13468 80023468 00000000 */  nop
    /* 1346C 8002346C 0A004010 */  beqz       $v0, .L80023498
    /* 13470 80023470 21800000 */   addu      $s0, $zero, $zero
    /* 13474 80023474 21103002 */  addu       $v0, $s1, $s0
  .L80023478:
    /* 13478 80023478 00004490 */  lbu        $a0, 0x0($v0)
    /* 1347C 8002347C 9B8C000C */  jal        SwapByte
    /* 13480 80023480 01001026 */   addiu     $s0, $s0, 0x1
    /* 13484 80023484 21103002 */  addu       $v0, $s1, $s0
    /* 13488 80023488 00004290 */  lbu        $v0, 0x0($v0)
    /* 1348C 8002348C 00000000 */  nop
    /* 13490 80023490 F9FF4014 */  bnez       $v0, .L80023478
    /* 13494 80023494 21103002 */   addu      $v0, $s1, $s0
  .L80023498:
    /* 13498 80023498 9B8C000C */  jal        SwapByte
    /* 1349C 8002349C 21200000 */   addu      $a0, $zero, $zero
    /* 134A0 800234A0 AF8C000C */  jal        PutLong
    /* 134A4 800234A4 21204002 */   addu      $a0, $s2, $zero
    /* 134A8 800234A8 9B8C000C */  jal        SwapByte
    /* 134AC 800234AC 21200000 */   addu      $a0, $zero, $zero
    /* 134B0 800234B0 C28C000C */  jal        GetLong
    /* 134B4 800234B4 00000000 */   nop
    /* 134B8 800234B8 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 134BC 800234BC 1800B28F */  lw         $s2, 0x18($sp)
    /* 134C0 800234C0 1400B18F */  lw         $s1, 0x14($sp)
    /* 134C4 800234C4 1000B08F */  lw         $s0, 0x10($sp)
    /* 134C8 800234C8 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 134CC 800234CC 0800E003 */  jr         $ra
    /* 134D0 800234D0 00000000 */   nop
endlabel DDXopen
