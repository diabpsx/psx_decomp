.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GetCreature__14TownToCreaturei, 0x1C

glabel GetCreature__14TownToCreaturei
    /* 81BE4 80091BE4 00008290 */  lbu        $v0, 0x0($a0)
    /* 81BE8 80091BE8 00000000 */  nop
    /* 81BEC 80091BEC 0200A214 */  bne        $a1, $v0, .L80091BF8
    /* 81BF0 80091BF0 FFFF0224 */   addiu     $v0, $zero, -0x1
    /* 81BF4 80091BF4 01008290 */  lbu        $v0, 0x1($a0)
  .L80091BF8:
    /* 81BF8 80091BF8 0800E003 */  jr         $ra
    /* 81BFC 80091BFC 00000000 */   nop
endlabel GetCreature__14TownToCreaturei
