.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching StartCARD, 0x38

glabel StartCARD
    /* A8C8 8001A8C8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* A8CC 8001A8CC 1000BFAF */  sw         $ra, 0x10($sp)
    /* A8D0 8001A8D0 6346000C */  jal        EnterCriticalSection
    /* A8D4 8001A8D4 00000000 */   nop
    /* A8D8 8001A8D8 4F6A000C */  jal        StartCARD2
    /* A8DC 8001A8DC 00000000 */   nop
    /* A8E0 8001A8E0 9346000C */  jal        ChangeClearPAD
    /* A8E4 8001A8E4 21200000 */   addu      $a0, $zero, $zero
    /* A8E8 8001A8E8 6746000C */  jal        ExitCriticalSection
    /* A8EC 8001A8EC 00000000 */   nop
    /* A8F0 8001A8F0 1000BF8F */  lw         $ra, 0x10($sp)
    /* A8F4 8001A8F4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* A8F8 8001A8F8 0800E003 */  jr         $ra
    /* A8FC 8001A8FC 00000000 */   nop
endlabel StartCARD
