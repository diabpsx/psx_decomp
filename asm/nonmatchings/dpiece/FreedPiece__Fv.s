.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FreedPiece__Fv, 0x44

glabel FreedPiece__Fv
    /* 72838 80082838 C416828F */  lw         $v0, %gp_rel(dPiece)($gp)
    /* 7283C 8008283C E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 72840 80082840 06004014 */  bnez       $v0, .L8008285C
    /* 72844 80082844 1000BFAF */   sw        $ra, 0x10($sp)
    /* 72848 80082848 21200000 */  addu       $a0, $zero, $zero
    /* 7284C 8008284C 1280053C */  lui        $a1, %hi(D_801194E8)
    /* 72850 80082850 E894A524 */  addiu      $a1, $a1, %lo(D_801194E8)
    /* 72854 80082854 A583000C */  jal        DBG_Error
    /* 72858 80082858 6A000624 */   addiu     $a2, $zero, 0x6A
  .L8008285C:
    /* 7285C 8008285C C416848F */  lw         $a0, %gp_rel(dPiece)($gp)
    /* 72860 80082860 E720020C */  jal        Tfree__FPv
    /* 72864 80082864 00000000 */   nop
    /* 72868 80082868 C41680AF */  sw         $zero, %gp_rel(dPiece)($gp)
    /* 7286C 8008286C 1000BF8F */  lw         $ra, 0x10($sp)
    /* 72870 80082870 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 72874 80082874 0800E003 */  jr         $ra
    /* 72878 80082878 00000000 */   nop
endlabel FreedPiece__Fv
