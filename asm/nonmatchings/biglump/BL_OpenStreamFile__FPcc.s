.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching BL_OpenStreamFile__FPcc, 0x2C

glabel BL_OpenStreamFile__FPcc
    /* 781A0 800881A0 E8FFBD27 */  addiu      $sp, $sp, -0x18
    /* 781A4 800881A4 1000BFAF */  sw         $ra, 0x10($sp)
    /* 781A8 800881A8 002E0500 */  sll        $a1, $a1, 24
    /* 781AC 800881AC 9B1E020C */  jal        BL_FindStreamFile__FPcc
    /* 781B0 800881B0 032E0500 */   sra       $a1, $a1, 24
    /* 781B4 800881B4 2B180200 */  sltu       $v1, $zero, $v0
    /* 781B8 800881B8 23180300 */  negu       $v1, $v1
    /* 781BC 800881BC 1000BF8F */  lw         $ra, 0x10($sp)
    /* 781C0 800881C0 24104300 */  and        $v0, $v0, $v1
    /* 781C4 800881C4 0800E003 */  jr         $ra
    /* 781C8 800881C8 1800BD27 */   addiu     $sp, $sp, 0x18
endlabel BL_OpenStreamFile__FPcc
