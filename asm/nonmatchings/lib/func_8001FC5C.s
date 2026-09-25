.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching func_8001FC5C, 0x44

glabel func_8001FC5C
    /* FC5C 8001FC5C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* FC60 8001FC60 1400BFAF */  sw         $ra, 0x14($sp)
    /* FC64 8001FC64 6346000C */  jal        EnterCriticalSection
    /* FC68 8001FC68 00000000 */   nop
    /* FC6C 8001FC6C 03000424 */  addiu      $a0, $zero, 0x3
    /* FC70 8001FC70 9B48000C */  jal        ChangeClearRCnt
    /* FC74 8001FC74 01000524 */   addiu     $a1, $zero, 0x1
    /* FC78 8001FC78 1280053C */  lui        $a1, %hi(D_8011C924)
    /* FC7C 8001FC7C 24C9A524 */  addiu      $a1, $a1, %lo(D_8011C924)
    /* FC80 8001FC80 9B47000C */  jal        SysDeqIntRP
    /* FC84 8001FC84 01000424 */   addiu     $a0, $zero, 0x1
    /* FC88 8001FC88 6746000C */  jal        ExitCriticalSection
    /* FC8C 8001FC8C 00000000 */   nop
    /* FC90 8001FC90 1400BF8F */  lw         $ra, 0x14($sp)
    /* FC94 8001FC94 1800BD27 */  addiu      $sp, $sp, 0x18
    /* FC98 8001FC98 0800E003 */  jr         $ra
    /* FC9C 8001FC9C 00000000 */   nop
endlabel func_8001FC5C
