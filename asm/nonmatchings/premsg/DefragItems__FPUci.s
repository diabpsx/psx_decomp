.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DefragItems__FPUci, 0x48

glabel DefragItems__FPUci
    /* 293DC 80162FD4 0F00A018 */  blez       $a1, .L80163014
    /* 293E0 80162FD8 21180000 */   addu      $v1, $zero, $zero
    /* 293E4 80162FDC FF000624 */  addiu      $a2, $zero, 0xFF
    /* 293E8 80162FE0 2128A400 */  addu       $a1, $a1, $a0
  .L80162FE4:
    /* 293EC 80162FE4 00008290 */  lbu        $v0, 0x0($a0)
    /* 293F0 80162FE8 00000000 */  nop
    /* 293F4 80162FEC 05004610 */  beq        $v0, $a2, .L80163004
    /* 293F8 80162FF0 00000000 */   nop
    /* 293FC 80162FF4 0D80013C */  lui        $at, %hi(itemactive)
    /* 29400 80162FF8 21082300 */  addu       $at, $at, $v1
    /* 29404 80162FFC 545322A0 */  sb         $v0, %lo(itemactive)($at)
    /* 29408 80163000 01006324 */  addiu      $v1, $v1, 0x1
  .L80163004:
    /* 2940C 80163004 01008424 */  addiu      $a0, $a0, 0x1
    /* 29410 80163008 2A108500 */  slt        $v0, $a0, $a1
    /* 29414 8016300C F5FF4014 */  bnez       $v0, .L80162FE4
    /* 29418 80163010 00000000 */   nop
  .L80163014:
    /* 2941C 80163014 0800E003 */  jr         $ra
    /* 29420 80163018 00000000 */   nop
endlabel DefragItems__FPUci
