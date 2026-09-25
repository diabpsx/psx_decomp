.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GLUE_StartGameExit__Fv, 0x6C

glabel GLUE_StartGameExit__Fv
    /* 8C4AC 8009C4AC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 8C4B0 8009C4B0 1000BFAF */  sw         $ra, 0x10($sp)
    /* 8C4B4 8009C4B4 E8190224 */  addiu      $v0, $zero, 0x19E8
  .L8009C4B8:
    /* 8C4B8 8009C4B8 0E80013C */  lui        $at, %hi(plr + 0x1D)
    /* 8C4BC 8009C4BC 21082200 */  addu       $at, $at, $v0
    /* 8C4C0 8009C4C0 55A520A0 */  sb         $zero, %lo(plr + 0x1D)($at)
    /* 8C4C4 8009C4C4 18E64224 */  addiu      $v0, $v0, -0x19E8
    /* 8C4C8 8009C4C8 FBFF4104 */  bgez       $v0, .L8009C4B8
    /* 8C4CC 8009C4CC 00000000 */   nop
    /* 8C4D0 8009C4D0 896E020C */  jal        GLUE_SuspendGame__Fv
    /* 8C4D4 8009C4D4 00000000 */   nop
    /* 8C4D8 8009C4D8 C46E020C */  jal        GLUE_SetFinished__Fb
    /* 8C4DC 8009C4DC 01000424 */   addiu     $a0, $zero, 0x1
    /* 8C4E0 8009C4E0 890C020C */  jal        MAIN_RestartGameTask__Fv
    /* 8C4E4 8009C4E4 00000000 */   nop
    /* 8C4E8 8009C4E8 EE80000C */  jal        TSK_Sleep
    /* 8C4EC 8009C4EC 03000424 */   addiu     $a0, $zero, 0x3
    /* 8C4F0 8009C4F0 9E6E020C */  jal        GLUE_ResumeGame__Fv
    /* 8C4F4 8009C4F4 00000000 */   nop
    /* 8C4F8 8009C4F8 9768020C */  jal        SPU_Init__Fv
    /* 8C4FC 8009C4FC 00000000 */   nop
    /* 8C500 8009C500 3F4A010C */  jal        MSG_ClearOutCompMap__Fv
    /* 8C504 8009C504 00000000 */   nop
    /* 8C508 8009C508 1000BF8F */  lw         $ra, 0x10($sp)
    /* 8C50C 8009C50C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 8C510 8009C510 0800E003 */  jr         $ra
    /* 8C514 8009C514 00000000 */   nop
endlabel GLUE_StartGameExit__Fv
