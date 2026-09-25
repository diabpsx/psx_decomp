.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching LevelToLevelInit__Fv, 0x50

glabel LevelToLevelInit__Fv
    /* 8757C 8009757C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 87580 80097580 1000BFAF */  sw         $ra, 0x10($sp)
    /* 87584 80097584 C46E020C */  jal        GLUE_SetFinished__Fb
    /* 87588 80097588 01000424 */   addiu     $a0, $zero, 0x1
    /* 8758C 8009758C 21200000 */  addu       $a0, $zero, $zero
  .L80097590:
    /* 87590 80097590 01400524 */  addiu      $a1, $zero, 0x4001
    /* 87594 80097594 B681000C */  jal        TSK_Exist
    /* 87598 80097598 FFFF0624 */   addiu     $a2, $zero, -0x1
    /* 8759C 8009759C 05004010 */  beqz       $v0, .L800975B4
    /* 875A0 800975A0 00000000 */   nop
    /* 875A4 800975A4 EE80000C */  jal        TSK_Sleep
    /* 875A8 800975A8 01000424 */   addiu     $a0, $zero, 0x1
    /* 875AC 800975AC 645D0208 */  j          .L80097590
    /* 875B0 800975B0 21200000 */   addu      $a0, $zero, $zero
  .L800975B4:
    /* 875B4 800975B4 EE80000C */  jal        TSK_Sleep
    /* 875B8 800975B8 02000424 */   addiu     $a0, $zero, 0x2
    /* 875BC 800975BC 1000BF8F */  lw         $ra, 0x10($sp)
    /* 875C0 800975C0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 875C4 800975C4 0800E003 */  jr         $ra
    /* 875C8 800975C8 00000000 */   nop
endlabel LevelToLevelInit__Fv
