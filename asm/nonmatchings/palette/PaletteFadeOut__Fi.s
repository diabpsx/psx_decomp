.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PaletteFadeOut__Fi, 0x54

glabel PaletteFadeOut__Fi
    /* 6F2F8 8007F2F8 EC14828F */  lw         $v0, %gp_rel(D_8011BC6C)($gp)
    /* 6F2FC 8007F2FC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 6F300 8007F300 0D004014 */  bnez       $v0, .L8007F338
    /* 6F304 8007F304 1000BFAF */   sw        $ra, 0x10($sp)
    /* 6F308 8007F308 01000224 */  addiu      $v0, $zero, 0x1
    /* 6F30C 8007F30C E81484AF */  sw         $a0, %gp_rel(D_8011BC68)($gp)
    /* 6F310 8007F310 00800434 */  ori        $a0, $zero, 0x8000
    /* 6F314 8007F314 0880053C */  lui        $a1, %hi(PaletteFadeOutTask__FP4TASK)
    /* 6F318 8007F318 48F2A524 */  addiu      $a1, $a1, %lo(PaletteFadeOutTask__FP4TASK)
    /* 6F31C 8007F31C 00080624 */  addiu      $a2, $zero, 0x800
    /* 6F320 8007F320 EC1482AF */  sw         $v0, %gp_rel(D_8011BC6C)($gp)
    /* 6F324 8007F324 E51480A3 */  sb         $zero, %gp_rel(D_8011BC65)($gp)
    /* 6F328 8007F328 0480000C */  jal        TSK_AddTask
    /* 6F32C 8007F32C 21380000 */   addu      $a3, $zero, $zero
    /* 6F330 8007F330 CFFC0108 */  j          .L8007F33C
    /* 6F334 8007F334 01000224 */   addiu     $v0, $zero, 0x1
  .L8007F338:
    /* 6F338 8007F338 21100000 */  addu       $v0, $zero, $zero
  .L8007F33C:
    /* 6F33C 8007F33C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 6F340 8007F340 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 6F344 8007F344 0800E003 */  jr         $ra
    /* 6F348 8007F348 00000000 */   nop
endlabel PaletteFadeOut__Fi
