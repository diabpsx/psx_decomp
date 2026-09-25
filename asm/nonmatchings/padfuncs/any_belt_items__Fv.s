.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching any_belt_items__Fv, 0x68

glabel any_belt_items__Fv
    /* 90A68 800A0A68 21200000 */  addu       $a0, $zero, $zero
    /* 90A6C 800A0A6C 1280033C */  lui        $v1, %hi(myplr)
    /* 90A70 800A0A70 08BA638C */  lw         $v1, %lo(myplr)($v1)
    /* 90A74 800A0A74 FFFF0524 */  addiu      $a1, $zero, -0x1
    /* 90A78 800A0A78 40100300 */  sll        $v0, $v1, 1
    /* 90A7C 800A0A7C 21104300 */  addu       $v0, $v0, $v1
    /* 90A80 800A0A80 80100200 */  sll        $v0, $v0, 2
    /* 90A84 800A0A84 21104300 */  addu       $v0, $v0, $v1
    /* 90A88 800A0A88 00110200 */  sll        $v0, $v0, 4
    /* 90A8C 800A0A8C 23104300 */  subu       $v0, $v0, $v1
    /* 90A90 800A0A90 80100200 */  sll        $v0, $v0, 2
    /* 90A94 800A0A94 21104300 */  addu       $v0, $v0, $v1
    /* 90A98 800A0A98 C0180200 */  sll        $v1, $v0, 3
  .L800A0A9C:
    /* 90A9C 800A0A9C 0E80013C */  lui        $at, %hi(plr + 0x15DC)
    /* 90AA0 800A0AA0 21082300 */  addu       $at, $at, $v1
    /* 90AA4 800A0AA4 14BB2284 */  lh         $v0, %lo(plr + 0x15DC)($at)
    /* 90AA8 800A0AA8 00000000 */  nop
    /* 90AAC 800A0AAC 06004514 */  bne        $v0, $a1, .L800A0AC8
    /* 90AB0 800A0AB0 01000224 */   addiu     $v0, $zero, 0x1
    /* 90AB4 800A0AB4 01008424 */  addiu      $a0, $a0, 0x1
    /* 90AB8 800A0AB8 08008228 */  slti       $v0, $a0, 0x8
    /* 90ABC 800A0ABC F7FF4014 */  bnez       $v0, .L800A0A9C
    /* 90AC0 800A0AC0 6C006324 */   addiu     $v1, $v1, 0x6C
    /* 90AC4 800A0AC4 21100000 */  addu       $v0, $zero, $zero
  .L800A0AC8:
    /* 90AC8 800A0AC8 0800E003 */  jr         $ra
    /* 90ACC 800A0ACC 00000000 */   nop
endlabel any_belt_items__Fv
