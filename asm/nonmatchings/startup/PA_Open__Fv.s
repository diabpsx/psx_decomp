.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PA_Open__Fv, 0x38

glabel PA_Open__Fv
    /* A06E4 800B06E4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* A06E8 800B06E8 00800434 */  ori        $a0, $zero, 0x8000
    /* A06EC 800B06EC 0980053C */  lui        $a1, %hi(PauseTask__FP4TASK)
    /* A06F0 800B06F0 C884A524 */  addiu      $a1, $a1, %lo(PauseTask__FP4TASK)
    /* A06F4 800B06F4 00080624 */  addiu      $a2, $zero, 0x800
    /* A06F8 800B06F8 1000BFAF */  sw         $ra, 0x10($sp)
    /* A06FC 800B06FC C41E80AF */  sw         $zero, %gp_rel(D_8011C644)($gp)
    /* A0700 800B0700 C81E80AF */  sw         $zero, %gp_rel(D_8011C648)($gp)
    /* A0704 800B0704 0480000C */  jal        TSK_AddTask
    /* A0708 800B0708 21380000 */   addu      $a3, $zero, $zero
    /* A070C 800B070C 1000BF8F */  lw         $ra, 0x10($sp)
    /* A0710 800B0710 1800BD27 */  addiu      $sp, $sp, 0x18
    /* A0714 800B0714 0800E003 */  jr         $ra
    /* A0718 800B0718 00000000 */   nop
endlabel PA_Open__Fv
