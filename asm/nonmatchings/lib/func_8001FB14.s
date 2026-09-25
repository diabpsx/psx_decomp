.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching func_8001FB14, 0xA8

glabel func_8001FB14
    /* FB14 8001FB14 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* FB18 8001FB18 2400A5AF */  sw         $a1, 0x24($sp)
    /* FB1C 8001FB1C 2000A4AF */  sw         $a0, 0x20($sp)
    /* FB20 8001FB20 0B80053C */  lui        $a1, %hi(D_800B6314)
    /* FB24 8001FB24 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* FB28 8001FB28 1463A58C */  lw         $a1, %lo(D_800B6314)($a1)
    /* FB2C 8001FB2C 0B80043C */  lui        $a0, %hi(D_800B6344)
    /* FB30 8001FB30 2800A6AF */  sw         $a2, 0x28($sp)
    /* FB34 8001FB34 2C00A7AF */  sw         $a3, 0x2C($sp)
    /* FB38 8001FB38 9367000C */  jal        printf
    /* FB3C 8001FB3C 44638424 */   addiu     $a0, $a0, %lo(D_800B6344)
    /* FB40 8001FB40 1280013C */  lui        $at, %hi(D_8011C940)
    /* FB44 8001FB44 2C7F000C */  jal        func_8001FCB0
    /* FB48 8001FB48 40C920AC */   sw        $zero, %lo(D_8011C940)($at)
    /* FB4C 8001FB4C 21200000 */  addu       $a0, $zero, $zero
    /* FB50 8001FB50 21280000 */  addu       $a1, $zero, $zero
    /* FB54 8001FB54 21300000 */  addu       $a2, $zero, $zero
    /* FB58 8001FB58 EF7E000C */  jal        func_8001FBBC
    /* FB5C 8001FB5C 21380000 */   addu      $a3, $zero, $zero
    /* FB60 8001FB60 2000A48F */  lw         $a0, 0x20($sp)
    /* FB64 8001FB64 2800AE8F */  lw         $t6, 0x28($sp)
    /* FB68 8001FB68 1280013C */  lui        $at, %hi(D_8011C944)
    /* FB6C 8001FB6C 2400A58F */  lw         $a1, 0x24($sp)
    /* FB70 8001FB70 2C00AF8F */  lw         $t7, 0x2C($sp)
    /* FB74 8001FB74 44C924AC */  sw         $a0, %lo(D_8011C944)($at)
    /* FB78 8001FB78 48C92EAC */  sw         $t6, %lo(D_8011C948)($at)
    /* FB7C 8001FB7C 1280013C */  lui        $at, %hi(D_8011C954)
    /* FB80 8001FB80 54C925AC */  sw         $a1, %lo(D_8011C954)($at)
    /* FB84 8001FB84 5F7F000C */  jal        bzero
    /* FB88 8001FB88 58C92FAC */   sw        $t7, %lo(D_8011C958)($at)
    /* FB8C 8001FB8C 2800A48F */  lw         $a0, 0x28($sp)
    /* FB90 8001FB90 2C00A58F */  lw         $a1, 0x2C($sp)
    /* FB94 8001FB94 5F7F000C */  jal        bzero
    /* FB98 8001FB98 00000000 */   nop
    /* FB9C 8001FB9C B87E000C */  jal        func_8001FAE0
    /* FBA0 8001FBA0 00000000 */   nop
    /* FBA4 8001FBA4 287F000C */  jal        func_8001FCA0
    /* FBA8 8001FBA8 00000000 */   nop
    /* FBAC 8001FBAC 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* FBB0 8001FBB0 2000BD27 */  addiu      $sp, $sp, 0x20
    /* FBB4 8001FBB4 0800E003 */  jr         $ra
    /* FBB8 8001FBB8 01000224 */   addiu     $v0, $zero, 0x1
endlabel func_8001FB14
