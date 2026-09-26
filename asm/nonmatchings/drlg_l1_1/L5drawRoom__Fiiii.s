.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching L5drawRoom__Fiiii, 0x6C

glabel L5drawRoom__Fiiii
    /* 37D4 8013D3CC F0FFBD27 */  addiu      $sp, $sp, -0x10
    /* 37D8 8013D3D0 1600E018 */  blez       $a3, .L8013D42C
    /* 37DC 8013D3D4 21480000 */   addu      $t1, $zero, $zero
    /* 37E0 8013D3D8 0E800C3C */  lui        $t4, %hi(dungeon)
    /* 37E4 8013D3DC C4408C25 */  addiu      $t4, $t4, %lo(dungeon)
    /* 37E8 8013D3E0 01000B24 */  addiu      $t3, $zero, 0x1
  .L8013D3E4:
    /* 37EC 8013D3E4 0D00C018 */  blez       $a2, .L8013D41C
    /* 37F0 8013D3E8 21400000 */   addu      $t0, $zero, $zero
    /* 37F4 8013D3EC 21102501 */  addu       $v0, $t1, $a1
    /* 37F8 8013D3F0 40500200 */  sll        $t2, $v0, 1
  .L8013D3F4:
    /* 37FC 8013D3F4 21100401 */  addu       $v0, $t0, $a0
    /* 3800 8013D3F8 40180200 */  sll        $v1, $v0, 1
    /* 3804 8013D3FC 21186200 */  addu       $v1, $v1, $v0
    /* 3808 8013D400 40190300 */  sll        $v1, $v1, 5
    /* 380C 8013D404 21186C00 */  addu       $v1, $v1, $t4
    /* 3810 8013D408 21184301 */  addu       $v1, $t2, $v1
    /* 3814 8013D40C 01000825 */  addiu      $t0, $t0, 0x1
    /* 3818 8013D410 2A100601 */  slt        $v0, $t0, $a2
    /* 381C 8013D414 F7FF4014 */  bnez       $v0, .L8013D3F4
    /* 3820 8013D418 00006BA4 */   sh        $t3, 0x0($v1)
  .L8013D41C:
    /* 3824 8013D41C 01002925 */  addiu      $t1, $t1, 0x1
    /* 3828 8013D420 2A102701 */  slt        $v0, $t1, $a3
    /* 382C 8013D424 EFFF4014 */  bnez       $v0, .L8013D3E4
    /* 3830 8013D428 00000000 */   nop
  .L8013D42C:
    /* 3834 8013D42C 1000BD27 */  addiu      $sp, $sp, 0x10
    /* 3838 8013D430 0800E003 */  jr         $ra
    /* 383C 8013D434 00000000 */   nop
endlabel L5drawRoom__Fiiii
