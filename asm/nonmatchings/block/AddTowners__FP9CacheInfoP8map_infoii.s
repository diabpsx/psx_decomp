.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddTowners__FP9CacheInfoP8map_infoii, 0x5C

glabel AddTowners__FP9CacheInfoP8map_infoii
    /* 8009C 8009009C 0000A384 */  lh         $v1, 0x0($a1)
    /* 800A0 800900A0 00000000 */  nop
    /* 800A4 800900A4 0300601C */  bgtz       $v1, .L800900B4
    /* 800A8 800900A8 21388000 */   addu      $a3, $a0, $zero
    /* 800AC 800900AC 3C400208 */  j          .L800900F0
    /* 800B0 800900B0 21100000 */   addu      $v0, $zero, $zero
  .L800900B4:
    /* 800B4 800900B4 01000224 */  addiu      $v0, $zero, 0x1
    /* 800B8 800900B8 FFFF6324 */  addiu      $v1, $v1, -0x1
    /* 800BC 800900BC 40200300 */  sll        $a0, $v1, 1
    /* 800C0 800900C0 21208300 */  addu       $a0, $a0, $v1
    /* 800C4 800900C4 80200400 */  sll        $a0, $a0, 2
    /* 800C8 800900C8 21208300 */  addu       $a0, $a0, $v1
    /* 800CC 800900CC C0200400 */  sll        $a0, $a0, 3
    /* 800D0 800900D0 1080053C */  lui        $a1, %hi(monster)
    /* 800D4 800900D4 9453A524 */  addiu      $a1, $a1, %lo(monster)
    /* 800D8 800900D8 21208500 */  addu       $a0, $a0, $a1
    /* 800DC 800900DC 0000E690 */  lbu        $a2, 0x0($a3)
    /* 800E0 800900E0 00220400 */  sll        $a0, $a0, 8
    /* 800E4 800900E4 2530C400 */  or         $a2, $a2, $a0
    /* 800E8 800900E8 0000E6AC */  sw         $a2, 0x0($a3)
    /* 800EC 800900EC 0000E3A0 */  sb         $v1, 0x0($a3)
  .L800900F0:
    /* 800F0 800900F0 0800E003 */  jr         $ra
    /* 800F4 800900F4 00000000 */   nop
endlabel AddTowners__FP9CacheInfoP8map_infoii
