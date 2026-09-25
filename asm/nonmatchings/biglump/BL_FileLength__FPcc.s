.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching BL_FileLength__FPcc, 0x80

glabel BL_FileLength__FPcc
    /* 77C34 80087C34 E803828F */  lw         $v0, %gp_rel(LFileTab)($gp)
    /* 77C38 80087C38 E0FFBD27 */  addiu      $sp, $sp, -0x20
    /* 77C3C 80087C3C 1000B0AF */  sw         $s0, 0x10($sp)
    /* 77C40 80087C40 21808000 */  addu       $s0, $a0, $zero
    /* 77C44 80087C44 1800BFAF */  sw         $ra, 0x18($sp)
    /* 77C48 80087C48 05004014 */  bnez       $v0, .L80087C60
    /* 77C4C 80087C4C 1400B1AF */   sw        $s1, 0x14($sp)
    /* 77C50 80087C50 DFA3000C */  jal        filesize
    /* 77C54 80087C54 00000000 */   nop
    /* 77C58 80087C58 271F0208 */  j          .L80087C9C
    /* 77C5C 80087C5C 00000000 */   nop
  .L80087C60:
    /* 77C60 80087C60 21200002 */  addu       $a0, $s0, $zero
    /* 77C64 80087C64 00160500 */  sll        $v0, $a1, 24
    /* 77C68 80087C68 038E0200 */  sra        $s1, $v0, 24
    /* 77C6C 80087C6C 9B1E020C */  jal        BL_FindStreamFile__FPcc
    /* 77C70 80087C70 21282002 */   addu      $a1, $s1, $zero
    /* 77C74 80087C74 08004014 */  bnez       $v0, .L80087C98
    /* 77C78 80087C78 21200002 */   addu      $a0, $s0, $zero
    /* 77C7C 80087C7C 0100253A */  xori       $a1, $s1, 0x1
    /* 77C80 80087C80 9B1E020C */  jal        BL_FindStreamFile__FPcc
    /* 77C84 80087C84 2B280500 */   sltu      $a1, $zero, $a1
    /* 77C88 80087C88 03004014 */  bnez       $v0, .L80087C98
    /* 77C8C 80087C8C 00000000 */   nop
    /* 77C90 80087C90 271F0208 */  j          .L80087C9C
    /* 77C94 80087C94 21100000 */   addu      $v0, $zero, $zero
  .L80087C98:
    /* 77C98 80087C98 1000428C */  lw         $v0, 0x10($v0)
  .L80087C9C:
    /* 77C9C 80087C9C 1800BF8F */  lw         $ra, 0x18($sp)
    /* 77CA0 80087CA0 1400B18F */  lw         $s1, 0x14($sp)
    /* 77CA4 80087CA4 1000B08F */  lw         $s0, 0x10($sp)
    /* 77CA8 80087CA8 2000BD27 */  addiu      $sp, $sp, 0x20
    /* 77CAC 80087CAC 0800E003 */  jr         $ra
    /* 77CB0 80087CB0 00000000 */   nop
endlabel BL_FileLength__FPcc
