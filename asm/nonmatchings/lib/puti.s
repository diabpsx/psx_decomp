.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching puti, 0x28

glabel puti
    /* 1CB94 8002CB94 FFFFC624 */  addiu      $a2, $a2, -0x1
    /* 1CB98 8002CB98 0600C004 */  bltz       $a2, .L8002CBB4
    /* 1CB9C 8002CB9C 00000000 */   nop
  .L8002CBA0:
    /* 1CBA0 8002CBA0 000085A0 */  sb         $a1, 0x0($a0)
    /* 1CBA4 8002CBA4 022A0500 */  srl        $a1, $a1, 8
    /* 1CBA8 8002CBA8 FFFFC624 */  addiu      $a2, $a2, -0x1
    /* 1CBAC 8002CBAC FCFFC104 */  bgez       $a2, .L8002CBA0
    /* 1CBB0 8002CBB0 01008424 */   addiu     $a0, $a0, 0x1
  .L8002CBB4:
    /* 1CBB4 8002CBB4 0800E003 */  jr         $ra
    /* 1CBB8 8002CBB8 00000000 */   nop
endlabel puti
