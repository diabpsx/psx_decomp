.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching putm, 0x28

glabel putm
    /* 1CB6C 8002CB6C FFFFC624 */  addiu      $a2, $a2, -0x1
    /* 1CB70 8002CB70 0600C004 */  bltz       $a2, .L8002CB8C
    /* 1CB74 8002CB74 21208600 */   addu      $a0, $a0, $a2
  .L8002CB78:
    /* 1CB78 8002CB78 000085A0 */  sb         $a1, 0x0($a0)
    /* 1CB7C 8002CB7C 022A0500 */  srl        $a1, $a1, 8
    /* 1CB80 8002CB80 FFFFC624 */  addiu      $a2, $a2, -0x1
    /* 1CB84 8002CB84 FCFFC104 */  bgez       $a2, .L8002CB78
    /* 1CB88 8002CB88 FFFF8424 */   addiu     $a0, $a0, -0x1
  .L8002CB8C:
    /* 1CB8C 8002CB8C 0800E003 */  jr         $ra
    /* 1CB90 8002CB90 00000000 */   nop
endlabel putm
