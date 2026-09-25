.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching GRL_LoadFileInMemSig__FPCcPUl, 0xE4

glabel GRL_LoadFileInMemSig__FPCcPUl
    /* 64E9C 80074E9C C8FFBD27 */  addiu      $sp, $sp, -0x38
    /* 64EA0 80074EA0 2800B0AF */  sw         $s0, 0x28($sp)
    /* 64EA4 80074EA4 21808000 */  addu       $s0, $a0, $zero
    /* 64EA8 80074EA8 2C00B1AF */  sw         $s1, 0x2C($sp)
    /* 64EAC 80074EAC 2188A000 */  addu       $s1, $a1, $zero
    /* 64EB0 80074EB0 3400BFAF */  sw         $ra, 0x34($sp)
    /* 64EB4 80074EB4 1D11020C */  jal        SYSI_GetFs__Fv
    /* 64EB8 80074EB8 3000B2AF */   sw        $s2, 0x30($sp)
    /* 64EBC 80074EBC 1000A427 */  addiu      $a0, $sp, 0x10
    /* 64EC0 80074EC0 21280002 */  addu       $a1, $s0, $zero
    /* 64EC4 80074EC4 E0D3010C */  jal        GRL_StripDir__FPcPCc
    /* 64EC8 80074EC8 21904000 */   addu      $s2, $v0, $zero
    /* 64ECC 80074ECC 21204002 */  addu       $a0, $s2, $zero
    /* 64ED0 80074ED0 A416020C */  jal        FileLen__6FileIOPCc
    /* 64ED4 80074ED4 1000A527 */   addiu     $a1, $sp, 0x10
    /* 64ED8 80074ED8 21804000 */  addu       $s0, $v0, $zero
    /* 64EDC 80074EDC FFFF0224 */  addiu      $v0, $zero, -0x1
    /* 64EE0 80074EE0 05000216 */  bne        $s0, $v0, .L80074EF8
    /* 64EE4 80074EE4 21200000 */   addu      $a0, $zero, $zero
    /* 64EE8 80074EE8 1280053C */  lui        $a1, %hi(D_8011892C)
    /* 64EEC 80074EEC 2C89A524 */  addiu      $a1, $a1, %lo(D_8011892C)
    /* 64EF0 80074EF0 A583000C */  jal        DBG_Error
    /* 64EF4 80074EF4 47020624 */   addiu     $a2, $zero, 0x247
  .L80074EF8:
    /* 64EF8 80074EF8 02002012 */  beqz       $s1, .L80074F04
    /* 64EFC 80074EFC 00000000 */   nop
    /* 64F00 80074F00 000030AE */  sw         $s0, 0x0($s1)
  .L80074F04:
    /* 64F04 80074F04 AA20020C */  jal        Tmalloc__Fi
    /* 64F08 80074F08 21200002 */   addu      $a0, $s0, $zero
    /* 64F0C 80074F0C 21804000 */  addu       $s0, $v0, $zero
    /* 64F10 80074F10 07000016 */  bnez       $s0, .L80074F30
    /* 64F14 80074F14 21204002 */   addu      $a0, $s2, $zero
    /* 64F18 80074F18 21200000 */  addu       $a0, $zero, $zero
    /* 64F1C 80074F1C 1280053C */  lui        $a1, %hi(D_8011892C)
    /* 64F20 80074F20 2C89A524 */  addiu      $a1, $a1, %lo(D_8011892C)
    /* 64F24 80074F24 A583000C */  jal        DBG_Error
    /* 64F28 80074F28 4F020624 */   addiu     $a2, $zero, 0x24F
    /* 64F2C 80074F2C 21204002 */  addu       $a0, $s2, $zero
  .L80074F30:
    /* 64F30 80074F30 1000A527 */  addiu      $a1, $sp, 0x10
    /* 64F34 80074F34 21300002 */  addu       $a2, $s0, $zero
    /* 64F38 80074F38 FD16020C */  jal        ReadAtAddr__6FileIOPCcPUci
    /* 64F3C 80074F3C FFFF0724 */   addiu     $a3, $zero, -0x1
    /* 64F40 80074F40 05004014 */  bnez       $v0, .L80074F58
    /* 64F44 80074F44 21200000 */   addu      $a0, $zero, $zero
    /* 64F48 80074F48 1280053C */  lui        $a1, %hi(D_8011892C)
    /* 64F4C 80074F4C 2C89A524 */  addiu      $a1, $a1, %lo(D_8011892C)
    /* 64F50 80074F50 A583000C */  jal        DBG_Error
    /* 64F54 80074F54 55020624 */   addiu     $a2, $zero, 0x255
  .L80074F58:
    /* 64F58 80074F58 5F91020C */  jal        UPDATEPROGRESS__Fi
    /* 64F5C 80074F5C 01000424 */   addiu     $a0, $zero, 0x1
    /* 64F60 80074F60 21100002 */  addu       $v0, $s0, $zero
    /* 64F64 80074F64 3400BF8F */  lw         $ra, 0x34($sp)
    /* 64F68 80074F68 3000B28F */  lw         $s2, 0x30($sp)
    /* 64F6C 80074F6C 2C00B18F */  lw         $s1, 0x2C($sp)
    /* 64F70 80074F70 2800B08F */  lw         $s0, 0x28($sp)
    /* 64F74 80074F74 3800BD27 */  addiu      $sp, $sp, 0x38
    /* 64F78 80074F78 0800E003 */  jr         $ra
    /* 64F7C 80074F7C 00000000 */   nop
endlabel GRL_LoadFileInMemSig__FPCcPUl
