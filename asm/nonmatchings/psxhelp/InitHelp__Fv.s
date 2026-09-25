.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching InitHelp__Fv, 0x4C

glabel InitHelp__Fv
    /* 9E6F0 800AE6F0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 9E6F4 800AE6F4 0B000424 */  addiu      $a0, $zero, 0xB
    /* 9E6F8 800AE6F8 0D80063C */  lui        $a2, %hi(txt_actions)
    /* 9E6FC 800AE6FC 0CC4C624 */  addiu      $a2, $a2, %lo(txt_actions)
    /* 9E700 800AE700 1280053C */  lui        $a1, %hi(options_pad)
    /* 9E704 800AE704 50B2A58C */  lw         $a1, %lo(options_pad)($a1)
    /* 9E708 800AE708 1000BFAF */  sw         $ra, 0x10($sp)
    /* 9E70C 800AE70C 53EB010C */  jal        PostGamePad__Fiiii
    /* 9E710 800AE710 21380000 */   addu      $a3, $zero, $zero
    /* 9E714 800AE714 01000224 */  addiu      $v0, $zero, 0x1
    /* 9E718 800AE718 600B82AF */  sw         $v0, %gp_rel(D_8011B2E0)($gp)
    /* 9E71C 800AE71C 01000224 */  addiu      $v0, $zero, 0x1
    /* 9E720 800AE720 C41F80A3 */  sb         $zero, %gp_rel(D_8011C744)($gp)
    /* 9E724 800AE724 C51F82A3 */  sb         $v0, %gp_rel(D_8011C745)($gp)
    /* 9E728 800AE728 780B80AF */  sw         $zero, %gp_rel(displayinghelp)($gp)
    /* 9E72C 800AE72C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 9E730 800AE730 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 9E734 800AE734 0800E003 */  jr         $ra
    /* 9E738 800AE738 00000000 */   nop
endlabel InitHelp__Fv
