.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching FeGetCursor__Fv, 0x14

glabel FeGetCursor__Fv
    /* C44 8013A83C 140C828F */  lw         $v0, %gp_rel(FeCurMenu)($gp)
    /* C48 8013A840 00000000 */  nop
    /* C4C 8013A844 0400428C */  lw         $v0, 0x4($v0)
    /* C50 8013A848 0800E003 */  jr         $ra
    /* C54 8013A84C 00000000 */   nop
endlabel FeGetCursor__Fv
