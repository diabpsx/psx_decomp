.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FilthyTask__FP4TASK, 0x88

glabel FilthyTask__FP4TASK
    /* 865B8 800965B8 D0FFBD27 */  addiu      $sp, $sp, -0x30
    /* 865BC 800965BC 2800BFAF */  sw         $ra, 0x28($sp)
    /* 865C0 800965C0 2400B1AF */  sw         $s1, 0x24($sp)
    /* 865C4 800965C4 2000B0AF */  sw         $s0, 0x20($sp)
    /* 865C8 800965C8 1C00838C */  lw         $v1, 0x1C($a0)
    /* 865CC 800965CC 01000224 */  addiu      $v0, $zero, 0x1
    /* 865D0 800965D0 1280013C */  lui        $at, %hi(CDWAIT)
    /* 865D4 800965D4 ECAD22AC */  sw         $v0, %lo(CDWAIT)($at)
    /* 865D8 800965D8 01000224 */  addiu      $v0, $zero, 0x1
    /* 865DC 800965DC 1280013C */  lui        $at, %hi(PauseMode)
    /* 865E0 800965E0 A4B722A0 */  sb         $v0, %lo(PauseMode)($at)
    /* 865E4 800965E4 0000708C */  lw         $s0, 0x0($v1)
    /* 865E8 800965E8 0400718C */  lw         $s1, 0x4($v1)
    /* 865EC 800965EC 896E020C */  jal        GLUE_SuspendGame__Fv
    /* 865F0 800965F0 00000000 */   nop
    /* 865F4 800965F4 EE80000C */  jal        TSK_Sleep
    /* 865F8 800965F8 03000424 */   addiu     $a0, $zero, 0x3
    /* 865FC 800965FC D7F3000C */  jal        stream_stop__Fv
    /* 86600 80096600 00000000 */   nop
    /* 86604 80096604 21200002 */  addu       $a0, $s0, $zero
    /* 86608 80096608 3759020C */  jal        LoadThis__7CPlayeri
    /* 8660C 8009660C 21282002 */   addu      $a1, $s1, $zero
    /* 86610 80096610 9E6E020C */  jal        GLUE_ResumeGame__Fv
    /* 86614 80096614 00000000 */   nop
    /* 86618 80096618 1280013C */  lui        $at, %hi(PauseMode)
    /* 8661C 8009661C A4B720A0 */  sb         $zero, %lo(PauseMode)($at)
    /* 86620 80096620 1280013C */  lui        $at, %hi(CDWAIT)
    /* 86624 80096624 ECAD20AC */  sw         $zero, %lo(CDWAIT)($at)
    /* 86628 80096628 2800BF8F */  lw         $ra, 0x28($sp)
    /* 8662C 8009662C 2400B18F */  lw         $s1, 0x24($sp)
    /* 86630 80096630 2000B08F */  lw         $s0, 0x20($sp)
    /* 86634 80096634 3000BD27 */  addiu      $sp, $sp, 0x30
    /* 86638 80096638 0800E003 */  jr         $ra
    /* 8663C 8009663C 00000000 */   nop
endlabel FilthyTask__FP4TASK
