.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddObject__FP9CacheInfoP8map_infoii, 0x5C

glabel AddObject__FP9CacheInfoP8map_infoii
    /* 804B0 800904B0 0300A680 */  lb         $a2, 0x3($a1)
    /* 804B4 800904B4 00000000 */  nop
    /* 804B8 800904B8 0300C01C */  bgtz       $a2, .L800904C8
    /* 804BC 800904BC 21388000 */   addu      $a3, $a0, $zero
    /* 804C0 800904C0 41410208 */  j          .L80090504
    /* 804C4 800904C4 21100000 */   addu      $v0, $zero, $zero
  .L800904C8:
    /* 804C8 800904C8 01000224 */  addiu      $v0, $zero, 0x1
    /* 804CC 800904CC 40180600 */  sll        $v1, $a2, 1
    /* 804D0 800904D0 21186600 */  addu       $v1, $v1, $a2
    /* 804D4 800904D4 80180300 */  sll        $v1, $v1, 2
    /* 804D8 800904D8 23186600 */  subu       $v1, $v1, $a2
    /* 804DC 800904DC 80180300 */  sll        $v1, $v1, 2
    /* 804E0 800904E0 0E80043C */  lui        $a0, %hi(shrineavail + 0x4)
    /* 804E4 800904E4 208C8424 */  addiu      $a0, $a0, %lo(shrineavail + 0x4)
    /* 804E8 800904E8 21186400 */  addu       $v1, $v1, $a0
    /* 804EC 800904EC 0000E590 */  lbu        $a1, 0x0($a3)
    /* 804F0 800904F0 001A0300 */  sll        $v1, $v1, 8
    /* 804F4 800904F4 2528A300 */  or         $a1, $a1, $v1
    /* 804F8 800904F8 FFFFC324 */  addiu      $v1, $a2, -0x1
    /* 804FC 800904FC 0000E5AC */  sw         $a1, 0x0($a3)
    /* 80500 80090500 0000E3A0 */  sb         $v1, 0x0($a3)
  .L80090504:
    /* 80504 80090504 0800E003 */  jr         $ra
    /* 80508 80090508 00000000 */   nop
endlabel AddObject__FP9CacheInfoP8map_infoii
