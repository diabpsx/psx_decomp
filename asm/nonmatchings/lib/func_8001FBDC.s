.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching func_8001FBDC, 0x80

glabel func_8001FBDC
    /* FBDC 8001FBDC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* FBE0 8001FBE0 1400BFAF */  sw         $ra, 0x14($sp)
    /* FBE4 8001FBE4 BD7A000C */  jal        func_8001EAF4
    /* FBE8 8001FBE8 00000000 */   nop
    /* FBEC 8001FBEC 6346000C */  jal        EnterCriticalSection
    /* FBF0 8001FBF0 00000000 */   nop
    /* FBF4 8001FBF4 1280053C */  lui        $a1, %hi(D_8011C924)
    /* FBF8 8001FBF8 24C9A524 */  addiu      $a1, $a1, %lo(D_8011C924)
    /* FBFC 8001FBFC 9B47000C */  jal        SysDeqIntRP
    /* FC00 8001FC00 01000424 */   addiu     $a0, $zero, 0x1
    /* FC04 8001FC04 1280053C */  lui        $a1, %hi(D_8011C924)
    /* FC08 8001FC08 24C9A524 */  addiu      $a1, $a1, %lo(D_8011C924)
    /* FC0C 8001FC0C 9747000C */  jal        SysEnqIntRP
    /* FC10 8001FC10 01000424 */   addiu     $a0, $zero, 0x1
    /* FC14 8001FC14 0B80023C */  lui        $v0, %hi(D_800B6340)
    /* FC18 8001FC18 4063428C */  lw         $v0, %lo(D_800B6340)($v0)
    /* FC1C 8001FC1C FEFF0E24 */  addiu      $t6, $zero, -0x2
    /* FC20 8001FC20 00004EAC */  sw         $t6, 0x0($v0)
    /* FC24 8001FC24 04004F8C */  lw         $t7, 0x4($v0)
    /* FC28 8001FC28 21200000 */  addu       $a0, $zero, $zero
    /* FC2C 8001FC2C 0100F835 */  ori        $t8, $t7, 0x1
    /* FC30 8001FC30 B77A000C */  jal        func_8001EADC
    /* FC34 8001FC34 040058AC */   sw        $t8, 0x4($v0)
    /* FC38 8001FC38 03000424 */  addiu      $a0, $zero, 0x3
    /* FC3C 8001FC3C 9B48000C */  jal        ChangeClearRCnt
    /* FC40 8001FC40 21280000 */   addu      $a1, $zero, $zero
    /* FC44 8001FC44 6746000C */  jal        ExitCriticalSection
    /* FC48 8001FC48 00000000 */   nop
    /* FC4C 8001FC4C 1400BF8F */  lw         $ra, 0x14($sp)
    /* FC50 8001FC50 1800BD27 */  addiu      $sp, $sp, 0x18
    /* FC54 8001FC54 0800E003 */  jr         $ra
    /* FC58 8001FC58 01000224 */   addiu     $v0, $zero, 0x1
endlabel func_8001FBDC
