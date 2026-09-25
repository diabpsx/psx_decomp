.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching TSK_OpenModule, 0x74

glabel TSK_OpenModule
    /* FF9C 8001FF9C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* FFA0 8001FFA0 1000BFAF */  sw         $ra, 0x10($sp)
    /* FFA4 8001FFA4 1280013C */  lui        $at, %hi(D_8011C9A4)
    /* FFA8 8001FFA8 A4C920AC */  sw         $zero, %lo(D_8011C9A4)($at)
    /* FFAC 8001FFAC 1280013C */  lui        $at, %hi(D_8011C98C)
    /* FFB0 8001FFB0 8CC920AC */  sw         $zero, %lo(D_8011C98C)($at)
    /* FFB4 8001FFB4 1280013C */  lui        $at, %hi(D_8011C998)
    /* FFB8 8001FFB8 98C924AC */  sw         $a0, %lo(D_8011C998)($at)
    /* FFBC 8001FFBC 1280013C */  lui        $at, %hi(D_8011C990)
    /* FFC0 8001FFC0 90C920AC */  sw         $zero, %lo(D_8011C990)($at)
    /* FFC4 8001FFC4 D281000C */  jal        TSK_ClearExecFilter
    /* FFC8 8001FFC8 00000000 */   nop
    /* FFCC 8001FFCC C082000C */  jal        TSK_ClearEpiProFilter
    /* FFD0 8001FFD0 00000000 */   nop
    /* FFD4 8001FFD4 A882000C */  jal        TSK_SetDoTasksEpilogue
    /* FFD8 8001FFD8 21200000 */   addu      $a0, $zero, $zero
    /* FFDC 8001FFDC A282000C */  jal        TSK_SetDoTasksPrologue
    /* FFE0 8001FFE0 21200000 */   addu      $a0, $zero, $zero
    /* FFE4 8001FFE4 CD82000C */  jal        TSK_SetExtraStackProtection
    /* FFE8 8001FFE8 21200000 */   addu      $a0, $zero, $zero
    /* FFEC 8001FFEC D182000C */  jal        TSK_SetStackFloodCallback
    /* FFF0 8001FFF0 21200000 */   addu      $a0, $zero, $zero
    /* FFF4 8001FFF4 D782000C */  jal        TSK_SetExtraStackSize
    /* FFF8 8001FFF8 00100434 */   ori       $a0, $zero, 0x1000
    /* FFFC 8001FFFC 01000234 */  ori        $v0, $zero, 0x1
    /* 10000 80020000 1000BF8F */  lw         $ra, 0x10($sp)
    /* 10004 80020004 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 10008 80020008 0800E003 */  jr         $ra
    /* 1000C 8002000C 00000000 */   nop
endlabel TSK_OpenModule
