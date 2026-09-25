.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching Unload__7CScreen, 0x24

glabel Unload__7CScreen
    /* 84BA4 80094BA4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 84BA8 80094BA8 FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 84BAC 80094BAC 1000BFAF */  sw         $ra, 0x10($sp)
    /* 84BB0 80094BB0 A14E020C */  jal        DumpData__7TextDat
    /* 84BB4 80094BB4 700082AC */   sw        $v0, 0x70($a0)
    /* 84BB8 80094BB8 1000BF8F */  lw         $ra, 0x10($sp)
    /* 84BBC 80094BBC 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 84BC0 80094BC0 0800E003 */  jr         $ra
    /* 84BC4 80094BC4 00000000 */   nop
endlabel Unload__7CScreen
