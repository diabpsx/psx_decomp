.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CD_initvol, 0xF0

glabel CD_initvol
    /* C448 8001C448 0B80033C */  lui        $v1, %hi(D_800B61D0)
    /* C44C 8001C44C D061638C */  lw         $v1, %lo(D_800B61D0)($v1)
    /* C450 8001C450 00000000 */  nop
    /* C454 8001C454 B8016294 */  lhu        $v0, 0x1B8($v1)
    /* C458 8001C458 00000000 */  nop
    /* C45C 8001C45C 09004014 */  bnez       $v0, .L8001C484
    /* C460 8001C460 F8FFBD27 */   addiu     $sp, $sp, -0x8
    /* C464 8001C464 BA016294 */  lhu        $v0, 0x1BA($v1)
    /* C468 8001C468 00000000 */  nop
    /* C46C 8001C46C 06004014 */  bnez       $v0, .L8001C488
    /* C470 8001C470 FF3F0224 */   addiu     $v0, $zero, 0x3FFF
    /* C474 8001C474 800162A4 */  sh         $v0, 0x180($v1)
    /* C478 8001C478 820162A4 */  sh         $v0, 0x182($v1)
    /* C47C 8001C47C 0B80033C */  lui        $v1, %hi(D_800B61D0)
    /* C480 8001C480 D061638C */  lw         $v1, %lo(D_800B61D0)($v1)
  .L8001C484:
    /* C484 8001C484 FF3F0224 */  addiu      $v0, $zero, 0x3FFF
  .L8001C488:
    /* C488 8001C488 B00162A4 */  sh         $v0, 0x1B0($v1)
    /* C48C 8001C48C B20162A4 */  sh         $v0, 0x1B2($v1)
    /* C490 8001C490 01C00234 */  ori        $v0, $zero, 0xC001
    /* C494 8001C494 AA0162A4 */  sh         $v0, 0x1AA($v1)
    /* C498 8001C498 0B80033C */  lui        $v1, %hi(D_800B61BC)
    /* C49C 8001C49C BC61638C */  lw         $v1, %lo(D_800B61BC)($v1)
    /* C4A0 8001C4A0 80000224 */  addiu      $v0, $zero, 0x80
    /* C4A4 8001C4A4 0200A2A3 */  sb         $v0, 0x2($sp)
    /* C4A8 8001C4A8 0000A2A3 */  sb         $v0, 0x0($sp)
    /* C4AC 8001C4AC 02000224 */  addiu      $v0, $zero, 0x2
    /* C4B0 8001C4B0 0300A0A3 */  sb         $zero, 0x3($sp)
    /* C4B4 8001C4B4 0100A0A3 */  sb         $zero, 0x1($sp)
    /* C4B8 8001C4B8 000062A0 */  sb         $v0, 0x0($v1)
    /* C4BC 8001C4BC 0B80033C */  lui        $v1, %hi(D_800B61C4)
    /* C4C0 8001C4C0 C461638C */  lw         $v1, %lo(D_800B61C4)($v1)
    /* C4C4 8001C4C4 0000A293 */  lbu        $v0, 0x0($sp)
    /* C4C8 8001C4C8 00000000 */  nop
    /* C4CC 8001C4CC 000062A0 */  sb         $v0, 0x0($v1)
    /* C4D0 8001C4D0 0B80033C */  lui        $v1, %hi(D_800B61C8)
    /* C4D4 8001C4D4 C861638C */  lw         $v1, %lo(D_800B61C8)($v1)
    /* C4D8 8001C4D8 0100A293 */  lbu        $v0, 0x1($sp)
    /* C4DC 8001C4DC 00000000 */  nop
    /* C4E0 8001C4E0 000062A0 */  sb         $v0, 0x0($v1)
    /* C4E4 8001C4E4 0B80033C */  lui        $v1, %hi(D_800B61BC)
    /* C4E8 8001C4E8 BC61638C */  lw         $v1, %lo(D_800B61BC)($v1)
    /* C4EC 8001C4EC 03000224 */  addiu      $v0, $zero, 0x3
    /* C4F0 8001C4F0 000062A0 */  sb         $v0, 0x0($v1)
    /* C4F4 8001C4F4 0B80033C */  lui        $v1, %hi(D_800B61C0)
    /* C4F8 8001C4F8 C061638C */  lw         $v1, %lo(D_800B61C0)($v1)
    /* C4FC 8001C4FC 0200A293 */  lbu        $v0, 0x2($sp)
    /* C500 8001C500 00000000 */  nop
    /* C504 8001C504 000062A0 */  sb         $v0, 0x0($v1)
    /* C508 8001C508 0B80033C */  lui        $v1, %hi(D_800B61C4)
    /* C50C 8001C50C C461638C */  lw         $v1, %lo(D_800B61C4)($v1)
    /* C510 8001C510 0300A293 */  lbu        $v0, 0x3($sp)
    /* C514 8001C514 00000000 */  nop
    /* C518 8001C518 000062A0 */  sb         $v0, 0x0($v1)
    /* C51C 8001C51C 0B80033C */  lui        $v1, %hi(D_800B61C8)
    /* C520 8001C520 C861638C */  lw         $v1, %lo(D_800B61C8)($v1)
    /* C524 8001C524 20000224 */  addiu      $v0, $zero, 0x20
    /* C528 8001C528 000062A0 */  sb         $v0, 0x0($v1)
    /* C52C 8001C52C 21100000 */  addu       $v0, $zero, $zero
    /* C530 8001C530 0800E003 */  jr         $ra
    /* C534 8001C534 0800BD27 */   addiu     $sp, $sp, 0x8
endlabel CD_initvol
