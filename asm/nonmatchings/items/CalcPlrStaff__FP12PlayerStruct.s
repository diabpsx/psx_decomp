.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CalcPlrStaff__FP12PlayerStruct, 0xCC

glabel CalcPlrStaff__FP12PlayerStruct
    /* 2F4B0 8003F4B0 21388000 */  addu       $a3, $a0, $zero
    /* 2F4B4 8003F4B4 21400000 */  addu       $t0, $zero, $zero
    /* 2F4B8 8003F4B8 21480000 */  addu       $t1, $zero, $zero
    /* 2F4BC 8003F4BC 8C03E284 */  lh         $v0, 0x38C($a3)
    /* 2F4C0 8003F4C0 FFFF0424 */  addiu      $a0, $zero, -0x1
    /* 2F4C4 8003F4C4 B019E8AC */  sw         $t0, 0x19B0($a3)
    /* 2F4C8 8003F4C8 B419E9AC */  sw         $t1, 0x19B4($a3)
    /* 2F4CC 8003F4CC 29004410 */  beq        $v0, $a0, .L8003F574
    /* 2F4D0 8003F4D0 00000000 */   nop
    /* 2F4D4 8003F4D4 C603E280 */  lb         $v0, 0x3C6($a3)
    /* 2F4D8 8003F4D8 00000000 */  nop
    /* 2F4DC 8003F4DC 25004010 */  beqz       $v0, .L8003F574
    /* 2F4E0 8003F4E0 00000000 */   nop
    /* 2F4E4 8003F4E4 A903E290 */  lbu        $v0, 0x3A9($a3)
    /* 2F4E8 8003F4E8 00000000 */  nop
    /* 2F4EC 8003F4EC 16004010 */  beqz       $v0, .L8003F548
    /* 2F4F0 8003F4F0 00000000 */   nop
    /* 2F4F4 8003F4F4 9D03E280 */  lb         $v0, 0x39D($a3)
    /* 2F4F8 8003F4F8 00000524 */  addiu      $a1, $zero, 0x0
    /* 2F4FC 8003F4FC 01000424 */  addiu      $a0, $zero, 0x1
    /* 2F500 8003F500 FFFF4224 */  addiu      $v0, $v0, -0x1
    /* 2F504 8003F504 80360200 */  sll        $a2, $v0, 26
    /* 2F508 8003F508 0400C104 */  bgez       $a2, .L8003F51C
    /* 2F50C 8003F50C 00000000 */   nop
    /* 2F510 8003F510 04484400 */  sllv       $t1, $a0, $v0
    /* 2F514 8003F514 07000104 */  bgez       $zero, .L8003F534
    /* 2F518 8003F518 21400000 */   addu      $t0, $zero, $zero
  .L8003F51C:
    /* 2F51C 8003F51C 0400C010 */  beqz       $a2, .L8003F530
    /* 2F520 8003F520 04484500 */   sllv      $t1, $a1, $v0
    /* 2F524 8003F524 23300200 */  negu       $a2, $v0
    /* 2F528 8003F528 0630C400 */  srlv       $a2, $a0, $a2
    /* 2F52C 8003F52C 25482601 */  or         $t1, $t1, $a2
  .L8003F530:
    /* 2F530 8003F530 04404400 */  sllv       $t0, $a0, $v0
  .L8003F534:
    /* 2F534 8003F534 21100001 */  addu       $v0, $t0, $zero
    /* 2F538 8003F538 B019E8AC */  sw         $t0, 0x19B0($a3)
    /* 2F53C 8003F53C B419E9AC */  sw         $t1, 0x19B4($a3)
    /* 2F540 8003F540 5DFD0008 */  j          .L8003F574
    /* 2F544 8003F544 21182001 */   addu      $v1, $t1, $zero
  .L8003F548:
    /* 2F548 8003F548 9D03E380 */  lb         $v1, 0x39D($a3)
    /* 2F54C 8003F54C 6400E28C */  lw         $v0, 0x64($a3)
    /* 2F550 8003F550 00000000 */  nop
    /* 2F554 8003F554 07006214 */  bne        $v1, $v0, .L8003F574
    /* 2F558 8003F558 03000224 */   addiu     $v0, $zero, 0x3
    /* 2F55C 8003F55C 6800E380 */  lb         $v1, 0x68($a3)
    /* 2F560 8003F560 00000000 */  nop
    /* 2F564 8003F564 03006214 */  bne        $v1, $v0, .L8003F574
    /* 2F568 8003F568 04000224 */   addiu     $v0, $zero, 0x4
    /* 2F56C 8003F56C 6400E4AC */  sw         $a0, 0x64($a3)
    /* 2F570 8003F570 6800E2A0 */  sb         $v0, 0x68($a3)
  .L8003F574:
    /* 2F574 8003F574 0800E003 */  jr         $ra
    /* 2F578 8003F578 00000000 */   nop
endlabel CalcPlrStaff__FP12PlayerStruct
