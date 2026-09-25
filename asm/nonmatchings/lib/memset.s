.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching memset, 0x24

glabel memset
    /* 3A4 800103A4 0600C010 */  beqz       $a2, .L800103C0
    /* 3A8 800103A8 FFFFC224 */   addiu     $v0, $a2, -0x1
    /* 3AC 800103AC FFFF0324 */  addiu      $v1, $zero, -0x1
  .L800103B0:
    /* 3B0 800103B0 000085A0 */  sb         $a1, 0x0($a0)
    /* 3B4 800103B4 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 3B8 800103B8 FDFF4314 */  bne        $v0, $v1, .L800103B0
    /* 3BC 800103BC 01008424 */   addiu     $a0, $a0, 0x1
  .L800103C0:
    /* 3C0 800103C0 0800E003 */  jr         $ra
    /* 3C4 800103C4 00000000 */   nop
endlabel memset
