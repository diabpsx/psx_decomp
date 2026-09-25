.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CD_vol, 0x88

glabel CD_vol
    /* C2EC 8001C2EC 0B80033C */  lui        $v1, %hi(D_800B61BC)
    /* C2F0 8001C2F0 BC61638C */  lw         $v1, %lo(D_800B61BC)($v1)
    /* C2F4 8001C2F4 02000224 */  addiu      $v0, $zero, 0x2
    /* C2F8 8001C2F8 000062A0 */  sb         $v0, 0x0($v1)
    /* C2FC 8001C2FC 0B80033C */  lui        $v1, %hi(D_800B61C4)
    /* C300 8001C300 C461638C */  lw         $v1, %lo(D_800B61C4)($v1)
    /* C304 8001C304 00008290 */  lbu        $v0, 0x0($a0)
    /* C308 8001C308 00000000 */  nop
    /* C30C 8001C30C 000062A0 */  sb         $v0, 0x0($v1)
    /* C310 8001C310 0B80033C */  lui        $v1, %hi(D_800B61C8)
    /* C314 8001C314 C861638C */  lw         $v1, %lo(D_800B61C8)($v1)
    /* C318 8001C318 01008290 */  lbu        $v0, 0x1($a0)
    /* C31C 8001C31C 00000000 */  nop
    /* C320 8001C320 000062A0 */  sb         $v0, 0x0($v1)
    /* C324 8001C324 0B80033C */  lui        $v1, %hi(D_800B61BC)
    /* C328 8001C328 BC61638C */  lw         $v1, %lo(D_800B61BC)($v1)
    /* C32C 8001C32C 03000224 */  addiu      $v0, $zero, 0x3
    /* C330 8001C330 000062A0 */  sb         $v0, 0x0($v1)
    /* C334 8001C334 0B80033C */  lui        $v1, %hi(D_800B61C0)
    /* C338 8001C338 C061638C */  lw         $v1, %lo(D_800B61C0)($v1)
    /* C33C 8001C33C 02008290 */  lbu        $v0, 0x2($a0)
    /* C340 8001C340 00000000 */  nop
    /* C344 8001C344 000062A0 */  sb         $v0, 0x0($v1)
    /* C348 8001C348 0B80033C */  lui        $v1, %hi(D_800B61C4)
    /* C34C 8001C34C C461638C */  lw         $v1, %lo(D_800B61C4)($v1)
    /* C350 8001C350 03008290 */  lbu        $v0, 0x3($a0)
    /* C354 8001C354 00000000 */  nop
    /* C358 8001C358 000062A0 */  sb         $v0, 0x0($v1)
    /* C35C 8001C35C 0B80033C */  lui        $v1, %hi(D_800B61C8)
    /* C360 8001C360 C861638C */  lw         $v1, %lo(D_800B61C8)($v1)
    /* C364 8001C364 20000224 */  addiu      $v0, $zero, 0x20
    /* C368 8001C368 000062A0 */  sb         $v0, 0x0($v1)
    /* C36C 8001C36C 0800E003 */  jr         $ra
    /* C370 8001C370 21100000 */   addu      $v0, $zero, $zero
endlabel CD_vol
