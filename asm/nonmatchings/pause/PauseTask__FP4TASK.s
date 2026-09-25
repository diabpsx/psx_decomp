.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PauseTask__FP4TASK, 0x50

glabel PauseTask__FP4TASK
    /* 784C8 800884C8 D8FFBD27 */  addiu      $sp, $sp, -0x28
    /* 784CC 800884CC 2000BFAF */  sw         $ra, 0x20($sp)
    /* 784D0 800884D0 240484AF */  sw         $a0, %gp_rel(TPtr)($gp)
  .L800884D4:
    /* 784D4 800884D4 CE24020C */  jal        __17CTempPauseMessage
    /* 784D8 800884D8 1000A427 */   addiu     $a0, $sp, 0x10
    /* 784DC 800884DC 4621020C */  jal        GetPausePad__Fv
    /* 784E0 800884E0 00000000 */   nop
    /* 784E4 800884E4 1000A427 */  addiu      $a0, $sp, 0x10
    /* 784E8 800884E8 9B21020C */  jal        DoPause__14CPauseMessagesi
    /* 784EC 800884EC 21284000 */   addu      $a1, $v0, $zero
    /* 784F0 800884F0 C81E80AF */  sw         $zero, %gp_rel(D_8011C648)($gp)
    /* 784F4 800884F4 1000A427 */  addiu      $a0, $sp, 0x10
    /* 784F8 800884F8 B024020C */  jal        ___17CTempPauseMessage
    /* 784FC 800884FC 02000524 */   addiu     $a1, $zero, 0x2
    /* 78500 80088500 35210208 */  j          .L800884D4
    /* 78504 80088504 00000000 */   nop
    /* 78508 80088508 2000BF8F */  lw         $ra, 0x20($sp)
    /* 7850C 8008850C 2800BD27 */  addiu      $sp, $sp, 0x28
    /* 78510 80088510 0800E003 */  jr         $ra
    /* 78514 80088514 00000000 */   nop
endlabel PauseTask__FP4TASK
