.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching RemoveCtrlScreen__Fv, 0x5C

glabel RemoveCtrlScreen__Fv
    /* 8C7C4 8009C7C4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 8C7C8 8009C7C8 1000BFAF */  sw         $ra, 0x10($sp)
    /* 8C7CC 8009C7CC D871020C */  jal        checkvalid__Fv
    /* 8C7D0 8009C7D0 00000000 */   nop
    /* 8C7D4 8009C7D4 01004238 */  xori       $v0, $v0, 0x1
    /* 8C7D8 8009C7D8 0D004014 */  bnez       $v0, .L8009C810
    /* 8C7DC 8009C7DC 21100000 */   addu      $v0, $zero, $zero
    /* 8C7E0 8009C7E0 09000424 */  addiu      $a0, $zero, 0x9
    /* 8C7E4 8009C7E4 0D80063C */  lui        $a2, %hi(txt_actions)
    /* 8C7E8 8009C7E8 0CC4C624 */  addiu      $a2, $a2, %lo(txt_actions)
    /* 8C7EC 8009C7EC 1280053C */  lui        $a1, %hi(options_pad)
    /* 8C7F0 8009C7F0 50B2A58C */  lw         $a1, %lo(options_pad)($a1)
    /* 8C7F4 8009C7F4 53EB010C */  jal        PostGamePad__Fiiii
    /* 8C7F8 8009C7F8 21380000 */   addu      $a3, $zero, $zero
    /* 8C7FC 8009C7FC A00880A3 */  sb         $zero, %gp_rel(ctrlflag)($gp)
    /* 8C800 8009C800 481F80A3 */  sb         $zero, %gp_rel(D_8011C6C8)($gp)
    /* 8C804 8009C804 1280013C */  lui        $at, %hi(cmenu)
    /* 8C808 8009C808 3CB220AC */  sw         $zero, %lo(cmenu)($at)
    /* 8C80C 8009C80C 01000224 */  addiu      $v0, $zero, 0x1
  .L8009C810:
    /* 8C810 8009C810 1000BF8F */  lw         $ra, 0x10($sp)
    /* 8C814 8009C814 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 8C818 8009C818 0800E003 */  jr         $ra
    /* 8C81C 8009C81C 00000000 */   nop
endlabel RemoveCtrlScreen__Fv
