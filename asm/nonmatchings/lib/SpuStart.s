.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching SpuStart, 0x70

glabel SpuStart
    /* 6764 80016764 0B80023C */  lui        $v0, %hi(_spu_isCalled)
    /* 6768 80016768 3C5A428C */  lw         $v0, %lo(_spu_isCalled)($v0)
    /* 676C 8001676C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 6770 80016770 14004014 */  bnez       $v0, .L800167C4
    /* 6774 80016774 1000BFAF */   sw        $ra, 0x10($sp)
    /* 6778 80016778 01000224 */  addiu      $v0, $zero, 0x1
    /* 677C 8001677C 0B80013C */  lui        $at, %hi(_spu_isCalled)
    /* 6780 80016780 6346000C */  jal        EnterCriticalSection
    /* 6784 80016784 3C5A22AC */   sw        $v0, %lo(_spu_isCalled)($at)
    /* 6788 80016788 0180043C */  lui        $a0, %hi(_spu_FiDMA)
    /* 678C 8001678C CB5C000C */  jal        _SpuDataCallback
    /* 6790 80016790 1C6C8424 */   addiu     $a0, $a0, %lo(_spu_FiDMA)
    /* 6794 80016794 00F0043C */  lui        $a0, (0xF0000009 >> 16)
    /* 6798 80016798 09008434 */  ori        $a0, $a0, (0xF0000009 & 0xFFFF)
    /* 679C 8001679C 20000524 */  addiu      $a1, $zero, 0x20
    /* 67A0 800167A0 00200624 */  addiu      $a2, $zero, 0x2000
    /* 67A4 800167A4 5746000C */  jal        OpenEvent
    /* 67A8 800167A8 21380000 */   addu      $a3, $zero, $zero
    /* 67AC 800167AC 21204000 */  addu       $a0, $v0, $zero
    /* 67B0 800167B0 0B80013C */  lui        $at, %hi(_spu_EVdma)
    /* 67B4 800167B4 5F46000C */  jal        EnableEvent
    /* 67B8 800167B8 D45524AC */   sw        $a0, %lo(_spu_EVdma)($at)
    /* 67BC 800167BC 6746000C */  jal        ExitCriticalSection
    /* 67C0 800167C0 00000000 */   nop
  .L800167C4:
    /* 67C4 800167C4 1000BF8F */  lw         $ra, 0x10($sp)
    /* 67C8 800167C8 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 67CC 800167CC 0800E003 */  jr         $ra
    /* 67D0 800167D0 00000000 */   nop
endlabel SpuStart
    /* 67D4 800167D4 00000000 */  nop
    /* 67D8 800167D8 00000000 */  nop
