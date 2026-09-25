.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching _SpuIsInAllocateArea_, 0x8C

glabel _SpuIsInAllocateArea_
    /* 7B5C 80017B5C 0B80023C */  lui        $v0, %hi(_spu_mem_mode_plus)
    /* 7B60 80017B60 745A428C */  lw         $v0, %lo(_spu_mem_mode_plus)($v0)
    /* 7B64 80017B64 0B80033C */  lui        $v1, %hi(_spu_memList)
    /* 7B68 80017B68 B45A638C */  lw         $v1, %lo(_spu_memList)($v1)
    /* 7B6C 80017B6C 00000000 */  nop
    /* 7B70 80017B70 03006014 */  bnez       $v1, .L80017B80
    /* 7B74 80017B74 04204400 */   sllv      $a0, $a0, $v0
    /* 7B78 80017B78 F85E0008 */  j          .L80017BE0
    /* 7B7C 80017B7C 21100000 */   addu      $v0, $zero, $zero
  .L80017B80:
    /* 7B80 80017B80 0080083C */  lui        $t0, (0x80000000 >> 16)
    /* 7B84 80017B84 0040073C */  lui        $a3, (0x40000000 >> 16)
    /* 7B88 80017B88 FF0F063C */  lui        $a2, (0xFFFFFFF >> 16)
    /* 7B8C 80017B8C FFFFC634 */  ori        $a2, $a2, (0xFFFFFFF & 0xFFFF)
    /* 7B90 80017B90 21286000 */  addu       $a1, $v1, $zero
  .L80017B94:
    /* 7B94 80017B94 0000A38C */  lw         $v1, 0x0($a1)
    /* 7B98 80017B98 00000000 */  nop
    /* 7B9C 80017B9C 24106800 */  and        $v0, $v1, $t0
    /* 7BA0 80017BA0 0C004014 */  bnez       $v0, .L80017BD4
    /* 7BA4 80017BA4 24106700 */   and       $v0, $v1, $a3
    /* 7BA8 80017BA8 0C004014 */  bnez       $v0, .L80017BDC
    /* 7BAC 80017BAC 24186600 */   and       $v1, $v1, $a2
    /* 7BB0 80017BB0 2B106400 */  sltu       $v0, $v1, $a0
    /* 7BB4 80017BB4 0A004010 */  beqz       $v0, .L80017BE0
    /* 7BB8 80017BB8 01000224 */   addiu     $v0, $zero, 0x1
    /* 7BBC 80017BBC 0400A28C */  lw         $v0, 0x4($a1)
    /* 7BC0 80017BC0 00000000 */  nop
    /* 7BC4 80017BC4 21106200 */  addu       $v0, $v1, $v0
    /* 7BC8 80017BC8 2B108200 */  sltu       $v0, $a0, $v0
    /* 7BCC 80017BCC 04004014 */  bnez       $v0, .L80017BE0
    /* 7BD0 80017BD0 01000224 */   addiu     $v0, $zero, 0x1
  .L80017BD4:
    /* 7BD4 80017BD4 E55E0008 */  j          .L80017B94
    /* 7BD8 80017BD8 0800A524 */   addiu     $a1, $a1, 0x8
  .L80017BDC:
    /* 7BDC 80017BDC 21100000 */  addu       $v0, $zero, $zero
  .L80017BE0:
    /* 7BE0 80017BE0 0800E003 */  jr         $ra
    /* 7BE4 80017BE4 00000000 */   nop
endlabel _SpuIsInAllocateArea_
    /* 7BE8 80017BE8 00000000 */  nop
