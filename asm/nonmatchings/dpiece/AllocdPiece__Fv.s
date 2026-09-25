.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching AllocdPiece__Fv, 0x58

glabel AllocdPiece__Fv
    /* 727E0 800827E0 C416828F */  lw         $v0, %gp_rel(dPiece)($gp)
    /* 727E4 800827E4 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 727E8 800827E8 06004010 */  beqz       $v0, .L80082804
    /* 727EC 800827EC 1000BFAF */   sw        $ra, 0x10($sp)
    /* 727F0 800827F0 21200000 */  addu       $a0, $zero, $zero
    /* 727F4 800827F4 1280053C */  lui        $a1, %hi(D_801194E8)
    /* 727F8 800827F8 E894A524 */  addiu      $a1, $a1, %lo(D_801194E8)
    /* 727FC 800827FC A583000C */  jal        DBG_Error
    /* 72800 80082800 63000624 */   addiu     $a2, $zero, 0x63
  .L80082804:
    /* 72804 80082804 AA20020C */  jal        Tmalloc__Fi
    /* 72808 80082808 00620424 */   addiu     $a0, $zero, 0x6200
    /* 7280C 8008280C C41682AF */  sw         $v0, %gp_rel(dPiece)($gp)
    /* 72810 80082810 FF300324 */  addiu      $v1, $zero, 0x30FF
    /* 72814 80082814 FE614224 */  addiu      $v0, $v0, 0x61FE
  .L80082818:
    /* 72818 80082818 000040A4 */  sh         $zero, 0x0($v0)
    /* 7281C 8008281C FFFF6324 */  addiu      $v1, $v1, -0x1
    /* 72820 80082820 FDFF6104 */  bgez       $v1, .L80082818
    /* 72824 80082824 FEFF4224 */   addiu     $v0, $v0, -0x2
    /* 72828 80082828 1000BF8F */  lw         $ra, 0x10($sp)
    /* 7282C 8008282C 1800BD27 */  addiu      $sp, $sp, 0x18
    /* 72830 80082830 0800E003 */  jr         $ra
    /* 72834 80082834 00000000 */   nop
endlabel AllocdPiece__Fv
