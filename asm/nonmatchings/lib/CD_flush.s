.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CD_flush, 0xD4

glabel CD_flush
    /* C374 8001C374 0B80033C */  lui        $v1, %hi(D_800B61BC)
    /* C378 8001C378 BC61638C */  lw         $v1, %lo(D_800B61BC)($v1)
    /* C37C 8001C37C 01000224 */  addiu      $v0, $zero, 0x1
    /* C380 8001C380 000062A0 */  sb         $v0, 0x0($v1)
    /* C384 8001C384 0B80023C */  lui        $v0, %hi(D_800B61C8)
    /* C388 8001C388 C861428C */  lw         $v0, %lo(D_800B61C8)($v0)
    /* C38C 8001C38C 00000000 */  nop
    /* C390 8001C390 00004290 */  lbu        $v0, 0x0($v0)
    /* C394 8001C394 00000000 */  nop
    /* C398 8001C398 07004230 */  andi       $v0, $v0, 0x7
    /* C39C 8001C39C 16004010 */  beqz       $v0, .L8001C3F8
    /* C3A0 8001C3A0 01000424 */   addiu     $a0, $zero, 0x1
    /* C3A4 8001C3A4 07000324 */  addiu      $v1, $zero, 0x7
  .L8001C3A8:
    /* C3A8 8001C3A8 0B80023C */  lui        $v0, %hi(D_800B61BC)
    /* C3AC 8001C3AC BC61428C */  lw         $v0, %lo(D_800B61BC)($v0)
    /* C3B0 8001C3B0 00000000 */  nop
    /* C3B4 8001C3B4 000044A0 */  sb         $a0, 0x0($v0)
    /* C3B8 8001C3B8 0B80023C */  lui        $v0, %hi(D_800B61C8)
    /* C3BC 8001C3BC C861428C */  lw         $v0, %lo(D_800B61C8)($v0)
    /* C3C0 8001C3C0 00000000 */  nop
    /* C3C4 8001C3C4 000043A0 */  sb         $v1, 0x0($v0)
    /* C3C8 8001C3C8 0B80023C */  lui        $v0, %hi(D_800B61C4)
    /* C3CC 8001C3CC C461428C */  lw         $v0, %lo(D_800B61C4)($v0)
    /* C3D0 8001C3D0 00000000 */  nop
    /* C3D4 8001C3D4 000043A0 */  sb         $v1, 0x0($v0)
    /* C3D8 8001C3D8 0B80023C */  lui        $v0, %hi(D_800B61C8)
    /* C3DC 8001C3DC C861428C */  lw         $v0, %lo(D_800B61C8)($v0)
    /* C3E0 8001C3E0 00000000 */  nop
    /* C3E4 8001C3E4 00004290 */  lbu        $v0, 0x0($v0)
    /* C3E8 8001C3E8 00000000 */  nop
    /* C3EC 8001C3EC 07004230 */  andi       $v0, $v0, 0x7
    /* C3F0 8001C3F0 EDFF4014 */  bnez       $v0, .L8001C3A8
    /* C3F4 8001C3F4 00000000 */   nop
  .L8001C3F8:
    /* C3F8 8001C3F8 0B80033C */  lui        $v1, %hi(D_800B61D4)
    /* C3FC 8001C3FC D4616324 */  addiu      $v1, $v1, %lo(D_800B61D4)
    /* C400 8001C400 020060A0 */  sb         $zero, 0x2($v1)
    /* C404 8001C404 02006290 */  lbu        $v0, 0x2($v1)
    /* C408 8001C408 00000000 */  nop
    /* C40C 8001C40C 010062A0 */  sb         $v0, 0x1($v1)
    /* C410 8001C410 0B80043C */  lui        $a0, %hi(D_800B61BC)
    /* C414 8001C414 BC61848C */  lw         $a0, %lo(D_800B61BC)($a0)
    /* C418 8001C418 02000224 */  addiu      $v0, $zero, 0x2
    /* C41C 8001C41C 000062A0 */  sb         $v0, 0x0($v1)
    /* C420 8001C420 000080A0 */  sb         $zero, 0x0($a0)
    /* C424 8001C424 0B80023C */  lui        $v0, %hi(D_800B61C8)
    /* C428 8001C428 C861428C */  lw         $v0, %lo(D_800B61C8)($v0)
    /* C42C 8001C42C 00000000 */  nop
    /* C430 8001C430 000040A0 */  sb         $zero, 0x0($v0)
    /* C434 8001C434 0B80033C */  lui        $v1, %hi(D_800B61CC)
    /* C438 8001C438 CC61638C */  lw         $v1, %lo(D_800B61CC)($v1)
    /* C43C 8001C43C 25130224 */  addiu      $v0, $zero, 0x1325
    /* C440 8001C440 0800E003 */  jr         $ra
    /* C444 8001C444 000062AC */   sw        $v0, 0x0($v1)
endlabel CD_flush
