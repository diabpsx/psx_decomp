.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching IsEqual__C8PalEntryUsUsi, 0x38

glabel IsEqual__C8PalEntryUsUsi
    /* 8B288 8009B288 10008294 */  lhu        $v0, 0x10($a0)
    /* 8B28C 8009B28C FFFFA530 */  andi       $a1, $a1, 0xFFFF
    /* 8B290 8009B290 0900A214 */  bne        $a1, $v0, .L8009B2B8
    /* 8B294 8009B294 21400000 */   addu      $t0, $zero, $zero
    /* 8B298 8009B298 08008394 */  lhu        $v1, 0x8($a0)
    /* 8B29C 8009B29C FFFFC230 */  andi       $v0, $a2, 0xFFFF
    /* 8B2A0 8009B2A0 05004314 */  bne        $v0, $v1, .L8009B2B8
    /* 8B2A4 8009B2A4 00000000 */   nop
    /* 8B2A8 8009B2A8 12008294 */  lhu        $v0, 0x12($a0)
    /* 8B2AC 8009B2AC 00000000 */  nop
    /* 8B2B0 8009B2B0 26104700 */  xor        $v0, $v0, $a3
    /* 8B2B4 8009B2B4 0100482C */  sltiu      $t0, $v0, 0x1
  .L8009B2B8:
    /* 8B2B8 8009B2B8 0800E003 */  jr         $ra
    /* 8B2BC 8009B2BC 21100001 */   addu      $v0, $t0, $zero
endlabel IsEqual__C8PalEntryUsUsi
