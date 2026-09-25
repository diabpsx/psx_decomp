.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching _spu_FgetRXXa, 0x3C

glabel _spu_FgetRXXa
    /* 71D0 800171D0 0B80023C */  lui        $v0, %hi(_spu_RXX)
    /* 71D4 800171D4 4C5A428C */  lw         $v0, %lo(_spu_RXX)($v0)
    /* 71D8 800171D8 40200400 */  sll        $a0, $a0, 1
    /* 71DC 800171DC 21208200 */  addu       $a0, $a0, $v0
    /* 71E0 800171E0 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 71E4 800171E4 00008494 */  lhu        $a0, 0x0($a0)
    /* 71E8 800171E8 0500A210 */  beq        $a1, $v0, .L80017200
    /* 71EC 800171EC 00000000 */   nop
    /* 71F0 800171F0 0B80023C */  lui        $v0, %hi(_spu_mem_mode_plus)
    /* 71F4 800171F4 745A428C */  lw         $v0, %lo(_spu_mem_mode_plus)($v0)
    /* 71F8 800171F8 815C0008 */  j          .L80017204
    /* 71FC 800171FC 04104400 */   sllv      $v0, $a0, $v0
  .L80017200:
    /* 7200 80017200 21108000 */  addu       $v0, $a0, $zero
  .L80017204:
    /* 7204 80017204 0800E003 */  jr         $ra
    /* 7208 80017208 00000000 */   nop
endlabel _spu_FgetRXXa
