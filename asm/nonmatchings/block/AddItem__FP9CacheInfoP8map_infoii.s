.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AddItem__FP9CacheInfoP8map_infoii, 0x5C

glabel AddItem__FP9CacheInfoP8map_infoii
    /* 80CB8 80090CB8 0400A680 */  lb         $a2, 0x4($a1)
    /* 80CBC 80090CBC 00000000 */  nop
    /* 80CC0 80090CC0 0300C014 */  bnez       $a2, .L80090CD0
    /* 80CC4 80090CC4 21388000 */   addu      $a3, $a0, $zero
    /* 80CC8 80090CC8 43430208 */  j          .L80090D0C
    /* 80CCC 80090CCC 21100000 */   addu      $v0, $zero, $zero
  .L80090CD0:
    /* 80CD0 80090CD0 01000224 */  addiu      $v0, $zero, 0x1
    /* 80CD4 80090CD4 C0180600 */  sll        $v1, $a2, 3
    /* 80CD8 80090CD8 23186600 */  subu       $v1, $v1, $a2
    /* 80CDC 80090CDC 80180300 */  sll        $v1, $v1, 2
    /* 80CE0 80090CE0 23186600 */  subu       $v1, $v1, $a2
    /* 80CE4 80090CE4 80180300 */  sll        $v1, $v1, 2
    /* 80CE8 80090CE8 0D80043C */  lui        $a0, %hi(ItemInvSnds + 0x38)
    /* 80CEC 80090CEC E81C8424 */  addiu      $a0, $a0, %lo(ItemInvSnds + 0x38)
    /* 80CF0 80090CF0 21186400 */  addu       $v1, $v1, $a0
    /* 80CF4 80090CF4 0000E590 */  lbu        $a1, 0x0($a3)
    /* 80CF8 80090CF8 001A0300 */  sll        $v1, $v1, 8
    /* 80CFC 80090CFC 2528A300 */  or         $a1, $a1, $v1
    /* 80D00 80090D00 FFFFC324 */  addiu      $v1, $a2, -0x1
    /* 80D04 80090D04 0000E5AC */  sw         $a1, 0x0($a3)
    /* 80D08 80090D08 0000E3A0 */  sb         $v1, 0x0($a3)
  .L80090D0C:
    /* 80D0C 80090D0C 0800E003 */  jr         $ra
    /* 80D10 80090D10 00000000 */   nop
endlabel AddItem__FP9CacheInfoP8map_infoii
