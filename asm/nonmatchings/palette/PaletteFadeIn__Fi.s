.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching PaletteFadeIn__Fi, 0x58

glabel PaletteFadeIn__Fi
    /* 6F1F0 8007F1F0 EC14828F */  lw         $v0, %gp_rel(D_8011BC6C)($gp)
    /* 6F1F4 8007F1F4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 6F1F8 8007F1F8 0E004014 */  bnez       $v0, .L8007F234
    /* 6F1FC 8007F1FC 1000BFAF */   sw        $ra, 0x10($sp)
    /* 6F200 8007F200 01000224 */  addiu      $v0, $zero, 0x1
    /* 6F204 8007F204 EC1482AF */  sw         $v0, %gp_rel(D_8011BC6C)($gp)
    /* 6F208 8007F208 01000224 */  addiu      $v0, $zero, 0x1
    /* 6F20C 8007F20C E81484AF */  sw         $a0, %gp_rel(D_8011BC68)($gp)
    /* 6F210 8007F210 00800434 */  ori        $a0, $zero, 0x8000
    /* 6F214 8007F214 0880053C */  lui        $a1, %hi(PaletteFadeInTask__FP4TASK)
    /* 6F218 8007F218 60F1A524 */  addiu      $a1, $a1, %lo(PaletteFadeInTask__FP4TASK)
    /* 6F21C 8007F21C 00080624 */  addiu      $a2, $zero, 0x800
    /* 6F220 8007F220 E51482A3 */  sb         $v0, %gp_rel(D_8011BC65)($gp)
    /* 6F224 8007F224 0480000C */  jal        TSK_AddTask
    /* 6F228 8007F228 21380000 */   addu      $a3, $zero, $zero
    /* 6F22C 8007F22C 8EFC0108 */  j          .L8007F238
    /* 6F230 8007F230 01000224 */   addiu     $v0, $zero, 0x1
  .L8007F234:
    /* 6F234 8007F234 21100000 */  addu       $v0, $zero, $zero
  .L8007F238:
    /* 6F238 8007F238 1000BF8F */  lw         $ra, 0x10($sp)
    /* 6F23C 8007F23C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 6F240 8007F240 0800E003 */  jr         $ra
    /* 6F244 8007F244 00000000 */   nop
endlabel PaletteFadeIn__Fi
