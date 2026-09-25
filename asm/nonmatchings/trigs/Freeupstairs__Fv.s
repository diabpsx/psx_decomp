.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Freeupstairs__Fv, 0xB0

glabel Freeupstairs__Fv
    /* 66390 80076390 F8FFBD27 */  addiu      $sp, $sp, -0x8
    /* 66394 80076394 F813828F */  lw         $v0, %gp_rel(numtrigs)($gp)
    /* 66398 80076398 00000000 */  nop
    /* 6639C 8007639C 25004018 */  blez       $v0, .L80076434
    /* 663A0 800763A0 21400000 */   addu      $t0, $zero, $zero
    /* 663A4 800763A4 21380000 */  addu       $a3, $zero, $zero
  .L800763A8:
    /* 663A8 800763A8 FEFF0524 */  addiu      $a1, $zero, -0x2
    /* 663AC 800763AC 0E80013C */  lui        $at, %hi(trigs)
    /* 663B0 800763B0 21082700 */  addu       $at, $at, $a3
    /* 663B4 800763B4 CC33298C */  lw         $t1, %lo(trigs)($at)
    /* 663B8 800763B8 0E80013C */  lui        $at, %hi(trigs + 0x4)
    /* 663BC 800763BC 21082700 */  addu       $at, $at, $a3
    /* 663C0 800763C0 D0332A8C */  lw         $t2, %lo(trigs + 0x4)($at)
  .L800763C4:
    /* 663C4 800763C4 FEFF0424 */  addiu      $a0, $zero, -0x2
    /* 663C8 800763C8 21104501 */  addu       $v0, $t2, $a1
    /* 663CC 800763CC C0300200 */  sll        $a2, $v0, 3
  .L800763D0:
    /* 663D0 800763D0 21182401 */  addu       $v1, $t1, $a0
    /* 663D4 800763D4 C0100300 */  sll        $v0, $v1, 3
    /* 663D8 800763D8 23104300 */  subu       $v0, $v0, $v1
    /* 663DC 800763DC C0110200 */  sll        $v0, $v0, 7
    /* 663E0 800763E0 2110C200 */  addu       $v0, $a2, $v0
    /* 663E4 800763E4 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 663E8 800763E8 21082200 */  addu       $at, $at, $v0
    /* 663EC 800763EC 2E7A2390 */  lbu        $v1, %lo(dung_map + 0x6)($at)
    /* 663F0 800763F0 01008424 */  addiu      $a0, $a0, 0x1
    /* 663F4 800763F4 08006334 */  ori        $v1, $v1, 0x8
    /* 663F8 800763F8 0E80013C */  lui        $at, %hi(dung_map + 0x6)
    /* 663FC 800763FC 21082200 */  addu       $at, $at, $v0
    /* 66400 80076400 2E7A23A0 */  sb         $v1, %lo(dung_map + 0x6)($at)
    /* 66404 80076404 03008228 */  slti       $v0, $a0, 0x3
    /* 66408 80076408 F1FF4014 */  bnez       $v0, .L800763D0
    /* 6640C 8007640C 00000000 */   nop
    /* 66410 80076410 0100A524 */  addiu      $a1, $a1, 0x1
    /* 66414 80076414 0300A228 */  slti       $v0, $a1, 0x3
    /* 66418 80076418 EAFF4014 */  bnez       $v0, .L800763C4
    /* 6641C 8007641C 00000000 */   nop
    /* 66420 80076420 F813828F */  lw         $v0, %gp_rel(numtrigs)($gp)
    /* 66424 80076424 01000825 */  addiu      $t0, $t0, 0x1
    /* 66428 80076428 2A100201 */  slt        $v0, $t0, $v0
    /* 6642C 8007642C DEFF4014 */  bnez       $v0, .L800763A8
    /* 66430 80076430 1000E724 */   addiu     $a3, $a3, 0x10
  .L80076434:
    /* 66434 80076434 0800BD27 */  addiu      $sp, $sp, 0x8
    /* 66438 80076438 0800E003 */  jr         $ra
    /* 6643C 8007643C 00000000 */   nop
endlabel Freeupstairs__Fv
