.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PlrHitObj__FP12PlayerStructii, 0x80

glabel PlrHitObj__FP12PlayerStructii
    /* 533F0 800633F0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 533F4 800633F4 C0300600 */  sll        $a2, $a2, 3
    /* 533F8 800633F8 C0100500 */  sll        $v0, $a1, 3
    /* 533FC 800633FC 23104500 */  subu       $v0, $v0, $a1
    /* 53400 80063400 C0110200 */  sll        $v0, $v0, 7
    /* 53404 80063404 2130C200 */  addu       $a2, $a2, $v0
    /* 53408 80063408 1000BFAF */  sw         $ra, 0x10($sp)
    /* 5340C 8006340C 0E80013C */  lui        $at, %hi(dung_map + 0x3)
    /* 53410 80063410 21082600 */  addu       $at, $at, $a2
    /* 53414 80063414 2B7A2280 */  lb         $v0, %lo(dung_map + 0x3)($at)
    /* 53418 80063418 00000000 */  nop
    /* 5341C 8006341C 0200401C */  bgtz       $v0, .L80063428
    /* 53420 80063420 FFFF4524 */   addiu     $a1, $v0, -0x1
    /* 53424 80063424 27280200 */  nor        $a1, $zero, $v0
  .L80063428:
    /* 53428 80063428 40100500 */  sll        $v0, $a1, 1
    /* 5342C 8006342C 21104500 */  addu       $v0, $v0, $a1
    /* 53430 80063430 80100200 */  sll        $v0, $v0, 2
    /* 53434 80063434 23104500 */  subu       $v0, $v0, $a1
    /* 53438 80063438 80100200 */  sll        $v0, $v0, 2
    /* 5343C 8006343C 0E80013C */  lui        $at, %hi(object + 0x22)
    /* 53440 80063440 21082200 */  addu       $at, $at, $v0
    /* 53444 80063444 6E8C2380 */  lb         $v1, %lo(object + 0x22)($at)
    /* 53448 80063448 01000224 */  addiu      $v0, $zero, 0x1
    /* 5344C 8006344C 04006214 */  bne        $v1, $v0, .L80063460
    /* 53450 80063450 21100000 */   addu      $v0, $zero, $zero
    /* 53454 80063454 139A010C */  jal        BreakObject__FP12PlayerStructi
    /* 53458 80063458 00000000 */   nop
    /* 5345C 8006345C 01000224 */  addiu      $v0, $zero, 0x1
  .L80063460:
    /* 53460 80063460 1000BF8F */  lw         $ra, 0x10($sp)
    /* 53464 80063464 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 53468 80063468 0800E003 */  jr         $ra
    /* 5346C 8006346C 00000000 */   nop
endlabel PlrHitObj__FP12PlayerStructii
