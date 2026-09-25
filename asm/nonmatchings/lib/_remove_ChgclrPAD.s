.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

/* Handwritten function */
nonmatching _remove_ChgclrPAD, 0x68

glabel _remove_ChgclrPAD
    /* 1FEC 80011FEC 1380013C */  lui        $at, %hi(D_8012FFC0)
    /* 1FF0 80011FF0 C0FF3FAC */  sw         $ra, %lo(D_8012FFC0)($at)
    /* 1FF4 80011FF4 6346000C */  jal        EnterCriticalSection
    /* 1FF8 80011FF8 00000000 */   nop
    /* 1FFC 80011FFC 57000924 */  addiu      $t1, $zero, 0x57
    /* 2000 80012000 B0000A24 */  addiu      $t2, $zero, 0xB0
    /* 2004 80012004 09F84001 */  jalr       $t2
    /* 2008 80012008 00000000 */   nop
    /* 200C 8001200C 09000A24 */  addiu      $t2, $zero, 0x9
    /* 2010 80012010 6C01428C */  lw         $v0, 0x16C($v0)
    /* 2014 80012014 00000000 */  nop
    /* 2018 80012018 2C064320 */  addi       $v1, $v0, 0x62C /* handwritten instruction */
  .L8001201C:
    /* 201C 8001201C 000060AC */  sw         $zero, 0x0($v1)
    /* 2020 80012020 04006324 */  addiu      $v1, $v1, 0x4
    /* 2024 80012024 FFFF4A25 */  addiu      $t2, $t2, -0x1
    /* 2028 80012028 FCFF4015 */  bnez       $t2, .L8001201C
    /* 202C 8001202C 00000000 */   nop
    /* 2030 80012030 4F46000C */  jal        FlushCache
    /* 2034 80012034 00000000 */   nop
    /* 2038 80012038 6746000C */  jal        ExitCriticalSection
    /* 203C 8001203C 00000000 */   nop
    /* 2040 80012040 13801F3C */  lui        $ra, %hi(D_8012FFC0)
    /* 2044 80012044 C0FFFF8F */  lw         $ra, %lo(D_8012FFC0)($ra)
    /* 2048 80012048 00000000 */  nop
    /* 204C 8001204C 0800E003 */  jr         $ra
    /* 2050 80012050 00000000 */   nop
endlabel _remove_ChgclrPAD
    /* 2054 80012054 00000000 */  nop
    /* 2058 80012058 00000000 */  nop
