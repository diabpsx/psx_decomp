.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GLUE_StartBg__Fibi, 0x68

glabel GLUE_StartBg__Fibi
    /* 8BB1C 8009BB1C E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 8BB20 8009BB20 1000B0AF */  sw         $s0, 0x10($sp)
    /* 8BB24 8009BB24 21808000 */  addu       $s0, $a0, $zero
    /* 8BB28 8009BB28 1400B1AF */  sw         $s1, 0x14($sp)
    /* 8BB2C 8009BB2C 2188A000 */  addu       $s1, $a1, $zero
    /* 8BB30 8009BB30 1800B2AF */  sw         $s2, 0x18($sp)
    /* 8BB34 8009BB34 2190C000 */  addu       $s2, $a2, $zero
    /* 8BB38 8009BB38 00800434 */  ori        $a0, $zero, 0x8000
    /* 8BB3C 8009BB3C 0A80053C */  lui        $a1, %hi(BgTask__FP4TASK)
    /* 8BB40 8009BB40 B4BCA524 */  addiu      $a1, $a1, %lo(BgTask__FP4TASK)
    /* 8BB44 8009BB44 00200624 */  addiu      $a2, $zero, 0x2000
    /* 8BB48 8009BB48 1C00BFAF */  sw         $ra, 0x1C($sp)
    /* 8BB4C 8009BB4C 0480000C */  jal        TSK_AddTask
    /* 8BB50 8009BB50 10000724 */   addiu     $a3, $zero, 0x10
    /* 8BB54 8009BB54 1C00428C */  lw         $v0, 0x1C($v0)
    /* 8BB58 8009BB58 00000000 */  nop
    /* 8BB5C 8009BB5C 000050AC */  sw         $s0, 0x0($v0)
    /* 8BB60 8009BB60 040051AC */  sw         $s1, 0x4($v0)
    /* 8BB64 8009BB64 080052AC */  sw         $s2, 0x8($v0)
    /* 8BB68 8009BB68 1C00BF8F */  lw         $ra, 0x1C($sp)
    /* 8BB6C 8009BB6C 1800B28F */  lw         $s2, 0x18($sp)
    /* 8BB70 8009BB70 1400B18F */  lw         $s1, 0x14($sp)
    /* 8BB74 8009BB74 1000B08F */  lw         $s0, 0x10($sp)
    /* 8BB78 8009BB78 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 8BB7C 8009BB7C 0800E003 */  jr         $ra
    /* 8BB80 8009BB80 00000000 */   nop
endlabel GLUE_StartBg__Fibi
