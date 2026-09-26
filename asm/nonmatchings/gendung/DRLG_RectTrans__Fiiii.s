.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_RectTrans__Fiiii, 0x74

glabel DRLG_RectTrans__Fiiii
    /* 204EC 8015A0E4 2A10E500 */  slt        $v0, $a3, $a1
    /* 204F0 8015A0E8 15004014 */  bnez       $v0, .L8015A140
    /* 204F4 8015A0EC 00000000 */   nop
  .L8015A0F0:
    /* 204F8 8015A0F0 21408000 */  addu       $t0, $a0, $zero
    /* 204FC 8015A0F4 2A10C400 */  slt        $v0, $a2, $a0
    /* 20500 8015A0F8 0D004014 */  bnez       $v0, .L8015A130
    /* 20504 8015A0FC C0100800 */   sll       $v0, $t0, 3
    /* 20508 8015A100 C0180500 */  sll        $v1, $a1, 3
    /* 2050C 8015A104 23104800 */  subu       $v0, $v0, $t0
    /* 20510 8015A108 C0110200 */  sll        $v0, $v0, 7
    /* 20514 8015A10C 21184300 */  addu       $v1, $v0, $v1
  .L8015A110:
    /* 20518 8015A110 C8198293 */  lbu        $v0, %gp_rel(TransVal)($gp)
    /* 2051C 8015A114 01000825 */  addiu      $t0, $t0, 0x1
    /* 20520 8015A118 0E80013C */  lui        $at, %hi(dung_map + 0x7)
    /* 20524 8015A11C 21082300 */  addu       $at, $at, $v1
    /* 20528 8015A120 2F7A22A0 */  sb         $v0, %lo(dung_map + 0x7)($at)
    /* 2052C 8015A124 2A10C800 */  slt        $v0, $a2, $t0
    /* 20530 8015A128 F9FF4010 */  beqz       $v0, .L8015A110
    /* 20534 8015A12C 80036324 */   addiu     $v1, $v1, 0x380
  .L8015A130:
    /* 20538 8015A130 0100A524 */  addiu      $a1, $a1, 0x1
    /* 2053C 8015A134 2A10E500 */  slt        $v0, $a3, $a1
    /* 20540 8015A138 EDFF4010 */  beqz       $v0, .L8015A0F0
    /* 20544 8015A13C 00000000 */   nop
  .L8015A140:
    /* 20548 8015A140 C8198293 */  lbu        $v0, %gp_rel(TransVal)($gp)
    /* 2054C 8015A144 00000000 */  nop
    /* 20550 8015A148 01004224 */  addiu      $v0, $v0, 0x1
    /* 20554 8015A14C C81982A3 */  sb         $v0, %gp_rel(TransVal)($gp)
    /* 20558 8015A150 0800E003 */  jr         $ra
    /* 2055C 8015A154 00000000 */   nop
endlabel DRLG_RectTrans__Fiiii
