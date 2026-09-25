.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CheckTrigLevel__Fi, 0x3C

glabel CheckTrigLevel__Fi
    /* 66A8C 80076A8C 0E80023C */  lui        $v0, %hi(plr + 0x13C)
    /* 66A90 80076A90 74A64280 */  lb         $v0, %lo(plr + 0x13C)($v0)
    /* 66A94 80076A94 00000000 */  nop
    /* 66A98 80076A98 2A104400 */  slt        $v0, $v0, $a0
    /* 66A9C 80076A9C 08004010 */  beqz       $v0, .L80076AC0
    /* 66AA0 80076AA0 01000224 */   addiu     $v0, $zero, 0x1
    /* 66AA4 80076AA4 0E80023C */  lui        $v0, %hi(plr + 0x1B24)
    /* 66AA8 80076AA8 5CC04280 */  lb         $v0, %lo(plr + 0x1B24)($v0)
    /* 66AAC 80076AAC 00000000 */  nop
    /* 66AB0 80076AB0 2A104400 */  slt        $v0, $v0, $a0
    /* 66AB4 80076AB4 02004014 */  bnez       $v0, .L80076AC0
    /* 66AB8 80076AB8 21100000 */   addu      $v0, $zero, $zero
    /* 66ABC 80076ABC 01000224 */  addiu      $v0, $zero, 0x1
  .L80076AC0:
    /* 66AC0 80076AC0 0800E003 */  jr         $ra
    /* 66AC4 80076AC4 00000000 */   nop
endlabel CheckTrigLevel__Fi
