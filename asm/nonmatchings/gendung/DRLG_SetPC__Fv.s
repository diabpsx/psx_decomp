.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DRLG_SetPC__Fv, 0xA0

glabel DRLG_SetPC__Fv
    /* 206C4 8015A2BC F0FFBD27 */  addiu      $sp, $sp, -0x10
    /* 206C8 8015A2C0 21280000 */  addu       $a1, $zero, $zero
    /* 206CC 8015A2C4 6C19828F */  lw         $v0, %gp_rel(setpc_w)($gp)
    /* 206D0 8015A2C8 6419838F */  lw         $v1, %gp_rel(setpc_x)($gp)
    /* 206D4 8015A2CC 40380200 */  sll        $a3, $v0, 1
    /* 206D8 8015A2D0 7019828F */  lw         $v0, %gp_rel(setpc_h)($gp)
    /* 206DC 8015A2D4 40180300 */  sll        $v1, $v1, 1
    /* 206E0 8015A2D8 40480200 */  sll        $t1, $v0, 1
    /* 206E4 8015A2DC 6819828F */  lw         $v0, %gp_rel(setpc_y)($gp)
    /* 206E8 8015A2E0 10006824 */  addiu      $t0, $v1, 0x10
    /* 206EC 8015A2E4 40100200 */  sll        $v0, $v0, 1
    /* 206F0 8015A2E8 19002019 */  blez       $t1, .L8015A350
    /* 206F4 8015A2EC 10004A24 */   addiu     $t2, $v0, 0x10
  .L8015A2F0:
    /* 206F8 8015A2F0 1300E018 */  blez       $a3, .L8015A340
    /* 206FC 8015A2F4 21200000 */   addu      $a0, $zero, $zero
    /* 20700 8015A2F8 21104501 */  addu       $v0, $t2, $a1
    /* 20704 8015A2FC C0300200 */  sll        $a2, $v0, 3
    /* 20708 8015A300 21180401 */  addu       $v1, $t0, $a0
  .L8015A304:
    /* 2070C 8015A304 C0100300 */  sll        $v0, $v1, 3
    /* 20710 8015A308 23104300 */  subu       $v0, $v0, $v1
    /* 20714 8015A30C C0110200 */  sll        $v0, $v0, 7
    /* 20718 8015A310 2110C200 */  addu       $v0, $a2, $v0
    /* 2071C 8015A314 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 20720 8015A318 21082200 */  addu       $at, $at, $v0
    /* 20724 8015A31C 2E7A2390 */  lbu        $v1, %lo(dung_map + 0x6)($at)
    /* 20728 8015A320 01008424 */  addiu      $a0, $a0, 0x1
    /* 2072C 8015A324 08006334 */  ori        $v1, $v1, 0x8
    /* 20730 8015A328 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 20734 8015A32C 21082200 */  addu       $at, $at, $v0
    /* 20738 8015A330 2E7A23A0 */  sb         $v1, %lo(dung_map + 0x6)($at)
    /* 2073C 8015A334 2A108700 */  slt        $v0, $a0, $a3
    /* 20740 8015A338 F2FF4014 */  bnez       $v0, .L8015A304
    /* 20744 8015A33C 21180401 */   addu      $v1, $t0, $a0
  .L8015A340:
    /* 20748 8015A340 0100A524 */  addiu      $a1, $a1, 0x1
    /* 2074C 8015A344 2A10A900 */  slt        $v0, $a1, $t1
    /* 20750 8015A348 E9FF4014 */  bnez       $v0, .L8015A2F0
    /* 20754 8015A34C 00000000 */   nop
  .L8015A350:
    /* 20758 8015A350 1000BD27 */  addiu      $sp, $sp, 0x10
    /* 2075C 8015A354 0800E003 */  jr         $ra
    /* 20760 8015A358 00000000 */   nop
endlabel DRLG_SetPC__Fv
