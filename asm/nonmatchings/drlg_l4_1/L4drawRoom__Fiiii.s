.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching L4drawRoom__Fiiii, 0x68

glabel L4drawRoom__Fiiii
    /* 19094 80152C8C F0FFBD27 */  addiu      $sp, $sp, -0x10
    /* 19098 80152C90 1500E018 */  blez       $a3, .L80152CE8
    /* 1909C 80152C94 21480000 */   addu      $t1, $zero, $zero
    /* 190A0 80152C98 15800C3C */  lui        $t4, %hi(dung)
    /* 190A4 80152C9C 74D88C25 */  addiu      $t4, $t4, %lo(dung)
    /* 190A8 80152CA0 01000B24 */  addiu      $t3, $zero, 0x1
  .L80152CA4:
    /* 190AC 80152CA4 0C00C018 */  blez       $a2, .L80152CD8
    /* 190B0 80152CA8 21400000 */   addu      $t0, $zero, $zero
    /* 190B4 80152CAC 2150A900 */  addu       $t2, $a1, $t1
  .L80152CB0:
    /* 190B8 80152CB0 21108800 */  addu       $v0, $a0, $t0
    /* 190BC 80152CB4 80180200 */  sll        $v1, $v0, 2
    /* 190C0 80152CB8 21186200 */  addu       $v1, $v1, $v0
    /* 190C4 80152CBC 80180300 */  sll        $v1, $v1, 2
    /* 190C8 80152CC0 21186C00 */  addu       $v1, $v1, $t4
    /* 190CC 80152CC4 21186A00 */  addu       $v1, $v1, $t2
    /* 190D0 80152CC8 01000825 */  addiu      $t0, $t0, 0x1
    /* 190D4 80152CCC 2A100601 */  slt        $v0, $t0, $a2
    /* 190D8 80152CD0 F7FF4014 */  bnez       $v0, .L80152CB0
    /* 190DC 80152CD4 00006BA0 */   sb        $t3, 0x0($v1)
  .L80152CD8:
    /* 190E0 80152CD8 01002925 */  addiu      $t1, $t1, 0x1
    /* 190E4 80152CDC 2A102701 */  slt        $v0, $t1, $a3
    /* 190E8 80152CE0 F0FF4014 */  bnez       $v0, .L80152CA4
    /* 190EC 80152CE4 00000000 */   nop
  .L80152CE8:
    /* 190F0 80152CE8 1000BD27 */  addiu      $sp, $sp, 0x10
    /* 190F4 80152CEC 0800E003 */  jr         $ra
    /* 190F8 80152CF0 00000000 */   nop
endlabel L4drawRoom__Fiiii
