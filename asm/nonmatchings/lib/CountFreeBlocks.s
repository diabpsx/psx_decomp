.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CountFreeBlocks, 0x2C

glabel CountFreeBlocks
    /* 13008 80023008 1280033C */  lui        $v1, %hi(D_8011C9D0)
    /* 1300C 8002300C D0C9638C */  lw         $v1, %lo(D_8011C9D0)($v1)
    /* 13010 80023010 00000000 */  nop
    /* 13014 80023014 05006010 */  beqz       $v1, .L8002302C
    /* 13018 80023018 21100000 */   addu      $v0, $zero, $zero
  .L8002301C:
    /* 1301C 8002301C 0400638C */  lw         $v1, 0x4($v1)
    /* 13020 80023020 00000000 */  nop
    /* 13024 80023024 FDFF6014 */  bnez       $v1, .L8002301C
    /* 13028 80023028 01004224 */   addiu     $v0, $v0, 0x1
  .L8002302C:
    /* 1302C 8002302C 0800E003 */  jr         $ra
    /* 13030 80023030 00000000 */   nop
endlabel CountFreeBlocks
