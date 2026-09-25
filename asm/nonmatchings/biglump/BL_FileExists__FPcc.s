.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching BL_FileExists__FPcc, 0x3C

glabel BL_FileExists__FPcc
    /* 77BF8 80087BF8 E803828F */  lw         $v0, %gp_rel(LFileTab)($gp)
    /* 77BFC 80087BFC E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 77C00 80087C00 05004014 */  bnez       $v0, .L80087C18
    /* 77C04 80087C04 1000BFAF */   sw        $ra, 0x10($sp)
    /* 77C08 80087C08 01A4000C */  jal        fileexists
    /* 77C0C 80087C0C 00000000 */   nop
    /* 77C10 80087C10 091F0208 */  j          .L80087C24
    /* 77C14 80087C14 00000000 */   nop
  .L80087C18:
    /* 77C18 80087C18 002E0500 */  sll        $a1, $a1, 24
    /* 77C1C 80087C1C 9B1E020C */  jal        BL_FindStreamFile__FPcc
    /* 77C20 80087C20 032E0500 */   sra       $a1, $a1, 24
  .L80087C24:
    /* 77C24 80087C24 1000BF8F */  lw         $ra, 0x10($sp)
    /* 77C28 80087C28 2B100200 */  sltu       $v0, $zero, $v0
    /* 77C2C 80087C2C 0800E003 */  jr         $ra
    /* 77C30 80087C30 1800BD27 */   addiu     $sp, $sp, 0x18
endlabel BL_FileExists__FPcc
