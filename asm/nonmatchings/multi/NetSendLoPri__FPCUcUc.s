.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching NetSendLoPri__FPCUcUc, 0x2C

glabel NetSendLoPri__FPCUcUc
    /* 42BA4 80052BA4 21288000 */  addu       $a1, $a0, $zero
    /* 42BA8 80052BA8 1280043C */  lui        $a0, %hi(myplr)
    /* 42BAC 80052BAC 08BA848C */  lw         $a0, %lo(myplr)($a0)
    /* 42BB0 80052BB0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 42BB4 80052BB4 1000BFAF */  sw         $ra, 0x10($sp)
    /* 42BB8 80052BB8 1A49010C */  jal        ParseCmd__FiPC4TCmd
    /* 42BBC 80052BBC 00000000 */   nop
    /* 42BC0 80052BC0 1000BF8F */  lw         $ra, 0x10($sp)
    /* 42BC4 80052BC4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 42BC8 80052BC8 0800E003 */  jr         $ra
    /* 42BCC 80052BCC 00000000 */   nop
endlabel NetSendLoPri__FPCUcUc
