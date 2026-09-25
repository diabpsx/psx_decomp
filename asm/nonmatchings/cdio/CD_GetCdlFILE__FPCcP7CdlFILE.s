.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching CD_GetCdlFILE__FPCcP7CdlFILE, 0x50

glabel CD_GetCdlFILE__FPCcP7CdlFILE
    /* 76E94 80086E94 E8FEBD27 */  addiu      $sp, $sp, -0x118
    /* 76E98 80086E98 21308000 */  addu       $a2, $a0, $zero
    /* 76E9C 80086E9C 1001B0AF */  sw         $s0, 0x110($sp)
    /* 76EA0 80086EA0 2180A000 */  addu       $s0, $a1, $zero
    /* 76EA4 80086EA4 1280053C */  lui        $a1, %hi(D_8011AB4C)
    /* 76EA8 80086EA8 4CABA524 */  addiu      $a1, $a1, %lo(D_8011AB4C)
    /* 76EAC 80086EAC 1401BFAF */  sw         $ra, 0x114($sp)
    /* 76EB0 80086EB0 9767000C */  jal        sprintf
    /* 76EB4 80086EB4 1000A427 */   addiu     $a0, $sp, 0x10
    /* 76EB8 80086EB8 21200002 */  addu       $a0, $s0, $zero
  .L80086EBC:
    /* 76EBC 80086EBC E772000C */  jal        CdSearchFile
    /* 76EC0 80086EC0 1000A527 */   addiu     $a1, $sp, 0x10
    /* 76EC4 80086EC4 FDFF4010 */  beqz       $v0, .L80086EBC
    /* 76EC8 80086EC8 21200002 */   addu      $a0, $s0, $zero
    /* 76ECC 80086ECC 01000224 */  addiu      $v0, $zero, 0x1
    /* 76ED0 80086ED0 1401BF8F */  lw         $ra, 0x114($sp)
    /* 76ED4 80086ED4 1001B08F */  lw         $s0, 0x110($sp)
    /* 76ED8 80086ED8 1801BD27 */  addiu      $sp, $sp, 0x118
    /* 76EDC 80086EDC 0800E003 */  jr         $ra
    /* 76EE0 80086EE0 00000000 */   nop
endlabel CD_GetCdlFILE__FPCcP7CdlFILE
