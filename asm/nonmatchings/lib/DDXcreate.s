.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DDXcreate, 0x9C

glabel DDXcreate
    /* 1339C 8002339C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 133A0 800233A0 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 133A4 800233A4 1800B2AF */  sw         $s2, 0x18($sp)
    /* 133A8 800233A8 1400B1AF */  sw         $s1, 0x14($sp)
    /* 133AC 800233AC 1000B0AF */  sw         $s0, 0x10($sp)
    /* 133B0 800233B0 21888000 */  addu       $s1, $a0, $zero
    /* 133B4 800233B4 2190A000 */  addu       $s2, $a1, $zero
    /* 133B8 800233B8 9B8C000C */  jal        SwapByte
    /* 133BC 800233BC FE000434 */   ori       $a0, $zero, 0xFE
    /* 133C0 800233C0 9B8C000C */  jal        SwapByte
    /* 133C4 800233C4 6D000434 */   ori       $a0, $zero, 0x6D
    /* 133C8 800233C8 00002292 */  lbu        $v0, 0x0($s1)
    /* 133CC 800233CC 00000000 */  nop
    /* 133D0 800233D0 0A004010 */  beqz       $v0, .L800233FC
    /* 133D4 800233D4 21800000 */   addu      $s0, $zero, $zero
    /* 133D8 800233D8 21103002 */  addu       $v0, $s1, $s0
  .L800233DC:
    /* 133DC 800233DC 00004490 */  lbu        $a0, 0x0($v0)
    /* 133E0 800233E0 9B8C000C */  jal        SwapByte
    /* 133E4 800233E4 01001026 */   addiu     $s0, $s0, 0x1
    /* 133E8 800233E8 21103002 */  addu       $v0, $s1, $s0
    /* 133EC 800233EC 00004290 */  lbu        $v0, 0x0($v0)
    /* 133F0 800233F0 00000000 */  nop
    /* 133F4 800233F4 F9FF4014 */  bnez       $v0, .L800233DC
    /* 133F8 800233F8 21103002 */   addu      $v0, $s1, $s0
  .L800233FC:
    /* 133FC 800233FC 9B8C000C */  jal        SwapByte
    /* 13400 80023400 21200000 */   addu      $a0, $zero, $zero
    /* 13404 80023404 AF8C000C */  jal        PutLong
    /* 13408 80023408 21204002 */   addu      $a0, $s2, $zero
    /* 1340C 8002340C 9B8C000C */  jal        SwapByte
    /* 13410 80023410 21200000 */   addu      $a0, $zero, $zero
    /* 13414 80023414 C28C000C */  jal        GetLong
    /* 13418 80023418 00000000 */   nop
    /* 1341C 8002341C 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 13420 80023420 1800B28F */  lw         $s2, 0x18($sp)
    /* 13424 80023424 1400B18F */  lw         $s1, 0x14($sp)
    /* 13428 80023428 1000B08F */  lw         $s0, 0x10($sp)
    /* 1342C 8002342C 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 13430 80023430 0800E003 */  jr         $ra
    /* 13434 80023434 00000000 */   nop
endlabel DDXcreate
