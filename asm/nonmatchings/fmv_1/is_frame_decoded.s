.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

nonmatching is_frame_decoded, 0xC

glabel is_frame_decoded
    /* 1D748 80157340 180D828F */  lw         $v0, %gp_rel(slices_to_do)($gp)
    /* 1D74C 80157344 0800E003 */  jr         $ra
    /* 1D750 80157348 0100422C */   sltiu     $v0, $v0, 0x1
endlabel is_frame_decoded
