.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching DrawInv__Fv, 0x48

glabel DrawInv__Fv
    /* 1F4BC 801590B4 A41B828F */  lw         $v0, %gp_rel(D_8011C324)($gp)
    /* 1F4C0 801590B8 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 1F4C4 801590BC 0B004014 */  bnez       $v0, .L801590EC
    /* 1F4C8 801590C0 1000BFAF */   sw        $ra, 0x10($sp)
    /* 1F4CC 801590C4 01000224 */  addiu      $v0, $zero, 0x1
    /* 1F4D0 801590C8 21200000 */  addu       $a0, $zero, $zero
    /* 1F4D4 801590CC 1680053C */  lui        $a1, %hi(DrawInvTSK__FP4TASK)
    /* 1F4D8 801590D0 FC90A524 */  addiu      $a1, $a1, %lo(DrawInvTSK__FP4TASK)
    /* 1F4DC 801590D4 00100624 */  addiu      $a2, $zero, 0x1000
    /* 1F4E0 801590D8 A41B82AF */  sw         $v0, %gp_rel(D_8011C324)($gp)
    /* 1F4E4 801590DC BC1B80AF */  sw         $zero, %gp_rel(InvPageFlag)($gp)
    /* 1F4E8 801590E0 B81B80AF */  sw         $zero, %gp_rel(InvPageNo)($gp)
    /* 1F4EC 801590E4 0480000C */  jal        TSK_AddTask
    /* 1F4F0 801590E8 21380000 */   addu      $a3, $zero, $zero
  .L801590EC:
    /* 1F4F4 801590EC 1000BF8F */  lw         $ra, 0x10($sp)
    /* 1F4F8 801590F0 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 1F4FC 801590F4 0800E003 */  jr         $ra
    /* 1F500 801590F8 00000000 */   nop
endlabel DrawInv__Fv
