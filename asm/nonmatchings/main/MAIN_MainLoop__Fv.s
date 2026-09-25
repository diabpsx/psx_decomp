.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching MAIN_MainLoop__Fv, 0x54

glabel MAIN_MainLoop__Fv
    /* 7335C 8008335C 1280023C */  lui        $v0, %hi(demo_pad_time)
    /* 73360 80083360 B4AB428C */  lw         $v0, %lo(demo_pad_time)($v0)
    /* 73364 80083364 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 73368 80083368 03004014 */  bnez       $v0, .L80083378
    /* 7336C 8008336C 1000BFAF */   sw        $ra, 0x10($sp)
    /* 73370 80083370 7E25020C */  jal        PAD_Handler__Fv
    /* 73374 80083374 00000000 */   nop
  .L80083378:
    /* 73378 80083378 7E80000C */  jal        TSK_DoTasks
    /* 7337C 8008337C 00000000 */   nop
    /* 73380 80083380 0C10020C */  jal        VID_AfterDisplay__Fv
    /* 73384 80083384 00000000 */   nop
    /* 73388 80083388 1691020C */  jal        DEC_DoDecompRequests__Fv
    /* 7338C 8008338C 00000000 */   nop
    /* 73390 80083390 0B83000C */  jal        TICK_Update
    /* 73394 80083394 00000000 */   nop
    /* 73398 80083398 2B6C020C */  jal        SCR_Handler__Fv
    /* 7339C 8008339C 00000000 */   nop
    /* 733A0 800833A0 1000BF8F */  lw         $ra, 0x10($sp)
    /* 733A4 800833A4 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 733A8 800833A8 0800E003 */  jr         $ra
    /* 733AC 800833AC 00000000 */   nop
endlabel MAIN_MainLoop__Fv
